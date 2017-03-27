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
<title>LiBanque - Accounts</title>
<%@include file='importLibs.jsp'%>
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
						<h1 class="text-center">My Accounts</h1>
						<hr>
					</div>
					<div class="col-xs-12">
					<% 
					if(client==null){
						response.sendRedirect("login.jsp");
					}else{
						for(Account account : Services.findAccountByClient(client)){
							
							TypeAccount typeAccount = Services.findTypeAccoundById(account.getTypeAccountId());
							
							Currency currency = Services.findCurrencyById(account.getCurrencyId());
							
							out.print("<table class=\"table table-hover\">");
							out.print("<thead>");
							out.print("<tr>");
							out.print("<th style=\"width:50%;\"><h4>" + typeAccount.getName() + "</h4></th>");
							out.print("<th style=\"width:20%;\"><h4>Amount</h4></th>");
							out.print("<th style=\"width:30%;\"><h4>Currency</h4></th>");
							out.print("</tr>");
							out.print("</thead>");
							out.print("<tbody>");
							out.print("<tr>");
							out.print("<th scope=\"row\"><a href=\"transactions.jsp?accountId=" + account.getId() + "\">" + account.getId() + "</a></th>");
							out.print("<th scope=\"row\"><a href=\"transactions.jsp?accountId=" + account.getId() + "\">" + account.getAmount() + "</a></th>");
							out.print("<th scope=\"row\"><a href=\"transactions.jsp?accountId=" + account.getId() + "\">" + currency.getName() + " ( " + currency.getCode() + " )" + "</a></th>");
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