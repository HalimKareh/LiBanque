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
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="imgages/favicon/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<%@include file='nav.jsp'%>
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
						<h1 class="text-center">My Accounts</h1>
						<hr>
					</div>
					<div class="col-xs-12">
					<% if(client==null){
						response.sendRedirect("login.jsp");
					}else{
					
						for(Account account : Services.findAccountByClient(client)){
							
							TypeAccount typeAccount = Services.findTypeAccoundById(account.getTypeAccountId());
							
							Currency currency = Services.findCurrencyById(account.getCurrencyId());
							
							out.print("<table class=\"table table-hover\">");
							out.print("<thead>");
							out.print("<tr>");
							out.print("<th style=\"width:40%;\"><h4>" + typeAccount.getName() + "</h4></th>");
							out.print("<th style=\"width:30%;\"><h4>Amount</h4></th>");
							out.print("<th style=\"width:30%;\"><h4>Currency</h4></th>");
							out.print("</tr>");
							out.print("</thead>");
							out.print("<tbody>");
							out.print("<tr>");
							out.print("<th scope=\"row\">" + account.getId() + "</th>");
							out.print("<th scope=\"row\">" + account.getAmount() + "</th>");
							out.print("<th scope=\"row\">" + currency.getName() + " ( " + currency.getCode() + " )" + "</th>");
							out.print("</tr>");
							out.print("</tbody>");
							out.print("</table>");
							out.println();
						}
					}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>