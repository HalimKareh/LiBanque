<%@page import="java.util.Collections"%>
<%@page import="packServices.Services"%>
<%@page import="java.util.ArrayList"%>
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
						<h1 class="text-center">
							<span class="glyphicon glyphicon-piggy-bank"
								style="padding-right: 15px;"></span> Welcome to LiBanque <span
								class="glyphicon glyphicon-globe" style="pading-left: 15px;"></span>
						</h1>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>