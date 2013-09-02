<%-- 
    Document   : test
    Created on : 17 Nov, 2012, 9:33:50 PM
    Author     : PYLDell
--%>
<%@page  import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
connected
<%
  } catch (Exception e) {
	  %>
	  Error in getting connection.
  <% 
  }
%>
        <h1>Hello World!</h1>
    </body>
</html>
