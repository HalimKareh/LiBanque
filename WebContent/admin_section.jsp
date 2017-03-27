<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Admin Section</title>
<%@include file='importLibs.jsp'%>
</head>
<body>
	<div class="container">
		<%@include file='nav.jsp'%>
			<% if(admin==null){response.sendRedirect("index.jsp");} %>
			<div class="col-md-12 no-float" id="web-body">

				<div class="col-xs-6"></div>
				<div class="col-xs-6 text-right">
					<%
							out.write(HeaderComponents.setDateAndTime());

							out.write(HeaderComponents.setLastConnection(client));
						%>
				</div>
					<div class="col-xs-12">
						<h1 class="text-center">
							<span class="glyphicon glyphicon-wrench" 
								style="padding-right: 12px"></span> Admin Section
						</h1>
						<hr>
					</div>
					<div class="col-xs-12">
						<%
					
						String message = request.getParameter("success");
						if(message!=null){
							if (message.equals("1")) {
								out.write("<div class=\"alert alert-success\" role=\"alert\">");
								out.write("<span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>");
								out.write("<span class=\"sr-only\">Success:</span>");
								out.write(" Success: Offer was deleted.");
								out.write("</div>");
							}
						}
						
						%>
						<div class="list-group">
							<a href="register.jsp" class="list-group-item"> <span
								class="badge"> <span
									class="glyphicon glyphicon-plus-sign" ></span>
							</span> Add new Client
							</a><a href="edit_delete.jsp" class="list-group-item"> <span
								class="badge"> <span class="glyphicon glyphicon-user"
									></span>
							</span> Edit/Delete Client
							</a><a href="create_account.jsp" class="list-group-item"> <span
								class="badge"> <span class="glyphicon glyphicon-level-up"
									></span>
							</span> Add new Account
							</a><a href="add_types.jsp" class="list-group-item"> <span
								class="badge"> <span
									class="glyphicon glyphicon-equalizer" ></span>
							</span> Add new Account/Transaction Type
							</a> <a href="edit_delete.jsp" class="list-group-item"> <span
								class="badge"> <span class="glyphicon glyphicon-barcode"
									></span>
							</span> Edit/Delete Account Type
							</a><a href="edit_delete.jsp" class="list-group-item"> <span
								class="badge"> <span
									class="glyphicon glyphicon-credit-card" ></span>
							</span> Edit/Delete Transaction Type
							</a><a href="currency_admin.jsp" class="list-group-item"> <span
								class="badge"> <span class="glyphicon glyphicon-usd"
									></span>
							</span> Add new Currency
							</a> <a href="edit_delete.jsp" class="list-group-item"> <span
								class="badge"> <span class="glyphicon glyphicon-gbp"
									></span>
							</span> Edit/Delete Currency
							</a>
						</div>
					</div>
			</div>
	</div>
</body>
</html>