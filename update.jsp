<!DOCTYPE html>
<html>
<head>
	<title>Update</title>
	<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />
</head>
<style type="text/css">
	.bg{
		background-image: url("bg.png");
	}
	.dp
	{
		height: 400px;
		width: 60%;
		border: 1px solid black;
		position: relative;
		margin-top: 80px;
		border-left: 60px solid black;
		border-radius: 6px;
		border-bottom-right-radius: 50px;
		background-color: #008B8B;
		
	}
	h1{
		text-align: center;
		color: red;
	}
	input.ip_area {
    width: 83%;
    padding: 10px 10px 10px 40px;
    background: rgba(23, 24, 25, 0.29) url("user.png") no-repeat 10px 10px;
    border: 1px solid #7B7474;
    border-radius: 5px;
    font-size: 18px;
    color: #FFF;
    //outline: none;
    margin-bottom: 20px;
    letter-spacing: 2px;
   }
   input.submit {
   	background: rgba(23, 24, 25, 0.29);
   	width: 100%;
   	border-radius: 5px;
   	height: 30px;
   	color: white;
   }
   label
   {
   	font-size: 18px;
   	color: white;

   }
   table{
   	text-align: center;
   	margin-top: 120px;
   }
   caption {caption-side:bottom;}


</style>
<%@ page import="java.sql.*" %>
<%
	String conn=(String)session.getAttribute("conn");
	session.setAttribute("conn",conn);
	String nm="";
	String pass="";
	try
         {
         	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection
			("jdbc:oracle:thin:@localhost:1521:xe","lms","lms");
			String q="select * from users where email='"+conn+"'";
            System.out.println("Connected");
       		PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            	{
            		nm=rs.getString(1);
            		pass=rs.getString(3);
            	}
		 }


       catch (Exception ex)
        {
            out.println("Error");
        }



%>
<body class="bg">
<h1 id="h1">Update</h1>
<center>
<form class="dp" name="login" method="post" action="updateaction.jsp">

	<table class="form_table">
	<caption id="type"></caption>
			<tr>
			    <td><label for="name">Name</label></td>
				<td><%=nm%></td>
				<td><input type="button" value="edit" onclick="enableEdit('name')"/></td>
				<td><input type="text" id="name" class="ip_area" name="name" hidden="true"/></td>
			</tr>
			<tr>
			    <td><label for="name">Password</label></td>
				<td><%=pass%></td>
				<td><input type="button" value="edit" id="editpk"onclick="enableEdit('password')" /></td>
				<td><input type="password" id="password" class="ip_area" name="password" hidden="true"/></td>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td align="right"><input type="submit" class="submit" id="submit" value="Submit" /></td>
			</tr>
	</table>
	
<p hidden="true" id="pkError">Invalid Login</p>
</form>
</center>

<script type="text/javascript">
   function enableEdit (tag) {
   	// body...
   	document.getElementById(tag).hidden=false;
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
</body>
</html>