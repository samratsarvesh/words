<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
	String email=(String)session.getAttribute("conn");
	String name=(String)session.getAttribute("name");
	String msg=request.getParameter("msg");
	if(msg!=null) {
		%>
		<script type="text/javascript">
		alert("<%=msg%>");
		</script>
		<%
		
	}
    session.setAttribute("conn",email);
    session.setAttribute("name",name);
	if (email==null) 
		{
		response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
		}
    String title="";
    String content="";
    String shortContent="";
    String articleid="";
    int flag=1;
%>
<!DOCTYPE html>
<html>
<head>
	<title>
	Welcome: Home
	</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />
</head>
<body id="body">
<%@include file="include/header.jsp"%>
<div class="clear"></div>
<%@include file="include/sidebar.jsp"%>
<div class="content" id="content">
	<h1 class="pagename">Your Words</h1>	
<%
	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://127.11.119.2:3306/words","sarvesh","asd");
            System.out.println("Connected...ON HOME PAGE");
			String q="select * from article where author='"+email+"' and protected='N'";
            System.out.println("Connected");
       		PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {	
            	articleid=rs.getString(1);
            	title=rs.getString(2);
		        content=rs.getString(4);
		        shortContent=content.substring(0,20);
		        flag=0;
		   %>
		        <div class="article">
            	<h3><%out.println(title);%></h3>
		        <p class="articlepreview">
		        <%=shortContent%>........
		        </p>
				<a class="readmore" href="welcome2.jsp?msg=<%=articleid%>">Read More...</a>
		        </div>       
           <% }
           	if(flag==1)
           	{
           	//System.out.println("If works");
           	%>
           		<center>
           		<div class="nothing">
           			<div class="h1">
           			<h1>Nothing To Display
           			<a href="post.jsp">Post Article</a></h1>
           			</div>
           		</div>
           		</center>
           		
        <%    
		}}
		catch (Exception ex)
        {
            out.println("Error");
        }
 %>
		
	

</div>
<div class="clear"></div>
<div class="footer"></div>


</body>
<script type="text/javascript">
$(document).ready(function() {
  function setHeight() {
    windowHeight = $(window).innerHeight()-113;
    $('#sidebar').css('min-height', windowHeight);
    $('#content').css('min-height', windowHeight);
  };
  setHeight();
  
  $(window).resize(function() {
    setHeight();
  });
});
</script>
</html>