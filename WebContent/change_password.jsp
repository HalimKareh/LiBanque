<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Change Password</title>
<%@include file='importLibs.jsp'%>
<script type="text/javascript">
	function myFunction() {
		var pass1 = document.getElementById("txtPass").value;
		var pass2 = document.getElementById("txtConfirmPass").value;
		var ok = true;
		if (pass1 != pass2) {
			//alert("Passwords Do not match");
			document.getElementById("txtConfirmPass").style.borderColor = "#E34234";
			document.getElementById("txtConfirmPass").style.boxShadow = "0px 0px 10px #E34234";
			ok = false;
		}
		else {
			// alert("Passwords Match!!!");

		}
		return ok;
	}
</script>
</head>
<body>
	<div class="container">
		<%@include file='nav.jsp'%>
		<div class="row">
			<% Client currentClient = new Client();;
			if(client==null){
				response.sendRedirect("login.jsp");}else{
				currentClient = client;
				}%>

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
						<h1 class="text-center">Change Password</h1>
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
								out.write(" Success: Password updated.");
								out.write("</div>");
							}
							if (message.equals("0")) {
								out.write("<div class=\"alert alert-danger\" role=\"alert\">");
								out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
								out.write("<span class=\"sr-only\">Error:</span>");
								out.write(" Error: Old Password is incorrect!");
								out.write("</div>");
							}
							if (message.equals("2")) {
								out.write("<div class=\"alert alert-danger\" role=\"alert\">");
								out.write("<span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>");
								out.write("<span class=\"sr-only\">Error:</span>");
								out.write(" Error: New Passwords Missmatch!");
								out.write("</div>");
							}
						}
					%>
						<form action="ChangePassword" method="post"
							onsubmit="return myFunction()">
							<div class="col-sm-12">
								<div class="row">

									<div class="form-group">
										<label>Old Password *</label> <input type="password"
											placeholder="Enter Old Password Here.." class="form-control"
											name="oldPassword" required id="txtOldPass">
									</div>
									<div class="form-group">
										<label>New Password *</label> <input type="password"
											placeholder="Enter New Password Here.." class="form-control"
											name="newPassword" required id="txtPass">
									</div>
									<div class="form-group">
										<label>Confirm Password *</label> <input type="password"
											placeholder="Renter New Password Here..."
											class="form-control" name="confirmNewPassword" required
											id="txtConfirmPass">
									</div>

									<div class="form-group">
										<input type="submit" class="btn btn-success form-control"
											value="Change Password">
									</div>
									<script type="text/javascript">
											$( "#txtConfirmPass,#txtPass" )
												.blur(function() {
													var pass1 = document.getElementById("txtPass").value;
													var pass2 = document.getElementById("txtConfirmPass").value;
													var ok = true;
													if (pass1 != pass2) {
														//alert("Passwords Do not match");
														// document.getElementById("txtPass").style.borderColor = "#E34234";
														document.getElementById("txtConfirmPass").style.borderColor = "#E34234";
														document.getElementById("txtConfirmPass").style.boxShadow = "0px 0px 10px #E34234";
														ok = false;
													}
													else {
														// alert("Passwords Match!!!");
														if (pass1.length>1) {
															document.getElementById("txtConfirmPass").style.borderColor = "#33cc33";
															document.getElementById("txtConfirmPass").style.boxShadow = "0px 0px 10px #33cc33";
														}else{
															document.getElementById("txtConfirmPass").style.borderColor = "";
															document.getElementById("txtConfirmPass").style.boxShadow = "";
														};

													}
													return ok;
											})
										</script>
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