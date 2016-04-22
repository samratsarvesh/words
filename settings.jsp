<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
	String email=(String)session.getAttribute("conn");
	String name=(String)session.getAttribute("name");
	String msg=(String)request.getParameter("msg");
	String pin="";
    session.setAttribute("conn",email);
    session.setAttribute("name",name);
	if (email==null) 
		{
		response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
	}
	
%>
<%
	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://127.11.119.2:3306/words","sarvesh","asd");
            System.out.println("Connected...ON CHECKSECRETBOX PAGE");
			String q="select secret_pin from users where email='"+email+"'";
       		PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            pin= rs.getString(1);
        	}
        }
        catch (Exception ex)
        {
                out.println("error"+ex);
        }
        
%>


<!DOCTYPE html>
<html>
<head>
	<title>User Settings</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/profile.css">
	<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />
</head>
<body class="bg" onload="flashError()">
<%@include file="include/header.jsp"%>
<%@include file="include/sidebar.jsp"%>
<div class="content" id="content">
	<div class="visible">
	<center><div class="btn"><button onclick="showChangePasswordDiv()">Change Password</button></div>
	<div class="btn"><button onclick="showChangePinDiv()">Change Pin</button></div>
	<div class="btn"><button onclick="showDeleteSecretBox()">Deactivate SecretBox</button></div>
	<div class="btn"><button>Change</button></div>
	<div class="btn"><button>Change</button></div>
	<div class="circle">
		<form class="changePass" hidden="true" action="changepassword.jsp" method="post" id="changepassword">
			<table>
				<tr>
					<td></td>
					<td><input type="text" placeholder="Old Password" name="oldpassword"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="password" id="password" placeholder="New Password" name="password"/></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="password" id="r_password" placeholder="Retype Password" name="r_password" onkeyup="matchPassword()"></td>
				</tr>
				<tr>
					<td></td>
					<td align="center"><input type="submit" value="Save"></td>
				</tr>
			</table>
		</form>

<!-- dectivate the secret box with pin -->

	<form class="changePass" id="checkpinfordelete" hidden="true">
			<table>
			<caption id="caption" hidden="true">Incorrect Pin</caption>
				
					<tr><td align="left">Enter Pin</td></tr>
					<tr><td><input type="password" id="pin" placeholder="4 digit pin" onkeyup="checkLenght2(id)"></td></tr>
				
			</table>
		</form>



	
	<!-- check the old pin to change with new pin -->

	<form class="changePass" id="checkpin" hidden="true">
			<table>
			<caption id="caption2" hidden="true">Incorrect Pin</caption>
				
					<tr><td align="left">Enter Old Pin</td></tr>
					<tr><td><input type="password" id="oldpin" placeholder="4 digit pin" onkeyup="checkLenght1(id)"></td></tr>
				
			</table>
		</form>



	<!-- 	new form for change pin -->
	<form class="changePass" action="changepin.jsp" id="changepin" hidden="true" method="post">
			<table>
			<caption id="caption3" hidden="true">Pins Do Not Match</caption>
				<tr>
					<td></td>
					<td><input type="password" id="newpin" placeholder="New pin" onkeyup="checkLenght(id)"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="password" name="pin" id="newr_pin" placeholder="Re Enter" onkeyup="matchPin()"></td>
				</tr>
			</table>
		</form>




	</div></center>
	</div>
	<div class="clear"></div>
	<center>
	<% if (msg!=null) {
		%>
		<div class="msgdisplay" id="flash"> <h1><%=msg%></h1>
		<%
	}else{%>
	<div class="msgdisplay"> <h1>Thank You For Being With Us</h1><%}%>
	</div>
	</center>

</div>
<div class="clear"></div>
<div class="footer"></div>

</body>
<script type="text/javascript">
	function showChangePasswordDiv (argument) {
		// body...
		document.getElementById('checkpin').hidden=true;
		document.getElementById('changepassword').hidden=false;
		document.getElementById('checkpinfordelete').hidden=true;
	}
	function showChangePinDiv (argument) {
		// body...
		document.getElementById('changepassword').hidden=true;
		document.getElementById('checkpin').hidden=false;
		document.getElementById('checkpinfordelete').hidden=true;
	}
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
									{
									if (cont==<%=pin%>) {
										document.getElementById('caption3').innerHTML="Old Pin and New Pin Is Same";
										document.getElementById('caption3').hidden=false;
									}
									document.getElementById("newr_pin").focus();
								    }
							}
	
				}
	}
	function checkLenght1(param)
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
		 				{if (cont==<%=pin%>) {
		 					document.getElementById('caption').innerHTML="Pin Matched";
		 					document.getElementById('caption').hidden=false;
		 					document.getElementById('checkpin').hidden=true;
		 					document.getElementById('changepin').hidden=false;
		 				}
		 				else
		 				{
					 					document.getElementById('caption2').hidden=false;
					 				}
					 			}
					 		}
	
				}
	}
	function matchPin() {
		// body...
		var p1=document.getElementById("newpin").value;
		var p2=document.getElementById("newr_pin").value;
		if (p1==p2&&p1!=null&&p2!=null) {
			document.getElementById("newr_pin").style.background="Green";
			document.getElementById("caption").innerHTML="Pins Match";
			document.getElementById("caption3").hidden=true;
			document.getElementById("changepin").submit();
			}
		else
			{
				document.getElementById("newr_pin").style.background="#DC143C";
				document.getElementById("caption3").hidden=false;	
			}
	}
		function matchPassword()
	{
		var p1=document.getElementById("password").value;
		//document.write(p1);
		var p2=document.getElementById("r_password").value;
		if(p1==p2)
		{
			document.getElementById("r_password").style.background="Green";
			document.getElementById("pkError").hidden=false;
			document.getElementById("pkError").innerHTML="Passwords match";
		}
		else
		{
			document.getElementById("r_password").style.background="#DC143C";
		    document.getElementById("pkError").innerHTML="Passwords do not match";
		}

	}
	function showDeleteSecretBox () {
		// body...
		document.getElementById('checkpinfordelete').hidden=false;
		document.getElementById('changepassword').hidden=true;
		document.getElementById('checkpin').hidden=true;

	}
	function checkLenght2(param)
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
									alert("Invalid Pin Type");
								};
								var int_length = (''+cont).length;
								if(int_length==4)
									{if (cont==<%=pin%>) {
										document.getElementById('caption').innerHTML="Pin Matched";
										window.location="deactivatesecretbox.jsp";
										document.getElementById('caption').hidden=true;
									}else
									{
										document.getElementById('caption').hidden=false;
									}
								}
							}
	
				}
	}
	function flashError () {
		// body...
		if ("<%=msg%>"!=null) {
			document.getElementById("flash").style.color="white";
			setTimeout(changeFlash, 200);
		}
	}
	function changeFlash () {
		// body...
		document.getElementById("flash").style.color="red";
		setTimeout(flashError, 200);
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