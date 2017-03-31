<%-- 
    Document   : Component
    Created on : 16 Mar, 2017, 7:55:51 PM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Admission.Component"%>
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
                                            String name = request.getParameter("componentName");
                                            Component component = new Component(con);
                                            component.setComponentName(name);
                                            try {
                                                component.insertComponent();
                                                out.println("<div class=\"alert alert-success \"  id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("componentName") + " component added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("componentName") + " component already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("updateButton") != null) {
                                            Component component = new Component(con);
                                            component.setComponentName(request.getParameter("componentName"));
                                            component.setComponentID(Integer.parseInt(request.getParameter("componentID")));
                                            try {
                                                component.updateComponent();

                                                out.println("<div class=\"alert alert-success\" id=\"updateSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("componentName") + " component updated successfully!."
                                                        + "</div>");

                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> failed !."
                                                        + "</div>");
                                            }
                                        }

                                    %>


                                    <form action="" method="">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">ADD COMPONENT</h3>
                                            <div class="row">
                                                <div class="col-md-4" id="componentID1">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Component ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" id="componentID" name="componentID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Component Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Component Name" id="componentName" name="componentName" required>
                                                    </div>
                                                </div>

                                                <div class="col-md-2">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit" class="btn btn-warning pull-right btn-block" name="insertButton" id="insertButton" value="SUBMIT">
                                                    <input type="submit" class="btn btn-warning pull-right btn-block" name="updateButton" id="updateButton" value="UPDATE">
                                                </div>

                                            </div>









                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">COMPONENT DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Sr. No.</th>
                                                                    <th>Component Name</th>

                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                  
                                                                    Component component[] = Component.getAllComponent(con);

                                                                    for (int i = 0; i < component.length; i++) {

                                                                        out.println("<tr>");
                                                                        out.println("<td>" + component[i].getComponentID() + "</td>"
                                                                                + "<td>" + component[i].getComponentName() + "</td>");
                                                                        out.println("<td><input type='button' class='edit-button' name='edit' value='edit'></td>");
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
            })
            $(document).ready(function () {
                $('[data-toggle="offcanvas"]').click(function () {
                    $("#navigation").toggleClass("hidden-xs");
                });
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
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);
                $("#componentID1").hide();
                $("#updateButton").hide();
                $(".edit-button").click(function () {
                    $("#componentID1").show();
                    $("#updateButton").show();
                    $("#insertButton").hide();
                    var row = $(this).closest("tr")
                    var componentID = row.find("td:eq(0)").text();
                    var componentName = row.find("td:eq(1)").text();

                    $("#componentID").val(componentID);
                    $("#componentName").val(componentName);
                });

            });
            
        </script>
        
             

        
        

        

    </body>
</html>
