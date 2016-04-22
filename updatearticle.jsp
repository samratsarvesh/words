<%@ page import="java.sql.*" %>
<%
    String articleid=(String)request.getParameter("msg");
    String email=(String)session.getAttribute("conn");
    if (email==null) 
        {
        response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
        }
    String name=(String)session.getAttribute("name");
    session.setAttribute("conn",email);
    session.setAttribute("name",name);
    if (articleid==null)
    {
        response.sendRedirect("404.jsp?msg=Article Not Found");
    }
    String title="";
    String content="";
    String author="";
    String flag="";
    int id=0;
    String secret="";
%>
<%                       try
                             {
                                Class.forName("com.mysql.jdbc.Driver");
                                java.sql.Connection con=DriverManager.getConnection
                                ("jdbc:mysql://127.11.119.2:3306/words","sarvesh","asd");
                                System.out.println("Connected...ON UPDATEARTICLE PAGE");
                                String q="select * from article where id='"+articleid+"' and author='"+email+"'";
                                PreparedStatement pst = con.prepareStatement(q);
                                ResultSet rs = pst.executeQuery();
                                while(rs.next())
                                {
                                    title=rs.getString("title");
                                    content=rs.getString("content");
                                    author=name;
                                    id=rs.getInt("id");
                                    secret=rs.getString("protected");
                                    if(secret.equals("y"))
                                        flag="checked";

                                    session.setAttribute("id",id);
                                    }}

                                    catch (Exception ex)
                                    {
                                    out.println("Error while update"+ex);
                                    }

%>

<html>
<head>
<title>
Article : Read 
</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="shortcut icon" type="image/ico" href="img/favicon.ico" />
</head>
<body onload="changeColor()">
<%@ include file="include/header.jsp"%>
<%@ include file="include/sidebar.jsp"%>
<div class="content">
    
    <div class="clear"></div>
    <h1 class="pagename"><%=title%></h1>
    <form action="updateaction.jsp?=<%=id%>" method="post" onkeydown="myFunction()" onkeyup="myFunction1()">
    <table class="articleinput">
        <tr>
            
            <td><input type="text" value="<%=title%>" name="title" autofocus /></td>
        </tr>
        <tr>
            
            <td><textarea rows="12" cols="50" name="content"><%=content%></textarea></td>
        </tr>
        <tr>
            
            <td><div class="slideThree">    
    <input type="checkbox" value="y" <%=flag%> id="slideThree" name="check" onclick="changeColor()"/>
    <label for="slideThree">Secret</label>
    </div></td>
        </tr>
        <tr>
            
            <td><input type="submit" value="Update"/></td>
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
    }
    function myFunction1()
        
    {       
            document.getElementById("type").hidden=true;
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
</html>