<%-- 
    Document   : Logout
    Created on : 22 Apr, 2017, 11:29:24 AM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("userid");
        String url=request.getContextPath();
            response.sendRedirect(""+url+"/index.jsp");
           
            %>
    </body>
</html>
