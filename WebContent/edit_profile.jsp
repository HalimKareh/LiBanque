<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="packServices.HeaderComponents"%>
<%@page import="packModel.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Register</title>
<%@include file='importLibs.jsp'%>
<script type="text/javascript">
	function randomPassword() {
		var chars = "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890";
		var pass = "";
		for (var x = 0; x < 10; x++) {
			var i = Math.floor(Math.random() * chars.length);
			pass += chars.charAt(i);
		}
		return pass;
	}

	function generate() {
		$("#txtPass").val(randomPassword());
	}
</script>
</head>
<body>

	<div class="container">
		<%@include file='nav.jsp'%>
		<div class="row">
			<% Client currentClient = new Client();
			if(client==null){
				response.sendRedirect("login.jsp");}else{
				currentClient = client;
				}%>
			
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
						<h1 class="text-center">Edit Profile</h1>
						<hr>
					</div>
					<div class="col-xs-12">
					<%
						
						String message = request.getParameter("success");
						if (message != null) {
							out.write("<div class=\"alert alert-success\" role=\"alert\">");
							out.write("<span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>");
							out.write("<span class=\"sr-only\">Success:</span>");
							out.write(" Success: Profile updated.");
							out.write("</div>");
						}
						%>
						<form action="UpdateProfile" method="post">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<h2>Account info</h2>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4 form-group">
										<label>Username *</label> <input type="text"
											placeholder="Enter Username Here.." class="form-control"
											name="username" required value="<% out.print(currentClient.getUsername()); %>" readonly>
									</div>
									<div class="col-sm-4 form-group">
										<label>Change Password</label>
										<a class="btn btn-info form-control" href="change_password.jsp" role="button">Change Password Here</a>
										
										<!-- <label>Confirm Password *</label>
										<input type="password" placeholder="Renter Password Here.." class="form-control" required id="txtConfirmPass"> -->
										<script type="text/javascript">
											//$( "#txtConfirmPass,#txtPass" )
											// 	.blur(function() {
											// 		var pass1 = document.getElementById("txtPass").value;
											// 		var pass2 = document.getElementById("txtConfirmPass").value;
											// 		var ok = true;
											// 		if (pass1 != pass2) {
											// 			//alert("Passwords Do not match");
											// 			// document.getElementById("txtPass").style.borderColor = "#E34234";
											// 			document.getElementById("txtConfirmPass").style.borderColor = "#E34234";
											// 			document.getElementById("txtConfirmPass").style.boxShadow = "0px 0px 10px #E34234";
											// 			ok = false;
											// 		}
											// 		else {
											// 			// alert("Passwords Match!!!");
											// 			if (pass1.length>1) {
											// 				document.getElementById("txtConfirmPass").style.borderColor = "#33cc33";
											// 				document.getElementById("txtConfirmPass").style.boxShadow = "0px 0px 10px #33cc33";
											// 			}else{
											// 				document.getElementById("txtConfirmPass").style.borderColor = "";
											// 				document.getElementById("txtConfirmPass").style.boxShadow = "";
											// 			};

											// 		}
											// 		return ok;
											// })
										</script>
									</div>
								</div>

								<div class="form-group">
									<label>Email Address *</label> <input type="text"
										placeholder="Enter Email Address Here.." class="form-control"
										name="email" required value="<% out.print(currentClient.getEmail()); %>">
								</div>
								<hr />
								<div class="row">
									<div class="col-sm-12">
										<h2>Profile info</h2>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6 form-group">
										<label>First Name *</label> <input type="text"
											placeholder="Enter First Name Here.." class="form-control"
											name="first" required value="<% out.print(currentClient.getFirstName()); %>">
									</div>
									<div class="col-sm-6 form-group">
										<label>Last Name *</label> <input type="text"
											placeholder="Enter Last Name Here.." class="form-control"
											name="last" required value="<% out.print(currentClient.getLastName()); %>">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6 form-group">
										<label>Father Name</label> <input type="text"
											placeholder="Enter Father Name Here.." class="form-control"
											name="father" value="<% out.print(currentClient.getFatherName()); %>">
									</div>
									<div class="col-sm-6 form-group">
										<label for="birthDate">Date of Birth *</label> <input
											type="date" id="birthDate" class="form-control"
											name="birthDate" required value="<%if(currentClient.getDateOfBirth()!=null){
												out.print(new SimpleDateFormat("yyyy-MM-dd").format(currentClient.getDateOfBirth()));
												} %>">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6 form-group">
										<div class="form-group">
											<label>Gender *</label>

											<div class="row">
												<div class="col-sm-3">
													<label class="radio-inline"> <input type="radio"
														id="femaleRadio" value="Female" name="gender" required
														checked="<% if(currentClient.getGender()!=null){
																out.print(currentClient.getGender().toLowerCase().equals("female")?"checked=\"true\"":"" );} %>"
														>Female
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input type="radio"
														id="maleRadio" value="Male" name="gender" required
														<% if(currentClient.getGender()!=null){
														out.print(currentClient.getGender().toLowerCase().equals("male")?"checked=\"true\"":"" );} %>
														>Male
													</label>
												</div>
											</div>

										</div>
									</div>
									<div class="col-sm-6 form-group">
										<div class="form-group">
											<label>Phone Number *</label> <input type="text"
												placeholder="Enter Phone Number Here.." class="form-control"
												name="phone" required value="<% out.print(currentClient.getPhone()); %>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4 form-group">
										<label>City *</label> <input type="text"
											placeholder="Enter City Name Here.." class="form-control"
											name="city" value="<% out.print(currentClient.getCity()); %>">
									</div>
									<div class="col-sm-4 form-group">
										<label>Street *</label> <input type="text"
											placeholder="Enter Street Name Here.." class="form-control"
											name="street" value="<% out.print(currentClient.getStreet()); %>">
									</div>
									<div class="col-sm-4 form-group">
										<label>Building *</label> <input type="text"
											placeholder="Enter Building Name Here.." class="form-control"
											name="building" value="<% out.print(currentClient.getBuilding()); %>">
									</div>
								</div>

								<blockquote id="blockquoteBlue">
									<p><span class="glyphicon glyphicon-asterisk" ></span> Fields marked with an asterisk are required.</p>
								</blockquote>
								<button type="submit" class="btn btn-success">Submit</button>
								<br /> <br />

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>