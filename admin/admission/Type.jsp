<%-- 
    Document   : Type
    Created on : 16 Mar, 2017, 8:13:07 PM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Admission.Type"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <link rel="icon" href="<%=request.getContextPath()%>/img/favicon.png" type="image/gif">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Parvatibai Chowgule College</title>
        <!-- Bootstrap -->
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
		<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">   
    </head>
    <body class="home">
        <div class="display-table">
            <div class="row display-table-row">
                <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container" id="navigation">
                    <%@ include file="../sidebar.jsp"%>
                    
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                    <%@ include file="../header.html"%>
                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">
                                    <%
                                        Database db = new Database();
                                       

                                        if (request.getParameter("insertButton") != null) {

                                            Type type = new Type(con,
                                            0,
                                            request.getParameter("typeName"));
                                           
                                            try {
                                                type.insertType();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("typeName") + " Type added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("typeName") + " Type already exists!."
                                                        + "</div>");
                                            }

                                        } else if (request.getParameter("updateButton") != null) {
                                            Type type = new Type(con,
                                            Integer.parseInt(request.getParameter("typeID")),
                                            request.getParameter("typeName"));
                                           
                                            try {
                                                type.updateType();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("typeName") + " Type updated successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> failed!."
                                                        + "</div>");
                                            }

                                        }
                                    %>
                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">ADD TYPE</h3>
                                            <div class="row">
                                                <div class="col-md-4" id="typeID1">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Type ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" name="typeID" id="typeID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Type Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Type Name" name="typeName" id="typeName" required>
                                                    </div>
                                                </div>

                                                <div class="col-md-2">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="INSERT TYPE" id="insertButton">
                                                    <input type="submit"  name="updateButton" class="btn btn-warning pull-right btn-block" value="UPDATE TYPE" id="updateButton">
                                                </div>

                                            </div>









                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">TYPE DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Sr. No.</th>
                                                                    <th>Type</th>

                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <%
                                                                    Type type[] = Type.getAllType(con);
                                                                    for (int i = 0; i < type.length; i++) {
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + type[i].getTypeID() + "</td>"
                                                                                + "<td>" + type[i].getTypeName() + "</td>");
                                                                        out.println("<td><button type='button' class='edit-btn btn btn-warning col-md-6' name='edit' ><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp; EDIT</button></td>");
                                                                        out.println("<tr>");
                                                                    }


                                                                %>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<%@ include file="../footer.html"%>
        
		<script>

              
              $(document).ready(function () {   	  
                  $("#typeID1").hide();
                  $("#updateButton").hide();
                  $(".edit-btn").click(function () {
                      $("#typeID1").show();

                      $("#updateButton").show();
                      $("#insertButton").hide();
                  });
                  $("#invalid").fadeOut(3000);
                  $("#insertSuccess").fadeOut(3000);
                  $("#updateSuccess").fadeOut(3000);
                  $(".edit-btn").click(function () {
                      var row = $(this).closest("tr");
                      var typeID = row.find("td:eq(0)").text();
                      var typeName = row.find("td:eq(1)").text();

                      $("#typeID").val(typeID);
                      $("#typeName").val(typeName);

                  });
              });

        </script>
    </body>
</html>

