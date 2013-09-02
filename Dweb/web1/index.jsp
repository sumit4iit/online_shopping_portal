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
<link rel="stylesheet" type="text/css" href="start_page.css"/>
<link  rel="stylesheet" type="text/css" href="styles/menu.css"/>
<script type="text/javascript" src="styles/jquery.js"></script>
<script type="text/javascript" src="styles/menu.js"></script>
</head>
<body>
<%
	
%>
<div class="hold">
</div>

<div id="container">
		<div id="logo">
		</div>
	
	<div id="main">
	
		<div id="menu">
			<jsp:include page="menu.jsp" />
		</div>
		
		<div id="list1" class="list">

			<h2>
			Heading to be placed here...!!
			</h2>
		
			<%for(int i=0 ; i<4 ; i++) 
			{
			%>
				<div id="list1" class="sugg">
					<div class="prod_img">
						<img alt="sample_image" src="images/sample.png"/> 
					</div>
					<div class="prod_desc">
						<p>Details and information about the product, will be puting links from the database and use of jquerry.</p>
					</div>
				</div>
			<%
			}
			%>
		</div>
		
		<div class="clear_left"></div>
		<div id="list2" class="list">

			<h2 >
			Heading to be placed here..!!
			</h2>
			<%for(int i=0 ; i<4 ; i++) 
			{
			%>
				<div id="list2" class="sugg">
					<div class="prod_img">
						<img alt="sample_image" src="images/sample.png"/> 
					</div>
					<div class="prod_desc">
						<p>Details and information about the product, will be puting links from the database and use of jquerry.</p>
					</div>
				</div>
			<%
			}
			%>
		</div>
	</div>
	
		<div id="sidebar">
			<div id="search">
				<jsp:include page="search.jsp"/>
			</div>
			
			<jsp:include page="sidebar.jsp"/>
		</div>

	<div class="clear">
	</div>
	
	
	
	<div id="footer">
		<p>footer Cotent to be placed in tho footer....</p>
		<p>footer Cotent to be placed in tho footer....</p>		
		<p>footer Cotent to be placed in tho footer....</p>
	
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