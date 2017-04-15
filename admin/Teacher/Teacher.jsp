<%-- 
    Document   : Teacher
    Created on : 24 Mar, 2017, 10:41:35 AM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Attendance.Teacher"%>

<%@page import="Admission.Department"%>
<%@page import="Admission.Database"%>
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
                                        Database db = new Database();
                                        Connection con = db.openConnection();

                                        if (request.getParameter("insertButton") != null) {
                                              Teacher teacher=new Teacher(con);
                                              teacher.setTeacherName(request.getParameter("teacherName"));
                                              int departmentID=Integer.parseInt(request.getParameter("department"));
                                              try{
                                              teacher.insertTeacher(departmentID);
                                               out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("teacherName") + " Teacher added successfully!."
                                                        + "</div>");
                                              }catch(SQLException sqlexception){
                                                   out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> failed!."
                                                        + "</div>");
                                              }

                                        } else if (request.getParameter("updateButton") != null) {
                                            Teacher teacher=new Teacher(con);
                                            teacher.setTeacherID(Integer.parseInt(request.getParameter("teacherID")));
                                            teacher.setTeacherName(request.getParameter("teacherName"));
                                           int departmentID=Integer.parseInt(request.getParameter("department"));
                                           try{
                                           teacher.updateTeacher(departmentID);
                                           out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("teacherName") + " Teacher updated successfully!."
                                                        + "</div>");
                                           }catch(SQLException sqlexception){
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
                                                                    <th>Department</th>
                                                                    <th></th>
                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <%
                                                                    Teacher teacher[] = Teacher.getAllTeacher(con);
                                                                    for (int i = 0; i < teacher.length; i++) {
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + teacher[i].getTeacherID() + "</td>"
                                                                                + "<td>" + teacher[i].getTeacherName() + "</td>"
                                                                                + "<td>"+teacher[i].getDepartment().getName()+"</td>"
                                                                                + "<td style='visibility:hidden'>"+teacher[i].getDepartment().getDepartmentID()+"</td>");
                                                                        out.println("<td><input type='button' class='edit-btn'name='edit' value='edit'</td>");
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
                $('[data-toggle="offcanvas"]').click(function () {
                    $("#navigation").toggleClass("hidden-xs");
                });
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
                    var departmentID=row.find("td:eq(3)").text();

                    $("#teacherID").val(teacherID);
                    $("#teacherName").val(teacherName);
                     $("#department option[value='" + departmentID + "']").prop('selected', true);

                });

            });
            





        </script>

          


        
    </body>
</html>

