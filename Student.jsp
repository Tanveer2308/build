<%-- 
    Document   : Student
    Created on : 28 May, 2017, 10:27:44 PM
    Author     : lenovo
--%>


<%@page import="java.sql.*" import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%! String eno;
    String en;
    String image;
    String name;
    String status1;
    String sem1;
    String branch;
    String scheme_id;
    String subject;
    String subject_code;
    String address;
    String city;
    String district;
    String gender;
    String category;
    String course;
%>
<% 
    
      
       		
    eno=request.getParameter("eno");
    status1=request.getParameter("status");
    sem1=request.getParameter("sem");
    HttpSession s=request.getSession();
    s.setAttribute("e",eno);
    s.setAttribute("s",status1);
    s.setAttribute("sem",sem1);
                try
		{
                    
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/home", "root", "root");
			PreparedStatement ps=con.prepareStatement("select * from eligible where eno=? and branchmode=?");
                        ps.setString(1,eno);
                        ps.setString(2,status1);
                       
			ResultSet rs=ps.executeQuery();
                        
			if(rs.next())
                        {      
                             name=rs.getString(3);
                             s.setAttribute("name",name);
                            if(rs.getString(7).equals("Paid"))
                              {
                              response.sendRedirect("transaction.jsp");
                               }
                            
                            
                                
				Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/home", "root", "root");
                                PreparedStatement ps1=con.prepareStatement("select * from reg1 where eno=? and status=? and sem=?");
                                 ps1.setString(1,eno);
                                 ps1.setString(2,status1);
                                 ps1.setString(3,sem1);
                                 
                                ResultSet rs1=ps1.executeQuery();
                                  
                                
                                if(rs1.next())
                                { 
                                    branch=rs1.getString(3);
                                //eno=rs1.getString(2);
				//name=rs1.getString(3);
				//status1=rs1.getString(12);
				//sem1=rs1.getString(13);
                                scheme_id=rs1.getString(13);
                                address=rs1.getString(7);
                                city=rs1.getString(8);
                                district=rs1.getString(9);
                                gender=rs1.getString(6);
                                category=rs1.getString(10);
                                course=rs1.getString(2);
                                 
                                }
                                else
                                {
                                     
                                 %>
                             <script>
                            if(window.confirm("No Records Found"))
                             {
                            window.location="index.html";
                             }
                            else
                            {
                           window.location="index.html"; 
                            }
                    
                         </script>
                            <%
                             }
                              
			%>
                        
                        
                        
      

<!DOCTYPE html>

	<title>Student</title>
	<style>
            #d1{
                border-radius: 25px;
                border: 2px solid;
                padding: 2%;
                width: 800px;
                margin-top: 20px;
                margin-left: 180px;
                margin-right: 180px;
                border-style: groove;
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
</head>
<body>
	<img align="center" src="ietlogo.png" style="background-color:limegreen;width:100%;height:150px">
        <center>
		<div id="d1">
			<hr>
			<h3 align="center">
			UTD Pay-Unpaid Examination Form/Print Reciept
			</h3>
			<hr>

			<div style="background-color: #B0C4DE;text-align: left;">
        	Student Detail
        	</div>
				<table cellpadding="4" cellspacing="1" border="1" style="border-collapse:collapse;margin-bottom: 7px;border-color: #cdcdcd" align="Center">
                    <tr>

                    <td align="left">
                    Name of College(Code)
                   	</td>
                    <td align="left" colspan="4">
                    <span>
                    INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                    </td>
                    <td rowspan="2" align="center">
                    <img id="ihoto" src="show.jsp?image=<%= eno%>" style="height:120px;width:100px;border-width:0px;"/>
                    </td>

                    </tr>
                    <tr>
                    
                    <td align="left">
                    Registration for Examination
                    </td>
                    <td align="left">
                   	<span>JUN-2017</span>
                   	</td>
                    <td align="left">
                    Examination Centre(Code)
                   	</td>
                    <td align="left" colspan="2">
                    <span>INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                    </td>
                   	
                   	</tr>
                    <tr>
                    
                    <td align="left">
                    Name of Course
                    </td>
                    <td align="left">
                    <span><%= course%></span>
                    </td>
                    <td align="left">
                    Programme/Branch(Code)
                   	</td>
                  	<td align="left">
                    <div><%= branch %></div>
                    </td>
                    <td align="left">
                    Semester/Year
                    </td>
                    <td align="left">
                    <span><%= sem1%></span>
                    </td>
                    
                    </tr>
                    <tr>
                    
                    <td align="left">
                   	Roll No./Enrollment No.
                   	</td>
                    <td align="left">
                    <span><%= eno  %></span>
                    </td>
                    <td align="left">
                    Category
                   	</td>
                    <td align="left">
                    <span><%= category %></span>
                    </td>
                    <td align="left">
                    Class
                    </td>
                    <td align="left">
                    <span>Class</span>
                    </td>
                    
                    </tr>
                 	<tr>
                   
                    <td align="left">
                    Gender
                    </td>
                    <td align="left">
                    <span><%= gender %></span>
                    </td>
                    <td align="left">
                    Status
                    </td>
                    <td align="left">
                    <span><%= status1%></span>
                    </td>
                   	<td align="left">
                    Name of Examinee
                    </td>
                    <td align="left">
                   	<div><%= name%></div>
                    </td>
                                                
                    </tr>
                   	<tr>

                    <td align="left">
                    Present Address
                    </td>
                    <td align="left">
                    <div><%= address %></div>
                    </td>
                    <td align="left">
                    City
                    </td>
                    <td align="left">
                    <span><%= city %></span>
                    </td>
                    <td align="left">
                    District
                   	</td>
                    <td align="left">
                    <span><%= district %></span>
                   	</td>
                                                
                    </tr>
                  	<tr>
                    
                    <td colspan="2" align="left">
                    Attendance in Percentage(out of 100)%
                    </td>
                    <td align="left" colspan="4">
                    <span></span>
                    </td>
                  	
                   	</tr>
                    
                </table>

                <div class="head1" style="z-index: 730;background-color: #B0C4DE;text-align: left;">
                Subject and Fees Description
                </div>
    			<table cellspacing="0" rules="all" border="1" id="grdSubject" style="width:100%;border-collapse:collapse;">
        		<tr>
            	<th align="left">
                Paper Code
                </th>
                <th align="left">
                Paper Description
                </th>
        		</tr>
                        

<%
                            
                        PreparedStatement ps2=con.prepareStatement("select * from subschema1 where schemeId=?");
			ps2.setString(1,scheme_id);

			ResultSet rs2=ps2.executeQuery();
                        
			if(rs2.next())
                        {      
				do{
                                    subject=rs2.getString(3);
                                    subject_code=rs2.getString(2);
                                    
                                  
 %>

       			<tr>
            	<td>
                <span><%=subject_code %></span>
                </td>
                <td>
                <span><%= subject %></span>
                </td>
                </tr>
 <%
                                   }while(rs2.next());

			}
%>                
            
            </table>

            <div align="center">
            <span style="text-align:center;">
            <input id="check" type="checkbox" name="chkDeclaration"/>
            <label>CERTIFIED THAT</label>
            </span>
            </div>

            <div>
            <span>
            I hereby declare that the information filled by me is true and complete as per my knowledge. If any information provided by me is found false or incorrect then i shall be disqualified by the university.
            </span>
            </div>

		</div>
        </center>
		<form action="transaction.jsp">
           <center>
               <input type="submit" style="margin-top: 10px" id="pay" class="button"  value="   Proceed To Payment   " disabled/>
           </center>
                    <div class="footer">
        <p> copyright IET, DAVV</p>
        <p> Designed and Developed By :- </p>
    </div>

<script>

var checker = document.getElementById('check');

 var sendbtn = document.getElementById('pay');
 // when unchecked or checked, run the function
 
checker.onchange = function(){

if(this.checked)
{
    sendbtn.disabled = false;

} 
else
 {
    sendbtn.disabled = true;
}



}
</script> 
        </form>    
</body>
</html>

  <%
 }
                else
                {
                %>
               
                <script>
                  if(window.confirm("No Records Found"))
                        {
                            window.location="index.html";
                        }
                        else
                        {
                           window.location="index.html"; 
                        }
                    
                   </script>
                <%
                }
        }
        catch(Exception e)
        {
           
          e.printStackTrace();
        }
               %>