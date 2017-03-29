<%-- 
    Document   : CourseSubject
    Created on : 16 Mar, 2017, 10:41:27 AM
    Author     : gaurav
--%>

<%@page import="Admission.Course" %>
<%@page import="Admission.Database"%>
<%@page import="Admission.Subject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Admission.CourseSubject"%>

<%@page import="java.sql.Connection"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Parvatibai Chowgule College</title>
        <!-- Bootstrap -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="../css/datepicker.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>




    <body>

    <body class="home">
        <div class="display-table">
            <div class="row display-table-row">
                <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container" id="navigation">
                    <div class="logo" style="padding:7px;">
                        <img src="../img/admin-logo.png" class="img-responsive hidden-xs hidden-sm">

                        <img src="../img/spcc.png" class="img-responsive hidden-md hidden-lg">
                        </a>
                    </div>
                    <div class="navi">
                        <ul class="nav">
                            <li class="active"><a href="index.html"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">HOME</span></a></li>
                            <li><a class="nav-dropdown-link">
                                    <i class="fa fa-star-half-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">ADMISSION</span><span class="fa fa-angle-down pull-right"></span></a>
                                <ul class="nav nav-dropdown" role="">
                                    <li><a href="Degree.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">DEGREE</span></a></li>
                                    <li><a href="Course.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">COURSE</span></a></li>
                                    <li><a href="Structure.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">STRUCTURE</span></a></li>
                                    <li class="nav-dropdown-link-2"><a  ><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">SUBJECT</span><span class="fa fa-angle-down pull-right"></span></a>
                                        <ul class="nav nav-dropdown-2" role="">
                                            <li><a href="Subjects.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">INSERT SUBJECT</span></a></li>
                                            <li><a href="CourseSubject.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">COURSE SUBJECT</span></a></li>
                                            <li><a href="CourseSubjectStructure.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">COURSE SUBJECT STRUCTURE</span></a></li>
                                        </ul>
                                    </li>
                                    <li><a href="Type.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">TYPE</span></a></li>
                                    <li class="nav-dropdown-link-3"><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">GROUP</span><span class="fa fa-angle-down pull-right"></span></a>
                                        <ul class="nav nav-dropdown-3" role="">
                                            <li><a href="GeneralGroup.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">GENERAL GROUP</span></a></li>
                                            <li><a href="FoundationGroup.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">FOUNDATION GROUP</span></a></li>
                                        </ul>


                                    </li>

                                    <li class="nav-dropdown-link-1"><a ><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">PAPERS </span><span class="fa fa-angle-down pull-right"></span></a>
                                        <ul class="nav nav-dropdown-1" role="">
                                            <li><a href="Papers.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">INSERT PAPER</span></a></li>
                                            <li><a href="PaperType.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">PAPER TYPE</span></a></li> 
                                            <li><a href="PaperComponent.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">PAPER COMPONENT</span></a></li>
                                            <li><a href="CourseSubjectPaper.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">COURSE SUBJECT PAPER</span></a></li>
                                             <li><a href="Sem.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">SEM</span></a></li>
                                        </ul>
                                    </li>

                                    <li><a href="Component.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">COMPONENT</span></a></li>
                                    <li><a href="Compatible.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">COMPATIBLE</span></a></li>
                                </ul>
                            </li>
                            <li><a href="Student.jsp"><i class="fa fa-bar-chart" aria-hidden="true"></i><span class="hidden-xs hidden-sm">STUDENT</span></a></li>
                            <li class="nav-dropdown-link-2"><a  ><i class="fa fa-bar-chart" aria-hidden="true"></i><span class="hidden-xs hidden-sm">EXAMINATION</span><span class="fa fa-angle-down pull-right"></span></a>
                                <ul class="nav nav-dropdown-2" role="">
                                    <li><a href="Exam.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">EXAM</span></a></li>
                                    <li><a href="PaperExam.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">PAPER EXAM</span></a></li>

                                </ul>
                            </li>
                             <li class="nav-dropdown-link-3"><a  ><i class="fa fa-bar-chart" aria-hidden="true"></i><span class="hidden-xs hidden-sm">DEPARTMENT</span><span class="fa fa-angle-down pull-right"></span></a>
                                <ul class="nav nav-dropdown-3" role="">
                                    <li><a href="http://localhost:43809/Chowgule1/Web/admin/Department/Department.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">DEPARTMENT</span></a></li>
                                   
                                </ul>
                            </li>
                          <li class="nav-dropdown-link-1"><a  ><i class="fa fa-bar-chart" aria-hidden="true"></i><span class="hidden-xs hidden-sm">TEACHER</span><span class="fa fa-angle-down pull-right"></span></a>
                                <ul class="nav nav-dropdown-1" role="">
                                    <li><a href="http://localhost:43809/Chowgule1/Web/admin/Teacher/Teacher.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span class="hidden-xs hidden-sm">TEACHER</span></a></li>
                                   
                                </ul>
                            </li>

                            <li><a href="#"><i class="fa fa-calendar" aria-hidden="true"></i><span class="hidden-xs hidden-sm">PREFERENCES</span></a></li>
                            <li><a href="#"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">SETTING</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                    <div class="row">
                        <header class="card-style-container">
                            <div class="col-md-7">
                                <nav class="navbar-default pull-left">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                </nav>

                            </div>
                            <div class="col-md-5">
                                <div class="header-rightside">
                                    <ul class="list-inline header-top pull-right">
                                        <li></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="../img/avatar.jpg" alt="user">
                                                <b class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <div class="navbar-content">
                                                        <a href="dash_profile.html" class="">View Profile</a>
                                                        <a href="#" class="">Preferences</a>
                                                        <div class="divider">
                                                        </div>
                                                        <a href="#" class="">LogOut</a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </header>
                    </div>
                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">
                                    <%
                                        Database db = new Database();
                                        Connection con = db.openConnection();

                                        if (request.getParameter("insertButton") != null) {
                                            CourseSubject coursesubject = new CourseSubject(con);
                                            Course course = new Course(con);
                                            Subject subject = new Subject(con);
                                            course.setCourseID(Integer.parseInt(request.getParameter("Course")));
                                            subject.setSubjectID(Integer.parseInt(request.getParameter("Subject")));
                                            coursesubject.setCourse(course);
                                            coursesubject.setSubject(subject);
                                            try {
                                                coursesubject.linkSubjectWithCourse();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Course Subject added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlException) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Course Subject already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("delete") != null) {
                                            CourseSubject coursesubject = new CourseSubject(con);
                                            Subject subject = new Subject(con);
                                            Course course = new Course(con);
                                            course.setCourseID(Integer.parseInt(request.getParameter("courseID")));
                                            subject.setSubjectID(Integer.parseInt(request.getParameter("subjectID")));
                                            coursesubject.setCourse(course);
                                            coursesubject.setSubject(subject);
                                            try {
                                                coursesubject.breakSubjectWithCourseLink();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Deleted!</strong> Course Subject deleted successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong>failed !."
                                                        + "</div>");
                                            }

                                        }
                                    %>

                                    <form action="" method="">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">Link Course Subject</h3>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Course:</label>
                                                        <select class="form-control"  name="Course" id="course">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%
                                                                Course course[] = Course.getAllCourses(con);
                                                                for (int i = 0; i < course.length; i++) {
                                                                    int courseID = course[i].getCourseID();
                                                                    out.println("<option value=" + courseID + ">" + course[i].getCourseName() + "</option>");
                                                                }

                                                            %>
                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Subject:</label>
                                                        <select class="form-control" name="Subject" id="subject">
                                                            <option  disabled selected value>--select an option--</option>
                                                            
                                                            
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
                                                        <h3 class="text-center">COURSE SUBJECT DIRECTORY</h3>
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
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th>Delete</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>


                                                                <%                                                                    Course courses = new Course(con);
                                                                    CourseSubject coursesubject[] = courses.getAllCourseSubject();

                                                                    for (int i = 0; i < coursesubject.length; i++) {

                                                                        out.println("<form>");
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + coursesubject[i].getCourse().getCourseName() + "</td>"
                                                                                + "<td>" + coursesubject[i].getSubject().getSubjectName() + "</td>"
                                                                                + "<td style='visibility:hidden'><input type='hidden'  name='courseID' value=" + coursesubject[i].getCourse().getCourseID() + "></td>"
                                                                                + "<td style='visibility:hidden'><input type='hidden' name='subjectID' value=" + coursesubject[i].getSubject().getSubjectID() + "></td>");

                                                                        out.println("<td><input type='submit' Onclick='return ConfirmDelete();' name='delete' id='deleteBtn' class='delete-btn' value='Delete'/></td>");
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



        <!-- Modal -->





        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../js/bootstrap-datetimepicker.min.js"></script>
        <script src="../js/bootstrap-datepicker.js"></script>
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://www.jqueryscript.net/demo/Responsive-jQuery-News-Ticker-Plugin-with-Bootstrap-3-Bootstrap-News-Box/scripts/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
        <script>

            $(function () {
                $('[data-toggle="tooltip"]').tooltip({trigger: 'manual'}).tooltip('show');
            });

            $(window).load(function () {
                // if($( window ).scrollTop() > 10){   scroll down abit and get the action
                $(".progress-bar").each(function () {
                    each_bar_width = $(this).attr('aria-valuenow');
                    $(this).width(each_bar_width + '%');
                });

                //  }
            });
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
                $.getScript('http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js', function () {
                    $.getScript('http://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.0/morris.min.js', function () {
                        Morris.Bar({
                            element: 'bar-example',
                            data: [
                                {y: 'Jan 2014', a: 100},
                                {y: 'Feb 2014', a: 75},
                                {y: 'Mar 2014', a: 50},
                                {y: 'Apr 2014', a: 75},
                                {y: 'May 2014', a: 50},
                                {y: 'Jun 2014', a: 75}
                            ],
                            xkey: 'y',
                            ykeys: ['a'],
                            labels: ['Visitors', 'Conversions']

                        });

                    });
                });
            });

        </script>

        <script src="../js/bootstrap.min.js"></script>


        <script>
            $(document).ready(function () {
                $("#insertSuccess").fadeOut(3000);
                $("#invalid").fadeOut(3000);

            });
        </script>
      
        <script>
            $(document).ready(function(){
                
               $("#course").change(function(){
                  var courseID=$("#course").val();
                 // alert(courseID);
                  
                  $.ajax({
                     "method":"post",
                     "url":"http://localhost:43809/Chowgule1/NewServlet",
                     data:{"course":courseID},
                     success:function(data){
                       //  alert(data);
                        $("#subject").empty();
                        subJson=JSON.parse(data);
                        $.each(subJson,function(key,value){
                           // alert(value);
                             $("#subject").append(" <option  disabled selected value>--select an option--</option>")
                            $.each(value,function(index1,value1){
                               
                               $("#subject").append("<option value="+value1[0]+">"+value1[1]+"</option>");
                                
                            })
                            
                        });
                        
                     },
                     error:function(){
                       alert("failed")  
                     }
            
                  });
        
               }); 
            });
            </script>


    </body>
</html>

