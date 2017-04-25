<%-- 
    Document   : PageUrl
    Created on : 19 Apr, 2017, 1:53:46 PM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Admission.PageUrl"%>
<%@page import="Admission.Rights"%>
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
                                           
                                            PageUrl pageurl=new PageUrl(con,
                                            0,
                                            request.getParameter("pageUrl"),
                                            Integer.parseInt(request.getParameter("rights")),
                                            "",
                                            request.getParameter("pageName"));
                                            try{
                                            pageurl.insertPageUrl();
                                            out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("pageUrl") + " url added successfully!."
                                                        + "</div>");
                                            }catch(SQLException sqlexception){
                                                  out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("pageUrl") + " url already exists!."
                                                        + "</div>");
                                            }

                                           

                                        } else if (request.getParameter("updateButton") != null) {
                                              PageUrl pageurl=new PageUrl(con,
                                            Integer.parseInt(request.getParameter("pageUrlID")),
                                            request.getParameter("pageUrl"),
                                            Integer.parseInt(request.getParameter("rights")),
                                            "",
                                              request.getParameter("pageName"));
                                              try{
                                              pageurl.updatePageUrl();
                                              out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("pageUrl") + " url updated successfully!."
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
                                            <h3 class="text-center">ADD PAGE URL</h3>
                                            <div class="row">
                                                
                                                <div class="col-md-3" id="pageUrlID1">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Page Url ID:</label>
                                                        <input type="text"   class="form-control pull-right" placeholder="Enter Page Url ID" name="pageUrlID" id="pageUrlID" readonly>
                                                    </div>
                                                </div>
                                               <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Rights:</label>
                                                        <select class="form-control" name="rights" id="rights">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <%
                                                                Rights right[] = Rights.getAllRights(con);
                                                                for (int i = 0; i < right.length; i++) {
                                                                    int rightID = right[i].getRightID();

                                                                    out.println("<option value=" + rightID + ">" + right[i].getName() + "</option>");
                                                                }


                                                            %>
                                                        </select>
                                                    </div>
                                                </div> 

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Page Url:</label>
                                                        <input type="text"   class="form-control pull-right" placeholder="Enter Page Url" name="pageUrl" id="pageUrl" required>
                                                    </div>
                                                </div>
                                                        <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Page Name:</label>
                                                        <input type="text"   class="form-control pull-right" placeholder="Enter Page Name" name="pageName" id="pageName" required>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-3">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="INSERT PAGE URL" id="insertButton">
                                                    <input type="submit"  name="updateButton" class="btn btn-warning pull-right btn-block" value="UPDATE PAGE URL" id="updateButton">

                                                </div>

                                            </div>
                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">PAGE URL DIRECTORY</h3>
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
                                                                   <th>Right Name</th>
                                                                    <th>Page Name</th>
                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>


                                                                <%    PageUrl pageurl[]=PageUrl.getAllPageUrl(con);
                                                                for(int i=0;i<pageurl.length;i++){
                                                                    out.println("<tr>");
                                                                    out.println("<td>"+pageurl[i].getPageID()+"</td>"
                                                                            + "<td>"+pageurl[i].getPageUrl()+"</td>"
                                                                            + "<td>"+pageurl[i].getName()+"</td>"
                                                                            + "<td style='display:none;'>"+pageurl[i].getRightID()+"</td> "
                                                                            + "<td>"+pageurl[i].getPageName()+"</td>");
                                                                    out.println("<td><button type='button' class='edit-btn btn btn-warning col-md-12' name='edit'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp;EDIT</button></td>");
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
                $("#updateButton").hide();
                $("#pageUrlID1").hide();

                $(".edit-btn").click(function () {
                    $("#pageUrlID1").show();
                    $("#insertButton").hide();
                    $("#updateButton").show();
                });
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);
                $(".edit-btn").click(function () {
                    var row = $(this).closest("tr");
                    var pageID = row.find("td:eq(0)").text();
                    var pageUrl = row.find("td:eq(1)").text();
                    var rightID=row.find("td:eq(3)").text();
                    var pageName=row.find("td:eq(4)").text();

                    $("#pageUrlID").val(pageID);
                    $("#pageUrl").val(pageUrl);
                     $("#pageName").val(pageName);
                    $("#rights option[value='" + rightID + "']").prop('selected', true);
                    
                });

            });
        </script>
    </body>
</html>

