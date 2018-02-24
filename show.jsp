<%-- 
    Document   : show.jsp
    Created on : 31 May, 2017, 1:36:15 PM
    Author     : lenovo
--%>

<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="java.io.IOException" 
        import="java.io.PrintWriter" import="javafx.scene.control.Alert" 
        import="javax.servlet.ServletException" import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse" 
        import="java.io.*"%>

<%!
ResultSet rs = null;
PreparedStatement pstmt = null;
OutputStream oImage;
Connection con;
%>





<% 




try {
    String image=(String)request.getParameter("image");
    out.println(image);
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/home", "root", "root");
                        
                    pstmt = con.prepareStatement("select image from reg1 where eno=?");
                   pstmt.setString(1,image);
                      rs = pstmt.executeQuery();
                      
                      
    if(rs.next()) {
       // byte[] barray = rs.getBytes(1);
        response.setContentType("image/jpeg");
        response.setHeader("expires","0");
        out.clear();
        //byte[] eb=Base64.encodeBase64(barray);
        oImage=response.getOutputStream();
        oImage.write(rs.getBytes(1));
        oImage.flush();
        oImage.close();
    }
}
catch(Exception ex)
{
    ex.printStackTrace();
}
%>
