<!-- Layout of the main site -->
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
<link  rel="stylesheet" type="text/css" href="common.css"/>
<link  rel="stylesheet" type="text/css" href="styles/menu.css"/>
<link rel="stylesheet" type="text/css"  href="styles/details.css" />
<script type="text/javascript" src="styles/jquery.js"></script>
<script type="text/javascript" src="styles/menu.js"></script>
<style type="text/css">
    table{
        width: 450px;
        border: #cccccc thin solid;
    }
</style>
<script type="text/javascript">
    $(document).ready(function(){
        $("#show").click(function(){
            $(".hid").slideToggle('slow');
            
        }
        )
            $("#hide").click(function(){
                $("")
            })
            
    })
    </script>
</head>

<body>

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
  int p_id;
  p_id = Integer.parseInt(request.getParameter("p_id"));
  PreparedStatement ps = conn.prepareStatement("select * from product where p_id = "+ p_id+ ";");
  ResultSet rs = ps.executeQuery();
  String p_name = "";String p_model = "";String p_brand ="";
		String p_capacity = ""; String p_dim = "";float p_weight=0;
		String p_color="";String p_catL1="";String p_catL2="";String p_catL3="";
		float p_price = 0; int discount=0;int p_timeDel=0;String p_image ="";
		int p_nItems = 0;
                String p_payment = "";
		Boolean cod = false; Boolean debit = false; Boolean cred = false ; Boolean netB=false;
  String imgpath="images/" ;
    while(rs.next()){
    p_name = rs.getString("p_name");
    p_model = rs.getString("p_model");
    p_brand = rs.getString("p_brand");
    p_capacity = rs.getString("p_capacity");
    p_dim = rs.getString("p_dim");
    p_weight = rs.getFloat("p_weight");
    p_color = rs.getString("p_color");
    p_catL1 = rs.getString("p_catL1");
    p_catL2 = rs.getString("p_catL2");
    p_catL3 = rs.getString("p_catL3");
    p_price = rs.getFloat("p_price");
    discount = rs.getInt("discount");
    p_timeDel = rs.getInt("p_timeDel");
    p_image = rs.getString("p_image");
    p_nItems = rs.getInt("p_nItems");
    cod = rs.getBoolean("p_cod");
    debit = rs.getBoolean("p_debit");
    cred = rs.getBoolean("p_credit");
    netB = rs.getBoolean("p_netB");
  
    
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

		<!-- Place the content of main body here -->
		
		<div id="body_content" >
			<h2> Heading </h2>
			<div id="sub_div">
			
				<div id="float_img" class="float_left">
					<img alt="img" src="<%= imgpath %>"></img>
				</div>
				<div id="float_desc" class ="float_left">
                                    <p>Original Price: <%= p_price %></p>
                                    <p>Discount: <%= discount %></p>
                                    <% 
                                    float newp = p_price - (discount*p_price)/100;
                                     %>
                                    <p>OSP Price: <%=  newp %></p>
                                    <form action="transaction.jsp">
                                        <div style="display:none;">
                                        <input type="text" name="p_id" value ="<%=p_id%>" />
                                        </div>
                                        Quantity <input type="text" name="Quantity" value="1" />
                                        
                                        <input id="purchase" style="display:block" type="submit" value="Buy"/>
                                    </form>
					
				</div>
                                <div class="clear">
				</div>
                                <div id="details_visible" >
                                    <table border="0" >
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Product Name</td>
                                                <td><%= p_name%></td>
                                            </tr>
                                            <tr>
                                                <td>Brand</td>
                                                <td><%= p_brand%></td>
                                            </tr>
                                            <tr>
                                                <td>Color</td>
                                                <td><%= p_color%></td>
                                            </tr>
                                            <tr>
                                                <td>Expected Time of Delivery</td>
                                                <td><%= p_timeDel + " days"%></td>
                                            </tr>
                                            <tr>
                                                <td>Cash on Delivery</td>
                                                <td>
                                                    <%
                                                        if(cod == true){
                                                            %>
                                                            Available
                                                            <%
                                                        }
                                                         else{
                                                            %>
                                                            Not Available
                                                            <%
                                                         }
                                                    %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Credit Card</td>
                                                <td><%
                                                        if(cred == true){
                                                            %>
                                                            Available
                                                            <%
                                                        }
                                                         else{
                                                            %>
                                                            Not Available
                                                            <%
                                                         }
                                                    %>
                                                </td>
                                            </tr>
                                                <tr>
                                                <td>Debit Card</td>
                                                <td><%
                                                        if(debit == true){
                                                            %>
                                                            Available
                                                            <%
                                                        }
                                                         else{
                                                            %>
                                                            Not Available
                                                            <%
                                                         }
                                                    %>
                                                </td>
                                            </tr>
                                                <tr>
                                                <td>Net Banking</td>
                                                <td><%
                                                        if(netB == true){
                                                            %>
                                                            Available
                                                            <%
                                                        }
                                                         else{
                                                            %>
                                                            Not Available
                                                            <%
                                                         }
                                                    %>
                                                </td>                                                
          
                                            </tr>
                                                <tr >
                                                    <td>Dimensions</td>
                                                    <td><%= p_dim%></td>
                                                </tr>
                                                <tr >
                                                    <td>Weight</td>
                                                    <td><%= p_weight%></td>
                                                </tr>
                                                <tr >
                                                    <td>Dimensions</td>
                                                    <td><%= p_dim%></td>
                                                </tr>
                                                <tr >
                                                    <td>Capacity</td>
                                                    <td><%= p_capacity%></td>
                                                </tr>
                                                <tr >
                                                    <td>Availability</td>
                                                    <td><% if(p_nItems > 0){ %> 
                                                    In stock <% } else { %> Out of stock <% } %>
                                                    </td>
                                                </tr>
                                               
                                        </tbody>
                                    </table>
                                                    <input type="button" id="show" value="Reviews"></input>
                                </div>
                                                    <div id ="reviews" class ="hid" style="display:none;border: thin solid #cccccc">
<%
            PreparedStatement ps2 = conn.prepareStatement("select t_rating,t_comment,u_name from transaction,users where transaction.u_id = users.u_id and p_id = "+p_id);
            ResultSet rs2 = ps2.executeQuery();
            int rating = 0;
            String Comment = "";
            String User ="";
            while(rs2.next())
                               {
                                rating = rs2.getInt(1);
                                Comment = rs2.getString(2);
                                User = rs2.getString(3);
                                for(int i=0;i<rating;i++){
                                    %>
                                    <img src="" alt="*" style="display: inline;"/>
                                    <%
                                } // end of the rating loop
    %> 
                                <div style="display:block">
                                     Username : <p style="display:block;"><%=User%></p>
                                     Comment  : <p style="display:block;"><%=Comment%></p>
                                </div>
                                <hr></hr>
                                    <%
    
                               }
            
%>
                                                    </div>
                                                    
			</div>
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