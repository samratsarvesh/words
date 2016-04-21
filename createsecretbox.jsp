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
	<center>
	<!-- This is the division to display on first open on page -->
   <div class="secretwelcome" id="secretwelcome">
	<center><h1 class="msg">Welcome to Secret Box</h1></center>
	<div id="nogenerate">
		Not Interested??
		<br>
		<br>
		<input type="button" value="Back" id="back" onclick="completeAction(id)">
	</div>
	<div id="generate">
		Ready to create?
		<br>
		<br>
		<input type="button" value="Go" id="o" onclick="completeAction(id)">
	</div>
	<h3 id="aboutsb">Secret Box Keeps all your secret posts protected with a high security pin</h3>
		
	</div>

	<!-- ------------------------------------------------------------------------- -->

	<div class="new_pin" id="new_pin" hidden="true">
	<center><h1 class="msg">Create your first time pin</h1></center>
		<form id="generate_pin" action="savepin.jsp" method="post">
		<table>
		<caption id="caption" hidden="true">Pins Match</caption>
			<tr>
				<td><label for="pin"></label></td>
				<td><br><input type="password" id="pin" placeholder="4 digit pin" onkeyup="checkLenght(id)"></td>
			</tr>
			<tr>
				<td><label for="pin"></label></td>
				<td><br><br><input type="password" name="pin" id="r_pin" placeholder="Re Enter" onkeyup="matchPin()"></td>
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
									document.getElementById("r_pin").focus();
							}
	
				}
	}
	function matchPin() {
		// body...
		var p1=document.getElementById("pin").value;
		var p2=document.getElementById("r_pin").value;
		if (p1==p2) {
			document.getElementById("r_pin").style.background="Green";
			document.getElementById("generate_pin").submit();
			document.getElementById("caption").hide;
		}
		else
			{
				document.getElementById("r_pin").style.background="#DC143C";
			}
	}
	function completeAction(par) {
		// body...
		var chk=document.getElementById(par).value;
		if(chk=="Go")
		{	
			document.getElementById("secretwelcome").style.display='none';
			document.getElementById("new_pin").hidden = false;
		}
		if (chk=="Back") {
			window.location="home.jsp";
		};
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