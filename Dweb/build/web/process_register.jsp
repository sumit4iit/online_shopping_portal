
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page  import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
	<head></head>
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


	String username ="";String name ="";String addrL1="" ;
	String addrL2 ="";String addrL3 ="";String landmark ="";
	String city="";String state ="";String pin ="";
	String contact1 ="";String contact2=""; String password ="";
	username = request.getParameter("username");
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
	%>
	
	works
	
	<%
	
	Statement p1 = conn.createStatement();
	
	ResultSet rs = p1.executeQuery("select max(u_id) from users");
	int newid = -1;
	while(rs.next())
	{
            %>
            while worked
        <%
		newid = rs.getInt(1);
		newid++;
                %>
          <%= newid %>
        <%
	}
	if(newid != -1)
	{
            try{
                
            conn.setAutoCommit(false);
	  PreparedStatement p = conn.prepareStatement("insert into users(u_id,u_name,u_addrL1,u_addrL2,u_addrL3,u_addrLM, u_addrCt, u_addrSt, u_addrPin,u_usrname,u_passhash) "
	  + " values('"+ newid+ "', '"+name+ "', '"+addrL1+"', '"+addrL2+"', '"+addrL3+"', '"+landmark+"','"+ city+"',' "+ state +"','"+pin +"','"+username+"','"+password+"');");
          
            //PreparedStatement p = conn.prepareStatement("insert into users(u_id) values('"+ newid + "');");
            p.executeUpdate();
            PreparedStatement p2 = conn.prepareStatement("insert into contact values("+newid+",'"+ contact1 +"')");
            p2.executeUpdate();
            PreparedStatement p3 = conn.prepareStatement("insert into contact values("+newid+",'"+ contact2 +"')");
            p3.executeUpdate();
            conn.commit();
            response.sendRedirect("login.jsp");
                       }
            catch(Exception e){
                conn.rollback();
                               }
            }
%>
	</body>
</html>
