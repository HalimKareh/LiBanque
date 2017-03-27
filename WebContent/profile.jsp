<%@page import="packServices.Services"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Profile</title>
<%@include file='importLibs.jsp'%>
</head>
<body>
	<div class="container">
		<%@include file='nav.jsp'%>
		<div class="row">
		<div class="col-md-12 no-float" id="web-body">
			<%
				Client currentClient = new Client();
				;
				if (client == null) {
					response.sendRedirect("login.jsp");
				} else {
					currentClient = client;
				}
			%>
			
			<div class="col-md-12">
				<h2>Personal Info</h2><br />
			</div>
				<div class="col-md-6">
					<div class="col-md-3 col-sm-3">
						<%
							if (client != null) {
								if (client.getGender().toLowerCase().equals("female")) {
									out.print("<img alt=\"Avatar\" src=\"images/avatar_female.png\" class=\"img-circle img-responsive\" style=\"display: block;\">");
								} else {
									out.print("<img alt=\"Avatar\" src=\"images/avatar_male.png\" class=\"img-circle img-responsive\" style=\"display: block;\">");
								}
							}
						%>
					</div>
					<div class="col-md-6 col-sm-6">
						<%
							if (client != null) {
								out.print("<address>");
								out.print("<strong>" + client.getBuilding() + "</strong><br>");
								out.print(client.getStreet() + ", " + client.getCity() + "<br>");
								out.print("<abbr title=\"Phone\">P:</abbr> "
										+ client.getPhone());
								out.print("</address>");
								out.print("<address>");
								out.print("<strong>"
										+ HeaderComponents.setWelcomePhrase(client)
										+ "</strong><br>");
								out.print("<a href=\"mailto:" + client.getEmail() + "\">"
										+ client.getEmail() + "</a>");
								out.print("</address>");
							}
						%>
					</div>
				</div>
				<div class="col-md-6">
					<div class="col-md-12">
						<%
							if (client != null) {
								out.print("<strong>Father Name:</strong> " + client.getFatherName() + "<br />");
								out.print("<strong>Gender:</strong> " + client.getGender() + "<br />");
								out.print("<br /><a href=\"edit_profile.jsp\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\" style=\"padding-right:10px;\"></span>Edit Profile Here</a>");
								out.print("<br /><a href=\"change_password.jsp\"><span class=\"glyphicon glyphicon-lock\" aria-hidden=\"true\" style=\"padding-right:10px;\"></span>Change Password</a>");
							}
						%>
					</div>
				</div>
			
			
			<div class="col-md-12">
				<br />
				<br />
				<br />
			</div>
				<div class="col-md-6">
					<div class="col-md-12">
						<%
							if (client != null) {
								out.print("<strong>Number of Accounts:</strong> " + Services.findAccountByClient(client).size() + " account(s)<br />");
								out.print("<strong>LiBanque Username:</strong> " + client.getUsername() + "<br />");
								out.print(HeaderComponents.setLastConnection(client));
							}
						%>
					</div>
				</div>
				<div class="col-md-6">
					<div class="col-md-12">
						<%
							if (client != null) {
								out.print("<br /><a href=\"accounts.jsp\"><span class=\"glyphicon glyphicon-credit-card\" aria-hidden=\"true\" style=\"padding-right:10px;\"></span>Check Your Bank Accounts Here</a>");
								out.print("<br />");
								out.print("<br />");
								out.print("<br />");
							}
						%>
					</div>
				</div>
			
		</div>
		</div>
	</div>
</body>
</html>