<%@ page import="java.sql.*" %>
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
		String joined="";
		String sbs="";
		String sbp="";
		String tot="0";
%>
<%
	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://127.11.119.2:3306/words","sarvesh","asd");
            System.out.println("Connected...ON HOME PAGE");
			String q="select * from users where email='"+email+"'";
			String q2="SELECT COUNT(title) FROM article where author='"+email+"'";
            System.out.println("Connected on user profile page");
       		PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            PreparedStatement pst1 = con.prepareStatement(q2);
            ResultSet rs1 = pst1.executeQuery();
            while(rs.next())
            {	
            	joined=rs.getString("joined");
            	sbs=rs.getString("secret_box");
		        sbp=rs.getString("secret_pin");
		 
		 	}
		 	while(rs1.next())
		 	{
		 		tot=rs1.getString(1);
		 	}
		}
		catch (Exception ex)
        {
            out.println("Error");
        }
 %>
		

<!DOCTYPE html>
<html>
<head>
	<title>
	User Profile
	</title>
	<link rel="stylesheet" type="text/css" href="css/profile.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />

</head>
<body id="body">
<%@include file="include/header.jsp"%>
<div class="clear"></div>
<%@include file="include/sidebar.jsp"%>
<div class="content" id="content">
	<h1 class="pagename">Profile</h1>	
		<center><div class="personal">
			<div class="summary">
				<h2><%=name%></h2>
				<h2><%=email%></h2>
				<h2>Member Since <%=joined%></h2>
			</div>
			<div class="pic">
				<img src="img/user.png">
			</div>
		</div>
		<div class="account">
				<h2>Secret Box Status- <%=sbs%></h2>
				<h2>Secret Box Pin- <span id="pin" onmouseover="alert1()" onclick="showPin(<%=sbp%>)">****</span></h2>
				<% if (tot.equals("0")){
					%>
					<h2>No Articles<a href="post.jsp"> Post Now</a></h2>
				<%} else {%>
				<h2>Total Articles- <%=tot%></h2> <% } %>
				<h2><a href="settings.jsp">Account Settings</a></h2>
		</div>
		<div class="thanks">
			Thank You For Being With Us
		</div>
		</center>
	

</div>
<div class="clear"></div>
<div class="footer"></div>


</body>
<script type="text/javascript">
	function showPin (p) {
		// body...
		document.getElementById("pin").innerHTML=p;
		setTimeout(hidePin,1000);

	}
	function hidePin () {
		// body...
		document.getElementById("pin").innerHTML='****';
	}
	function alert1 () {
		// body...
		document.getElementById("pin").innerHTML='Click to see';
	}
	
</script>
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