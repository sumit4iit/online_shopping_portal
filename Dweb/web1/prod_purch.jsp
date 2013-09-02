<!-- Layout of the main site -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="description" content="Online Shopping" />
<meta author="Sumit Agrawal"/>
<meta sub="databases" />
<title>Online Shopping Portal</title>
<link  rel="stylesheet" type="text/css" href="common.css" />
<link rel="stylesheet" type="text/css" href="styles/purchase.css"/>
<link  rel="stylesheet" type="text/css" href="styles/menu.css"/>
<script type="text/javascript" src="styles/jquery.js"></script>
<script type="text/javascript" src="styles/menu.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#usr").change(function()
		{
			$("#usr_div").show('slow');
			$("#no_usr_div").hide('slow');
		})
		
		$("#no_usr").change(function()
		{
			$("#no_usr_div").show('slow');
			$("#usr_div").hide('slow');
		})
	}
	)
</script>

</head>
<body>

<div class="hold">
</div>

<div id="container">
		<div id="logo">
		</div>
	
	<div id="main">

	
		<div id="menu">
			<jsp:include page="menu.jsp" />
		</div>

		<!-- Place the content of main body here -->
		<h2>
		Product name
		</h2>
		
		<div id="purchase_box" style="border:thin	#CCCCCC	solid;	">
			<form id="buy" action="process.jsp">
			<div class="block">
				<input name="Radio1" id="usr" type="radio" value="true"> I already have osp account </input> 
			</div>
				<div id="usr_div" style="display:none;margin-left:24px;">
					
					username <input type="text" name="username" size="15"> </input>
					
					password<input type="password" name="password"></input>
				
					
				</div>
			<div style="display:block;">
				<input name="Radio1" id="no_usr" type="radio" value="2" > Register </input> 
			</div>
				<div id="no_usr_div" style="display:none;margin-left:24px;">

				<table style="width: 100%">
					<tr>
						<td>username</td>
						<td><input type="text" value="username"></input></td>
					</tr>
					<tr>
						<td>name</td>
						<td><input type="text" value="name"></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><input type="text" value="first line"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" value="Second line"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" value="Third line"></td>
					</tr>
					<tr>
						<td>Nearby landmark</td>
						<td><input type="text" value="landmark"></td>
					</tr>
					<tr>
						<td>City</td>
						<td><input type="text" value="city"></td>
					</tr>
					<tr>
						<td>State</td>
						<td><input type="text" value="state"></td>
					</tr>
					<tr>
						<td>Pin</td>
						<td><input type="text" value="pin"></td>
					</tr>
					<tr>
						<td>Contact:1</td>
						<td><input type="text" value="contact_1"></td>
					</tr>
					<tr>
						<td>Contact:2</td>
						<td><input type="text" value="contact_2"></td>
					</tr>

					<tr>
						<td>password</td>
						<td><input type="password" value="password"></input></td>
					</tr>
					
					<tr>
						<td>confirm password</td>
						<td><input type="password"></input></td>
					</tr>
					
				</table>

				</div>
			<input name="Submit1" type="submit" value="submit" />
			</form>
		</div>

	</div>
	
		<div id="sidebar">
			<div id="search">
				<jsp:include page="search.jsp"/>
			</div>
			
			<jsp:include page="sidebar.jsp"/>
			
		<!-- place contents of the sidebar here -->
			
			
	</div>
		
		

	<div class="clear">
	</div>
	
		
	<div id="footer">
	
	<!-- Place the content of the footer here -->
	
		<div id="footer_bottom">
			<a href="http://www.iiti.ac.in" style="text-align:center;text-decoration:none;cursor:auto;display:block;margin:0px;padding:0px;color:#000000">
			© 2012 IIT INDORE</a>
			<a href="mailto:sumit4iit@gmail.com" style="text-align:left;text-decoration:none;display:inline;float:left;padding:10px;color:black;text-transform:capitalize;">
			Sumit Agrawal 1000101</a>
			<a href="mailto:piyush@iiti.ac.in" style="text-align:right;text-decoration:none;float:right;padding:10px;color:black;text-transform:capitalize;">
			Piyush Lahoti 1000105</a>
			<div class="clear"></div>
		</div>		
	</div>	
	</div>	

</body>
</html>