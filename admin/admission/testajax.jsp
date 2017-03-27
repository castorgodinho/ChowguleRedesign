<%-- 
    Document   : testajax
    Created on : 20 Mar, 2017, 10:44:17 AM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>

    $(document).ready(function(){
       $("#button").click(function(){
         var val=$("#name").val();
              
        $.ajax({
           "method":"post",
           "url":"http://localhost:43809/Chowgule1/NewServlet",
           data:{"name":val},
           success:function(data){
               alert(data);
           }
               
        });
       });   
    });
    </script>
    </head>
    
    
    <body>
        <input type="text"   id="name">
        <input type="button" name="submit" value="submit" id="button">
        
    </body>
</html>
