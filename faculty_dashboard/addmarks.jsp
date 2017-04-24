<%@page import="Exam.StudentPaperExam"%>
<%@page import="Exam.ExamAdmin"%>
<%@page import="Exam.Exam"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page import="Admission.Papers"%>
<%@page import="Admission.Student"%>
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
        <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>

        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </head>
    <body>
    <body class="home">
        <div class="display-table">
            <div class="row display-table-row">
                <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container" id="navigation">
                    <%@ include file="sidebar.html"%>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <%@ include file="header.html"%>

                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">

                                    <%
                                        Database database = new Database();
                                        Connection con = database.openConnection();
                                        if (request.getParameter("insertButton") != null) {
                                            Student student = new Student(con);
                                            Papers paper = new Papers(con);
                                            Exam exam = new Exam(con);
                                            StudentPaperExam studentpaperexam = new StudentPaperExam(con);
                                            paper.setPaperID(Integer.parseInt(request.getParameter("paper")));
                                            exam.setExamID(Integer.parseInt(request.getParameter("exam")));
                                            String student1[] = request.getParameterValues("student");
                                            studentpaperexam.setExam(exam);
                                            studentpaperexam.setPaper(paper);
                                            String marks[] = request.getParameterValues("marksObtained");

                                            for (int i = 0; i < student1.length; i++) {
                                                student.setStudentID(Integer.parseInt(student1[i]));
                                                studentpaperexam.setStudent(student);
                                                studentpaperexam.setMarksObtained(Integer.parseInt(marks[i]));
                                                studentpaperexam.enterStudentPaperExam();

                                            }

                                        }

                                    %>

                                    <form action="" method="">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">ADD MARKS</h3>
                                            <div class="row"> 
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Academic Year:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Academic Year" name="academicYear" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Paper:</label>
                                                        <select class="form-control"  name="paper" id="paper">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <%                                                                Papers paper[] = Papers.getAllPapers(con);
                                                                for (int i = 0; i < paper.length; i++) {
                                                                    out.println("<option value=" + paper[i].getPaperID() + ">" + paper[i].getPaperName() + "</option>");
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Exam:</label>
                                                        <select class="form-control"  name="exam" id="exam">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <%
                                                                Exam exam[] = ExamAdmin.getAllExams(con);
                                                                for (int i = 0; i < exam.length; i++) {
                                                                    out.println("<option value=" + exam[i].getExamID() + ">" + exam[i].getExamName() + "</option>");
                                                                }
                                                            %>

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-2 ">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit" class="btn btn-warning pull-right btn-block"  value="SUBMIT" name="insertButton" >
                                                </div>

                                            </div>
                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">ADD MARKS DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>

                                                                <tr>
                                                                    <th>Student Name</th>
                                                                    <th>Enter Marks</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                    Student student[] = Student.getAllStudents(con);
                                                                    for (int i = 0; i < student.length; i++) {
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + student[i].getFullName() + "</td>"
                                                                                + "<td><input type='text' name='marksObtained' ></td>"
                                                                                + "<td><input type='hidden' name='student' value=" + student[i].getStudentID() + "></td>");
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
        <script>
            (function () {
                'use strict';
                var $ = jQuery;
                $.fn.extend({
                    filterTable: function () {
                        return this.each(function () {
                            $(this).on('keyup', function (e) {
                                $('.filterTable_no_results').remove();
                                var $this = $(this),
                                        search = $this.val().toLowerCase(),
                                        target = $this.attr('data-filters'),
                                        $target = $(target),
                                        $rows = $target.find('tbody tr');

                                if (search == '') {
                                    $rows.show();
                                } else {
                                    $rows.each(function () {
                                        var $this = $(this);
                                        $this.text().toLowerCase().indexOf(search) === -1 ? $this.hide() : $this.show();
                                    })
                                    if ($target.find('tbody tr:visible').size() === 0) {
                                        var col_count = $target.find('tr').first().find('td').size();
                                        var no_results = $('<tr class="filterTable_no_results"><td colspan="' + col_count + '">No results found</td></tr>')
                                        $target.find('tbody').append(no_results);
                                    }
                                }
                            });
                        });
                    }
                });
                $('[data-action="filter"]').filterTable();
            })(jQuery);

            $(function () {
                // attach table filter plugin to inputs
                $('[data-action="filter"]').filterTable();

                $('.container').on('click', '.panel-heading span.filter', function (e) {
                    var $this = $(this),
                            $panel = $this.parents('.panel');

                    $panel.find('.panel-body').slideToggle();
                    if ($this.css('display') != 'none') {
                        $panel.find('.panel-body input').focus();
                    }
                });
                $('[data-toggle="tooltip"]').tooltip();
            })
            $(document).ready(function () {

                $('[data-toggle="offcanvas"]').click(function () {
                    $("#navigation").toggleClass("hidden-xs");
                });
                $('.nav-dropdown-1').hide();
                $('.nav-dropdown-2').hide();   
                $('.nav-dropdown-link-1').click(function () {
                    $('.nav-dropdown-1').slideToggle();
                    
                });
                $('.nav-dropdown-link-2').click(function () {
                    $('.nav-dropdown-2').slideToggle();
                    
                });

            });







        </script>

       

    </body>
</html>
