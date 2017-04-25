<%-- 
    Document   : PaperExam
    Created on : 17 Mar, 2017, 10:24:52 AM
    Author     : gaurav
--%>

<%@page import="dbExam.DBPaperExam"%>
<%@page import="java.sql.SQLException"%>

<%@page import="Admission.Paper"%>
<%@page import="Exam.Exam"%>

<%@page import="Attendance.Teacher"%>
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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
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
                        <div class="container-fluid card-style">
                            
                                

                                    <%
                                       
                                        if (request.getParameter("insertButton") != null) {
                                            Teacher teacher = new Teacher(con,
                                                   0,
                                                    "",
                                                    0,
                                                    "");

                                            DBPaperExam dbpaperexam = new DBPaperExam(
                                                    Integer.parseInt(request.getParameter("paper")),
                                                    Integer.parseInt(request.getParameter("exam")),
                                                    request.getParameter("examTime"),
                                                    request.getParameter("examDate"),
                                                    Integer.parseInt(request.getParameter("totalMarks")),
                                                    Integer.parseInt(request.getParameter("duration")),
                                                    request.getParameter("academicYear"));

                                            try {

                                                teacher.insertPaperExam(dbpaperexam);
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Paper Exam added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {

                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Paper already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("updateButton") != null) {
                                            Teacher teacher = new Teacher(con,
                                                   0,
                                                    "",
                                                    0,
                                                    "");

                                            DBPaperExam dbpaperexam = new DBPaperExam(
                                                    Integer.parseInt(request.getParameter("paper")),
                                                    Integer.parseInt(request.getParameter("exam")),
                                                    request.getParameter("examTime"),
                                                    request.getParameter("examDate"),
                                                    Integer.parseInt(request.getParameter("totalMarks")),
                                                    Integer.parseInt(request.getParameter("duration")),
                                                    request.getParameter("academicYear"));

                                            try {
                                                teacher.updatePaperExam(dbpaperexam);
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Paper Exam updated successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> failed!."
                                                        + "</div>");
                                            }
                                        }
                                    %>
                                    <form action="" method="post">
                                        <div class="col-md-12  attendance-container " >
                                            <h3 class="text-center">PAPER EXAM</h3>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="dtp_input2" class=" control-label">Date Picking</label>
                                                        <div class="input-group date form_date " data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                            <input class="form-control" size="16" type="text" name="examDate" id="examDate" value="" >

                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        </div>
                                                        <input type="hidden" id="dtp_input2" value="" /><br/>
                                                    </div>

                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="dtp_input3" class=" control-label">Time Picking</label>
                                                        <div class="input-group date form_time" data-date="" data-date-format="HH:ii p" data-link-field="dtp_input3" data-link-format="HH:ii">
                                                            <input class="form-control" size="16" type="text" name="examTime" id="examTime" value="" >

                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                                        </div>
                                                        <input type="hidden" id="dtp_input3" value="" /><br/>
                                                    </div>

                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Exam:</label>
                                                        <select class="form-control" name="exam" id="exam">
                                                            <option disabled selected value>--select an option--</option>
                                                            <%
                                                                Exam exam[] = Exam.getAllExam(con);
                                                                for (int i = 0; i < exam.length; i++) {
                                                                    int examID = exam[i].getExamID();
                                                                    out.println("<option value=" + examID + ">" + exam[i].getExamName() + "</option>");
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Paper:</label>
                                                        <select class="form-control" name="paper" id="paper">

                                                            <option disabled selected value>--select an option--</option>
                                                            <%                                                              
                                                                Teacher teacher = new Teacher(con,
                                                                        Integer.parseInt(session.getAttribute("teacherid").toString()),
                                                                        "",
                                                                        0,
                                                                        "");
                                                                Paper papers[] = teacher.getPapers(con);
                                                                for (int i = 0; i < papers.length; i++) {
                                                                    int paperID = papers[i].getPaperID();
                                                                    out.println("<option value=" + paperID + ">" + papers[i].getPaperName() + "</option>");
                                                                }

                                                            %>
                                                        </select>
                                                    </div>
                                                </div></div>
                                                <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Academic Year:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" name="academicYear" id="academicYear" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Total Marks:</label>
                                                        <input type="number" Value="" class="form-control pull-right" placeholder="Enter Total Marks" name="totalMarks" id="totalMarks" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Exam Duration:</label>
                                                        <input type="number" Value="" class="form-control pull-right" placeholder="" name="duration" id="duration" required>
                                                    </div>
                                                </div>
                                                
                                                
                                                <div class="col-md-3">
                                                <label for="sel1">&nbsp;</label>
                                                <input type="submit" class="btn btn-warning pull-right btn-block " name="insertButton" value="SUBMIT" id="insertButton">
                                                <input type="submit" class="btn btn-warning pull-right btn-block " name="updateButton" value="UPDATE" id="updateButton">
                                                </div>
                                                </div>
                                                    
                                                

                                            
                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">PAPER EXAM DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Date</th>
                                                                    <th>Time</th>
                                                                    <th>Exam</th>
                                                                    <th>Paper</th>
                                                                    <th>Total Marks</th>
                                                                    <th>Duration</th>
                                                                    <th>Academic Year</th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th>Edit</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                                                 
                                                                    String academicYear = request.getParameter("academicYear");
                                                                    Teacher teachers = new Teacher(con,
                                                                            Integer.parseInt(session.getAttribute("teacherid").toString()),
                                                                            "",
                                                                            0,
                                                                            "");
                                                                    DBPaperExam dbpaperexam[] = teachers.getPaperExam();
                                                                    for (int i = 0; i < dbpaperexam.length; i++) {

                                                                        out.println("<tr>");
                                                                        out.println("<td>" + dbpaperexam[i].date + "</td>"
                                                                                + "<td>" + dbpaperexam[i].time + "</td>"
                                                                                + "<td>" + dbpaperexam[i].examName + "</td>"
                                                                                + "<td>" + dbpaperexam[i].paperName + "</td>"
                                                                                + "<td>" + dbpaperexam[i].totalMarks + "</td>"
                                                                                + "<td>" + dbpaperexam[i].duration + "</td>"
                                                                                + "<td>" + dbpaperexam[i].academicYear + "</td>"
                                                                                + "<td style='visibility:hidden'>" + dbpaperexam[i].examID + "</td>"
                                                                                + "<td style='visibility:hidden'>" + dbpaperexam[i].paperID + "</td>"
                                                                                + "");
                                                                        out.println("<td><button type='button' class='edit-btn btn btn-warning col-md-12' name='edit' value='edit'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp;EDIT</button></td>");
                                                                        out.println("</tr>");

                                                                    }

                                                                %>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                    </form>
                                    </div>
                    </div>
                </div>
            </div>
</div>
        
        <%@ include file="../footer.html"%>

        <script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
        <script>
            $(document).ready(function () {

            });
            $('.form_date').datetimepicker({
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
            $('.form_time').datetimepicker({
                language: 'fr',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 1,
                minView: 0,
                maxView: 1,
                forceParse: 0,
                showMeridian: 1

            });
        </script>

        <script>
            $(document).ready(function () {
                $("#updateButton").hide();
                $(".edit-btn").click(function () {
                    $("#updateButton").show();
                    $("#insertButton").hide();
                    var row = $(this).closest("tr");
                    var date = row.find("td:eq(0)").text();
                    var time = row.find("td:eq(1)").text();
                    var totalMarks = row.find("td:eq(4)").text();
                    var duration = row.find("td:eq(5)").text();
                    var academicYear = row.find("td:eq(6)").text();
                    var examID = row.find("td:eq(7)").text();

                    var paperID = row.find("td:eq(8)").text();


                    $("#examDate").val(date);
                    $("#examTime").val(time);
                    $("#totalMarks").val(totalMarks);
                    $("#duration").val(duration);
                    $("#academicYear").val(academicYear);

                    $("#exam option[value=" + examID + "]").prop('selected', true);
                    $("#paper option[value=" + paperID + "]").prop('selected', true);
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);
            });
        </script>
    </body>
</html>

