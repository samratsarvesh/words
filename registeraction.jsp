<%@ page import="java.sql.*,java.util.Date" %>
<%
	String name= request.getParameter("name");
    String email= request.getParameter("email");
	String password= request.getParameter("password");
    Date date=new Date();
	
int count=0;
	try
         {
         	Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con=DriverManager.getConnection
			("jdbc:mysql://127.11.119.2:3306/words","sarvesh","asd");
    		System.out.println("Connected...");

            String q="select email from users";
            PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                if(email.equals(rs.getString(1)))
                    count++;
            }
            if(count==0)
			{
               String q1="insert into users(name,email,password,joined) values('"+name+"','"+email+"','"+password+"','"+date+"')";
       		   PreparedStatement pst1 = con.prepareStatement(q1);
               int rs1 = pst1 .executeUpdate();
               if(rs1==1)
                	response.sendRedirect("login.jsp?msg=Successfully Registered");
            }
            else
                response.sendRedirect("signup.jsp?msg=Email already exists");
		}

        catch (Exception ex)
        {
                response.sendRedirect("signup.jsp?msg=Signup Failed"+ex);
        }


%>