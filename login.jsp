<%
session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="css/logincss.css">
	<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />
	<script>
	function show()
	{
		document.getElementById("m").style.visibility="hidden";
	}
</script>
</head>
<body class="bg" onload="flashError()">
<center>
<h1>Welcome To Words</h1>
<div class="login_form">
<form name="login" method="post" action="loginaction.jsp">
<h1 id="h1">Login</h1>
	<table class="form_table">
	<caption id="m">
		<% 
			String n=request.getParameter("msg"); 
			 if(n==null)
			   {}
			    else
				{
					out.println(n);
				}
		%>


	</caption>
			<tr>
			    <td><label for="email">Email</label></td>
				<td><input type="email" id="email" class="ip_area" name="email" autofocus/></td>
			</tr>
			<tr>
				<td><label for="password">Password</label></td>
				<td><input type="password" id="password" class="ip_area" name="password"/></td>
			</tr>
			<tr>
				<td></td>
				<td align="right"><input type="submit" class="submit" id="submit" value="Submit" /></td>
			</tr>
			<tr>
				<td></td>
				<td align="right"><br><a  id="forgot" href="forgotpassword.jsp">Forgot Password?</a></td>
			</tr>
			
	</table>
</form>
</div>
<h3>New Here??  <a href="signup.jsp">Get Started</a></h3>
</center>
</body>
<script type="text/javascript">
	function flashError () {
		// body...
		if ("<%=n%>"!=null) {
			document.getElementById("m").style.color="white";
			setTimeout(changeFlash, 200);
		}
	}
	function changeFlash () {
		// body...
		document.getElementById("m").style.color="red";
		setTimeout(flashError, 200);
	}
</script>
</html>