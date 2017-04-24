<%-- 
    Document   : Loginprocess
    Created on : 20 Apr, 2017, 12:40:27 PM
    Author     : gaurav
--%>

<%@page import="Admission.Login"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Database database=new Database();
            Connection con=database.openConnection();
            if(request.getParameter("login")!=null){
                Login login=new Login(con,
                request.getParameter("username"),
                request.getParameter("password"));
               boolean loginStatus = login.checkCerdentials();
               if(loginStatus){
                  session.setAttribute("userid",login.userID);
                if(request.getParameter("username").equals("admin")){
                     String url=request.getContextPath();
                     response.sendRedirect(""+url+"/admin/admission/a_index.jsp");
                }
                else{
                    String url=request.getContextPath();
                    response.sendRedirect(""+url+"/faculty_dashboard/f_index.jsp");
                }
              
               
               }else{
                   String url=request.getContextPath();
                response.sendRedirect(""+url+"/admin/LoginError.jsp");
               }
            }

            %>
    </body>
</html>
