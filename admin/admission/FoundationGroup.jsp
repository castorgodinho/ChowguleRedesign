<%-- 
    Document   : FoundationGroup
    Created on : 16 Mar, 2017, 3:37:25 PM
    Author     : gaurav
--%>

<%@page import="Admission.FoundationGroup"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page import="java.sql.SQLException"%>
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
        <link href="../css/bootstrap.min.css" rel="stylesheet">
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

                                            FoundationGroup foundationgroup = new FoundationGroup(con);
                                            foundationgroup.setName(request.getParameter("foundationGroupName"));

                                            try {

                                                foundationgroup.insertFoundationGroup();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("foundationGroupName") + " group added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("foundationGroupName") + "  group already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("updateButton") != null) {
                                            FoundationGroup foundationgroup = new FoundationGroup(con);
                                            foundationgroup.setID(Integer.parseInt(request.getParameter("foundationGroupID")));
                                            foundationgroup.setName(request.getParameter("foundationGroupName"));
                                            try {
                                                foundationgroup.update();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("foundationGroupName") + " group added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> failed !."
                                                        + "</div>");
                                            }

                                        }

                                    %>
                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">ADD FOUNDATION GROUP</h3>
                                            <div class="row">
                                                <div class="col-md-4" id="foundationGroupID1">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Foundation Group ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder=""  id="foundationGroupID" name="foundationGroupID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Foundation Group Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Foundation Group Name" id="foundationGroupName" name="foundationGroupName" required>
                                                    </div>
                                                </div>

                                                <div class="col-md-2">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit" class="btn btn-warning pull-right btn-block" value="SUBMIT" name="insertButton" id="insertButton">
                                                    <input type="submit" class="btn btn-warning pull-right btn-block" value="UPDATE" name="updateButton" id="updateButton">
                                                </div>

                                            </div>

                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">FOUNDATION GROUP DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Sr. No.</th>
                                                                    <th>Group Name</th>

                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                    FoundationGroup foundationGroup[] = FoundationGroup.getAllFoundationGroups(con);
                                                                    for (int i = 0; i < foundationGroup.length; i++) {

                                                                        out.println("<tr>");
                                                                        out.println("<td>" + foundationGroup[i].getID() + "</td>"
                                                                                + "<td>" + foundationGroup[i].getName() + "</td>");
                                                                        out.println("<td><button type='button' class='edit-btn btn btn-warning col-md-6' name='edit'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp; EDIT</button></td>");
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
                $("#foundationGroupID").hide();
                $("#foundationGroupID1").hide();
                $("#updateButton").hide();
                $(".edit-btn").click(function () {
                    $("#updateButton").show();
                    $("#insertButton").hide();
                    $("#foundationGroupID").show();
                    $("#foundationGroupID1").show();
                    var row = $(this).closest("tr");
                    var foundationGroupID = row.find("td:eq(0)").text();
                    var foundationGroupName = row.find("td:eq(1)").text();

                    $("#foundationGroupID").val(foundationGroupID);
                    $("#foundationGroupName").val(foundationGroupName);
                });

            });
           
        </script>
    </body>
</html>

