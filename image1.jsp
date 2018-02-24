<%-- 
    Document   : image1
    Created on : 3 Jul, 2017, 3:03:32 PM
    Author     : lenovo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page 
    import="java.io.IOException"
import="java.io.PrintWriter"
import="javax.servlet.ServletException"
import ="javax.servlet.annotation.WebServlet"
import="javax.servlet.http.HttpServlet"
import="javax.servlet.http.HttpServletRequest"
import="javax.servlet.http.HttpServletResponse"
 import="java.io.*"
 import="java.sql.*" 
 import="java.util.zip.*"
import="java.sql.*" %>


<%!
    String eno;
    %>
    <%
       
        HttpSession ss=request.getSession();
        eno=(String)ss.getAttribute("e");
        out.println(eno);
   
       String saveFile="";
        String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
      FileInputStream fis;
   
     try
    { out.println("try");
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/home","root","root");
                    File f = new File(saveFile);
                    String Query="update reg1 set image=? where eno=?";
                    fis = new FileInputStream(f);
                    PreparedStatement psm=conn.prepareStatement(Query);
                    psm.setBinaryStream(1, (InputStream)fis, (int)(f.length()));
                     psm.setString(2,eno);
                     //out.println("yaha tk");
                     int i=0;
                      i=psm.executeUpdate();
                       if(i>0)
                        {
                        out.println("success");
                        f.delete();
                        response.sendRedirect("Register.jsp");
                        }
                   
                   
    }
      catch(Exception ex){
     ex.printStackTrace();
 
 }
}

            
          %>