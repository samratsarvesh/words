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
    String password=request.getParameter("oldpassword");
    String newpassword=request.getParameter("r_password");
    if (password.equals(newpassword)) {
        response.sendRedirect("settings.jsp?msg=Old and New Passwords Can Not be Same");
    }
    
	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/words","sarvesh","asd");
            System.out.println("Connected...ON CHECKSECRETBOX PAGE");
			String q="select password from users where email='"+email+"'";
            String q2="update users set password='"+newpassword+"' where email='"+email+"'";
       		PreparedStatement pst = con.prepareStatement(q);
            PreparedStatement pst1 = con.prepareStatement(q2);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            if(password.equals(rs.getString(1)))
                {
                    int rs2=pst1.executeUpdate();
                    if(rs2==1)
                    {
                        //session.invalidate();
                        response.sendRedirect("settings.jsp?msg=Password Changed Successfully.....Login Again");
                    }
                    else
                    {
                        response.sendRedirect("settings.jsp?msg=Error while changing Password");
                    }

                }
            else
                 response.sendRedirect("settings.jsp?msg=Invalid Old Password Retry");
            } 
        }
        catch (Exception ex)
        {
                out.println("error"+ex);
        }


%>