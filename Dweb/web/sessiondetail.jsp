<%
                    String username =  (String) session.getAttribute("user");
                    String type = (String) session.getAttribute("type");
                    if(username != null){
                        %>
                        <p style="margin: 2px">    
                    <%= username%>
                        </p>
                        
                        <p style ="margin: 2px">
                        <%= type%>
                        </p>
                        <a href="process_logout.jsp"><input type="button" value ="Log Out"></input></a>
                        <%
                    }
                    
                 %>