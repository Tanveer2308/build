<%-- 
    Document   : Register_insert
    Created on : 9 Aug, 2017, 3:59:22 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page 
import="javafx.scene.input.KeyCode"
import="org.apache.commons.fileupload.disk.DiskFileItemFactory"
import="org.apache.commons.fileupload.FileItem"
import="org.apache.commons.fileupload.servlet.ServletFileUpload"
import ="java.util.List"
import="org.apache.commons.fileupload.disk.DiskFileItemFactory"
import="org.apache.commons.fileupload.servlet.ServletFileUpload"
import="javax.servlet.ServletException"
import ="javax.servlet.annotation.WebServlet"
import="javax.servlet.http.HttpServlet"
import="javax.servlet.http.HttpServletRequest"
import="javax.servlet.http.HttpServletResponse"
 import="java.io.*"
 import="java.sql.*" 
 import="java.util.zip.*"
import="java.sql.*"  %>

 <% 
      
        
    String branch=request.getParameter("branch");
    String eno=request.getParameter("enrollment_no");
   
    String fname=request.getParameter("fname");
    String mname=request.getParameter("mname");
    String gender=request.getParameter("gender");
    String status=request.getParameter("status");
    String add=request.getParameter("address");
    String city=request.getParameter("city");
    String district=request.getParameter("district");
    String category=request.getParameter("category");
    String section=request.getParameter("section");
    String sem=request.getParameter("sem");
    String course=request.getParameter("course");
    String reg=request.getParameter("reg");

   /*
    out.println(branch);
    out.println(eno);
   // out.println(roll_no);
   // out.println(name);
    out.println(fname);
    out.println(mname);
    out.println(gender);
    out.println(status);
    out.println(add);
    out.println(category);
    out.println(section);
    out.println(sem);
    out.println(course);
     out.println(city);
      out.println(district);
   
*/
                try
		{
                  
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/home", "root", "root");
		
                        PreparedStatement ps=con.prepareStatement("update reg1 set branch=?,fname=?,mname=?,address=?,gender=?,category=?,section=?,status=?,sem=?,course=?,city=?,district=?,reg=? where eno=?");
			ps.setString(1,branch);
                        ps.setString(2,fname);
                        ps.setString(3,mname);
                        ps.setString(4,add);
                        ps.setString(5,gender);
                        ps.setString(6,category);
                        ps.setString(7,section);
                        ps.setString(8,status);
                        ps.setString(9,sem);
                        ps.setString(10,course);
                         ps.setString(14,eno);
                         ps.setString(11,city);
                         ps.setString(12,district);
                         ps.setString(13,reg);
		
                        int i=0;
                         
                        i=ps.executeUpdate();
                        
                        if(i>0)
                        {
                            %>
                        
                <%
                        }
                        
                        
                        			
   
  
                        
		
                }
                catch(Exception e)
                {
                    out.println(e);
                e.printStackTrace();
                }
        
            %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <style>
            /* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
        </style>
        <script>
            // Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal 
btn.onclick = function(){
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

        </script>
   
    </head>
    <body>
        <!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Some text in the Modal..</p>
  </div>

</div>
    </body>
</html>
