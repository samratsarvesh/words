<!DOCTYPE html>
<html>
<head>
	<title>Signup</title>
	<link rel="stylesheet" type="text/css" href="css/signupcss.css">
	<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />
</head>

<body class="bg">
<center>
<div class="login_form">

<form  name="login" id="login"  method="post" onkeydown="myFunction()" onkeyup="myFunction1()" action="registeraction.jsp">
	<h1 onmouseover="animateHead()" onmouseout="innerHTML='Register'" id="h1">Registration</h1>
	<table class="form_table">
	<caption id="type" hidden="true" >Typing......</caption>
	<th colspan="2" id="m">
		
		<% 
			String n=request.getParameter("msg"); 
			 if(n==null)
			   {}
			 else
				{
					out.println(n);
				%>
				<a href="login.jsp">&nbsp;&nbsp;Login</a>	
				<%
				} %>
		
	</th>
			<tr>
				<td><label for="name">Name</label></td>
				<td><input type="text" id="name" class="ip_area"  name="name"/></td>
			</tr>
			<tr>
				<td><label for="email">Email</label></td>
				<td><input type="email" id="email" class="ip_area" name="email"/></td>
			</tr>
			<tr>
				<td><label for="password">Password</label></td>
				<td><input type="password" id="password" class="ip_area" name="password"/></td>
			</tr>
			<tr>
				<td><label for="password">Retype Password</label></td>
				<td><input type="password" id="r_password" class="ip_area" name="r_password" onkeyup="matchPassword()" /></td>
			</tr>
			<tr>
				<td></td>
				<td align="right"><input type="submit" class="submit" id="submit" value="Submit" /></td>


			</tr>
	</table>
	
<p hidden="true" id="pkError">Passwords Match</p>
</form>
</div>
<h1>Signup for 	WORDS - The Personal Secret Diary</h1>
<h3 style="color:yellow">Already a member? <a href="login.jsp" style=""> Login here</a></h3>
</center>

<script type="text/javascript">
    /*var form_flag=0;
	function enableSubmit()
		
	{       //if(form_flag==4)
			document.getElementById("submit").hidden=false;
	}*/
	function myFunction()
		
	{       
			document.getElementById("type").hidden=false;
	}
	function myFunction1()
		
	{       
			document.getElementById("type").hidden=true;
	}

	function animateHead()
	    {
	        document.getElementById("h1").innerHTML="Enter Details Below To Register";
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
	function validateForm()
    { 
    	/*
		var x=document.forms["login"]["name"].value;
		if (x==null || x=="")
		  {
		  alert("Name must be filled out");
		  return false;
		  }
		  else
		  	form_flag++;
		x=document.forms["login"]["email"].value;
		if (x==null || x=="")
		  {
		  alert("Email must be filled out");
		  return false;
		  }
		  else
		  	form_flag++;
		x=document.forms["login"]["password"].value;
		if (x==null || x=="")
		  {
		  alert("Password must be filled out");
		  return false;
		  }
		  else
		  	form_flag++;
		x=document.forms["login"]["r_password"].value;
		if (x==null || x=="")
		  {
		  alert("Re enter password");
		  return false;
		  }
		  else
		  form_flag++;
		*/
		  
		  enableSubmit();
    }
   
</script>
</body>
</html>