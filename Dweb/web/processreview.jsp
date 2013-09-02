<%-- 
    Document   : processreview
    Created on : 18 Nov, 2012, 8:15:58 PM
    Author     : PYLDell
--%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    if(session.getAttribute("user") == null || session.getAttribute("type") != "Customer"){
        response.sendRedirect("login.jsp");
    }
       else{
        
      
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
  } catch (Exception e) {
  } 
  String feedb = request.getParameter("reviews");
  int t_id = Integer.parseInt(request.getParameter("t_id"));
  int rating = Integer.parseInt(request.getParameter("rating"));
  try{
    conn.setAutoCommit(false);
  PreparedStatement ps1 = conn.prepareStatement("update transaction set t_comment = '"+feedb+"' , t_rating = "+rating+" where t_id = "+ t_id+" ;");
  ps1.executeUpdate(); 
  conn.commit();
  response.sendRedirect("index.jsp");
   %>
   Successful
   <%
  }
catch(Exception e){
  conn.rollback();
    %>
    Error 
    <%
}   
   }
%>
    </body>
</html>
