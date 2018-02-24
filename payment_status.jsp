<%-- 
    Document   : payment_status
    Created on : Jul 9, 2017, 11:26:07 PM
    Author     : Windows 8.1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! HttpSession session1;
        String uname;
        String pass;
        String query;
        String sem;
        String branch;
        String payment_status;
        String eno;
        String name;
        String query1;
        PreparedStatement pd;
        String course;
        
        %>
         <% try{
          session1=request.getSession();
        
          if(session1.getAttribute("uname").equals("tanveer") && session1.getAttribute("pass").equals("tanveer") )
                                   {
       
        uname=(String)session1.getAttribute("uname");
        pass=(String)session1.getAttribute("pass");
         
        payment_status=request.getParameter("payment_status");
      
        sem=request.getParameter("sem");
     
        branch=request.getParameter("branch");
        course=request.getParameter("course");
 
       Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/home","root","root");
      
      /* query1="select eno from eligible";
       PreparedStatement pd1=con.prepareStatement("query1");
       ResultSet rs1=pd1.executeQuery();
       out.println(19);
       while (rs1.next()){
                   eno=rs1.getString(1);
       */
       
       query="select eligible.eno,eligible.name,eligible.payment_status,reg1.sem,reg1.branch,reg1.course from  eligible inner join reg1 on eligible.eno=reg1.eno where  reg1.branch=? and reg1.sem=? and reg1.course=? and eligible.payment_status=?";
       query1="select eligible.eno,eligible.name,eligible.payment_status,reg1.sem,reg1.branch from  eligible inner join reg1 on eligible.eno=reg1.eno where reg1.branch=? and reg1.sem=? and reg1.course=?";
      if(payment_status.equals("Paid") || payment_status.equals("Unpaid")){
     pd=con.prepareStatement(query);
      pd.setString(4,payment_status);
      }
             else{
 pd=con.prepareStatement(query1);
             }
    
       
       
    pd.setString(1, branch);

             pd.setString(2,sem);
             pd.setString(3,course);
               ResultSet rs=pd.executeQuery();
   
      %>
    <center> <br><br>
           <table border radius="1" style="border-collapse:collapse" width="800px">
               <tr>
                   
              
                   <th>Enrollment Number</th>
                   <th>Name</th>
                   <th>Branch</th>
                   <th>Semester</th>
                   <th>Payment Status</th>
               </tr>
        <%       
         
            while(rs.next()){
           
           name=rs.getString(2);
           eno=rs.getString(1);
           payment_status=rs.getString(3);
           %>
       
           <tr><td><center><%=eno%></center></td>
           <td><center><%= name %></center></td>
           <td><center><%= branch %></center></td>
           <td><center><%= sem %></center></td>
           <td><center><%= payment_status %></center></td>
           </tr>
           
           <% } 
                   }
             
         else{response.sendRedirect("admin.jsp");
                 }
                   }
         catch(Exception e){
                         out.println(e);}
   %>
           </table>
    </center>   
    </body>
</html>
