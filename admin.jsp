<%-- 
    Document   : admin
    Created on : Jun 4, 2017, 4:21:10 PM
    Author     : Windows 8.1
--%>
<%@page import = "javax.servlet.http.HttpServlet" %>
<%@page import= "javax.servlet.http.HttpServletRequest" %>
<%@page import ="javax.servlet.http.HttpServletResponse" %>
<%@page import= "java.sql.*" %>
<%@page import = "javax.servlet.http.HttpSession" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">
    <head>
        <title>ADMINISTRATION</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            #main{
                border-radius: 25px;
                border: 2px solid;
                padding: 2%;
                margin-top: 30px;
                margin-left: 20px;
                margin-right: 20px;
                width: 470px;
                height: 400px;
                 }
                 
                 
                 #t2{
                     
                     border-collapse:collapse;
                    text-align: center;
                     height: 150px;

                    border-color: grey;
                     font-size: 18px;
                 }
                 #menu_bar
		{
			width: 100%;
			height:30px;
			margin-top: 4px;
			background-color: maroon;
		}
		a{
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
			
                $("#slide_box").hide();
                $("#slide_box").slideDown(1000);
                $("main").css({"height":""})
                
		});
	</script>
   
    </head>
    <body id="pagestyle" class="relative">

<img align="center" src="ietlogo.png" style="background-color:limegreen;width:100%;height:150px">
<div id="menu_bar" style="background-color:yellowgreen">
	<a href="index.html">Home</a>
	<a href="admin.jsp">Admin</a>
	<a href="Register_sel.jsp">Student_Registration</a>
</div>
<center>
   <form action="details.jsp" method="post">
 <div id="main">

<hr><h1>ADMINISTRATION</h1><hr>
<div id="slide_box">
<table id="t2">
<tr>
<td height="40px">
<b><input type="text" name="uname" class="form-control" style="font-size: 20px;width: 300px;height:27px;text-align: center" required="" placeholder="USERNAME" align="center"></b>
</td>
</tr>
<tr>
<td height="35px">
<b><input type="password" name="pass" class="form-control" style="font-size: 20px;width: 300px;height:27px;text-align: center"  required="" placeholder="PASSWORD"></b>
</td>
</tr>
</table>

<input class="form-control" style="margin-top:10px; width: 302px;height: 40px;font-size:22px;font-style: bold" type="submit" name="btn" value="LOGIN">   
 
</div> 
</div>
        </form>
   <div class="footer">
        <p> copyright IET, DAVV</p>
        <p> Designed and Developed By :- </p>
    </div>
</center>
</body>
</html>

