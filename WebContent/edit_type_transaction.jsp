<%@page import="packModel.TypeTransaction"%>
<%@page import="packModel.TypeAccount"%>
<%@page import="packServices.Services"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Edit Type Account</title>
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
					<div class="col-xs-12">
						<h1 class="text-center">Edit Account Type</h1>
						<hr>
					</div>
					<div class="col-xs-12">
						<h3>Edit Account type</h3>
						<%
							String message = request.getParameter("success");
							if (message != null) {
								if (message.equals("1")) {
									out.write("<div class=\"alert alert-success\" role=\"alert\">");
									out.write("<span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>");
									out.write("<span class=\"sr-only\">Success:</span>");
									out.write(" Success: Type Transaction updated. <a href=\"edit_delete.jsp\">Click Here</a> to go back!");
									out.write("</div>");
								}
								if (message.equals("0")) {
									out.write("<div class=\"alert alert-danger\" role=\"alert\">");
									out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
									out.write("<span class=\"sr-only\">Error:</span>");
									out.write(" Error: Error updating!");
									out.write("</div>");
								}
							}
						%>
						<%String typeTransactionId = request.getParameter("typeTransactionId"); 
						TypeTransaction typeTransaction = Services.findTypeTransactionById(typeTransactionId);
						%>
						<form action="UpdateTypeTransaction" method="post">
							<input type="hidden" name="typeId" value="<%=typeTransactionId%>">
							<div class="form-group">
							
								<label>Name</label> <input type="text"
									placeholder="Enter Type Here.." class="form-control"
									name="type" required value="<%= typeTransaction.getName() %>">
							</div>
							<button type="submit" class="btn btn-success">Save</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>