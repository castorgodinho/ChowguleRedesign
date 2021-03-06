<%-- 
    Document   : Sem
    Created on : 27 Mar, 2017, 2:54:43 PM
    Author     : gaurav
--%>

<%@page import="Admission.AdmissionAdmin"%>
<%@page import="dbAdmission.DBPaperSem"%>
<%@page import="java.sql.SQLException"%>

<%@page import="Admission.Subject"%>
<%@page import="Admission.Structure"%>
<%@page import="Admission.Paper"%>
<%@page import="Admission.Course"%>
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
                                            try{
                                               
                                            String sem[]=request.getParameterValues("sem");
                                            
                                            int sem1[]=new int[sem.length];
                                            for(int i=0;i<sem1.length;i++){
                                                sem1[i]=Integer.parseInt(sem[i]);
                                                
                                                DBPaperSem dbpapersem=new DBPaperSem(
                                                Integer.parseInt(request.getParameter("papers")),
                                                sem1[i],
                                                request.getParameter("academicYear"),
                                                Integer.parseInt(request.getParameter("courses")),
                                                Integer.parseInt(request.getParameter("structure")),
                                                Integer.parseInt(request.getParameter("subject")),
                                                0);
                                                admissionAdmin.insertPaperSem(dbpapersem);
                                            }
                                            
                                            out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> sem added successfully!."
                                                        + "</div>");
                                            }catch(SQLException sqlexception){
                                                    out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> sem already exists!."
                                                        + "</div>");
                                                    }
                                        } 
                                        else if (request.getParameter("delete") != null) {
                                            
                                                      
                                            int paperSemID=Integer.parseInt(request.getParameter("semester"));
                                           
                                            try{
                                            admissionAdmin.deleteSem(paperSemID);
                                             out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> sem deleted successfully!."
                                                        + "</div>");
                                            }catch(SQLException sqlexception){
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> !."
                                                        + "</div>");
                                                    }
                                            }
                                        
                                    %>
                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">ADD SEM</h3>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="col-md-4 col-md-offset-2" >
                                                        <div class="form-group">
                                                            <label for="sel1"> Academic Year:</label>
                                                            <input type="text" Value="" class="form-control pull-right" placeholder="Academic Year" name="academicYear" id="academicYear" >
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="sel1">Enter Course:</label>
                                                            <select class="form-control" name="courses" id="courses">
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
                                                </div>



                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Subject:</label>
                                                        <select class="form-control" name="subject" id="subject">


                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Structure:</label>
                                                        <select class="form-control" name="structure" id="structure">


                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Paper:</label>
                                                        <select class="form-control" name="papers" id="papers">


                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <label for="sel1">First Year:</label>
                                                    <div>
                                                        <input value="1" id="checkbox-1" class="checkbox-custom" name="sem" type="checkbox" >
                                                        <label for="checkbox-1" class="checkbox-custom-label">Semester 1</label>
                                                        <input value="2" id="checkbox-2" class="checkbox-custom" name="sem" type="checkbox" >
                                                        <label for="checkbox-2" class="checkbox-custom-label">Semester 2</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="sel1">Second Year:</label>
                                                    <div>
                                                        <input value="3" id="checkbox-3" class="checkbox-custom" name="sem" type="checkbox" >
                                                        <label for="checkbox-3" class="checkbox-custom-label">Semester 3</label>
                                                        <input value="4" id="checkbox-4" class="checkbox-custom" name="sem" type="checkbox" >
                                                        <label for="checkbox-4" class="checkbox-custom-label">Semester 4</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="sel1">Third Year:</label>
                                                    <div>
                                                        <input value="5" id="checkbox-5" class="checkbox-custom" name="sem" type="checkbox" >
                                                        <label for="checkbox-5" class="checkbox-custom-label">Semester 5</label>
                                                        <input value="6" id="checkbox-6" class="checkbox-custom" name="sem" type="checkbox" >
                                                        <label for="checkbox-6" class="checkbox-custom-label">Semester 6</label>
                                                    </div>
                                                </div>




                                                <div class="col-md-3 col-md-offset-9">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="SUBMIT" id="insertButton">

                                                </div>

                                            </div>

                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">SEM DIRECTORY</h3>
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
                                                                    <th>Structure</th>
                                                                    <th>Paper</th>
                                                                    <th>Academic Year</th>
                                                                    <th>Semester</th>
                                                                    <th></th>
                                                                    <th>Delete</th>

                                                                    
                                                                </tr>
                                                            </thead>
                                                            <tbody>


                                                                <%    DBPaperSem dbpapersem[] = AdmissionAdmin.getAllSem(con);
                                                                    for (int i = 0; i < dbpapersem.length; i++) {
                                                                        out.println("<form>");
                                                                        out.println("<tr>");
                                                                        out.println(""
                                                                                + "<td>" + dbpapersem[i].courseName + "</td>"
                                                                                + "<td>" + dbpapersem[i].subjectName + "</td>"
                                                                                + "<td>" + dbpapersem[i].structureName + "</td>"
                                                                                + "<td>" + dbpapersem[i].paperName + "</td>"
                                                                                + "<td>" + dbpapersem[i].academicYear + "</td>"
                                                                                + "<td>Semester " + dbpapersem[i].sem + "</td>"
                                                                                + "<td><input type='hidden' name='semester' value="+dbpapersem[i].paperSemID+"></td>");

                                                                        out.println("<td><button type='submit' class='delete-btn btn btn-warning col-md-12' name='delete' ><i class='fa fa-trash-o' aria-hidden='true'></i>&nbsp; DELETE</button></td>");

                                                                       

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

            });
        </script>


        <script>
            $(document).ready(function () {
                $("#courses").change(function () {
                    var courseID = $("#courses").val();
                   
                    $.ajax({
                        "method": "post",
                        "url": "http://localhost:43809/Chowgule1/Ajax",
                        data: {"courses": courseID},
                        success: function (data) {
                            
                            $("#subject").empty();
                            subJson = JSON.parse(data);
                            $.each(subJson, function (key, value) {
                                $("#subject").append(" <option  disabled selected value>--select an option--</option>");
                                $.each(value, function (index1, value1) {
                                    $("#subject").append("<option value=" + value1[0] + ">" + value1[1] + "</option>");

                                });

                            });
                        }

                    });

                });
                $("#subject").change(function () {
                    var subjectID = $("#subject").val();
                    var courseID = $("#courses").val();

                   
                    $.ajax({
                        "method": "post",
                        "url": "http://localhost:43809/Chowgule1/Ajax",
                        data: {"subject1": subjectID, "course1": courseID},
                        success: function (data) {
                            
                            $("#structure").empty();
                            subjson = JSON.parse(data);
                            $.each(subjson, function (key2, value2) {
                                $("#structure").append(" <option  disabled selected value>--select an option--</option>");
                                $.each(value2, function (index3, value3) {
                                    $("#structure").append("<option value=" + value3[0] + ">" + value3[1] + "</option>");

                                });

                            });
                        },
                        error: function () {
                            alert("failed");
                        }


                    });

                });


                $("#subject").change(function () {
                    var subjectID = $("#subject").val();
                    var courseID = $("#courses").val();
                    

                    $.ajax({
                        "method": "post",
                        "url": "http://localhost:43809/Chowgule1/Ajax",
                        data: {"subject2": subjectID, "course2": courseID},
                        success: function (data) {
                            // alert(data);
                            $("#papers").empty();
                            subjson = JSON.parse(data);
                            $.each(subjson, function (key2, value2) {
                                $("#papers").append(" <option  disabled selected value>--select an option--</option>");
                                $.each(value2, function (index3, value3) {
                                    $("#papers").append("<option value=" + value3[0] + ">" + value3[1] + "</option>");

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

