<!-- Layout of the main site -->
<%@ page import="java.sql.*"%>
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
        	/*$(document).ready(function(){
		
		$("#usr").click(function()
		{
			$("#usr_div").show('slow');
			$("#no_usr_div").hide('slow');
		})
		
		$("#no_usr").click(function()
		{
			$("#no_usr_div").show('slow');
			$("#usr_div").hide('slow');
		})
	}
	)*/
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
                <%

  String url = "jdbc:mysql://localhost:3306/";
  String dbName = "test";
  String driver = "com.mysql.jdbc.Driver";
  String userName = "root";
  String key = "p9yus8";
  Connection conn = null;   
  try {
		
  Class.forName(driver).newInstance();
  conn = DriverManager.getConnection(url+dbName,userName,key);
  System.out.println("Connected to the database");
%>
connected
<%
  } catch (Exception e) {
	  %>
	  Error in getting connection.
  <% 
  }
  String username = (String)session.getAttribute("user");
  if(username == null){
      response.sendRedirect("login.jsp");
  }
  else
  {         
  PreparedStatement ps1 = conn.prepareStatement("select* from users where u_usrname = '"+username+"';");
  ResultSet rs1 = ps1.executeQuery();
  while(rs1.next())
         {
%>
		
		<div id="purchase_box" style="border:thin	#CCCCCC	solid;	">
			<form id="buy" action="process_settings.jsp" >
			<div style="display:block;">
				<h2> Change Settings </h2> 
			</div>
				<div id="no_usr_div" style="margin-left:24px;">

				<table style="width: 100%">
					<tr style="display: none">
						<td>username</td>
						<td><input name="username" type="text" value=<%= rs1.getString("u_usrname")%>></input></td>
                                        </tr>
					<tr>
						<td>name</td>
						<td><input name="name" type="text" value=<%= rs1.getString("u_name")%>></input></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><input name="addrL1" type="text" value=<%= rs1.getString("u_addrL1")%>></input></td>
					</tr>
					<tr>
						<td></td>
						<td><input name="addrL2" type="text" value=<%= rs1.getString("u_addrL2")%>></input></td>
					</tr>
					<tr>
						<td></td>
						<td><input name="addrL3" type="text" value=<%= rs1.getString("u_addrL3")%>></input></td>
					</tr>
					<tr>
						<td>Nearby landmark</td>
						<td><input type="text" name="landmark" value=<%= rs1.getString("u_addrLM")%>></input></td>
					</tr>
					<tr>
						<td>City</td>
						<td><input type="text" name="city" value=<%= rs1.getString("u_addrCt")%>></input></td>
					</tr>
					<tr>
						<td>State</td>
						<td><input type="text" name="state" value=<%= rs1.getString("u_addrSt")%>></input></td>
					</tr>
					<tr>
						<td>Pin</td>
						<td><input type="text" name="pin" value= <%= rs1.getString("u_addrPin")%>></input></td>
					</tr>
					<tr>
						<td>password</td>
						<td><input type="password" value=<%= rs1.getString("u_passHash")%> name="password"></input></td>
					</tr>
<%
                                        PreparedStatement ps2 = conn.prepareStatement("select c.* from users u,contact c where u.u_id = c.u_id and u.u_usrname ='"+username+"';");
                                        ResultSet rs2 = ps2.executeQuery();
                                        int cnt=1;
                                        while(rs2.next()){
%>
                                        <tr>
						<td>Contact:</td>
						<td><input type="text" value=<%= rs2.getString("u_contact")%> name="contact<%=cnt%>"/></td>
					</tr>
<%					
                                   cnt++;
                                        }
%>					
				</table>

				</div>
			<input name="Submit1" type="submit" value="submit" />
			</form>
                        <%
                                               }
   }
  %>
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