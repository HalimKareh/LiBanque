<%@page import="packServices.HeaderComponents"%>
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
			<% if(client!=null){response.sendRedirect("index.jsp");} %>
			<div class="col-md-12 no-float" id="web-body">
				<div class="row">
					<div class="col-xs-12">
						<h1 class="text-center">Login into LiBanque</h1>
						<hr>
					</div>
					<div class="col-xs-12">
						<%
						
						String message = request.getParameter("Error_Message");
						if (message != null) {
							out.write("<div class=\"alert alert-danger\" role=\"alert\">");
							out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
							out.write("<span class=\"sr-only\">Error:</span>");
							out.write(" Enter a valid username or password");
							out.write("</div>");
						}
						%>
						<form action="Login" method="post">
							<div class="form-group">
								<label>Username</label> <input type="text"
									placeholder="Enter Username Here.." class="form-control"
									name="username" required 
									value="<% if(request.getParameter("username")!=null)
									{out.print(request.getParameter("username"));} %>">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password"
									placeholder="Enter Password Here.." class="form-control"
									name="password" required>
							</div>
							<button type="submit" class="btn btn-default">Sign in</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>