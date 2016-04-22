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
    String pin=(String)request.getParameter("pin");
    String keyindb="";

	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://127.11.119.2:3306/words","sarvesh","asd");
            System.out.println("Connected...ON CHECKSECRETBOX PAGE");
			String q="select secret_pin from users where email='"+email+"'";
       		PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            keyindb= rs.getString(1);
            if(keyindb.equals(pin))
                {response.sendRedirect("secretbox.jsp");
                                session.setAttribute("pin",pin);}
            else
                    response.sendRedirect("loginsecretbox.jsp?msg=Invalid Pin");   
            } 
        }
        catch (Exception ex)
        {
                out.println("error"+ex);
        }


%>