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
<link rel="stylesheet" type="text/css" href="search.css" />
<link  rel="stylesheet" type="text/css" href="styles/menu.css"/>
<script type="text/javascript" src="styles/jquery.js"></script>
<script type="text/javascript" src="styles/menu.js"></script>
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
			<div id="serch_short">

			<% for(int i=0 ; i< 4 ; i++)
			{
			%>

				<div class="search_short">

					<div class="sample_img" style="background-image:<%= "url('images/sample.png')"%>">
					</div>

					<div class="desc">
					</div>

				</div>

			<% 
			}
			%>
			<div class="clear_left"></div>
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
			<a href="http://www.iiti.ac.in" style="text-align:center;text-decoration:none;cursor:auto;display:block;margin:0px;padding:0px;color:#000000">&copy 2012 IIT INDORE</a>
			<a href="mailto:sumit4iit@gmail.com" style="text-align:left;text-decoration:none;display:inline;float:left;padding:10px;color:black;text-transform:capitalize;">Sumit Agrawal 1000101</a>
			<a href="mailto:piyush@iiti.ac.in" style="text-align:right;text-decoration:none;float:right;padding:10px;color:black;text-transform:capitalize;">Piyush Lahoti 1000105</a>
			<div class="clear"></div>
		</div>		
	</div>	
	</div>	

</body>
</html>