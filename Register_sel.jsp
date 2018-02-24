<%-- 
    Document   : Register_sel
    Created on : 26 Jun, 2017, 3:33:25 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
     HttpSession ss=request.getSession();
     ss.invalidate();
    %>
<!DOCTYPE html>
<html>
    <head>
        
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
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
        </style>
    </head>
    <body>
        <img align="center" src="ietlogo.png" style="background-color:limegreen;width:100%;height:150px">
       <div id="menu_bar"style="background-color:yellowgreen">
	<a href="index.html">Home</a>
	<a href="admin.jsp">Admin</a>
	<a href="Register_sel.jsp">Student_Registration</a>
</div>
     <center>
        <form action="Register.jsp">
<div style="border-radius: 25px;border: 2px solid;padding: 2%; width: 1020px;margin-top: 20px">

<hr><h1>Examination Registration</h1><hr>
<table style="background-color: #B0C4DE;width: 1000px;font-size: 20px;margin-top: 1px" >
<tr><td style="text-align: left;">Selection Criteria</td></tr>
</table><table border="1" style="width: 1000px;border-collapse:collapse;border-color: grey; font-size: 18px ">
<tr>
<td height="40px" style="text-align: right;">
<b>Please Enter Enroll Number</b>
</td>
<td><input type="text" name="eno" style="font-size: 15px;width: 150px;height:27px" required="" maxlength="7">
</td>
</tr>
</table><input style="margin-top:10px; width: 120px;font-size:15px;" type="submit" name="btn" value="GO">     <input style="width: 120px;font-size: 15px;" type="button" name="cbtn" value="Cancel">

</div>
        </form>
    </center>
    </body>
</html>