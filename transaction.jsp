<%-- 
    Document   : transaction
    Created on : 6 Jun, 2017, 12:00:07 AM
    Author     : lenovo
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%> 
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%! String query3;
            String query4;
           String date1;
           String payment_status;
           String query5;
           String query6;
           String date2 ;
           int time1;
           String time2;
           String transaction_id;
           String eno;
           String query7;
           String pay_mode;
           int fee;
            String name;
            String sem;
            String reg;
            String category;
            String gender;
            String address;
            String image;
            String s;
        String query;
        String subject;
        String subject_code;
             String query1;
             String branch;
           String[] sub=new String[50] ;
            String subCode[]=new String[50] ;
           int i;
           String city;
           String district;
           String scheme_id;
           String course;
           
        %>

        
        <%
            HttpSession ss=request.getSession();
            String eno=(String)ss.getAttribute("e");
            String s=(String)ss.getAttribute("s");
            String sem=(String)ss.getAttribute("sem");
            name=(String)ss.getAttribute("name");
            if(eno==null)
            {
            response.sendRedirect("index.html");
            }
           // out.println(en);
                try
		{
                    
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/home", "root", "root");
			PreparedStatement ps=con.prepareStatement("select * from reg1 where eno=? and status=? and sem=?");
			ps.setString(1,eno);
                        ps.setString(2,s);
                        ps.setString(3,sem);
			ResultSet rs=ps.executeQuery();
                        
			if(rs.next())
                        {       
                               
                               
                                    branch=rs.getString(3);
                                 scheme_id=rs.getString(13);
                                address=rs.getString(7);
                                city=rs.getString(8);
                                district=rs.getString(9);
                                gender=rs.getString(6);
                                category=rs.getString(10);
                                course=rs.getString(2);
				
                              
			}
           
            PreparedStatement ps_=con.prepareStatement("select * from eligible where eno=? and branchmode=?");
            ps_.setString(1,eno);           
            ps_.setString(2,s);
            
            ResultSet rs_=ps_.executeQuery();
             if(rs_.next())
             {
             payment_status=rs_.getString(7);
             
             }
          if(payment_status.equals("Unpaid")) 
          {
              //out.println("unnpaid");
        query3="select CURDATE()";
        Statement st =con.createStatement();
        ResultSet rs4=st.executeQuery(query3);
        rs4.next();
        date1=rs4.getString(1);
        
     
        query5="select CURDATE() + 0";
        Statement st1=con.createStatement();
        ResultSet rs1=st1.executeQuery(query5);
        rs1.next();
        date2=rs1.getString(1);
        
        
        query6="select CURTIME() + 0";
         Statement st2=con.createStatement();
        ResultSet rs2=st2.executeQuery(query6);
        rs2.next();
        time1=(int)rs2.getInt(1);
        time2=Integer.toString(time1);
        transaction_id=date2+time2;
        
       
       query4="insert into transaction values('netbanking',?,?,?,2000)";
       PreparedStatement pd4=con.prepareStatement(query4);
       pd4.setString(1,date1);
       pd4.setString(2, transaction_id);
       pd4.setString(3,eno);
       // ResultSet rs1=pd.executeQuery();
        int count=0;
        count=pd4.executeUpdate();
        if(count!=0)
            {
                 
        PreparedStatement pd5=con.prepareStatement("update eligible set payment_status='Paid' where eno=? ");
       pd5.setString(1,eno);
       pd5.executeUpdate();

            }
            
          payment_status="Paid";
          }  
        query7="Select * from transaction where enrollment_no=?";
        PreparedStatement pd2=con.prepareStatement(query7);
        pd2.setString(1,eno);
        ResultSet rs3=pd2.executeQuery();
        if(rs3.next())
        {
            
            pay_mode= rs3.getString(1);
            fee= rs3.getInt(5);
            transaction_id=rs3.getString(3);
                   
 
           }
        
        %>

        
<!DOCTYPE html>
<html>
<head>
	<title>Student</title>
	<style>
            #d1{
                border-radius: 25px;
                border: 2px solid;
                padding: 2%;
                width: 800px;
                
                border-style: groove;
            }
        </style>
</head>
<body>
	<img align="center" src="ietlogo.png" style="background-color:limegreen;width:100%;height:150px">
           <div id="menu_bar" style="background-color:yellowgreen"></div>
		<center>
		<div id="d1">
			<hr>
			<h3 align="center">
			UTD Pay-Unpaid Examination Form/Print Reciept
			</h3>
			<hr>

            <div class="head1" style="z-index: 750;background-color: #B0C4DE;text-align: left;">
            Transaction Details
            </div>
            <table cellpadding="4" cellspacing="1" border="1" style="border-collapse: collapse;margin-bottom: 7px;" bordercolor="#cdcdcd" width="100%" align="Center">
            <tr>
            <td align="left">
            Application Number:
            </td>
            <td align="left" colspan="3">
            <span></span>
            <span style="font-size: 10px; color: red; font-weight: normal;">
            (Please note your application No for future reference.)
            </span>
            </td>
            <td rowspan="2" align="center">
          
             <br></br>
             <strong>QR-Code [Scan to Verify]</strong>
            </td>

            </tr>
            <tr>
            <td align="left">
            Payment Mode:
            </td>
            <td align="left">
            <span><%=pay_mode %></span>
            </td>
            <td align="left">
            Channel Id:
            </td>
            <td align="left">
            <span></span>
            </td>
            
            </tr>
            <tr>
            <td align="left">
            Transaction Id:
            </td>
            <td align="left">
            <span><%= transaction_id %></span>
            </td>
            <td align="left">
            Payment Status:
            </td>
           	<td align="left" colspan="2">
            <span><%= payment_status %></span> on <span><%=  date2 %></span>
            </td>
            
            </tr>
            <tr>
            <td align="left">
            Application Fee(Rs.):
            </td>
            <td align="left">
            <span><%= fee %></span>
            </td>
            <td align="left">
            Portal Fee(Rs.):
            </td>
            <td align="left" colspan="2">
            <span>50</span>
            </td>
            </tr>
            </table>
        
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
                    <span><%= sem%></span>
                    </td>
                    
                    </tr>
                    <tr>
                    
                    <td align="left">
                   	Roll No./Enrolment No.
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
                    <span><%= s %></span>
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
 <%
                }
        catch(Exception e)
        {
           
          e.printStackTrace();
        }
               %>
            
            </table>
        </div>
        </center>
        
       
           <center>
               <input id="pay" style="margin-top: 10px" type="button" onclick="window.print()" value="   Print   "/>
           </center>
       
         
</body>
</html>
                                                  
                                   
                                  
                               