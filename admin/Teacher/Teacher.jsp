<%-- 
    Document   : Teacher
    Created on : 24 Mar, 2017, 10:41:35 AM
    Author     : gaurav
--%>

<%@page import="Admission.Users"%>
<%@page import="Attendance.Department"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Attendance.Teacher"%>
<%@page import="Admission.Database"%>
<%@page import="java.sql.Connection"%>
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
                    <%@ include file="../header.jsp"%>
                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">
                                    <%
                                        Database db = new Database();
                                        if (request.getParameter("insertButton") != null) {
                                            Users user=new Users(con,
                                                    0,
                                            request.getParameter("userName"),
                                            request.getParameter("password"));
                                            
                                            int userID=user.insertUser();
                                            
                                            Teacher teacher = new Teacher(con,
                                                    0,
                                                    request.getParameter("teacherName"),
                                                    Integer.parseInt(request.getParameter("department")),
                                                    request.getParameter("designation"));
                                        try {
                                           teacher.insertTeacher(userID);
                                           out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("teacherName") + " Teacher updated successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("teacherName") + " Already  exists!."
                                                        + "</div>");
                                            }


                                        } else if (request.getParameter("updateButton") != null) {
                                            Teacher teacher = new Teacher(con,
                                                    Integer.parseInt(request.getParameter("teacherID")),
                                                    request.getParameter("teacherName"),
                                                    Integer.parseInt(request.getParameter("department")),
                                                    request.getParameter("designation"));
                                            
                                          
                                           
                                            try {
                                                teacher.updateTeacher();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("teacherName") + " Teacher updated successfully!."
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
                                            <h3 class="text-center">ADD TEACHER</h3>
                                            <div class="row">
                                                <div class="col-md-3" id="teacherID1">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Teacher ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" name="teacherID" id="teacherID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Teacher Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Teacher Name" name="teacherName" id="teacherName" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Designation:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Designation" name="designation" id="designation" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">User Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter User Name" name="userName" id="userName" >
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Password:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Password" name="password" id="password" >
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Department:</label>
                                                        <select class="form-control"  name="department" id="department">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%
                                                                Department department[] = Department.getAllDepartment(con);
                                                                for (int i = 0; i < department.length; i++) {
                                                                    int departmentID = department[i].getDepartmentID();
                                                                    out.println("<option value=" + departmentID + ">" + department[i].getName() + "</option>");
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="SUBMIT" id="insertButton">
                                                    <input type="submit"  name="updateButton" class="btn btn-warning pull-right btn-block" value="UPDATE" id="updateButton">
                                                </div>
                                            </div>
                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">TEACHER DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>
                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Sr. No.</th>
                                                                    <th>Teacher</th>
                                                                    <th>Designation</th>
                                                                    <th>Department</th>
                                                                    <th></th>
                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                                                 
                                                                    Teacher teacher[] = Teacher.getAllTeacher(con);
                                                                    for (int i = 0; i < teacher.length; i++) {
                                                                        System.out.println("hello"+ teacher[i].getTeacherName());
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + teacher[i].getTeacherID() + "</td>"
                                                                                + "<td>" + teacher[i].getTeacherName()+ "</td>"
                                                                                + "<td>" + teacher[i].getDesignation()+ "</td>"
                                                                                + "<td>" + teacher[i].getDepartmentName() + "</td>"
                                                                                + "<td style='visibility:hidden'>" + teacher[i].getDeartmentID()+ "</td>");
                                                                         out.println("<td><button type='button' class='edit-btn btn btn-warning col-md-6' name='edit'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp;EDIT</button></td>");
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
                $("#teacherID1").hide();
                $("#updateButton").hide();
                $(".edit-btn").click(function () {
                    $("#teacherID1").show();

                    $("#updateButton").show();
                    $("#insertButton").hide();
                });
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);
                $(".edit-btn").click(function () {
                    var row = $(this).closest("tr");
                    var teacherID = row.find("td:eq(0)").text();
                    var teacherName = row.find("td:eq(1)").text();
                    var designation=row.find("td:eq(2)").text();
                    var departmentID = row.find("td:eq(4)").text();
                    $("#teacherID").val(teacherID);
                    $("#teacherName").val(teacherName);
                    $("#designation").val(designation);
                    $("#department option[value='" + departmentID + "']").prop('selected', true);
                });
            });
        </script>
    </body>
</html>

