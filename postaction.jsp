<%@ page import="java.sql.*" %>
<%
	String title=(String)request.getParameter("title");
    if (title=="") {
        title="no-subject";
    }
    String content=request.getParameter("content");
    String secret=request.getParameter("secret");
    if (secret==null) {
        secret="n";
    }
	String email=(String)session.getAttribute("conn");
    if (email==null) 
        {
        response.sendRedirect("sessionexpired.jsp?msg=Session Expired");
        }
    String name=(String)session.getAttribute("name");
    session.setAttribute("conn",email);
    session.setAttribute("name",name);
    int count=0;

	try
         {  
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection
            ("jdbc:mysql://127.11.119.2:3306/words","sarvesh","asd");
            System.out.println("Connected...");

            String q="select title from article where author='"+email+"'";
            PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                if(title.equals(rs.getString(1)))
                    count++;
            }
            if(count==0)
            {
			String q1="insert into article(title,author,content,protected) values('"+title+"','"+email+"','"+content+"','"+secret+"')";
       		PreparedStatement pst1 = con.prepareStatement(q1);
            int rs1 = pst1.executeUpdate();
            if(rs1==1)
                {
                if(secret.equals("y"))
            	response.sendRedirect("secretbox.jsp?msg=Article Saved To Secret Box");
                else
                response.sendRedirect("home.jsp?msg=Article Saved");
                }
		    }
            else
            response.sendRedirect("post.jsp?msg=Same Article Name Exists Aready");
        }

        catch (Exception ex)
        {
                out.println("Error while posting"+ex);
        }


%>