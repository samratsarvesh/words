<%@ page import="java.sql.*" %>
<html>
<head>
<title>
Article : Read 
</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />
</head>
<body onload="checkSecret()">

<%
	String articleid=(String)request.getParameter("msg");
	if(articleid==null)
	{
		response.sendRedirect("404.jsp");
    }
	//System.out.println(article);
	String email=(String)session.getAttribute("conn");
	if (email==null) 
		{
		response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
		}
    String name=(String)session.getAttribute("name");
    session.setAttribute("conn",email);
    session.setAttribute("name",name);
    String title="";
    String content="";
    String author=name;
    String secret="";
    int flag=0;
    // session.setAttribute("article",article);
    try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/words","sarvesh","asd");
            System.out.println("Connected...ON welcome2 PAGE");
			String q="select * from article where id='"+articleid+"' and author='"+email+"'";
            System.out.println("Connected");
       		PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
            	title=rs.getString("title");
            	content=rs.getString("content");
            	secret=rs.getString("protected");
            }
            else
            flag++;
		}


       catch (Exception ex)
        {
            out.println("Error");
        }

%>
<%@ include file="include/header.jsp"%>
<%@ include file="include/sidebar.jsp"%>

		<div class="content" id="content">
			<h1 class="pagename"><%=title%></h1>
			<center>
            
                <div class="articleholder">
                <pre>
                <p class="articledisplay"><%=content%>
                </p>
                </pre>
                </div>
                <% if (flag==1) {
                	
                %>
					                <h1>Nothing To Display <a href="home.jsp">Back</a></h1>
				<%
						}
				%>

	<div class="update">
	<input type="submit" id="update" onclick="updateArticle()" value="Update">
	<input type="submit" id="delete" onclick="deleteArticle()" value="Delete">
	</div>
</center>
</div>
<div class="clear"></div>
<div class="footer" id="footer">
    <span style="float:right;color:white; width:100px; margin-right:10px;" hidden="true" id="secretalert">Secret Post</span>
</div>
</body>
<script type="text/javascript">
	function updateArticle () {
		// body...
		window.location="updatearticle.jsp?msg=<%=articleid%>";
	}
	function deleteArticle () {
		// body...
		window.location="deletearticle.jsp?msg=<%=articleid%>";
	}
	var chk="<%=secret%>";
	function checkSecret () {
		// body...
		
		if (chk=="y") {
		document.getElementById("header").style.background="#a72631";
        document.getElementById("footer").style.background="#a72631";
        document.getElementById("secretalert").hidden=false;
        

                    setTimeout(hideSecret, 300);
               
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
        if (chk=="y") {
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