<!-- Layout of the main site -->
<!--path:    C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\Dweb\web    -->
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
                    <%
                    String username =  (String) session.getAttribute("user");
                    String type = (String) session.getAttribute("type");
                    if(username != null && type == "Employee"){
                        %>
                        <p style="margin: 2px">    
                    <%= username%>
                        </p>
                        
                        <p style ="margin: 2px">
                        <%= type%>
                        </p>
                        <a href="process_logout.jsp"><input type="button" value ="Log Out"></input></a>
                        <%
                    }
                                       else{
                                       response.sendRedirect("login.jsp");
                                       }
                 %>
                </div>
	<div id="main">

	
		<div id="menu">
			<jsp:include page="menu.jsp" />
		</div>

		<!-- Place the content of main body here -->
                <form action="adminProcessProdUpdt.jsp">
                        <table border="1" style="margin-left: 24px">
                            <thead>
                                <tr>
                                    <th>Enter Product Details</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Name</td>
                                    <td><input type="text" name="p_name" value="p_name" /></td>
                                </tr>
                                <tr>
                                    <td>Model</td>
                                    <td><input type="text" name="p_model" value="p_model"/></td>
                                </tr>
                                <tr>
                                    <td>Brand</td>
                                    <td><input type="text" name="p_brand" value="p_brand"  /></td>
                                </tr>
                                <tr>
                                    <td>Capacity</td>
                                    <td><input type="text" name="p_capacity" value="p_capacity"  /></td>
                                </tr>
                                <tr>
                                    <td>Dimensions</td>
                                    <td><input type="text" name="p_dim" value="p_dim" /></td>
                                </tr>
                                <tr>
                                    <td>Weight</td>
                                    <td><input type="text" name="p_weight" value="0.0" /></td>
                                </tr>
                                <tr>
                                    <td>Color</td>
                                    <td><input type="text" name="p_color" value="p_color" /></td>
                                </tr>
                                <tr>
                                    <td>Category Level 1</td>
                                    <td><input type="text" name="p_catL1" value="Apparel" /></td>
                                </tr>
                                <tr>
                                    <td>Category Level 2</td>
                                    <td><input type="text" name="p_catL2" value="footwear" /></td>
                                </tr>
                                <tr>
                                    <td>Category Level 3</td>
                                    <td><input type="text" name="p_catL3" value="p_catL3" /></td>
                                </tr>
                                <tr>
                                    <td>Price</td>
                                    <td><input type="text" name="p_price" value="0.0" /></td>
                                </tr>
                                <tr>
                                    <td>Discount</td>
                                    <td><input type="text" name="p_disc" value="10.0" /></td>
                                </tr>
                                <tr>
                                    <td>Time of Delivery</td>
                                    <td><input type="text" name="p_timeDel" value="3" /></td>
                                </tr>
                                <tr>
                                    <td>Image</td>
                                    <td><input type="text" name="p_image" value=".jpeg" /></td>
                                </tr>
                                <tr>
                                    <td>Number of Items</td>
                                    <td><input type="text" name="p_nItems" value="10" /></td>
                                </tr>
                                <tr>
                                    <td>Cash on Delivery</td>
                                    <td><input type="checkbox" name="cod" value="1" checked="checked" /></td>
                                </tr>
                                <tr>
                                    <td>Credit</td>
                                    <td><input type="checkbox" name="cred" value="1" checked="checked" /></td>
                                </tr>
                                <tr>
                                    <td>Debit</td>
                                    <td><input type="checkbox" name="debit" value="1" checked="checked"/></td>
                                </tr>
                                <tr>
                                    <td>Net Banking</td>
                                    <td><input type="checkbox"  name="netB" value="1" checked="checked" /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" name="submit" value="submit" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
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