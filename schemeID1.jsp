<%@page import="java.lang.String"%>
<%@page import= "java.sql.*" %>
<%@page import= "javax.servlet.http.HttpServletRequest"%>
<%@page import= "javax.servlet.http.HttpServletResponse"%>
<%@page import= "javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            String uname;
            String pass;
            String query;
            String schemeId;
            ResultSet rs;
            String rno;
            String s;
            int schemeChange;
            String query1;
            String eno;
            HttpSession session1;
            String branchmode;
            int i;
            int j;
            String query3;
            
           String sem_num;String sem;
           String query4;
        %>
          <% 
          session1=request.getSession();
        
          if(session1.getAttribute("uname").equals("tanveer") && session1.getAttribute("pass").equals("tanveer") )
                                   {
       
        uname=(String)session1.getAttribute("uname");
        pass=(String)session1.getAttribute("pass");
         try{
            // out.println("try");
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/home","root", "root");
   
        query ="select * from eligible ";
        PreparedStatement pd= con.prepareStatement(query);
       
       rs= pd.executeQuery();
      // out.println("exeute");
       while(rs.next()){
          // out.println("next");
           
     //rno updation after every sem      
            rno=rs.getString(2);
            branchmode=rs.getString(5);
         eno=rs.getString(6);
       //  out.println("hello1");
          sem_num=rno.substring(3,4);
     sem=sem_num+"Sem";
     query4="Update reg1 set sem=? where eno=?";
     PreparedStatement pd4=con.prepareStatement(query4);
         pd4.setString(1,sem);
         pd4.setString(2,eno);
        int x=pd4.executeUpdate();
    //scheme id generation    
     s=  rno.substring(0,2);
  
     schemeChange=Integer.parseInt(s);
//out.println("hello3");
     if(schemeChange>=15 && branchmode.equalsIgnoreCase("regular")){
  
           schemeId=15+rno.substring(2,4);

         query1="update reg1 set scheme_id=? where eno=?";
         PreparedStatement pd1=con.prepareStatement(query1);
           // out.println("hello4");
         pd1.setString(1,schemeId);
  
         pd1.setString(2,eno);
   
              i=pd1.executeUpdate();
      out.println("Successfully Generated !!");

        
   
     }
     
         else if(schemeChange ==15 && branchmode.equalsIgnoreCase("diploma")){
             schemeId=14+rno.substring(2,4);
               query1="update reg1 set scheme_id=? where eno=?";
         PreparedStatement pd1=con.prepareStatement(query1);
         pd1.setString(1,schemeId);
         eno=rs.getString(1);
         pd1.setString(2,eno);
       j=pd1.executeUpdate();
       out.println("Successfully Generated !!");
    
         }
    
                
            
       }
       
           }
         catch(Exception e){
             out.println(e);
         }
                }
                    
                  else{
                response.sendRedirect("admin.jsp");
                       }
                   
         
          %>
       

    </body>
</html>
