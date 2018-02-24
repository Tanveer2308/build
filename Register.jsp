<%-- 
    Document   : Register
    Created on : 23 Jun, 2017, 11:58:53 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.ServletException" import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>



<%! 
    String eno;
    String enroll;
    String roll_no;
    String name;
    String status;
   
%>
<% 
    
      
    
 HttpSession ss=request.getSession();
    
    if(ss.getAttribute("e")==null)
    {
    eno=request.getParameter("eno");
    //out.println("if");
    ss.setAttribute("e",eno);
    }
  else{
        // out.println("else");
         //out.println(eno);
        eno=(String)ss.getAttribute("e");
        } 

 //eno=request.getParameter("eno");
    try
		{
                    
			Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/home", "root", "root");
			
                       // out.println(eno);
                        PreparedStatement ps1=con.prepareStatement("insert into reg1(eno) VALUES (?)");
                        ps1.setString(1,eno);
                        int i=0;
                        i=ps1.executeUpdate();
                        if(i>0)
                        {
                        out.println("exxxxxxxx");
                        }
                        else
                        {
                         out.println(eno);
                        response.sendRedirect("Register_sel.jsp");
                        }
                
                            }	
                   catch(Exception e)
                   {
                    e.printStackTrace();
                   }
			%>
                        

<!DOCTYPE html>
<html>
<head>
    
    <script>
     //  he location of the current window with the new one.
function back()
{
    window.location.replace("index.html");
}

   

    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.in.js"></script>      
                <script src="http://iamrohit.inlab/js/locatio.js">
                </script>
    <title>REGISTRATION FORM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/mainStyle.css" />
    <link rel="stylesheet" href="css/responsive.css" />

    <!--for carousel-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.0/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.0/assets/owl.theme.default.css">

    <!--fonts-->
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>


</head>

<body data-spy="scroll" data-target="#navbar" data-offset="50">
    
    <div style="margin-left: 1100px">
      <div style="border: 2px solid;padding: 2%; width: 180px;height: 200px;margin-top: 60px;">
          <img id="ihoto" src="show.jsp?image=<%=eno%>" style="height:185px;width:165px;border-width:0px;"/>
                                                    </div>
    <form action="image1.jsp" enctype="multipart/form-data" method="post">
        <input type="file" name="file" multiple="" /><input type="submit" value="upload" style="margin-left: 50px;width: 100px"/>
         </form>
</div>
    
    
    <div class="container-fluid" id="finalDetail">
        
        <form class="form-horizontal row" id="msform" action="Register_insert.jsp"style="margin-right: 280px"> 
            <fieldset>
                <div class="col-md-12" style="text-align:center;">
                    <h2 style="margin-left: 200px">Exam Registration Details</h2>  
                </div>
                
                <div class="form-group">
                      
                    <label class="control-label col-sm-3"><span>Enrollment No</span></label>
                    <div class="col-sm-9" ><input type="tel" id="doa" class="form-control" name="enrollment_no" readonly="" value="<%= eno %>" /></div>
                </div>    
                       
                <div class="form-group">
                         <label class="control-label col-sm-3" ><span>Status</span></label>
                        <div class="col-sm-9"><select class="form-control" name="status">
                            <option>Regular</option>
                            <option>Ex</option>
                           
                            </select></div>
                </div>
                
                  
                    <div class="form-group">
                        <label class="control-label col-sm-3" ><span> Name</span> </label>
                        <div class="col-sm-9" ><input type="text" id="name" class="form-control" name="name" placeholder="Student name" maxlength="50" required /></div>
                    </div>   
                      
              
                 <div class="form-group">
                        <label class="control-label col-sm-3"><span>Course</span></label>
                        <div class="col-sm-9"> <select class="form-control" name="course">
                            <option>BE</option>
                            <option>ME</option>
                           
                        </select></div>
                    </div>
                    
                     <div class="form-group">
                        <label class="control-label col-sm-3"><span>Registration year</span></label>
                        <div class="col-sm-9"> <select class="form-control" name="reg">
                         <option>June 2017</option>
                        </select></div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3"><span>Branch</span></label>
                        <div class="col-sm-9"> <select class="form-control" name="branch">
                         <option>COMPUTER ENGINEERING</option>
                            <option>INFORMATION TECHNOLOGY ENGINEERING</option>
                             <option>MECHANICAL ENGINEERING</option>
                             <option>ELECTRONICS AND INSTRUMENTATION ENGINEERING</option>
                             <option>CIVIL ENGINEERING</option>
                              <option>ELECTRONICS AND TELECOMMUNICATION ENGINEERING</option>
                        </select></div>
                    </div>
                
                     <div class="form-group">
                        <label class="control-label col-sm-3"><span>Sem</span></label>
                        <div class="col-sm-9"> <select class="form-control" name="sem">
                            <option>1SEM</option>
                            <option>2SEM</option>
                            <option>3SEM</option>
                            <option>4SEM</option>
                            <option>5SEM</option>
                            <option>6SEM</option>
                            <option>7SEM</option>
                            <option>8SEM</option>
                        </select></div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3"><span>Father's Name</span></label>
                        <div class="col-sm-9"><input type="text" id="fathername" class="form-control" name="fname" placeholder="Father's name" maxlength="50" required /></div>
                    </div>
					
					<div class="form-group">
                        <label class="control-label col-sm-3"><span>Mother's Name</span></label>
                        <div class="col-sm-9"><input type="text" id="mothername" class="form-control" name="mname" placeholder="Mother's name" maxlength="50" required /></div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3"><span>Gender</span></label>
                        <div class="col-sm-9"> <input type="radio" name="gender" checked value="female">Female
  <input type="radio" name="gender" value="male">Male</div>
  </div>
  <div class="form-group">
					
<div class="form-group">
                        <label class="control-label col-sm-3"><span> Address</span></label>
                        <div class="col-sm-9"><input type="text" id="address" class="form-control" name="address" placeholder="Your Complete Address" maxlength="100" required /></div>
                    </div>
      
                      <div class="form-group">
                          <label class="control-label col-sm-3" ><span>City</span></label>
                          <div class="col-sm-9"><input type="text" id="city" class="form-control" name="city" placeholder="Your City" maxlength="100" required /></div>
                    </div>
                    
      
                     <div class="form-group">
                        <label class="control-label col-sm-3"><span>District</span></label>
                        <div class="col-sm-9"><input type="text" id="district" class="form-control" name="district" placeholder="Your District" maxlength="100" required /></div>
                     </div>
                   

                    <div class="form-group">
                        <label class="control-label col-sm-3"><span>Category</span></label>
                        <div class="col-sm-9"> <input type="radio" name="category" checked value="GENERAL">GENERAL
  <input type="radio" name="category" value="SC">SC
  <input type="radio" name="category" value="ST">ST
  <input type="radio" name="category" value="OBC">OBC</div>
                    </div>
        

                   
					
					<div class="form-group">
                        <label class="control-label col-sm-3"><span>Section</span></label>
                        <div class="col-sm-9"> <select class="form-control" name="section">
                            <option>A</option>
                            <option>B</option>
        
                        </select></div>
                                        </div>

                        
					 
                
					
                
                    
                      <center><input type="submit" name="btn" value="Submit"/></center>
                     
            </fieldset>
            

        </form> 
        </center>
</div>                   
                
   
</body>
</html>


