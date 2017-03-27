<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Add Types</title>
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
						<h1 class="text-center">Add new Account/Transaction Type</h1>
						<hr>
					</div>
					<div class="col-xs-12">
						<h3>Add new Account type</h3>
						<%
						String message = request.getParameter("account");
						if (message != null) {
							out.write("<div class=\"alert alert-success\" role=\"alert\">");
							out.write("<span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>");
							out.write("<span class=\"sr-only\">Success:</span>");
							out.write(" Success: Account Type added.");
							out.write("</div>");
						}
						%>
						<form action="AddTypeAccount" method="post">
							<div class="form-group">
								<label>Account Type</label> <input type="text"
									placeholder="Enter Type Here.." class="form-control"
									name="type" required>
							</div>
							<button type="submit" class="btn btn-success">Add</button>
						</form>
						<h3>Add new Transaction type</h3>
						<%
						message = request.getParameter("transaction");
						if (message != null) {
							out.write("<div class=\"alert alert-success\" role=\"alert\">");
							out.write("<span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>");
							out.write("<span class=\"sr-only\">Success:</span>");
							out.write(" Success: Transaction Type added.");
							out.write("</div>");
						}
						%>
						<form action="AddTypeTransaction" method="post">
							<div class="form-group">
								<label>Transaction Type</label> <input type="text"
									placeholder="Enter Transaction Type Here.." class="form-control"
									name="type" required>
							</div>
							<button type="submit" class="btn btn-success">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>