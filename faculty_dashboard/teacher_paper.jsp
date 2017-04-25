<%@page import="Attendance.Department"%>
<%@page import="dbAttendance.DBTeacherPaper"%>

<%@page import="java.sql.SQLException"%>

<%@page import="Admission.Paper"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page import="Attendance.Teacher"%>
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
                    <%@ include file="sidebar.html"%>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                    <%@ include file="header.html"%>
                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">
                                    <%
                                        Database database = new Database();
                                        Connection con = database.openConnection();
                                        if (request.getParameter("insertButton") != null) {

                                            Department department = new Department(con,
                                                    1);
                                            DBTeacherPaper dbteacherpaper = new DBTeacherPaper(
                                                    Integer.parseInt(request.getParameter("teacher")),
                                                    Integer.parseInt(request.getParameter("paper")),
                                                    request.getParameter("academicYear"));

                                            try {
                                                department.insertTeacherPaper(dbteacherpaper);
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Teacher Paper added successfully!."
                                                        + "</div>");

                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Teacher Paper already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("delete") != null) {
                                            Department department = new Department(con,
                                                    1);

                                            DBTeacherPaper dbteacherpaper = new DBTeacherPaper(
                                                    Integer.parseInt(request.getParameter("teacherID")),
                                                    Integer.parseInt(request.getParameter("paperID")),
                                                    request.getParameter("academic"));

                                            try {
                                                department.deleteTeacherPaper(dbteacherpaper);
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Teacher Paper deleted successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong>failed!."
                                                        + "</div>");
                                            }
                                        }

                                    %>

                                    <div class="col-md-12 card-style attendance-container " >
                                        <h3 class="text-center">ADD TEACHER PAPER</h3>
                                        <form action="" method="post"> 
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Teacher:</label>
                                                        <select class="form-control" name="teacher" id="teacher">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <%                                                                Teacher teacher[] = Teacher.getAllTeacher(con);
                                                                for (int i = 0; i < teacher.length; i++) {
                                                                    out.println("<option value=" + teacher[i].getTeacherID() + ">" + teacher[i].getTeacherName() + "</option>");
                                                                }


                                                            %>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Paper:</label>
                                                        <select class="form-control" name="paper" id="paper">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <%                                                                Paper paper[] = Paper.getAllPaper(con);
                                                                for (int i = 0; i < paper.length; i++) {
                                                                    out.println("<option value=" + paper[i].getPaperID() + ">" + paper[i].getPaperName() + "</option>");
                                                                }

                                                            %>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Academic Year:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Academic Year" name="academicYear"  required>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="SUBMIT" id="insertButton">

                                                </div>


                                            </div>
 											</form>
                                           
                                        <div class="attend-scroll">
                                            <div class="col-md-12">
                                                <div class="panel panel-success">
                                                    <h3 class="text-center">TEACHER PAPER DIRECTORY</h3>
                                                    <div class="panel-body">
                                                        <div class="col-md-6 col-md-offset-3">
                                                            <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                        </div>


                                                    </div>
                                                    <table class="table table-hover" id="task-table">
                                                        <thead>
                                                            <tr>
                                                                 <th>Paper</th>
                                                                <th>Teacher</th>
                                                               
                                                                <th>Academic Year</th>
                                                                <th></th>
                                                                <th></th>
                                                                <th></th>
                                                                <th>Delete</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <%                                                                  
                                                                Department department = new Department(con,
                                                                        4);
                                                                DBTeacherPaper dbteacherpaper[] =department.getAllTeacherPaper();
                                                                for (int i = 0; i < dbteacherpaper.length; i++) {
                                                                    out.println("<form>");
                                                                    out.println("<tr>");
                                                                    out.println("<td>" + dbteacherpaper[i].paperName + "</td>"
                                                                            + "<td>" + dbteacherpaper[i].teacherName + "</td>"
                                                                            + "<td>" + dbteacherpaper[i].academicYear + "</td>"
                                                                            + "<td><input type='hidden' name='paperID' value=" + dbteacherpaper[i].paperID + "></td>"
                                                                            + "<td><input type='hidden' name='teacherID' value=" + dbteacherpaper[i].teacherID + "></td>"
                                                                            + "<td><input type='hidden' name='academic' value=" + dbteacherpaper[i].academicYear + "></td>");
                                                                    out.println("<td><button type='sumbit' name='delete' id='deleteBtn' class='delete-btn btn btn-warning col-md-12'><i class='fa fa-trash-o' aria-hidden='true'></i>&nbsp; DELETE</button></td>");
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



                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

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
            });
            $(document).ready(function () {
                $('[data-toggle="offcanvas"]').click(function () {
                    $("#navigation").toggleClass("hidden-xs");
                });
                $('.nav-dropdown-1').hide();
                $('.nav-dropdown-2').hide();

                $('.nav-dropdown-3').hide();  
                $('.nav-dropdown-4').hide();  
                $('.nav-dropdown-5').hide();  

                $('.nav-dropdown-link-1').click(function () {
                    $('.nav-dropdown-1').slideToggle();

                });
                $('.nav-dropdown-link-2').click(function () {
                    $('.nav-dropdown-2').slideToggle();

                });

                $('.nav-dropdown-link-3').click(function () {
                    $('.nav-dropdown-3').slideToggle();
                    
                });
                $('.nav-dropdown-link-4').click(function () {
                    $('.nav-dropdown-4').slideToggle();
                    
                });
                $('.nav-dropdown-link-5').click(function () {
                    $('.nav-dropdown-5').slideToggle();
                    
                });

                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);


            });
        </script>   
    </body>
</html>
