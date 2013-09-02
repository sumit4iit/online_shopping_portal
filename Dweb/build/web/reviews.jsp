<!-- Layout of the main site -->
<!--path:    C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\Dweb\web    -->
<%@page import = "java.sql.*" %>
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
                <div id ="UserDetail" style="float: right;margin-right: 30px;">
                    <jsp:include page="sessiondetail.jsp"/>
                </div>
	<div id="main">

	
		<div id="menu">
			<jsp:include page="menu.jsp" />
		</div>

		<!-- Place the content of main body here -->
                <h2>
                   Feedback
                </h2>
                <div  style="margin-left: 24px;">
                <form action="processreview.jsp">
                    Transaction Id:
                    <input type="text" name="t_id" value="transaction id." style="display: block;"/>
                    <br>
                            Feedback
                    <textarea name="reviews" cols="20" rows="3" style="display: block;"></textarea>
                    <br>
                            Rating
                    <select name="rating">
                        <option value ="1">1</option>
                        <option value ="2">2</option>
                        <option value ="3">3</option>
                        <option value ="4">4</option>
                        <option value ="5">5</option>
                    </select>
                    <br>    
                    <input type="submit" value="submit" style="display: block;margin-top: 4px"></input>
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
			<a href="http://www.iiti.ac.in" style="text-align:center;text-decoration:none;cursor:auto;display:block;margin:0px;padding:0px;color:#000000">&copy 2012 IIT INDORE</a>
			<a href="mailto:sumit4iit@gmail.com" style="text-align:left;text-decoration:none;display:inline;float:left;padding:10px;color:black;text-transform:capitalize;">Sumit Agrawal 1000101</a>
			<a href="mailto:piyush@iiti.ac.in" style="text-align:right;text-decoration:none;float:right;padding:10px;color:black;text-transform:capitalize;">Piyush Lahoti 1000105</a>
			<div class="clear"></div>
		</div>		
	</div>	
	</div>	

</body>
</html>