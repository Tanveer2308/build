
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIT CARD</title>
        <style>
        div.relative {

    width: 800px;
    border: 1px solid black;
    border-radius: 25px;
    padding: 25px;
    margin: 25px;
    position: relative;
   
} 
/*
@media all {
	.page-break	{ display: none; }
}
*/

@media print {
	.page-break	{ display: block; page-break-after: always; }
}
       </style>
  
    </head>
    <body>
        <%!String eno;
        String name;
        String month;
        String rno;
        String status;
        String fname;
        String mname;
        String gender;
        String query;
        ResultSet rs1;
        String query1;
        String schemeId;
        String branch;
        String sem;
        String query2;
        String query3;
        String uname;
        String pass;
        HttpSession session1;
        %>
        
        <%////eno?????????????????
        session1=request.getSession();
      uname=(String)session1.getAttribute("uname");
      pass=(String)session1.getAttribute("pass");
      if(uname.equals("tanveer")&&pass.equals("tanveer"))
      {
           branch=request.getParameter("branch");
          sem=request.getParameter("sem");
          
     
                Class.forName("com.mysql.jdbc.Driver");
          
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/home","root","root");
          
        query="select * from reg1 where branch=? and sem=?";
       
        PreparedStatement pd=con.prepareStatement(query);
        pd.setString(1,branch);
       pd.setString(2,sem);
       

        ResultSet rs=pd.executeQuery();
        %>
        
        
                      
        <%
        
      while(rs.next()){
          
       eno=rs.getString(1);
       
          query3="select * from eligible where payment_status=? and eno=?";
          PreparedStatement pd3=con.prepareStatement(query3);
          pd3.setString(1,"Paid");
          pd3.setString(2,eno);
          ResultSet rs3=pd3.executeQuery();
          while(rs3.next()){
              
          
          
           
        
            name=rs3.getString(3);
            rno=rs3.getString(2);
                     
            month=rs.getString(14);
            
            fname=rs.getString(4);
            status=rs.getString(15);
            mname=rs.getString(5);
            gender=rs.getString(6);
            schemeId=rs.getString(13);
            
                          
        
        
        // For subSchema
        
        query1="select * from subSchema1 where schemeId=?";
        PreparedStatement pd1=con.prepareStatement(query1);
        pd1.setString(1,schemeId);
        
        
        rs1=pd1.executeQuery();
      
             %>
        <div class="page-break">  
    <center>
                        
        <div class="relative">
            <center><br>  <h2>INSTITUTE OF ENGINEERING AND TECHNOLOGY(IET),INDORE-Admit Card <%=month%></h2>
            </center>
            <hr>
            <br>
        <table border="1" style="border-collapse:collapse" width="800px">
            <tr><th>
                    Enrollment Number:
                </th>
                <td><%=eno%></td>
                <td rowspan="7"><img id="ihoto" src= "show.jsp?image=<%= eno%>" style="height:185px;width:165px;border-width:0px;"/> </td>
            </tr>
            
            <tr>
                <th>Roll No.</th>
                <td><%=rno%></td>
                
               
            </tr>
            
            <tr>
                <th>Exam Name:</th>
                <td><%= month %></td>
            </tr>
            
            <tr>
                <th>Exam Center:</th>
                <td>INSTITUTE OF ENGINEERING AND TECHNOLOGY(IET),INDORE[808]</td>
            </tr>
            <tr>
            <th>Exam Month:</th>
                <td><%=month %></td>
            </tr>
            <tr>
                <th>Name:</th>
                <td><%=name%></td>
            </tr>
            
            <tr><th>Father Name:</th>
                <td><%=fname%></td>
            </tr>
            
            <tr><th>Mother Name:
                </th>
                <td colspan="2"><%=mname%></td>
            </tr>
            
            <tr><th>Gender:</th>
                <td colspan="2"><%=gender%></td>
            </tr>
            <tr>
                 <th>Status:</th>
                <td colspan="2"><%= status%></td>
            </tr>
        </table>
            <hr>
            <center>
                <br>
            <h2>Opted Paper Description(Not In Sequence According To Time Table Of University)</h2>
            <br>
            </center>
            <table border="1" style="border-collapse:collapse" width="800px">
                <tr><th>Subject Code</th>
                <th>Subject Name</th>
                <th>Paper Type</th>
                <th>Answer Sheet Number:</th>
                <th>Paper Code</th>
                <th style="width:100px">Signature</th>
                </tr>
               
                    <% while(rs1.next()){ %>
                     <tr>
                    <td><%= rs1.getString(2)%></td>
                     <td><%= rs1.getString(3)%></td>
                      <td><%= rs1.getString(4)%></td>
                      <td></td>
                      <td></td>
                      <td></td>
                        </tr>
                      <% }  %>
                       
              
            </table>
                       
        </div>  
                   
                       
    
    </center>    
                      </div>
                      <%  }
         }
%>
                      
                       <% } 
              else{
               response.sendRedirect("admin.jsp");
               }
      %>
                              <center>
                                  <input type="submit" value="Print" align="center" onClick= "myfunction()">
                              </center>
                    
                      <script>
                        function  myfunction(){
                            window.print();
                        }
                      </script>
                         
         
    </body>
</html>
