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


	String username ="";String name ="";String addrL1="" ;
	String addrL2 ="";String addrL3 ="";String landmark ="";
	String city="";String state ="";String pin ="";
	String contact1 ="";String contact2=""; String password ="";
	username = request.getParameter("username");
        %> <%=username%><%
                
	name = request.getParameter("name");
	addrL1 = request.getParameter("addrL1");
	addrL2 = request.getParameter("addrL2");
	addrL3 = request.getParameter("addrL3");
	landmark = request.getParameter("landmark");
	city= request.getParameter("city");
	state = request.getParameter("state");
	pin = request.getParameter("pin");
        
	contact1 = request.getParameter("contact1");
	contact2 = request.getParameter("contact2");
	password = request.getParameter("password");
        try{
          conn.setAutoCommit(false);
        PreparedStatement ps = conn.prepareStatement("update users set u_name = '"+name+"',u_addrL1 = '"+addrL1+"',u_addrL2 = '"+addrL2+"',u_addrL3 = '"+addrL3+"',u_addrLM = '"+landmark+"',u_addrCt = '"+city+"',u_addrSt = '"+state+"',u_addrPin = '"+pin+"',u_passHash ='"+password +"' where u_usrname='"+username+"';");
        ps.executeUpdate();
        PreparedStatement ps1 = conn.prepareStatement("select u_id from users where u_usrname = "+username);
        int u_id=0;
        ResultSet rs1 = ps1.executeQuery();
        while(rs1.next()){
            u_id = rs1.getInt(1);
        }
        
        conn.commit();
        response.sendRedirect("index.jsp");
               }
        catch(Exception e){
            conn.rollback();
            %>Error
                    <%
                       }
	%>
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