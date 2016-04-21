<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
	String email=(String)session.getAttribute("conn");
    if (email==null) 
        {
        response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
        }
    String name=(String)session.getAttribute("name");
    if (name==null) 
        {
        response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
        }
    session.setAttribute("conn",email);
    session.setAttribute("name",name);
    String msg=request.getParameter("msg");
    if (msg==null) {
    	msg=" ";
    }
    
%>
<!DOCTYPE html>
<html>
<head>
	<title>
	Welcome: Secret Box
	</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />
	<style type="text/css">
	.header,.footer
	{
		background: #a72631;
	}
	</style>
</head>
<body>
<%@include file="include/header.jsp"%>
<div class="clear"></div>
<%@include file="include/sidebar.jsp"%>
<div class="content" id="content">
	<h1 class="pagename">Secret Box</h1>
	<center><h1 class="msg">Enter Your Secret Key To Visit SecretBox</h1></center>
	<center>
		
	<div class="new_pin" style="height:150px;">
		<form id="check_pin" action="checkpin.jsp" method="post">
		<table>
		<caption id="caption"><%=msg%></caption>
			<tr>
				<td><label for="pin"></label></td>
				<td><br><br><input type="password" id="pin" placeholder="Pin" name="pin" autofocus onkeyup="checkLenght(id)"></td>
			</tr>
		</table>
		</form>
	</div>
	</center>
	
	
</div>
<div class="clear"></div>
<div class="footer" id="footer">footer</div>


</body>
<script type="text/javascript">
	function checkLenght(param)
	{
		var cont= document.getElementById(param).value;
		if (cont!="")
				{
				var x=isNaN(cont);
					if (x==true) 
					{
					alert("Your Pin Will Be Numbers Only");
					}

					else
							{
								if (isNaN(cont)) {
									alert("Invalid Pin");
								};
								var int_length = (''+cont).length;
								if(int_length==4)
									{document.getElementById("pin").style.background="Green";
									document.getElementById("check_pin").submit();}
							}
	
				}
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