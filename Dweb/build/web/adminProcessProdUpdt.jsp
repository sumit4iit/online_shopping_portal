<%-- 
    Document   : adminProcessProdUpdt.jsp
    Created on : Nov 17, 2012, 10:42:17 PM
    Author     : Sumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
		<%
/*			String privilege = (String) session.getAttribute("type");
			if(privilege.equals("admin"))
			{*/
		%>
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
  %>
		
		<%
		int p_id = -1; String p_name = "";String p_model = "";String p_brand ="";
		String p_capacity = ""; String p_dim = "";String p_weight="";
		String p_color="";String p_catL1="";String p_catL2="";String p_catL3="";
		String p_price = ""; String discount="";String p_timeDel="";String p_image ="";
		String p_nItems = ""; String p_payment = "";
		String cod = "0"; String debit = "0"; String cred = "0" ; String netB="0"; 
		
		p_name = request.getParameter("p_name");
		p_model = request.getParameter("p_model");
		p_brand = request.getParameter("p_brand");
		p_capacity= request.getParameter("p_capacity");
		p_dim= request.getParameter("p_dim");
		p_weight= request.getParameter("p_weight");
		p_color= request.getParameter("p_color");
		p_catL1= request.getParameter("p_catL1");
		p_catL2= request.getParameter("p_catL2");
		p_catL3= request.getParameter("p_catL3");
		p_price= request.getParameter("p_price");
		discount= request.getParameter("p_disc");
		p_timeDel= request.getParameter("p_timeDel");
		p_image= request.getParameter("p_image");
		p_nItems= request.getParameter("p_nItems");
		//p_payment= request.getParameter("p_payment");
		
		p_name.replaceAll("'", "");
                p_model.replaceAll("'", "");
                p_brand.replaceAll("'", "");
                p_capacity.replaceAll("'", "");
                p_dim.replaceAll("'", "");
                p_weight.replaceAll("'", "");
                p_color.replaceAll("'", "");
                p_catL1.replaceAll("'", "");
                p_catL2.replaceAll("'", "");
                p_catL3.replaceAll("'", "");
                p_price.replaceAll("'", "");
                discount.replaceAll("'", "");
                p_timeDel.replaceAll("'", ".");
                p_image.replaceAll("'", ".");
                p_nItems.replaceAll("'", ".");
                //p_payment.replaceAll("'", ".");
                
                
                if(request.getParameter("cod") != null)
                {cod = request.getParameter("cod");}
		if(request.getParameter("cred") != null)
                {cred = request.getParameter("cred");}
		if(request.getParameter("debit") != null)
                {debit = request.getParameter("debit");}
		if(request.getParameter("netB") != null)
                {netB = request.getParameter("netB");}
		
		try{
                    conn.setAutoCommit(false);
		PreparedStatement p = conn.prepareStatement("select max(p_id) from product;");
		ResultSet r = p.executeQuery();
                while (r.next())
                {
                    p_id = r.getInt(1);
                }
                %>
                <%= p_id %>
                <%
                p_id += 1;
                PreparedStatement ps = conn.prepareStatement("insert into product(p_id,p_name,p_model,p_brand,p_capacity,p_dim,p_weight,p_color,p_catL1,p_catL2,p_catL3,p_price,discount,p_timeDel,p_image,p_nItems,p_cod,p_credit,p_debit,p_netB) "
                        + " values("+p_id +",'"+p_name+"','"+p_model+"','"+p_brand+"','"+p_capacity +"','"+p_dim+"',"+p_weight+",'"+p_color+"','"+p_catL1+"','"+p_catL2+"','"+p_catL3+"',"+p_price+","+discount+","+p_timeDel+",'"+p_image+"',"+p_nItems+",'"+cod+"','"+cred+"','"+debit+"','"+netB+"');");
 		ps.executeUpdate();		
                conn.commit();
		response.sendRedirect("AdminProdUpd.jsp");
		}catch(Exception e)
		{conn.rollback();
                        }%>		
    </body>
</html>
