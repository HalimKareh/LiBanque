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
			<%
				if (admin == null) {
					response.sendRedirect("index.jsp");
				}
			%>
			<div class="col-md-12 no-float" id="web-body">
				<div class="row">
					<div class="col-xs-12">
						<h1 class="text-center">Add New Client</h1>
						<hr>
					</div>
					<div class="col-xs-12">
						<form action="InsertClient" onsubmit="return myFunction()"
							method="post">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<h2>Account info</h2>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4 form-group" id="divUsername">
										<label>Username *</label>
										<div class="input-group" id="divInputGroupUsername">
											<input type="text" placeholder="Enter Username Here.."
												class="form-control" name="username" required
												id="txtUsername">
											<div class="input-group-addon" id="addonUsername">
												<span class="glyphicon"  id="spanUsername"></span>
											</div>
										</div>
									</div>
									<script type="text/javascript">
										$(document)
												.ready(
														function() {

															$("#addonUsername")
																	.hide();
															$(
																	"#divInputGroupUsername")
																	.removeClass(
																			"input-group");

															$("#txtUsername")
																	.focusout(
																			function() {
																				var value = $(
																						this)
																						.val();
																				if (value.length > 0) {
																					$(
																							"#addonUsername")
																							.show();
																					$(
																							"#divInputGroupUsername")
																							.addClass(
																									"input-group");
																					checkUsername();
																				} else {
																					$(
																							"#addonUsername")
																							.hide();
																					$(
																							"#divInputGroupUsername")
																							.removeClass(
																									"input-group");
																					$(
																							"#divUsername")
																							.removeClass(
																									"has-success");
																					$(
																							"#divUsername")
																							.removeClass(
																									"has-error");
																					$(
																							"#spanUsername")
																							.removeClass(
																									"glyphicon-ok");
																					$(
																							"#spanUsername")
																							.removeClass(
																									"glyphicon-remove");
																				}
																			});

															$('#txtUsername')
																	.keyup(
																			function() {
																				var value = $(
																						this)
																						.val();
																				if (value.length > 0) {
																					$(
																							"#addonUsername")
																							.show();
																					$(
																							"#divInputGroupUsername")
																							.addClass(
																									"input-group");
																					checkUsername();
																				} else {
																					$(
																							"#addonUsername")
																							.hide();
																					$(
																							"#divInputGroupUsername")
																							.removeClass(
																									"input-group");
																					$(
																							"#divUsername")
																							.removeClass(
																									"has-success");
																					$(
																							"#divUsername")
																							.removeClass(
																									"has-error");
																					$(
																							"#spanUsername")
																							.removeClass(
																									"glyphicon-ok");
																					$(
																							"#spanUsername")
																							.removeClass(
																									"glyphicon-remove");
																					$(
																							"#btnSubmit")
																							.removeClass(
																									"disabled");
																				}
																			});
														});

										function checkUsername() {
											var username = document
													.getElementById('txtUsername').value
											var exists = false;
											var xhttp = new XMLHttpRequest();
											xhttp.onreadystatechange = function() {
												if (xhttp.readyState == 4
														&& xhttp.status == 200) {
													var obj = JSON
															.parse(xhttp.responseText);
													// 												document.write(obj.available)
													if (obj.available == false) {
														$("#divUsername")
																.removeClass(
																		"has-success");
														$("#divUsername")
																.addClass(
																		"has-error");
														$("#spanUsername")
																.removeClass(
																		"glyphicon-ok");
														$("#spanUsername")
																.addClass(
																		"glyphicon-remove");
														$("#btnSubmit")
																.addClass(
																		"disabled");
													} else {
														$("#divUsername")
																.removeClass(
																		"has-error");
														$("#divUsername")
																.addClass(
																		"has-success");
														$("#spanUsername")
																.removeClass(
																		"glyphicon-remove");
														$("#spanUsername")
																.addClass(
																		"glyphicon-ok");
														$("#btnSubmit")
																.removeClass(
																		"disabled");
													}
												}
											};
											xhttp
													.open(
															"GET",
															"http://"
																	+
									<%="\"" + request.getServerName() + "\""%>
										+ ":"
																	+
									<%="\"" + request.getServerPort() + request.getContextPath()
					+ "\""%>
										+ "/CheckUsername?username="
																	+ username,
															true);
											xhttp.send();
										}
									</script>
									<div class="col-sm-4 form-group">
										<label>Password *</label> <input type="text"
											placeholder="Enter Password Here.." class="form-control"
											name="password" required id="txtPass" readonly>
									</div>
									<div class="col-sm-4 form-group">
										<label>Generate random password</label>
										<button type="button" class="btn btn-success form-control"
											onClick="generate();">Generate</button>
										<!-- <label>Confirm Password *</label>
										<input type="password" placeholder="Renter Password Here.." class="form-control" required id="txtConfirmPass"> -->
									</div>
								</div>

								<div class="form-group">
									<label>Email Address *</label> <input type="text"
										placeholder="Enter Email Address Here.." class="form-control"
										name="email" required>
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
											name="first" required>
									</div>
									<div class="col-sm-6 form-group">
										<label>Last Name *</label> <input type="text"
											placeholder="Enter Last Name Here.." class="form-control"
											name="last" required>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6 form-group">
										<label>Father Name</label> <input type="text"
											placeholder="Enter Father Name Here.." class="form-control"
											name="father">
									</div>
									<div class="col-sm-6 form-group">
										<label for="birthDate">Date of Birth *</label> <input
											type="date" id="birthDate" class="form-control"
											name="birthDate" required>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6 form-group">
										<div class="form-group">
											<label>Gender *</label>

											<div class="row">
												<div class="col-sm-3">
													<label class="radio-inline"> <input type="radio"
														id="femaleRadio" value="Female" name="gender" required>Female
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input type="radio"
														id="maleRadio" value="Male" name="gender" required>Male
													</label>
												</div>
											</div>

										</div>
									</div>
									<div class="col-sm-6 form-group">
										<div class="form-group">
											<label>Phone Number *</label> <input type="text"
												placeholder="Enter Phone Number Here.." class="form-control"
												name="phone" required>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4 form-group">
										<label>City *</label> <input type="text"
											placeholder="Enter City Name Here.." class="form-control"
											name="city">
									</div>
									<div class="col-sm-4 form-group">
										<label>Street *</label> <input type="text"
											placeholder="Enter Street Name Here.." class="form-control"
											name="street">
									</div>
									<div class="col-sm-4 form-group">
										<label>Building *</label> <input type="text"
											placeholder="Enter Building Name Here.." class="form-control"
											name="building">
									</div>
								</div>

								<blockquote id="blockquoteBlue">
									<p>
										<span class="glyphicon glyphicon-asterisk" ></span>
										Fields marked with an asterisk are required.
									</p>
								</blockquote>
								<button type="submit" class="btn btn-success" id="btnSubmit">Submit</button>
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