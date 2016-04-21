<html>
<title>
Welcome
</title>
<body>
<center>
<%
	String name=request.getParameter("name");
	String conn=(String)session.getAttribute("conn");
	session.setAttribute("conn",conn);

%>

<%
if(conn==null)
	{
		response.sendRedirect("login.jsp");
	}
else
	{
	%>
<h1>Welcome <%=name%></h1>


<a href="logout.jsp">Logout</a>

<a href="update.jsp">UpdateDeatils</a>
</center>
<% } %>
</body>
</html>