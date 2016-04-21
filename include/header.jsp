<script src="jquery.min.js"></script>
<script> 
		$(document).ready(function(){
		  $("#flip").click(function(){
		    $("#panel").slideToggle("slow");
		  });
		});
	</script>
<div class="header" id="header">
	<div class="leftonhead">
		<img src="img/heart.png" class="logo">
		<h1 class="name">Words</h1>

	</div>
			
	<div class="rightmenu" >
		<img src="img/user.png" class="usericon" id="flip">
		<h1 class="username">welcome <%=name%></h1>
		<div class="clear"></div>
		<div class="dropdown" id="panel">
				<a href="userprofile.jsp">Profile</a>
			 	<a href="settings.jsp">Settings</a>
				<a href="logout.jsp">Logout</a>
			
		</div>
	</div>
</div>
