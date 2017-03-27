<%@page import="packModel.TypeTransaction"%>
<%@page import="packModel.Transaction"%>
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
<title>LiBanque</title>
<%@include file='importLibs.jsp'%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#txtKeyword').keyup(function() {
			searchTable($(this).val());
		});
		$("#typeSelect").on('change', function(e) {
			var optionSelected = $("option:selected", this);
			var valueSelected = this.value;
			if (valueSelected != "All Types") {
				searchTable($("#typeSelect option:selected").text());
			} else {
				searchTable("");
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
					<div class="col-xs-6"></div>
					<div class="col-xs-6 text-right">
						<%
							out.write(HeaderComponents.setDateAndTime());
						 						
										out.write(HeaderComponents.setLastConnection(client));
						%>

					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<h1 class="text-center">My Transactions</h1>
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
											out.write(" Success: Transaction was submitted.");
											out.write("</div>");
										}
										if (message.equals("0")) {
											out.write("<div class=\"alert alert-danger\" role=\"alert\">");
											out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
											out.write("<span class=\"sr-only\">Error:</span>");
											out.write(" Error: Please check your amount or contact support!");
											out.write("</div>");
										}
										if (message.equals("2")) {
											out.write("<div class=\"alert alert-danger\" role=\"alert\">");
											out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
											out.write("<span class=\"sr-only\">Error:</span>");
											out.write(" Error: Unknown error, Please contact support!");
											out.write("</div>");
										}
									}
								%>
						<%
							if(client==null){
										response.sendRedirect("login.jsp");
									}else{
										String accountId = request.getParameter("accountId");
										int count = 0;
										out.print("<table class=\"table table-hover\" id=\"tblData\">");
										out.print("<thead>");
										out.print("<tr>");
										out.print("<th style=\"width:25%;\"><h4>Account</h4></th>");
										out.print("<th style=\"width:15%;\"><h4>Transaction</h4></th>");
										out.print("<th style=\"width:20%;\"><h4>Date of Transaction</h4></th>");
										out.print("<th style=\"width:15%;\"><h4>Amount</h4></th>");
										out.print("<th style=\"width:25%;\"><h4>Details</h4></th>");
										out.print("</tr>");
										out.print("</thead>");
										out.print("<tbody>");
										for(Transaction transaction : Services.findTransactionByAccountId(accountId)){
											count++;
											TypeTransaction typeTransaction = Services.findTypeTransactionById(transaction.getTypeTransactionId());
											
											
											out.print("<tr>");
											out.print("<td scope=\"row\">" + transaction.getAccountId() + "</td>");
											out.print("<td scope=\"row\">" + typeTransaction.getName() + "</td>");
											out.print("<td scope=\"row\">" + transaction.getDateOfTransaction() + "</td>");
											out.print("<td scope=\"row\">" + transaction.getAmount() + "</td>");
											out.print("<td scope=\"row\">" + (transaction.getDetails()==null?"N/A":transaction.getDetails().trim().equals("")?"N/A":transaction.getDetails()) + "</td>");
											out.print("</tr>");
										}
										
										Account account = Services.findAccountById(accountId);
										Currency currency = Services.findCurrencyById(account.getCurrencyId());
										out.print("<tr class=\"active\">");
										out.print("<th scope=\"row\">Total count: " + count + "</th>");
										out.print("<th scope=\"row\"></th>");
										out.print("<th scope=\"row\"></th>");
										out.print("<th scope=\"row\"><strong>Total Amount:</strong></th>");
										out.print("<th scope=\"row\">" + account.getAmount() + " (" + currency.getCode() + ")</th>");
										out.print("</tr>");
										
										out.print("</tbody>");
										out.print("</table>");
										out.println();
									}
						%>
						<input type="button" value="Show Search Filters"
							class="btn btn-primary" onclick="toggleFilters();" id="btnShow">
						<script type="text/javascript">
							function toggleFilters() {
								if (document.getElementById("searchFilters").style.display == "none") {
									document.getElementById("btnShow").style.display = "none";
									document.getElementById("searchFilters").style.display = "block";
								} else {
									document.getElementById("btnShow").style.display = "block";
									document.getElementById("searchFilters").style.display = "none";
								}
							}
						</script>
						<form id="searchFilters" style="display: none">
							<div class="row">
								<div class="col-md-12">
									<h3>Search Transaction</h3>
								</div>
								<div class="col-sm-6 form-group">
									<label>Keyword </label> <input type="text" class="form-control"
										placeholder="Keyword" id="txtKeyword">
								</div>
								<div class="col-sm-6 form-group">
									<label>Type of Transaction</label> <select class="form-control"
										id="typeSelect">
										<option>All Types</option>
										<%
											for (TypeTransaction typeTransaction : Services
													.findAllTypeTransaction()) {
												out.print("<option>" + typeTransaction.getName() + "</option>");
											}
										%>
									</select>
								</div>
							</div>
							<button type="button" class="btn btn-primary"
								onclick="toggleFilters();">Hide Filters</button>
						</form>
						<form action="CreateTransaction" method="post">
							<input type="hidden" name="accountId" value="<%=request.getParameter("accountId") %>">
							<div class="row">
								<div class="col-md-12">
									<h3>Make Transaction</h3>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Transaction Type:</label> <select class="form-control"
											name="type">
											<option>Select Type...</option>
											<% 
										     for(TypeTransaction tt : Services.findAllTypeTransaction()){
										    	 out.print("<option value=\"" + tt.getId() + "\">" + tt.getName().trim() + "</option>\n");
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
										<textarea  placeholder="Enter Details Here..." class="form-control" name="details" rows="2"></textarea>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Submit this Transaction</label> <input type="submit"
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