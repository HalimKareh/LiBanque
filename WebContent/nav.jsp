<%@page import="packModel.Admin"%>
<%@page import="packServices.HeaderComponents"%>
<%@page import="packModel.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            
          </div>
		<div class="navbar-collapse collapse" id="navbar">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp"><span
						class="glyphicon glyphicon-home" 
						style="padding-right: 12px"></span>Home</a></li>
				<li><a href="accounts.jsp"><span
						class="glyphicon glyphicon-credit-card" 
						style="padding-right: 12px"></span>Accounts</a></li>
				<li><a href="transfers.jsp"><span
						class="glyphicon glyphicon-transfer" 
						style="padding-right: 12px"></span>Transfers</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				
					<%
						final Client client = (Client) session.getAttribute("client");
						final Admin admin = (Admin) session.getAttribute("admin");
						if (admin != null) {
							out.write("<li><a href=\"admin_section.jsp\"><span class=\"glyphicon glyphicon-wrench\" aria-hidden=\"true\" style=\"padding-right: 12px\"></span>");
							out.write("Admin Section");
							out.write("</a></li>");
						}
						;

						if (client != null) {
							out.write("<li class=\"active\"><a href=\"profile.jsp\"><span class=\"glyphicon glyphicon-user\" aria-hidden=\"true\" style=\"padding-right: 12px\"></span>");
							out.write(HeaderComponents.setWelcomePhrase(client));
							out.write("</a></li>");
							out.write("<li><a href=\"Logout\"><span class=\"glyphicon glyphicon-off\" aria-hidden=\"true\" style=\"padding-right: 12px\"></span>Log	Out</a></li>");
						} else {
							out.write("<li><a href=\"login.jsp\"><span class=\"glyphicon glyphicon-log-in\" aria-hidden=\"true\" style=\"padding-right: 12px\"></span>Sign In</a></li>");
						}
						;
					%>
				
			</ul>
		</div>
	</div>
</nav>
<%
	//http://stackoverflow.com/questions/4194207/prevent-user-from-going-back-to-the-previous-secured-page-after-logout
	response.addHeader(
			"Cache-Control",
			"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
	response.addHeader("Pragma", "no-cache");
	response.addDateHeader("Expires", 0);
%>
