<%-- 
    Document   : CourseSubjectStructure
    Created on : 16 Mar, 2017, 12:24:45 PM
    Author     : Gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Admission.CourseSubjectStructure"%>
<%@page import="Admission.CourseSubject"%>
<%@page import="Admission.Structure"%>
<%@page import="Admission.Subject"%>
<%@page import="Admission.Course"%>
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
                                            CourseSubjectStructure coursesubjectstructure = new CourseSubjectStructure(con);
                                            Course course = new Course(con);
                                            Subject subject = new Subject(con);
                                            Structure structure = new Structure(con);
                                            course.setCourseID(Integer.parseInt(request.getParameter("courses")));
                                            subject.setSubjectID(Integer.parseInt(request.getParameter("subject")));
                                            structure.setStructureID(Integer.parseInt(request.getParameter("structure")));
                                            coursesubjectstructure.setCourse(course);
                                            coursesubjectstructure.setStructure(structure);
                                            coursesubjectstructure.setSubject(subject);
                                            try {
                                                coursesubjectstructure.linkCourseSubjectStructure();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Course Subject Structure added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlException) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Course Subject Structure already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("delete") != null) {
                                            CourseSubjectStructure coursesubjectstructure = new CourseSubjectStructure(con);
                                            Course course = new Course(con);
                                            Subject subject = new Subject(con);
                                            Structure structure = new Structure(con);
                                            course.setCourseID(Integer.parseInt(request.getParameter("courseID")));
                                            subject.setSubjectID(Integer.parseInt(request.getParameter("subjectID")));
                                            structure.setStructureID(Integer.parseInt(request.getParameter("structureID")));
                                            coursesubjectstructure.setCourse(course);
                                            coursesubjectstructure.setSubject(subject);
                                            coursesubjectstructure.setStructure(structure);
                                            try {
                                                coursesubjectstructure.breakCourseSubjectStructureLink();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Deleted!</strong> Course Subject Structure deleted successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong>failed !."
                                                        + "</div>");
                                            }

                                        }
                                    %>


                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">LINK COURSE SUBJECT STRUCTURE</h3>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Course:</label>
                                                        <select class="form-control" name="courses" id="courses">
                                                            <option  disabled selected value>--Select an Option--</option>
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
                                                        <select class="form-control" name="subject" id="subject">
                                                           
                                                            
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Structure:</label>
                                                        <select class="form-control" name="structure" id="structure">
                                                           
                                                           
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
                                                        <h3 class="text-center">DEGREE DIRECTORY</h3>
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
                                                                    <th>Structure</th>
                                                                    

                                                                    <th>Delete</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>


                                                                <%                                                                    Course courses = new Course(con);

                                                                    CourseSubjectStructure coursesubjectstructure[] = courses.getAllCourseSubjectStructure();
                                                                    for (int i = 0; i < coursesubjectstructure.length; i++) {
                                                                        out.println("<form>");
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + coursesubjectstructure[i].getCourse().getCourseName() + "</td>"
                                                                                + "<td>" + coursesubjectstructure[i].getSubject().getSubjectName() + "</td>"
                                                                                + "<td>" + coursesubjectstructure[i].getStructure().getStructureName() + "</td>"
                                                                                + "<td style='display:none;'><input type='hidden'  name='courseID' value=" + coursesubjectstructure[i].getCourse().getCourseID() + "></td>"
                                                                                + "<td style='display:none;'><input type='hidden' name='subjectID' value=" + coursesubjectstructure[i].getSubject().getSubjectID() + "></td>"
                                                                                + "<td style='display:none;'><input type='hidden' name='structureID' value=" + coursesubjectstructure[i].getStructure().getStructureID() + "></td>");

                                                                        out.println("<td><button type='submit' class='delete-btn btn btn-warning col-md-6' name='delete'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp; DELETE</button></td>");
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
                $("#courses").change(function(){
                    var courseID=$("#courses").val();
                  //  alert(courseID);
                    $.ajax({
                       "method":"post",
                       "url":"http://localhost:43809/Chowgule1/NewServlet",
                       data:{"courses":courseID},
                       success:function(data){
                          // alert(data);
                            $("#subject").empty();
                         subJson=JSON.parse(data);
                         $.each(subJson,function(key,value){
                             $("#subject").append(" <option  disabled selected value>--select an option--</option>");
                           $.each(value,function(index1,value1){
                                $("#subject").append("<option value="+value1[0]+">"+value1[1]+"</option>");
                                 
                             });
         
                         });
                       }
                       
                    });

            });
                $("#subject").change(function(){
                    var subjectID=$("#subject").val();
                    var courseID=$("#courses").val();
                    
                  //  alert (courseID);
                  //  alert(subjectID);
                    $.ajax({
                       "method":"get",
                       "url":"http://localhost:43809/Chowgule1/NewServlet",
                       data:{"subjects":subjectID,"courses":courseID},
                       
                       success:function(data){
                           alert(data);
                            $("#structure").empty();
                         subjson=JSON.parse(data);
                         $.each(subjson,function(key2,value2){
                              $("#structure").append(" <option  disabled selected value>--select an option--</option>");
                           $.each(value2,function(index3,value3){
                                $("#structure").append("<option value="+value3[0]+">"+value3[1]+"</option>");
                                 
                             });
         
                         });
                       },
                        error:function(){
                        alert("failed")  ;
                      }
             
                       
                    });
                 });   
             });
        </script>  
    </body>
    

</html>


