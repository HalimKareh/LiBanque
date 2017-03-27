<%@page import="packModel.Transfer"%>
<%@page import="packModel.Currency"%>
<%@page import="packModel.TypeAccount"%>
<%@page import="packServices.Services"%>
<%@page import="packModel.Account"%>
<%@page import="packServices.HeaderComponents"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="packModel.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Transfers</title>
<%@include file='importLibs.jsp'%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#txtKeyword').keyup(function() {
			searchTable($(this).val());
		});
		$("select#fromAccount").on('change', function(e) {
			var optionSelected = $("option:selected", this);
			var valueSelected = this.value;
			if (valueSelected != "Select Source Account...") {
				$("select#toAccount option").each(function () {
					$(this).show()
				}); 
				$("select#toAccount option[value='" + valueSelected + "']").hide(); 
			} else {
				$("select#toAccount option").each(function () {
					$(this).show()
				}); 
			}
		});
		$("select#toAccount").on('change', function(e) {
			var optionSelected = $("option:selected", this);
			var valueSelected = this.value;
			if (valueSelected != "Select Source Account...") {
				$("select#fromAccount option").each(function () {
					$(this).show()
				}); 
				$("select#fromAccount option[value='" + valueSelected + "']").hide(); 
			} else {
				$("select#fromAccount option").each(function () {
					$(this).show()
				}); 
			}
		});
	});

	function searchTable(inputVal) {
		var table = $('#tblData');
		table.find('tr').each(function(index, row) {
			var allCells = $(row).find('td');
			if (allCells.length > 0) {
				var found = false;
				allCells.each(function(index, td) {
					var regExp = new RegExp(inputVal, 'i');
					if (regExp.test($(td).text())) {
						found = true;
						return false;
					}
				});
				if (found == true)
					$(row).show();
				else
					$(row).hide();
			}
		});
	}
	
	
