<%-- 
    Document   : DepartmentPaper
    Created on : 3 Apr, 2017, 12:16:38 PM
    Author     : gaurav
--%>

<%@page import="Admission.DepartmentPaper"%>
<%@page import="Admission.Papers"%>
<%@page import="Admission.Department"%>
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
                                        Database db = new Database();
                                        Connection con = db.openConnection();

                                        if (request.getParameter("insertButton") != null) {
                                            DepartmentPaper departmentpaper = new DepartmentPaper(con);
                                            Papers paper = new Papers(con);
                                            Department department = new Department(con);
                                            paper.setPaperID(Integer.parseInt(request.getParameter("paper")));
                                            department.setDepartmentID(Integer.parseInt(request.getParameter("department")));
                                            departmentpaper.setDepartment(department);
                                            departmentpaper.setPaper(paper);
                                            departmentpaper.insertDepartmentPaper();

                                        } else if (request.getParameter("delete") != null) {
                                            DepartmentPaper departmentpaper = new DepartmentPaper(con);
                                            Papers paper = new Papers(con);
                                            Department department = new Department(con);
                                            paper.setPaperID(Integer.parseInt(request.getParameter("paperID")));
                                            department.setDepartmentID(Integer.parseInt(request.getParameter("departmentID")));
                                            departmentpaper.setDepartment(department);
                                            departmentpaper.setPaper(paper);
                                            departmentpaper.deleteDepartmentPaper();
                                        }
                                    %>

                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">LINK DEPARTMENT PAPER</h3>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Department:</label>
                                                        <select class="form-control"  name="department" id="department">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%
                                                                Department department[] = Department.getAllDepartment(con);
                                                                for (int i = 0; i < department.length; i++) {
                                                                    out.println("<option value=" + department[i].getDepartmentID() + ">" + department[i].getName() + "</option>");
                                                                }

                                                            %>
                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Paper:</label>
                                                        <select class="form-control" name="paper" id="paper">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%                                                                Papers paper[] = Papers.getAllPapers(con);
                                                                for (int i = 0; i < paper.length; i++) {
                                                                    out.println("<option value=" + paper[i].getPaperID() + ">" + paper[i].getPaperName() + "</option>");
                                                                }

                                                            %>



                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="SUBMIT" id="insertButton">

                                                </div>

                                            </div>

                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">DEPARTMENT PAPER DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>

                                                                    <th>Department</th>
                                                                    <th>Paper</th>

                                                                    <th>Delete</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                                                    DepartmentPaper departmentpaper[] = DepartmentPaper.getAllDepartmentPaper(con);
                                                                    for (int j = 0; j < departmentpaper.length; j++) {
                                                                        out.println("</form>");
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + departmentpaper[j].getDepartment().getName() + "</td>"
                                                                                + "<td>" + departmentpaper[j].getPaper().getPaperName() + "</td>"
                                                                                + "<td><input type='hidden' name=departmentID value=" + departmentpaper[j].getDepartment().getDepartmentID() + "></td>"
                                                                                + "<td><input type='hidden' name=paperID value=" + departmentpaper[j].getPaper().getPaperID() + "></td>");
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
                $("#insertSuccess").fadeOut(3000);
                $("#invalid").fadeOut(3000);

            });
        </script>
    </body>
</html>


