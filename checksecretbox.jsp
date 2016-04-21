<%@ page import="java.sql.*" %>
<%
	String email=(String)session.getAttribute("conn");
    if (email==null) 
        {
        response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
        }
    String name=(String)session.getAttribute("name");
    session.setAttribute("conn",email);
    session.setAttribute("name",name);
    String secretboxstatus="";
	

	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/words","sarvesh","asd");
            System.out.println("Connected...ON CHECKSECRETBOX PAGE");
			String q="select secret_box from users where email='"+email+"'";
       		PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            secretboxstatus= rs.getString(1);
            if(secretboxstatus.equals("NOT-ACTIVE"))
                response.sendRedirect("createsecretbox.jsp");
            else
                if(secretboxstatus.equals("ACTIVE"))
                    response.sendRedirect("loginsecretbox.jsp?msg=Your Secret Box Is Active");   
            } 
        }
        catch (Exception ex)
        {
                out.println("error"+ex);
        }


%>