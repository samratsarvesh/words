<%@ page import="java.sql.*" %>
<%
	String pin=(String)request.getParameter("pin");
    if (pin=="") {
        response.sendRedirect("sessionexpired.jsp?=Session Ended");
    }
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

	try
         {  
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://127.11.119.2:3306/words","sarvesh","asd");
            System.out.println("Connected...");

            String q="update users set secret_box='ACTIVE' , secret_pin='"+pin+"' where email='"+email+"'";
            PreparedStatement pst = con.prepareStatement(q);
            int rs = pst.executeUpdate();
            if(rs==1)
            {
                response.sendRedirect("loginsecretbox.jsp?msg=Secret Box Activated");
                session.setAttribute("pin",pin);
            }
            else
            response.sendRedirect("home.jsp?msg=Secret Box Creation Failed Retry");
        }

        catch (Exception ex)
        {
                out.println("Error while creating pin"+ex);
        }


%>