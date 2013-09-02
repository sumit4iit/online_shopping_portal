
<%
    String username = (String)session.getAttribute("user");
    String type = (String)session.getAttribute("type");
    
%>
<div style="">
		<div id="menu">
        <div class="hide"><a href="http://apycom.com/">Apycom jQuery Menus</a></div>
       		<ul class="menu">
                <li><a href="index.jsp" class="parent"><span>Home</span></a></li>
                <%
                if(username == null)
                       {
%>
                <li><a href="#" class="parent"><span>Enter the Portal</span></a>
                    <ul>
                        <li><a href="login.jsp"><span>LogIn</span></a></li>
                        <li><a href="Register.jsp"><span>Register</span></a></li>
                    </ul>
                </li>
                <%
                               }
    if(type == "Customer"){
%>
                <li><a href="#" class="parent"><span>Account</span></a>
                    <ul>
                        <li><a href="prevtrans.jsp"><span>Transactions</span></a></li>
                        <li><a href="reviews.jsp"><span>Reviews</span></a></li>
                        <li><a href="settings.jsp"><span>Settings</span></a></li>
                    </ul>
                </li>
<% } 
    if(type == "Employee"){
%>
                <li><a href="#" class="parent"><span>Account</span></a>
                    <ul>
                        <li><a href="settings.jsp"><span>Settings</span></a></li>
                    </ul>
                </li>
                <li><a href="#" class="parent"><span>Inventory</span></a>
                    <ul>
                        <li><a href="AdminProdUpd.jsp"><span>Add Product</span></a></li>
                        <li><a href="UpdInventory.jsp"><span>Update Inventory</span></a></li>
                        <li><a href="stock.jsp"><span>Stock</span></a></li>
                    </ul>
                </li>
<% } %>
            </ul>
        </div>
    </div>
