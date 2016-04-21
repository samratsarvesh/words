<%
	String email=(String)session.getAttribute("conn");
	String name=(String)session.getAttribute("name");
	//String name=request.getParameter("name");
    session.setAttribute("conn",email);
    session.setAttribute("name",name);
	if (email==null) 
		{
		response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
		}
		String msg=request.getParameter("msg");
		if(msg!=null) {
		%>
		<script type="text/javascript">
		alert("<%=msg%>");
		</script>
		<%
		}
		
%>
<!DOCTYPE html>
<html>
<head>
	<title>
	New Post: Words
	</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />
</head>
<body>
<%@include file="include/header.jsp" %>
<%@include file="include/sidebar.jsp" %>
<div class="content" id="content">
	
	<div class="clear"></div>
	<h1 class="pagename">New Post</h1>
	<form action="postaction.jsp" method="post" onkeydown="myFunction()"  >
	<table class="articleinput">
		<tr>
			
			<td><input type="text"  placeholder="Article Title" name="title" id="atitle" autofocus onblur="randomArticle()" /></td>
		</tr>
		<tr>
			
			<td><textarea rows="12" cols="50" name="content" placeholder="Fill in your words"></textarea></td>
		</tr>
		<tr>
			
			<td><div class="slideThree">	
	<input type="checkbox" id="slideThree" name="secret" value="y" onclick="changeColor()">
	<label for="slideThree">Secret</label>
	</div></td>
		</tr>
		<tr>
			
			<td><input type="submit" value="Post"></textarea></td>
		</tr>
	</table>
	</form>
		
</div>
<div class="clear"></div>
<div class="footer" id="footer">
	<center><div class="typing" id="type" hidden="false">Typing...</div></center>
	<span style="float:right;color:white; width:100px; margin-right:10px;" hidden="true" id="secretalert">Secret Post</span>
</div>
</body>
<script type="text/javascript">
    function myFunction()
        
    {       
            document.getElementById("type").hidden=false;
            setTimeout(myFunction1,100);

    }
    function myFunction1()
        
    {       
            document.getElementById("type").hidden=true;
    }
    
	function randomArticle() {
		var previoustitle=document.getElementById("atitle").value;
		if (previoustitle=="") {var r=randomString(3, '0123456789');
		{document.getElementById("atitle").value=r;};
		alert("We generated a random title for you.");
		}
	}
	function randomString(length, chars) {
    var result = 'article';
    for (var i = length; i > 0; --i) result += chars[Math.round(Math.random() * (chars.length - 1))];
    return result;
	}
	function changeColor () {
		if (document.getElementById("slideThree").checked) {
		document.getElementById("header").style.background="#a72631";
		document.getElementById("footer").style.background="#a72631";
		document.getElementById("secretalert").hidden=false;
		if (!document.getElementById("secretalert").hidden) {

					setTimeout(hideSecret, 300);
				};
	}
		else
		{document.getElementById("header").style.background="#155E61";
				document.getElementById("footer").style.background="#155E61";
				document.getElementById("secretalert").hidden=true;}
				
	}
	function hideSecret () {
		// body...
		document.getElementById("secretalert").hidden=true;
		setTimeout(showSecret,300);
	}
	function showSecret () {
		// body...
		document.getElementById("secretalert").hidden=false;
		if (document.getElementById("slideThree").checked) {
		setTimeout(hideSecret,300);}
		else
			document.getElementById("secretalert").hidden=true;
		//changeColor();
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