<%@ page import="java.sql.*" %>
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
    String newpin=request.getParameter("pin");
	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/words","sarvesh","asd");
            System.out.println("Connected...ON CHECKSECRETBOX PAGE");
            String q2="update users set secret_pin='"+newpin+"' where email='"+email+"'";
       		PreparedStatement pst1 = con.prepareStatement(q2);
            int rs = pst1.executeUpdate();
            while(rs==1)
            {
                 response.sendRedirect("settings.jsp?msg=Secret box pin changed");
            }
        }
        catch (Exception ex)
        {
                out.println("error"+ex);
        }


%>