<%@page import="Attendance.Lecture"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page import="Attendance.Teacher"%>
<%@page import="Admission.Paper"%>
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
                    <%@ include file="sidebar.jsp"%>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <%@ include file="header.jsp"%>

                    <div class="user-dashboard">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">
                                    <%
                                        
                                    %>

                                    <div class="col-md-12 card-style attendance-container " >
                                        <h3 class="text-center">VIEW LECTURES</h3>
                                        <form action="" method="post">
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
                                                        <select class="form-control" name="paper" id="paper">
                                                            <%
                                                                Teacher teacher = new Teacher(con,
                                                                        Integer.parseInt(session.getAttribute("teacherid").toString()));
                                                                Paper papers[] = teacher.getPapers(con);
                                                                for (int i = 0; i < papers.length; i++) {
                                                                    out.println("<option value=" + papers[i].getPaperID() + ">" + papers[i].getPaperName() + "</option>");

                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-2 ">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit" class="btn btn-warning pull-right btn-block" name="insertButton" value="submit">
                                                </div>

                                            </div>
                                        </form>




                                        <div class="attend-scroll">
                                            <div class="col-md-12">
                                                <div class="panel panel-success">
                                                    <h3 class="text-center"> LECTURE DIRECTORY</h3><hr/>

                                                    <div class="row">
                                                       
                                                           
                                                                <%
                                                                    if (request.getParameter("insertButton") != null) {
                                                                        int paperID = Integer.parseInt(request.getParameter("paper"));
                                                                        String academicYear = request.getParameter("academicYear");
                                                                        Teacher teachers = new Teacher(con,
                                                                                Integer.parseInt(session.getAttribute("teacherid").toString()));
                                                                        Lecture lecture[] = teachers.getAllLeactures(paperID, academicYear);
                                                                        for (int i = 0; i < lecture.length; i++) {
                                                                            String url=request.getContextPath();
                                                                            out.println("  <div class='col-lg-3 col-md-3 col-sm-6 col-xs-6'>"
                                                                                    + "<div class='list-group'> "
                                                                                    + "<p class='text-center list-group-item active-head'>"
                                                                                    + " " + lecture[i].getDate() + "<span class='fa fa-pencil-square-o pull-right'>"
                                                                                    + "</p>"
                                                                                    + "  <p  class='text-center list-group-item'>" + lecture[i].getTime() + "</p>"
                                                                                    + " <p class='text-center'><a href='"+url+"/faculty_dashboard/viewattendance.jsp?id="+lecture[i].getLectureID()+"' class='list-group-item'><button type='button' class='btn btn-warning'>View Attendance</button></a></p></div></div>");
                                                                        }
                                                                    }


                                                                %>
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

            </div>
            <%@ include file="footer.html"%>
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
=======
             <%@ include file="footer.html"%>
>>>>>>> 4b0b1eb5eb2403874f83f41dce8891ec7401c68a
    </body>
</html>
