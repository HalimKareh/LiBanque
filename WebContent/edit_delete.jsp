<%@page import="packModel.TypeAccount"%>
<%@page import="packModel.Currency"%>
<%@page import="packServices.Services"%>
<%@page import="packModel.TypeTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Edit/Delete Data</title>
<%@include file='importLibs.jsp'%>
</head>
<body>
	<div class="container">
		<%@include file='nav.jsp'%>
		<div class="row">
			<% if(admin==null){response.sendRedirect("index.jsp");} %>
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
						<h1 class="text-center">Edit/Delete Data</h1>
						<hr>
					</div>
					<div class="col-xs-12">
						<%	
							String message = request.getParameter("success");
							if (message != null) {
								if (message.equals("1")) {
									out.write("<div class=\"alert alert-success\" role=\"alert\">");
									out.write("<span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>");
									out.write("<span class=\"sr-only\">Success:</span>");
									out.write(" Success: Client was removed.");
									out.write("</div>");
								}
								if (message.equals("0")) {
									out.write("<div class=\"alert alert-danger\" role=\"alert\">");
									out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
									out.write("<span class=\"sr-only\">Error:</span>");
									out.write(" Error: Old Password is incorrect!");
									out.write("</div>");
								}
								if (message.equals("2")) {
									out.write("<div class=\"alert alert-danger\" role=\"alert\">");
									out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
									out.write("<span class=\"sr-only\">Error:</span>");
									out.write(" Error: New Passwords Missmatch!");
									out.write("</div>");
								}
							}
						%>
						<div class="col-md-6">
							<form class="form-inline" action="edit_client.jsp">
							<h3>Client</h3>
								<div class="form-group">
									<Select class="form-control" name="clientId" id="slctClient">
										<option>Select Client...</option>
										<% for(Client c: Services.findAllClient()){
											out.print("<option value=\"" + c.getId() + "\">" 
											+ c.getFirstName() + " " + c.getLastName()
											+ "</option>");
										}
											%>
									</Select>
								</div>
								<button type="submit" class="btn btn-info">
									<span class="glyphicon glyphicon-pencil" ></span>
									 Edit
								</button>
								<script type="text/javascript">
									$(document).ready(function(){
										$("#slctClient").on('change', function(e) {
											var optionSelected = $("option:selected", this);
											var valueSelected = this.value;
											if (valueSelected != "Select Client...") {
												$("#dltClient").attr("href","DeleteClient?clientId=" + valueSelected);
											}else{
												$("#dltClient").attr("href","#");
											}
										});
									});
								</script>
								<a href="#" class="btn btn-danger" id="dltClient">
									<span class="glyphicon glyphicon-remove" ></span>
									 Delete
								</a>
							</form>
						</div>
						<div class="col-md-6">
							<form class="form-inline" action="edit_currency.jsp">
							<h3>Currency</h3>
								<div class="form-group">
									<Select class="form-control" name="currencyId" id="slctCurrency">
										<option>Select Currency...</option>
										<% for(Currency c : Services.findAllCurrency()){
											out.print("<option value=\"" + c.getId() + "\">" 
											+ c.getName() + " (" + c.getCode()
											+ ")</option>");
										}
											%>
									</Select>
								</div>
								<button type="submit" class="btn btn-info">
									<span class="glyphicon glyphicon-pencil" ></span>
									 Edit
								</button>
								<script type="text/javascript">
									$(document).ready(function(){
										$("#slctCurrency").on('change', function(e) {
											var optionSelected = $("option:selected", this);
											var valueSelected = this.value;
											if (valueSelected != "Select Currency...") {
												$("#dltCurrency").attr("href","DeleteCurrency?currencyId=" + valueSelected);
											}else{
												$("#dltCurrency").attr("href","#");
											}
										});
									});
								</script>
								<a href="#" class="btn btn-danger" disabled id="dltCurrency">
									<span class="glyphicon glyphicon-remove" ></span>
									 Delete
								</a>
							</form>
						</div>
						<br/>
						<div class="col-md-6">
							<form class="form-inline" action="edit_type_account.jsp">
							<h3>Type Account</h3>
								<div class="form-group">
									<Select class="form-control" name="typeAccountId" id="slctTypeAccount">
										<option>Select Type Account...</option>
										<% for(TypeAccount ta : Services.findAllTypeAccount()){
											out.print("<option value=\"" + ta.getId() + "\">" 
											+ ta.getName() + "</option>");
										}
											%>
									</Select>
								</div>
								<button type="submit" class="btn btn-info">
									<span class="glyphicon glyphicon-pencil" ></span>
									 Edit
								</button>
								<script type="text/javascript">
									$(document).ready(function(){
										$("#slctTypeAccount").on('change', function(e) {
											var optionSelected = $("option:selected", this);
											var valueSelected = this.value;
											if (valueSelected != "Select Type Account...") {
												$("#dltTypeAccount").attr("href","DeleteTypeAccount?typeId=" + valueSelected);
											}else{
												$("#dltTypeAccount").attr("href","#");
											}
										});
									});
								</script>
								<a href="#" class="btn btn-danger" id="dltTypeAccount" disabled>
									<span class="glyphicon glyphicon-remove" ></span>
									 Delete
								</a>
							</form>
						</div>
						<div class="col-md-6">
						<form class="form-inline" action="edit_type_transaction.jsp">
							<h3>Type Transaction</h3>
								<div class="form-group">
									<Select class="form-control" name="typeTransactionId" id="slctTypeTransaction">
										<option>Select Type Transaction...</option>
										<% for(TypeTransaction tt : Services.findAllTypeTransaction()){
											out.print("<option value=\"" + tt.getId() + "\">" 
											+ tt.getName() + "</option>");
										}
											%>
									</Select>
								</div>
								<button type="submit" class="btn btn-info">
									<span class="glyphicon glyphicon-pencil" ></span>
									 Edit
								</button>
								<script type="text/javascript">
									$(document).ready(function(){
										$("#slctTypeTransaction").on('change', function(e) {
											var optionSelected = $("option:selected", this);
											var valueSelected = this.value;
											if (valueSelected != "Select Type Transaction...") {
												$("#dltTypeAccount").attr("href","DeleteTypeTransaction?typeId=" + valueSelected);
											}else{
												$("#dltTypeAccount").attr("href","#");
											}
										});
									});
								</script>
								<a href="#" class="btn btn-danger" disabled>
									<span class="glyphicon glyphicon-remove" ></span>
									 Delete
								</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>