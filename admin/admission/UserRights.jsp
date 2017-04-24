<%-- 
    Document   : UserRights
    Created on : 19 Apr, 2017, 3:15:48 PM
    Author     : gaurav
--%>

<%@page import="Admission.AdmissionAdmin"%>
<%@page import="dbAdmission.DBUserRights"%>
<%@page import="Admission.Users"%>
<%@page import="Admission.Rights"%>
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
                <div class="col-md-2  hidden-xs display-table-cell v-align box card-style-container" id="navigation">
                    <%@ include file="../sidebar.jsp"%>
                </div>
                <div class="col-md-10 col-sm-12 display-table-cell v-align">
                    <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                    <%@ include file="../header.html"%>
                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">
                                    <div class="col-md-12">
                                        <%

                                            Database db = new Database();
                                            

                                            if (request.getParameter("insertButton") != null) {
                                              
                                                String rights[] = request.getParameterValues("rights");
                                                for (int i = 0; i < rights.length; i++) {
                                                    DBUserRights dbUserRights = new DBUserRights(
                                                            Integer.parseInt(request.getParameter("users")),
                                                            Integer.parseInt(rights[i]),
                                                            "",
                                                            "");
                                                    admissionAdmin.insertUserRights(dbUserRights);

                                                }

                                            } else if (request.getParameter("delete") != null) {
                                                 
                                                int rightID=Integer.parseInt(request.getParameter("rightID"));
                                                admissionAdmin.deleteUserRights(rightID);
                                            }


                                        %>

                                        <form action="" method="post">
                                            <div class="col-md-12 card-style attendance-container " >
                                                <h3 class="text-center">ADD PAGE URL</h3>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label for="sel1">Enter Rights:</label>
                                                            <select class="form-control" name="users" id="users">
                                                                <option disabled selected value>--Select an Option--</option>
                                                                <%                                                                Users users[] = Users.getAllUsers(con);
                                                                    for (int i = 0; i < users.length; i++) {
                                                                        out.println("<option value=" + users[i].getUserID() + ">" + users[i].getUserName() + "</option>");
                                                                    }


                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>   

                                                    <div class="col-md-3">
                                                        <div class="form-group">

                                                            <%                                                                Rights right[] = Rights.getAllRights(con);
                                                                for (int i = 0; i < right.length; i++) {
                                                                    int rightID = right[i].getRightID();

                                                                    out.println("<input type='checkbox' value=" + rightID + "  name='rights' >" + right[i].getName() + "<br>");
                                                                }


                                                            %>

                                                        </div>
                                                    </div> 



                                                    <div class="col-md-3">
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
                                                                        <th>Sr. No.</th>
                                                                        <th>Page Url</th>

                                                                        <th>Delete</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>


                                                                    <%                                                                 
                                                  
                                                                        DBUserRights dbUserRights[] = admissionAdmin.getAllUserRights();
                                                                        for (int i = 0; i < dbUserRights.length; i++) {
                                                                            out.println("<tr>");
                                                                            out.println("<td>" + dbUserRights[i].userName + "</td>"
                                                                                    + "<td>" + dbUserRights[i].rightName + "</td>"
                                                                                    + "<td style='display:none;'><input type='hidden' name='rightID' value=" + dbUserRights[i].rightID + "></td>");
                                                                            out.println("<td><button type='sumbit' name='delete' id='deleteBtn' class='delete-btn btn btn-warning col-md-6'><i class='fa fa-trash-o' aria-hidden='true'></i>&nbsp; DELETE</button></td>");
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


            });
        </script>
    </body>
</html>


