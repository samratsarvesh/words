<%@ page import="java.sql.*" %>
<%
	String email=(String)session.getAttribute("conn");
    if (email==null) 
        {
        response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
        }
    String name=(String)session.getAttribute("name");
    String articleid=(String)request.getParameter("msg");
    session.setAttribute("conn",email);
    session.setAttribute("name",name);
	

	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://127.11.119.2:3306/words","sarvesh","asd");
            System.out.println("Connected...ON DELETE PAGE");
			String q="delete from article where id='"+articleid+"' and author='"+email+"'";
       		PreparedStatement pst = con.prepareStatement(q);
            int rs = pst.executeUpdate();
            if(rs==1)
            	response.sendRedirect("home.jsp?msg=Successfully Deleted");
		}

        catch (Exception ex)
        {
                response.sendRedirect("home.jsp?msg=Delete Failed");
        }


%>