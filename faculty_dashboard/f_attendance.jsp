<%@page import="dbAttendance.DBLeactureStudent"%>
<%@page import="java.sql.SQLException"%>

<%@page import="Admission.Student"%>
<%@page import="Admission.Paper"%>
<%@page import="Attendance.Teacher"%>
<%@page import="Attendance.Lecture"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
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
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
              rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
        <link href="<%=request.getContextPath()%>/css/font-awesome.css"
              rel="stylesheet">
        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/datepicker.css">
    </head>
    <body class="home">
        <div class="display-table">
            <div class="row display-table-row">
                <div
                    class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container"
                    id="navigation"><%@ include file="sidebar.jsp"%>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align"><%@ include
                        file="header.jsp"%>
                        <div class="user-dashboard ">
                            <div class="container-fluid">
                                <%
                                    
                                    if (request.getParameter("insertButton") != null) {
                                      
                                           
                                            Lecture lecture = new Lecture(con,
                                            0,
                                            request.getParameter("examDate"),
                                            request.getParameter("examTime"),
                                            request.getParameter("academicYear"),
                                            Integer.parseInt(request.getParameter("paper")),
                                            Integer.parseInt(session.getAttribute("teacherid").toString()));
                                           
                                            
                                            int lectureID=lecture.insertLecture(lecture);

                                            
                                            String student1[] = request.getParameterValues("studentID");
                                           
                                            for (int i = 0; i < student1.length; i++) {
                                                Teacher teacher=new Teacher(con,
                                            0);
                                                DBLeactureStudent dblecturestudent=new DBLeactureStudent(
                                                lectureID,
                                                 Integer.parseInt(student1[i]) );
                                               
                                               teacher.insertLeactureStudent(dblecturestudent);
                                                
                                            }
                                            out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                    + "<strong>Success!</strong> Attendence added successfully!."
                                                    + "</div>");
                                        
                                    }
                                %>
                                <form method="post" action="">
                                    <div class="row">
                                        <div class="">
                                            <div class="col-md-12 card-style attendance-container ">
                                                <h3 class="text-center">ATTENDANCE</h3>

                                                <div class="row">
                                                    <div class="col-md-4 col-md-offset-2">
                                                        <div class="form-group"><label for="dtp_input2"
                                                                                       class=" control-label">Date Picking</label>
                                                            <div class="input-group date form_date " data-date=""
                                                                 data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
                                                                 data-link-format="yyyy-mm-dd"><input class="form-control"
                                                                                                 size="16" type="text" name="examDate" id="examDate" value="">

                                                                <span class="input-group-addon"><span
                                                                        class="glyphicon glyphicon-calendar"></span></span></div>
                                                            <input type="hidden" id="dtp_input2" value="" /><br />
                                                        </div>

                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group"><label for="dtp_input3"
                                                                                       class=" control-label">Time Picking</label>
                                                            <div class="input-group date form_time" data-date=""
                                                                 data-date-format="HH:ii p" data-link-field="dtp_input3"
                                                                 data-link-format="HH:ii"><input class="form-control" size="16"
                                                                                            type="text" name="examTime" id="examTime" value=""> <span
                                                                                            class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                                            </div>
                                                            <input type="hidden" id="dtp_input3" value="" /><br />
                                                        </div>

                                                    </div>


                                                    <div class="col-md-4 ">

                                                        <div class="form-group"><label for="sel1">Enter Academic
                                                                Year:</label> <input type="text" Value="" class="form-control pull-right"
                                                                                 placeholder="Enter Academic Year" name="academicYear" required></div>
                                                    </div>
                                                    <div class="col-md-4 ">
                                                        <div class="form-group">
                                                            <label for="sel1">Select Paper:</label>
                                                            <select class="form-control"  name="paper" id="paper">
                                                                <option disabled selected value>--Select an Option--</option>
                                                                <%              
                                                                    Teacher teacher=new Teacher(con,
                                                                    Integer.parseInt(session.getAttribute("teacherid").toString()));
                                                                    Paper paper[] = teacher.getPapers(con);
                                                                    for (int i = 0; i < paper.length; i++) {
                                                                        out.println("<option value=" + paper[i].getPaperID() + ">" + paper[i].getPaperName() + "</option>");
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3"><label for="sel1">&nbsp;</label> <input
                                                            type="submit" class="btn btn-warning pull-right btn-block "
                                                            value="SUBMIT" name="insertButton" id="insertButton" ></div>
                                                </div>

                                                <div class="attend-scroll">
                                                    <div class="col-md-12">
                                                        <div class="panel panel-success">
                                                            <h3 class="text-center">ATTENDANCE DIRECTORY</h3>
                                                            <div class="panel-body">
                                                                <div class="col-md-6 col-md-offset-3"><input type="text"
                                                                                                             class="form-control" id="task-table-filter" data-action="filter"
                                                                                                             data-filters="#task-table" placeholder="Filter Tasks" /></div>

                                                            </div>
                                                            <table class="table table-hover" id="task-table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Name</th>                       
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                       Student student[] = Student.getAllStudents(con);
                                                                        for (int i = 0; i < student.length; i++) {
                                                                            out.println("<tr>");
                                                                            out.println("<td>" + student[i].getFullName() + "</td>"
                                                                                    + "<td style='display:none;'><input type='hidden' name='student' value=" + student[i].getStudentID() + "></td>"
                                                                                    + "<td> <div class='checkbox'><label style='font-size: 1em'><input type='checkbox' name='studentID' value=" + student[i].getStudentID() + " ><span class='cr'><i class='cr-icon fa fa-check'></i></span></label></div></td>");

                                                                            out.println("</tr>");
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
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
                                                                
                                                                    <%@ include file="footer.html"%>
            
           <script>
            $(document).ready(function () {
             
                $("#paper").change(function () {
                    var academicYear=$("#academicYear").val();
                    var paperID = $("#paper").val();
                   alert(academicYear);
                   alert(paperID);


                    $.ajax({
                        "method": "post",
                        "url": "http://localhost:43809/Chowgule1/Ajax",
                        data: {"academicYear":academicYear, "paperID":paperID },
                        success: function (data) {
                           
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
