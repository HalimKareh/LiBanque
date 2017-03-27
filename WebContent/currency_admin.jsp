<%@page import="packServices.HeaderComponents"%>
<%@page import="packModel.Client"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="packServices.Services"%>
<%@page import="packModel.Currency"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque</title>
<%@include file='importLibs.jsp'%>
</head>
<body>
	<div class="container">
	<%@include file='nav.jsp'%>
		<div class="row">
			<% if(admin==null){response.sendRedirect("index.jsp");} %>
			<div class="col-md-12 no-float" id="web-body">
				<div class="row">
					<div class="col-xs-12">
						<h1 class="text-center">Add Currency</h1>
						<hr>
					</div>
					<div class="col-xs-12">
						<%
							String message = request.getParameter("Error_Message");
							if (message != null) {
								out.write("<div class=\"alert alert-danger\" role=\"alert\">");
								out.write("<span class=\"sr-only\">Error:</span>");
								out.write("Enter a valid username or password");
								out.write("</div>");
							}
						%>
						<table class="table table-hover" id="myTable">
							<thead>
								<tr>
									<th>Name</th>
									<th>Code</th>
									<th>Rate in Dollar</th>
									<th>Edit</th>
								</tr>
							</thead>
							<tbody>
								<%
									int count = 0;
									for (Currency currency : Services.findAllCurrency()) {

										count++;

										out.print("<tr>");
										out.print("<th scope=\"row\">" + currency.getName() + "</th>");
										out.print("<th scope=\"row\">" + currency.getCode() + "</th>");
										out.print("<th scope=\"row\">" + new DecimalFormat("#.########").format(currency.getRateInDollar())
												+ "</th>");
										out.print("<th scope=\"row\"><a href=\"edit_currency.jsp?currencyId=" + currency.getId() + "\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a></th>");
									}
								%>
							</tbody>
						</table>
						
						<form class="form-inline">
						  <div class="form-group">
						    <input type="text" class="form-control" placeholder="Name" id="txtName">
						  </div>
						  <div class="form-group">
						    <input type="text" class="form-control" placeholder="Code" id="txtCode">
						  </div>
						  <div class="form-group">
						    <input type="text" class="form-control" placeholder="Rate in USD" id="txtRate" readonly="readonly">
						  </div>
						  <button type="button" class="btn btn-default" onclick="getRate()">Get Rate in USD</button>
						  <button type="button" class="btn btn-default" onclick="addRow()">Add row</button>
						</form>
						<br>
						<blockquote id="blockquoteBlue">
							<p><span class="glyphicon glyphicon-copyright-mark"></span> Currency rate Brought by: rate-exchange.herokuapp.com</p>
						</blockquote>
						<div class="alert alert-danger" role="alert" id="#msgError" style="display: none;">
							<span class="sr-only">Error:</span>
							Enter a valid currency code!
						</div>
						<script type="text/javascript">
							function addRow(){
								var name = document.getElementById('txtName').value
								var code = document.getElementById('txtCode').value
								var rate = document.getElementById('txtRate').value
								
								var xhttp = new XMLHttpRequest();
								xhttp.onreadystatechange = function() {
									if (xhttp.readyState == 4 && xhttp.status == 200) {
										$('#myTable tr:last').after('<tr><th scope="row">' + name + '</th><th scope="row">' + code + '</th><th scope="row">' + rate + '</th></tr>');
									}
								};
								xhttp.open("GET", "http://" + <%="\"" + request.getServerName() + "\""%> + ":" + <%="\"" + request.getServerPort() + request.getContextPath() + "\""%> + "/InsertCurrency?name=" + name + "&code=" + code + "&rate=" + rate, true);
								xhttp.send();
							}
							function getRate() {
								var xhttp = new XMLHttpRequest();
								xhttp.onreadystatechange = function() {
									if (xhttp.readyState == 4 && xhttp.status == 200) {
										
										var obj = JSON.parse(xhttp.responseText);
										if((obj.Rate==undefined) || (obj.Rate=='N/A')){
											document.getElementById("txtCode").style.borderColor = "#E34234";
											document.getElementById("txtCode").style.boxShadow = "0px 0px 10px #E34234";
											document.getElementById("#msgError").style.display = "block";
											
										}else{
											document.getElementById("txtCode").style.borderColor = "";
											document.getElementById("txtCode").style.boxShadow = "";
											document.getElementById("txtRate").value = obj.Rate;
											document.getElementById("#msgError").style.display = "none";
										}
									}
								};
								var code = document.getElementById('txtCode').value
								xhttp.open("GET", "http://rate-exchange.herokuapp.com/fetchRate?from=" + code + "&to=USD", true);
								xhttp.send();
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>