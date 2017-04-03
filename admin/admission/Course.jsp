<%-- 
    Document   : Course
    Created on : 15 Mar, 2017, 10:57:10 AM
    Author     : gaurav
--%>

<%@page import="Admission.Degree" %>
<%@page import="Admission.Database"%>
<%@page import="Admission.Course"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.Connection"%>


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
    </head>
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
                                            Degree degree = new Degree(con);
                                            Course course = new Course(con);
                                            course.setCourseName(request.getParameter("courseName"));
                                            degree.setDegreeID(Integer.parseInt(request.getParameter("degree")));
                                            course.setStatus(request.getParameter("Status"));
                                            try {
                                                course.insertCourse(degree);

                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("courseName") + " course added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("courseName") + " course already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("updateButton") != null) {
                                            Course course = new Course(con);

                                            course.setCourseID(Integer.parseInt(request.getParameter("courseID")));
                                            course.setCourseName(request.getParameter("courseName"));
                                            course.setStatus(request.getParameter("Status"));
                                            int degreeID = (Integer.parseInt(request.getParameter("degree")));

                                            try {
                                                course.updateCourse(degreeID);
                                                out.println("<div class=\"alert alert-success\" id=\"updateSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("courseName") + " course updated successfully!."
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
                                            <h3 class="text-center">ADD COURSE</h3>
                                            <div class="row">
                                                <div class="col-md-3" id="courseID1">
                                                    <div class="form-group" id="courseID1">
                                                        <label for="sel1"> Course ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" name="courseID" id="courseID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Degree:</label>
                                                        <select class="form-control" name="degree" id="degree">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <%
                                                                Degree[] degree = Degree.getAllDegrees(con);
                                                                for (int i = 0; i < degree.length; i++) {
                                                                    int iD = degree[i].getDegreeID();

                                                                    out.println("<option value=" + iD + ">" + degree[i].getName() + "</option>");
                                                                }


                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Course Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Course" name="courseName" id="courseName" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Status:</label>
                                                        <select class="form-control"  name="Status" id="status">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <option value="ON" >ON</option>
                                                            <option value="OFF">OFF</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="SUBMIT" id="insertButton">
                                                    <input type="submit"  name="updateButton" class="btn btn-warning pull-right btn-block" value="UPDATE" id="updateButton">
                                                </div>
                                            </div>
                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">COURSE DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Sr. No.</th>
                                                                    <th>Course Name</th>
                                                                    <th>Status</th>
                                                                    <th>Degree</th>
                                                                    
                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%    Course[] course = Course.getAllCourses(con);

                                                                    for (int i = 0; i < course.length; i++) {
                                                                        course[i].setCon(con);
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + course[i].getCourseID() + "</td>"
                                                                                + "<td>" + course[i].getCourseName() + "</td>"
                                                                                + "<td>" + course[i].getStatus() + "</td>"
                                                                                + "<td>" + course[i].getDegree().getName() + "</td>"
                                                                                + "<td style='display:none;'>" + course[i].getDegree().getDegreeID() + "</td>");
                                                                        out.println("<td><button type='button' class='edit-btn btn btn-warning col-md-6' name='edit' ><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp; EDIT</button></td>");
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

            });
            
        </script>

        
        <script>
            $(document).ready(function () {
                $('.nav-dropdown').hide();
                $('.nav-dropdown-1').hide();
                $('.nav-dropdown-2').hide();
                $('.nav-dropdown-3').hide();
                $('.nav-dropdown-4').hide();
                $('.nav-dropdown-5').hide();
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
                $('.nav-dropdown-link-4').click(function () {
                    $('.nav-dropdown-4').slideToggle();
                });
                $('.nav-dropdown-link-5').click(function () {
                    $('.nav-dropdown-5').slideToggle();
                });
                $('[data-toggle="offcanvas"]').click(function () {
                    $("#navigation").toggleClass("hidden-xs");
                });
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);
                $("#courseID").hide();
                $("#courseID1").hide();
                $("#updateButton").hide();
                $(".edit-btn").click(function () {
                    $("#insertButton").hide();
                    $("#courseID").show();
                    $("#courseID1").show();
                    $("#updateButton").show();
                });
                $(".edit-btn").click(function () {
                    var row = $(this).closest("tr");
                    var courseID = row.find("td:eq(0)").text();
                    var courseName = row.find("td:eq(1)").text();
                    var courseStatus = row.find("td:eq(2)").text();
                    var degree = row.find("td:eq(3)").text();
                    var degreeID = row.find("td:eq(4)").text();
                    $("#courseID").val(courseID);
                    $("#courseName").val(courseName);
                    $("#status option[value=" + courseStatus + "]").prop('selected', true);
                    $("#degree  option[value='" + degreeID + "']").prop('selected', true);
                });
            });

        </script>
    </body>
</html>
