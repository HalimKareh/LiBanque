<%@page import="packModel.Currency"%>
<%@page import="packModel.TypeAccount"%>
<%@page import="packServices.Services"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Create Account</title>
<%@include file='importLibs.jsp'%>
</head>
<body>
	<div class="container">
		<%@include file='nav.jsp'%>
		<div class="row">
			<%
				if (admin == null) {
					response.sendRedirect("index.jsp");
				}
			%>
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
						<h1 class="text-center">Create New Account</h1>
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
									out.write(" Success: Account Created.");
									out.write("</div>");
								}
								if (message.equals("0")) {
									out.write("<div class=\"alert alert-danger\" role=\"alert\">");
									out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
									out.write("<span class=\"sr-only\">Error:</span>");
									out.write(" Error: Please check your values!");
									out.write("</div>");
								}
							}
						%>
						<form action="CreateAccount" method="post">
							<div class="col-sm-12">
								<div class="row">

									<div class="form-group">
										<label>Client:</label> <select class="form-control"
											name="clientId">
											<option>Select Client...</option>
											<%
												for (Client c : Services.findAllClient()) {
													out.print("<option value=\"" + c.getId() + "\">" + c.getFirstName().trim() + " "
															+ c.getLastName().trim() + "</option>\n");
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label>Account Type:</label> <select class="form-control"
											name="type">
											<option>Select Type...</option>
											<%
												for (TypeAccount ta : Services.findAllTypeAccount()) {
													out.print("<option value=\"" + ta.getId() + "\">" + ta.getName().trim() + "</option>\n");
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label>Currency:</label> <select class="form-control"
											name="currency">
											<option>Select Currency...</option>
											<%
												for (Currency c : Services.findAllCurrency()) {
													out.print("<option value=\"" + c.getId() + "\">" + c.getName().trim() + " (" + c.getCode().trim()
															+ ")</option>\n");
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label for="sel1">Amount:</label> <input type="text"
											placeholder="Enter Amount..." class="form-control"
											name="amount" required>
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-success form-control"
											value="Create Account">
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