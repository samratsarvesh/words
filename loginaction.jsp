<%@ page import="java.sql.*" %>
<%
	String email= request.getParameter("email");
    if (email==null) 
        {
        response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
        }
	String password= request.getParameter("password");
    session.setAttribute("conn",email);

try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/words","sarvesh","asd");
            System.out.println("Connected...ON LOGINACTION PAGE");
			String q="select * from users where email='"+email+"' and password='"+password+"'";
            System.out.println("Connected");
       		PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                response.sendRedirect("home.jsp?name="+rs.getString(2));
                session.setAttribute("name",rs.getString(2));
            }
            else
            {
                response.sendRedirect("login.jsp?msg=Invalid Credentials");

            }
		}


       catch (Exception ex)
        {
            out.println("Error");
        }


%>