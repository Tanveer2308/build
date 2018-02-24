
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="javafx.scene.input.KeyCode" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import ="org.apache.commons.fileupload.*" %>
<%@page import ="org.apache.commons.fileupload.disk.*" %>
<%@page import ="org.apache.commons.fileupload.servlet.*" %>
<%@page import ="org.apache.commons.io.output.*" %>
<%@page import="java.sql.*" import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.ServletException" import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
<%!
   Connection con; 
String query;
String path;
HttpSession session1;
String uname;
String pass;
String query1;
String query2;
String query3;
PreparedStatement pd;
PreparedStatement pd1;
PreparedStatement pd2;
PreparedStatement pd3;
int i;
int j;
int k;
int l;
String query4;
%>


      


<% session1=request.getSession();
  uname=(String)session1.getAttribute("uname");
  pass=(String)session1.getAttribute("pass");
File file =new File("c:/temp1");//
  if(true){
      try{
          Class.forName("com.mysql.jdbc.Driver");

        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/home","root","root");
        
        

   file.delete();
if(!file.exists()) {
    
file.mkdir(); 
    
    query1="create table eligible1(sno int(5),rno varchar(20),name char(50),group_code varchar(10),branchmode char(10),eno varchar(7))";
    
   pd1= con.prepareStatement(query1);
   
   j=pd1.executeUpdate();  
        
       
    ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());

  List<FileItem> multifiles=sf.parseRequest(request);

  for(FileItem item : multifiles)
    { 
     
     
     
       File f=new File("C:/temp1/",item.getName());
    item.write(f);
     path ="C:/temp1/"+ item.getName();//
    query="Load data local infile ? into table eligible1 fields terminated by ',' enclosed by '\n'";
    pd=con.prepareStatement(query);
    pd.setString(1,path);
    i=pd.executeUpdate();

     f.delete();
     query2="insert into eligible(sno,rno,name,group_code,branchmode,eno) select * from eligible1";
    pd2=con.prepareStatement(query2);
      k=pd2.executeUpdate();
     query3="drop table eligible1";
    pd3=con.prepareStatement(query3);
     l=pd3.executeUpdate();

     file.delete();
    }
 response.sendRedirect("successfileupload.html");
    }
else{
}
    }
  catch(Exception e)
            {
             query3="drop table eligible1";
             pd3=con.prepareStatement(query3);
             l=pd3.executeUpdate();

             file.delete(); 
            out.println(e);
            }
    
  
           }
   else{
      response.sendRedirect("admin.jsp");
   }
    
%>
    </body>
</html>