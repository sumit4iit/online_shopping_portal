<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
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

<%
  } catch (Exception e) {
	  %>
	  Error in getting connection.
  <% 
  }
  %>
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
		
		<div id="list1" class="list">

			
			<%
                        String catL2 = "";
                        catL2 = request.getParameter("catL2");%>
                        <h2><%= catL2 %></h2>
                        <%
                        PreparedStatement ps = conn.prepareStatement("select * from product where p_catL2 = '" +catL2 +"';");
                        ResultSet rs = ps.executeQuery();
                        int i=0;
                            while(rs.next() )
                            {
                                String imgpath="images/" ;
                                if(rs.getString("p_catL1") != null){
                                    imgpath += rs.getString("p_catL1");
                                    imgpath += "/";
                                }
                                if(rs.getString("p_catL2") != null){
                                    imgpath += rs.getString("p_catL2");
                                    imgpath += "/";
                                }
                                if(rs.getString("p_catL3") != null){
                                    imgpath += rs.getString("p_catL3");
                                    imgpath += "/";
                                }
                                imgpath += rs.getString("p_image");
                                
                            %>
                            
                            <a href="prod_details.jsp?p_id=<%= rs.getInt("p_id") %>">
                                    <div id="list1" class="sugg">
                                        
                                            <div class="prod_img">
                                                <img alt="sample_image" src= "<%= imgpath%>"/>
<!--<img src="images/Apparel/Clothing/Jeans/mf.jpeg" width="114" height="140" alt="levis1"/>-->


                                            </div>
                                            <div class="prod_desc">
                                                    <p style="margin: 1px">
                                                        <%= rs.getString("p_name")%>
                                                    </p>
                                                    <p style="margin: 1px">
                                                        <%= rs.getString("p_brand")%>
                                                    </p>
                                                    <p style="margin: 1px">
                                                        Rs. <%= rs.getString("p_price")%>
                                                    </p>
                                                     <p style="margin: 1px">
                                                        Discount: <%= rs.getString("discount")%> %
                                                    </p>
                                            </div>
                                    </div>
                            </a>
                            <%
                           if(i%4==3){%>
                           <div class="clear_left"></div>
                           <%}
                                i++;
                           
                         } 
                         
                        if(i==0)
                           {
                            %>
                            <div style="margin-left: 24px">No Product Found</div>
                            <%
                        }
			%>
		</div>
        </div>
		
		<div id="sidebar" >
			<div id="search">
				<jsp:include page="search.jsp"/>
			</div>
			
			<jsp:include page="sidebar.jsp"/>
		</div>	
		

	<div class="clear">
	</div>
                
	
	
	<div id="footer">
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