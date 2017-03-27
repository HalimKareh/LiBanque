<%@page import="packServices.Services"%>
<%@page import="packModel.Currency"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiBanque - Edit Currency</title>
<%@include file='importLibs.jsp'%>
<script type="text/javascript">

function getRate() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			
			var obj = JSON.parse(xhttp.responseText);
			if((obj.Rate==undefined) || (obj.Rate=='N/A')){
				document.getElementById("txtCode").style.borderColor = "#E34234";
				document.getElementById("txtCode").style.boxShadow = "0px 0px 10px #E34234";
				document.getElementById("#msgError").style.display = "block";
				
			}else{
				document.getElementById("txtCode").style.borderColor = "";
				document.getElementById("txtCode").style.boxShadow = "";
				document.getElementById("txtRate").style.borderColor = "#33cc33";
				document.getElementById("txtRate").style.boxShadow = "0px 0px 10px #33cc33";
				document.getElementById("txtRate").value = obj.Rate;
				document.getElementById("#msgError").style.display = "none";
			}
		}
	};
	var code = document.getElementById('txtCode').value
	xhttp.open("GET", "http://rate-exchange.herokuapp.com/fetchRate?from=" + code + "&to=USD", true);
	xhttp.send();
}

</script>
</head>
<body>
<div class="container">
<%@include file='nav.jsp'%>
		<div class="row">
			<% if(admin==null){response.sendRedirect("index.jsp");} %>
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
						<h1 class="text-center">Edit Currency</h1>
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
								out.write(" Success: Currency updated. <a href=\"edit_delete.jsp\">Click Here</a> to go back!");
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
					<%
					String currencyId = request.getParameter("currencyId");
					Currency currency = Services.findCurrencyById(currencyId); %>
					<div class="alert alert-danger" role="alert" id="#msgError" style="display: none;">
						<span class="glyphicon glyphicon-exclamation-sign" ></span>
						<span class="sr-only">Error:</span>
						Enter a valid currency code!
					</div>
						<form action="UpdateCurrency" method="post" 
						onsubmit="return myFunction()">
							<div class="col-sm-12">
								<div class="row">
									<input type="hidden" name="currencyId" value="<%=currencyId%>">
									<div class="form-group">
									<label>Name *</label> <input type="text"
										placeholder="Enter Name Here.." class="form-control"
										name="name" required id="txtName"
										value="<%if(currency!=null){out.print(currency.getName());}%>">
									</div>
									<div class="form-group">
									<label>Code *</label> <input type="text"
										placeholder="Enter Code Here.." class="form-control text-uppercase"
										name="code" required id="txtCode"
										value="<%if(currency!=null){out.print(currency.getCode());}%>">
									</div>
									<div class="form-group">
										<label>Rate *</label> <input type="number"
										placeholder="Enter Rate Here..." class="form-control"
										name="rate" required id="txtRate" step="any"
										value="<%if(currency!=null){out.print(currency.getRateInDollar());}%>">
									</div>
									<div class="form-group">
										
									</div>
									<div class="form-group">
										<div class="col-md-6">
											<input type="button" onclick="getRate()"
											class="btn btn-warning form-control" 
											value="Update Rate from Server...">
										</div>
										<div class="col-md-6">
											<input type="submit" class="btn btn-success form-control" value="Save Changes">
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-12">
						<blockquote id="blockquoteBlue">
							<p><span class="glyphicon glyphicon-copyright-mark"></span> Currency rate Brought by: rate-exchange.herokuapp.com</p>
						</blockquote>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>