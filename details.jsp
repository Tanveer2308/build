<%-- 
    Document   : details
    Created on : Jun 4, 2017, 7:49:37 PM
    Author     : Windows 8.1
--%>
<%@page import = "javax.servlet.http.HttpServlet" %>
<%@page import= "javax.servlet.http.HttpServletRequest" %>
<%@page import= "javax.servlet.http.HttpServletResponse" %>
<%@page import= "java.sql.*" %>
<%@page import = "javax.servlet.http.HttpSession" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        div.relative {
    background-color:#F8F8F8 ;
    width: 700px;
    border: 1px solid black;
    border-radius:25px;
    padding: 25px;
    margin: 25px;
    position: relative;
  
    
}
a{
    color: 	 #800000;
}       
 #menu_bar
		{
			width: 100%;
			height:30px;
			margin-top: 4px;
			background-color: maroon;
		}
		.links{
			color: white;
			font-size: 25px;
                        font-family: calibri;
			margin-left: 10px;
		}
                  .footer {
   position:relative;
   left: 0;
   bottom: 0;
   width: 100%;
   height:150px;
   background-color:limegreen;
   color: white;
   text-align: center;
}
        </style>
     <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
 
      $("#one").hide();
      $("#two").hide();
      $("#three").hide();
      $("#four").hide();

      $("#one").slideDown(500);
      $("#two").slideDown(1000);;
      $("#three").slideDown(1500);;
      $("#four").slideDown(2000);;
     

    });
  </script>
    </head>
    <body>     
        <%!
       String pass;
       String uname;
     
HttpSession session1;
       
       %>
       
        <% pass=request.getParameter("pass");
            uname=request.getParameter("uname");
            if("tanveer".equals(request.getParameter("uname")) && "tanveer".equals(request.getParameter("pass"))){
          
          
         
           
                   session1=request.getSession();
                 session1.setAttribute("uname" ,uname );
          session1.setAttribute("pass", pass);
                          }

            else{
                response.sendRedirect("admin.jsp");
            }                             
            
       %>
       <img align="center" src="ietlogo.png" style="background-color:limegreen;width:100%;height:150px">
   <div id="menu_bar" style="background-color:yellowgreen">
           <a class="links" href="index.html">Home</a>
	<a class="links" href="admin.jsp">Admin</a>
	<a class="links" href="Register_sel.jsp">Student_Registration</a>
   </div>
       <br><br>
        <center>
        <div class="relative">
    
            <div id="one">
        <form action="fileUpload1.jsp" enctype="multipart/form-data" method="post">
        <h2 style="color:#800000">Upload Student Data</h2>
       
        <input type="file" name="file" multiple="" />
        <input type="submit" value="Upload"/>
        
        </form>
        </div>
       <hr>
       
       <div id="two">
       <a href="http://localhost:8080/ExamRegistration1/schemeID1.jsp"><h2>Generate Scheme ID And Update semester</h2></a>
       </div>
       <hr>
       <div id="three">
       <form action="payment_status.jsp">
            <h2 style="color:#800000">Payment Status</h2>
       <table style="border-style:groove" >
           <tr>
               <th>Select Course</th>
               <td><select style=" width:160px" name="course">
                       <option>Course</option>
                       <option>BE</option>
                       <option>ME</option>
                   </select>
               </td>
           </tr>
           <tr>
               <th>Select Branch</th>
               <td> 
                   <select style=" width:160px" name="branch">
                     <option>Select Branch</option>
                    <option>Computer Engineering</option>
                     <option>Electronics & Telecommunication</option>
                      <option>Information Technology</option>
                        <option>Mechanical</option>
                     <option>Civil</option>
                      <option>Electronics & Instrumentation</option>
                   </select>
               </td>
           </tr>
           <tr>
               <th>Select Semester</th>
               <td><select style=" width:160px" name="sem">
                          <option>Select sem</option>
                 <option>1Sem</option>
                    <option>2Sem</option>
                       <option>3Sem</option>
                          <option>4Sem</option>
                             <option>5Sem</option>   
                             <option>6sSem</option>
                                <option>7Sem</option>
                                   <option>8Sem</option>
                             
                   </select></td>
           </tr>
           <tr>
               <th>Payment status</th>
               <td><select style=" width:160px" name="payment_status">
                       <option>Select payment status</option>
                       <option>Paid</option>
                         <option>Unpaid</option>
                         <option>Both</option>
                   </select></td>
           </tr>
       </table><br>
       <input type="submit" value="GO">
       </form>
       </div>  
       <hr>
       <div id="four">
           <h2 style="color:#800000">Print Admit Card:</h2>
        <form action="admitCard1.jsp">
            <center>
           <table  style="border-style:groove" >
            <tr>
            <th>
               Select Branch:
            </th>
            <td><select name="branch" style="width:130px">
                    <option>Select Branch</option>
                    <option>Computer Engineering</option>
                     <option>Electronics & Telecommunication</option>
                      <option>Information Technology</option>
                        <option>Mechanical</option>
                     <option>Civil</option>
                      <option>Electronics & Instrumentation</option>
                </select></td>
            </tr>
             <tr>
            <th>
           Select Semester
            </th>
            <td>
             <select name="sem" style="width:130px">
                  <option>Select sem</option>
                 <option>1Sem</option>
                    <option>2Sem</option>
                       <option>3Sem</option>
                          <option>4Sem</option>
                             <option>5Sem</option>   
                             <option>6sSem</option>
                                <option>7Sem</option>
                                   <option>8Sem</option>
                             
             </select>
             </td>
             </tr>
        </table>
               
                <br>
               <input type="submit" value="Print" ></center>
      <hr>
        </form>
           </div>
           
           </div>
            </center>
             <div class="footer">
        <p> copyright IET, DAVV</p>
        <p> Designed and Developed By :- </p>
    </div>
  
    </body>
</html>
