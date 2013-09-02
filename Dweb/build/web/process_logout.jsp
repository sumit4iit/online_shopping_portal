<%-- 
    Document   : process_logout
    Created on : 18 Nov, 2012, 11:31:28 AM
    Author     : PYLDell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.invalidate();
        response.sendRedirect("index.jsp");
        %>
    </body>
</html>
