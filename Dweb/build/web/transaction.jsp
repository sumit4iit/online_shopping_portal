<!-- Layout of the main site -->
<!--path:    C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\Dweb\web    -->
<%@page import = "java.sql.*" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
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
  Class.forName(driver).newInstance();
  conn = DriverManager.getConnection(url+dbName,userName,key);
  System.out.println("Connected to the database");
        String username = (String)session.getAttribute("user");
        if(username == null){
            response.sendRedirect("login.jsp");
        }
               else{
                    conn.setAutoCommit(false);
                    try{
                    PreparedStatement ps1 = conn.prepareStatement("select * from users where u_usrname = '"+username+"';");
                    ResultSet rs1 = ps1.executeQuery();
                    int u_id=0;
                    while(rs1.next()){
                        u_id = rs1.getInt("u_id");
                    }
                    PreparedStatement ps2 = conn.prepareStatement("select max(t_id) from transaction;");
                    ResultSet rs2 = ps2.executeQuery();
                    int t_id=1;
                    while(rs2.next()){
                        t_id = rs2.getInt(1);
                        t_id++;
                    }
                    
                    Integer p_id = Integer.parseInt(request.getParameter("p_id"));
                    //s.replaceAll("\\W","");
                    //int p_id = Integer.parseInt(s);
                    PreparedStatement ps4 = conn.prepareStatement("select * from product where p_id = " + p_id+";");
                    ResultSet rs4 = ps4.executeQuery();
                    int quan = Integer.parseInt(request.getParameter("Quantity"));
                    int nItems =0 ;
                    float price=0;
                    float discount=0;
                    float amount=0;
                    while(rs4.next()){
                        nItems = rs4.getInt("p_nItems");
                        price = rs4.getFloat("p_price");
                        discount = rs4.getFloat("discount");
                        amount = price - (price*discount)/100;
                    }
                    if(quan <= nItems ){
                    PreparedStatement ps3 = conn.prepareStatement("insert into transaction(p_id,u_id,t_id,t_date,t_quantity,t_amount) values("+ p_id +","+u_id+","+t_id+",date(now()),"+quan+ ","+ amount+  ")");
                    ps3.executeUpdate();
                    PreparedStatement ps5 = conn.prepareStatement("update product set p_nItems = "+(nItems - quan) + " where p_id = "+p_id);
                    ps5.executeUpdate();
                    %>
                    Transaction was Successful
                    
                    <%
                                       }
                                       else{
                    %>Transaction Failed. Only <%= nItems %> available.<%
                                       }
                    conn.commit();
                       }
                    catch(Exception e)
                                                       {
                        conn.rollback();
                        %>Error in Transaction<%
                    }
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