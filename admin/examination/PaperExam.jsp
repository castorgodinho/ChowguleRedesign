<%-- 
    Document   : PaperExam
    Created on : 17 Mar, 2017, 10:24:52 AM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Exam.ExamAdmin"%>
<%@page import="Admission.Papers"%>
<%@page import="Exam.Exam"%>
<%@page import="Exam.PaperExam"%>
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
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Parvatibai Chowgule College</title>
        <!-- Bootstrap -->
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
		<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">   
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
        
    </head>
    <body>
    <body class="home">
        <div class="display-table">
            <div class="row display-table-row">
                <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container" id="navigation">
                    <%@ include file="../sidebar.html"%>
                    
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                    <%@ include file="../header.html"%>
                    <div class="user-dashboard ">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="">

                                    <%
                                        Database database = new Database();
                                        Connection con = database.openConnection();
                                        if (request.getParameter("insertButton") != null) {

                                            PaperExam paperexam = new PaperExam(con);
                                            Exam exam = new Exam();
                                            Papers paper = new Papers();
                                            exam.setExamID(Integer.parseInt(request.getParameter("exam")));
                                            paper.setPaperID(Integer.parseInt(request.getParameter("paper")));
                                            paperexam.setDate(request.getParameter("examDate"));
                                            paperexam.setTime(request.getParameter("examTime"));
                                            paperexam.setTotalMarks(Integer.parseInt(request.getParameter("totalMarks")));
                                            paperexam.setDuration(Integer.parseInt(request.getParameter("duration")));
                                            paperexam.setExam(exam);
                                            paperexam.setPaper(paper);
                                            try {

                                                paperexam.linkPaperWithExam();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Paper Exam added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {

                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Paper already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("updateButton") != null) {
                                            PaperExam paperexam = new PaperExam(con);
                                            Exam exam = new Exam();
                                            Papers paper = new Papers();
                                            exam.setExamID(Integer.parseInt(request.getParameter("exam")));
                                            paper.setPaperID(Integer.parseInt(request.getParameter("paper")));
                                            paperexam.setDate(request.getParameter("examDate"));
                                            paperexam.setTime(request.getParameter("examTime"));
                                            paperexam.setTotalMarks(Integer.parseInt(request.getParameter("totalMarks")));
                                            paperexam.setDuration(Integer.parseInt(request.getParameter("duration")));
                                            paperexam.setExam(exam);
                                            paperexam.setPaper(paper);
                                            try {
                                                paperexam.updatePaperWithExam();
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
                                    <form action="" method="">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">ADD EXAM</h3>
                                            <div class="row">
                                                <div class="col-md-4 col-md-offset-2">
                                                    <div class="form-group">
                                                        <label for="dtp_input2" class=" control-label">Date Picking</label>
                                                        <div class="input-group date form_date " data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                            <input class="form-control" size="16" type="text" name="examDate" id="examDate" value="" >

                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        </div>
                                                        <input type="hidden" id="dtp_input2" value="" /><br/>
                                                    </div>

                                                </div>
                                                <div class="col-md-4">
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
                                                                Exam exam[] = ExamAdmin.getAllExams(con);
                                                                for (int i = 0; i < exam.length; i++) {
                                                                    int examID = exam[i].getExamID();
                                                                    out.println("<option value=" + examID + ">" + exam[i].getExamName() + "</option>");
                                                                }

                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Paper:</label>
                                                        <select class="form-control" name="paper" id="paper">

                                                            <option disabled selected value>--select an option--</option>
                                                            <%                                                    Papers papers[] = Papers.getAllPapers(con);
                                                                for (int i = 0; i < papers.length; i++) {
                                                                    int paperID = papers[i].getPaperID();
                                                                    out.println("<option value=" + paperID + ">" + papers[i].getPaperName() + "</option>");
                                                                }

                                                            %>


                                                        </select>
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

                                                <div class="col-md-3 col-md-offset-9">
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
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th>Edit</th>
                                                                    
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                               <%                                                            PaperExam paperexam[] = PaperExam.getAllPaperExam(con);
                                                            for (int i = 0; i < paperexam.length; i++) {

                                                                out.println("<tr>");
                                                                out.println("<td>" + paperexam[i].getDate() + "</td>"
                                                                        + "<td>" + paperexam[i].getTime() + "</td>"
                                                                        + "<td>" + paperexam[i].getExam().getExamName() + "</td>"
                                                                        + "<td>" + paperexam[i].getPaper().getPaperName() + "</td>"
                                                                        + "<td>" + paperexam[i].getTotalMarks() + "</td>"
                                                                        + "<td>" + paperexam[i].getDuration() + "</td>"
                                                                        + "<td style='visibility:hidden'>" + paperexam[i].getExam().getExamID() + "</td>"
                                                                        + "<td style='visibility:hidden'>" + paperexam[i].getPaper().getPaperID() + "</td>"
                                                                        + "");
                                                                out.println("<td><input type='button' class='edit-btn' name='edit' value='edit'</td>");
                                                                out.println("</tr>");

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
     


        <!-- Modal -->





        <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="offcanvas"]').click(function () {
                    $("#navigation").toggleClass("hidden-xs");
                });
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
                  $('.nav-dropdown').hide();
                  $('.nav-dropdown-1').hide();
                  $('.nav-dropdown-2').hide();
                  $('.nav-dropdown-3').hide();
                  $('.nav-dropdown-link').click(function () {
                      $('.nav-dropdown').slideToggle();
                  });
                  $('.nav-dropdown-link-1').click(function () {
                      $('.nav-dropdown-1').slideToggle();
                  });
                  $('.nav-dropdown-link-2').click(function () {
                      $('.nav-dropdown-2').slideToggle();
                  });
                  $('.nav-dropdown-link-3').click(function () {
                      $('.nav-dropdown-3').slideToggle();
                  });
                  $('[data-toggle="offcanvas"]').click(function () {
                      $("#navigation").toggleClass("hidden-xs");
                  });
                  
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

                    var examID = row.find("td:eq(6)").text();

                    var paperID = row.find("td:eq(7)").text();


                    $("#examDate").val(date);
                    $("#examTime").val(time);
                    $("#totalMarks").val(totalMarks);
                    $("#duration").val(duration);
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

                                       