</script>
</head>
<body>
	<div class="container">
		<%@include file='nav.jsp'%>
		<div class="row">
			<div class="col-md-12 no-float" id="web-body">
				<div class="row">
					<div class="col-xs-6">
						
					</div>
					<div class="col-xs-6 text-right">
						<% 
						out.write(HeaderComponents.setDateAndTime());
 						
						out.write(HeaderComponents.setLastConnection(client));
							
						%>
						
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<h1 class="text-center">My Transfers</h1>
						<hr>
					</div>
					<div class="col-xs-12">
					<%
						
						String message = request.getParameter("success");
						if(message!=null){
							if (message.equals("1")) {
								out.write("<div class=\"alert alert-success\" role=\"alert\">");
								out.write("<span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>");
								out.write("<span class=\"sr-only\">Success:</span>");
								out.write(" Success: Transfer was made without errors.");
								out.write("</div>");
							}
							if (message.equals("0")) {
								out.write("<div class=\"alert alert-danger\" role=\"alert\">");
								out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
								out.write("<span class=\"sr-only\">Error:</span>");
								out.write(" Error: Can't transfer to same account!");
								out.write("</div>");
							}
							if (message.equals("2")) {
								out.write("<div class=\"alert alert-danger\" role=\"alert\">");
								out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
								out.write("<span class=\"sr-only\">Error:</span>");
								out.write(" Error: Please check your values!");
								out.write("</div>");
							}
							if (message.equals("3")) {
								out.write("<div class=\"alert alert-danger\" role=\"alert\">");
								out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
								out.write("<span class=\"sr-only\">Error:</span>");
								out.write(" Error: Insufficient funds! In case of problem, please contact us.");
								out.write("</div>");
							}
						}
					%>
					<%
							if(client==null){
										response.sendRedirect("login.jsp");
									}else{
										int count = 0;
										out.print("<table class=\"table table-hover\" id=\"tblData\">");
										out.print("<thead>");
										out.print("<tr>");
										out.print("<th style=\"width:30%;\"><h4>From Account</h4></th>");
										out.print("<th style=\"width:30%;\"><h4>To Account</h4></th>");
										out.print("<th style=\"width:20%;\"><h4>Date of Transfer</h4></th>");
										out.print("<th style=\"width:20%;\"><h4>Amount</h4></th>");
										out.print("</tr>");
										out.print("</thead>");
										out.print("<tbody>");
										for(Transfer transfer : Services.findTransferByClientId(client.getId())){
											count++;
											
											Account fromAccount, toAccount;
											fromAccount = Services.findAccountById(transfer.getFromAccountId());
											toAccount = Services.findAccountById(transfer.getToAccountId());
											
											Currency currency = Services.findCurrencyById(fromAccount.getCurrencyId());
											
											out.print("<tr>");
											out.print("<td scope=\"row\">" + fromAccount.getId() + "</td>");
											out.print("<td scope=\"row\">" + toAccount.getId() + "</td>");
											out.print("<td scope=\"row\">" + transfer.getDateOfTransfare() + "</td>");
											out.print("<td scope=\"row\">" + transfer.getAmount() + " (" + currency.getCode() + ")</td>");
											out.print("</tr>");
										}
										

										out.print("<tr class=\"active\">");
										out.print("<th scope=\"row\">Total count: " + count + "</th>");
										out.print("<th scope=\"row\"></th>");
										out.print("<th scope=\"row\"></th>");
										out.print("<th scope=\"row\"></th>");
										out.print("</tr>");
										
										out.print("</tbody>");
										out.print("</table>");
										out.println();
									}
						%>
						<form id="searchFilters">
							<div class="row">
								<div class="col-md-12">
									<h3>Search Transfer</h3>
									<div class="form-group">
										<label>Keyword </label> <input type="text" class="form-control"
											placeholder="Keyword" id="txtKeyword">
									</div>
								</div>
							</div>
						</form>
						
						<form action="CreateTransfer" method="post">
							<input type="hidden" name="clientId" value="<%= client!=null?client.getId():"" %>">
							<div class="row">
								<div class="col-md-12">
									<h3>Make Transfer</h3>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Transfer Source Account:</label> <select class="form-control"
											name="source" id="fromAccount">
											<option>Select Source Account...</option>
											<% 
											if(client!=null){
												for(Account account : Services.findAccountByClient(client)){
											    	 Currency currency = Services.findCurrencyById(account.getCurrencyId());
											    	 out.print("<option value=\"" + account.getId() + "\" id=\"" + account.getId() + "\">" 
											     + account.getId().trim() + " - " + account.getAmount() + " (" + currency.getCode() + ")</option>\n");
											     }
											}
										     
										      %>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Transfer Destination Account:</label> <select class="form-control"
											name="destination" id="toAccount">
											<option>Select Destination Account...</option>
											<% 
											if(client!=null){
												for(Account account : Services.findAccountByClient(client)){
											    	 Currency currency = Services.findCurrencyById(account.getCurrencyId());
											    	 out.print("<option value=\"" + account.getId() + "\">" 
											     + account.getId().trim() + " - " + account.getAmount() + " (" + currency.getCode() + ")</option>\n");
											     }
											}
										      %>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Amount:</label>
										<input type="number"
										placeholder="Amount Here.." class="form-control"
										name="amount" required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Details:</label>
										<textarea placeholder="Enter Details Here..." class="form-control" name="details" rows="2"></textarea>
									</div>
								</div>
								<div class="col-md-6">
									<blockquote id="blockquoteBlue">
										<p><span class="glyphicon glyphicon-info-sign" ></span> Accounts with different currencies will be calculated based on its rate.
										<br /><span style="padding-right: 18px"></span> Rates are subject to changes...</p>
									</blockquote>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Submit this Transfer</label> <input type="submit"
											class="btn btn-success form-control" value="Submit">
									</div>
								</div>
							</div>

						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>