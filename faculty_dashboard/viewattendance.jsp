<%-- 
    Document   : Degree
    Created on : 15 Mar, 2017, 10:00:58 AM
    Author     : gaurav
--%>

<%@page import="Admission.Student"%>
<%@page import="Attendance.Lecture"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Admission.Degree"%>
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
       
    </head>

    <body class="home">
       
        <div class="display-table">
            <div class="row display-table-row">
                <div class="col-md-2  hidden-xs display-table-cell v-align box card-style-container" id="navigation">
                    <%@ include file="sidebar.jsp"%>
                </div>
                <div class="col-md-10 col-sm-12 display-table-cell v-align">
                    <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                    <%@ include file="header.jsp"%>
                    <div class="user-dashboard ">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="">


                                                <div class="col-md-12">
                                        <div class="col-md-12 card-style attendance-container " >
                                            
                                            
                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">ATTENDANCE DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Roll No.</th>
                                                                    <th>Student Name</th>
                                                                    <th>Attendance</th>
                                                                 
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                    Lecture lecture=new Lecture(con,
                                                                    Integer.parseInt(request.getParameter("id")));
                                                                    Student student[]=lecture.getAllStudents();
                                                                    for(int i=0;i<student.length;i++){
                                                                        out.println("<tr>");
                                                                        out.println("<td>"+student[i].getRollNumber()+"</td>"
                                                                                + "<td>"+student[i].getFullName()+"</td>"
                                                                                + "<td>p</td>");
                                                                        out.println("</tr>");
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
        </div>
<<<<<<< HEAD
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
=======

		 <%@ include file="footer.html"%>
>>>>>>> 4b0b1eb5eb2403874f83f41dce8891ec7401c68a


        
    </body>
</html>

