<%-- 
    Document   : CourseSubject
    Created on : 16 Mar, 2017, 10:41:27 AM
    Author     : gaurav
--%>

<%@page import="dbAdmission.DBCourseSubject"%>
<%@page import="Admission.AdmissionAdmin"%>
<%@page import="Admission.Course" %>
<%@page import="Admission.Database"%>
<%@page import="Admission.Subject"%>
<%@page import="java.sql.SQLException"%>


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
                    <%@ include file="../header.html"%>
                    <div class="user-dashboard ">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="">
                                    <%
                                        Database db = new Database();
                                       
                                        
                                        if (request.getParameter("insertButton") != null) {
                                          
                                            DBCourseSubject dbCourseSubject = new DBCourseSubject(
                                                    Integer.parseInt(request.getParameter("Course")),
                                                    Integer.parseInt(request.getParameter("Subject")));
                                            
                                            try {
                                                admissionAdmin.linkCourseWithSubject(dbCourseSubject);
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Course Subject added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlException) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Course Subject already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("delete") != null) {
                                         
                                            DBCourseSubject dbCourseSubject = new DBCourseSubject(
                                                    Integer.parseInt(request.getParameter("courseID")),
                                                    Integer.parseInt(request.getParameter("subjectID")));
                                           
                                            
                                            try {
                                                admissionAdmin.breakSubjectWithCourseLink(dbCourseSubject);
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Deleted!</strong> Course Subject deleted successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong>failed !."
                                                        + "</div>");
                                            }
                                            
                                        }
                                    %>

                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">LINK COURSE SUBJECT</h3>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Course:</label>
                                                        <select class="form-control"  name="Course" id="course">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%                            
                                                                Course course[] = Course.getAllCourses(con);
                                                                for (int i = 0; i < course.length; i++) {
                                                                    int courseID = course[i].getCourseID();
                                                                    out.println("<option value=" + courseID + ">" + course[i].getCoursename() + "</option>");
                                                                }

                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Subject:</label>
                                                        <select class="form-control" name="Subject" id="subject">



                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="INSERT LINK" id="insertButton">

                                                </div>

                                            </div>

                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">COURSE SUBJECT DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>

                                                                    <th>Course</th>
                                                                    <th>Subject</th>

                                                                    <th>Delete</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                                                    
                                                                  
                                                                    DBCourseSubject dbcoursesubject[] = admissionAdmin.getAllCourseSubject();
                                                                    
                                                                    for (int i = 0; i < dbcoursesubject.length; i++) {
                                                                        
                                                                        out.println("<form>");
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + dbcoursesubject[i].courseName + "</td>"
                                                                                + "<td>" + dbcoursesubject[i].subjectName + "</td>"
                                                                                + "<td style='display:none;'><input type='hidden'  name='courseID' value=" + dbcoursesubject[i].courseID + "></td>"
                                                                                + "<td style='display:none;'><input type='hidden' name='subjectID' value=" + dbcoursesubject[i].subjectID + "></td>");
                                                                        
                                                                        out.println("<td><button type='sumbit' name='delete' id='deleteBtn' class='delete-btn btn btn-warning col-md-6'><i class='fa fa-trash-o' aria-hidden='true'></i>&nbsp; DELETE</button></td>");
                                                                        out.println("</tr>");
                                                                        out.println("</form>");
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
                $("#insertSuccess").fadeOut(3000);
                $("#invalid").fadeOut(3000);
                $("#course").change(function () {
                    var courseID = $("#course").val();
                    // alert(courseID);


                    $.ajax({
                        "method": "post",
                        "url": "http://localhost:43809/Chowgule1/Ajax",
                        data: {"course": courseID},
                        success: function (data) {
                            //  alert(data);
                            $("#subject").empty();
                            subJson = JSON.parse(data);
                            $.each(subJson, function (key, value) {
                                // alert(value);
                                $("#subject").append(" <option  disabled selected value>--select an option--</option>")
                                $.each(value, function (index1, value1) {

                                    $("#subject").append("<option value=" + value1[0] + ">" + value1[1] + "</option>");
                                });

                            });
                        },
                        error: function () {
                            alert("failed");
                        }
                    });
                });
            });
        </script>
    </body>
</html>

