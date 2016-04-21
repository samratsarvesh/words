<%@ page import="java.sql.*" %>
<%
	String title= request.getParameter("title");
    String content=request.getParameter("content");
    String secret=request.getParameter("check");
    if (secret==null) {
        secret="n";
    }
	String email=(String)session.getAttribute("conn");
    if (email==null) 
        {
        response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
        }
    String name=(String)session.getAttribute("name");
    Integer articleid=(Integer)session.getAttribute("id");
    if (articleid==0) {
        response.sendRedirect("404.jsp");
        
    }
    if (email==null) {
        response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
    }
    session.setAttribute("conn",email);
    session.setAttribute("name",name);

	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/words","sarvesh","asd");
            System.out.println("Connected...ON UPDATEACTION PAGE");
			String q="update article set title='"+title+"' , content='"+content+"', protected='"+secret+"' where id='"+articleid+"'";
       		PreparedStatement pst = con.prepareStatement(q);
            int rs = pst.executeUpdate();
            if(rs==1)
            	response.sendRedirect("home.jsp?msg=Article Updated");
		  }

        catch (Exception ex)
        {
                response.sendRedirect("home.jsp?msg=Error While Updating");
        }


%>