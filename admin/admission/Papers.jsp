<%-- 
    Document   : Papers
    Created on : 16 Mar, 2017, 2:51:18 PM
    Author     : gaurav
--%>

<%@page import="Admission.Foundation"%>
<%@page import="Admission.General"%>
<%@page import="Admission.Elective"%>
<%@page import="Admission.Core"%>
<%@page import="Admission.Papers"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page import="Admission.Subject"%>
<%@page import="Admission.Course"%>
<%@page import="Admission.FoundationGroup"%>
<%@page import="Admission.GeneralGroup"%>

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
                                            String paper = request.getParameter("papers");

                                            if (paper.contentEquals("Core")) {
                                                Core core = new Core(con);
                                              
                                                core.setPaperName(request.getParameter("paperName"));
                                                core.setStatus(request.getParameter("status"));
                                                core.setHasExam(request.getParameter("exams"));
                                                core.setCredit(Integer.parseInt(request.getParameter("credit")));
                                               

                                               

                                                    core.insertCorePaper();
                                                    out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                            + "<strong>Success!</strong> " + request.getParameter("paperName") + " Paper added successfully!."
                                                            + "</div>");
                                                
                                            } else if (paper.contentEquals("Elective")) {
                                                Elective elective = new Elective(con);
                                               
                                                elective.setPaperName(request.getParameter("paperName"));
                                                elective.setStatus(request.getParameter("status"));
                                                elective.setHasExam(request.getParameter("exams"));
                                                elective.setCredit(Integer.parseInt(request.getParameter("credit")));
                                                
                                                try {
                                                    elective.insertElectivePaper();
                                                    out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                            + "<strong>Success!</strong> " + request.getParameter("paperName") + " Paper  added successfully!."
                                                            + "</div>");
                                                } catch (SQLException sqlexception) {
                                                    out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                            + "<strong>Invalid!</strong> " + request.getParameter("paperName") + " Paper  already exists!."
                                                            + "</div>");

                                                }
                                            } else if (paper.contains("GeneralPaper")) {
                                                General general = new General(con);
                                              
                                                general.setPaperName(request.getParameter("paperName"));
                                                general.setStatus(request.getParameter("status"));
                                                general.setHasExam(request.getParameter("exams"));
                                                general.setCredit(Integer.parseInt(request.getParameter("credit")));
                                                int generalGroupID = Integer.parseInt(request.getParameter("generalGroup"));
                                               
                                                try {
                                                    general.insertGeneralPaper(generalGroupID);
                                                    out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                            + "<strong>Success!</strong>  " + request.getParameter("paperName") + " Paper  added successfully!."
                                                            + "</div>");
                                                } catch (SQLException sqlexception) {
                                                    out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                            + "<strong>Invalid!</strong> " + request.getParameter("paperName") + " Paper  already exists!."
                                                            + "</div>");

                                                }

                                            } else if (paper.contentEquals("Foundation")) {
                                                Foundation foundation = new Foundation(con);
                                               
                                                foundation.setPaperName(request.getParameter("paperName"));
                                                foundation.setStatus(request.getParameter("status"));
                                                foundation.setHasExam(request.getParameter("exams"));
                                                foundation.setCredit(Integer.parseInt(request.getParameter("credit")));
                                                int foundationGroupID = Integer.parseInt(request.getParameter("foundationGroup"));
                                                
                                                int foundationSubjectID = Integer.parseInt(request.getParameter("foundationSubject"));
                                                try {
                                                    foundation.insertFoundationPaper(foundationGroupID,foundationSubjectID);
                                                    out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                            + "<strong>Success!</strong> " + request.getParameter("paperName") + " paper added successfully!."
                                                            + "</div>");
                                                } catch (SQLException sqlexception) {
                                                    out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                            + "<strong>Invalid!</strong> " + request.getParameter("paperName") + " paper already exists!."
                                                            + "</div>");

                                                }

                                            }

                                        } else if (request.getParameter("updateButton") != null) {
                                            Papers paper = new Papers(con);
                                            paper.setPaperID(Integer.parseInt(request.getParameter("paperID")));
                                            paper.setPaperName(request.getParameter("paperName"));
                                            paper.setStatus(request.getParameter("status"));
                                            paper.setHasExam(request.getParameter("exams"));
                                            paper.setCredit(Integer.parseInt(request.getParameter("credit")));
                                           
                                            try {
                                                paper.updatePapers();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong>  " + request.getParameter("paperName") + " paper updated successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong>  Failed!."
                                                        + "</div>");
                                            }
                                        }

                                    %>
                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">ADD PAPER</h3>
                                            <div class="row">
                                                <div class="col-md-4" id="paperID1">
                                                    <div class="form-group">
                                                        <label for="sel1"> Paper ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" name="paperID" id="paperID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Paper Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Paper Name" name="paperName" id="paperName" required>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1"> Status:</label>
                                                        <select class="form-control" id="status" name="status">


                                                            <option disabled selected value>--select an option--</option>
                                                            <option value="ON" >ON</option>
                                                            <option value="OFF">OFF</option>
                                                        </select>

                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1"> Exams:</label>
                                                        <select class="form-control" name="exams" id="exams">

                                                            <option disabled selected value>--select an option--</option>
                                                            <option value="YES" >YES</option>
                                                            <option value="NO">NO</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1"> Credits:</label>
                                                        <select class="form-control" id="credit" name="credit">
                                                            <option disabled selected value>--select an option--</option>
                                                            <option value="1" >1</option>
                                                            <option value="2">2</option>
                                                            <option value="3" >3</option>
                                                            <option value="4">4</option>

                                                        </select>
                                                    </div>
                                                </div>
                     
                                                <div class="col-md-4">
                                                    <div class="form-group" id="paper">
                                                        <label for="sel1"> Status:</label>
                                                        <select class="form-control" name="papers" id="papers">

                                                            <option disabled selected value>--select an option--</option>
                                                            <option value="Core" >Core</option>
                                                            <option value="Elective">Elective</option>
                                                            <option value="GeneralPaper" >General Paper</option>
                                                            <option value="Foundation">Foundation</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-4" id="generalGroups">
                                                    <div class="form-group">
                                                        <label for="sel1"> General Group:</label>
                                                        <select class="form-control" name="generalGroup" id="generalGroup">

                                                            <option disabled selected value>--select an option--</option>
                                                            <%                                                                GeneralGroup group[] = GeneralGroup.getAllGeneralGroups(con);
                                                                for (int i = 0; i < group.length; i++) {
                                                                    out.println("<option value=" + group[i].getID() + ">" + group[i].getName() + "</option>");
                                                                }

                                                            %>

                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-4" id="foundationGroups">
                                                    <div class="form-group">
                                                        <label for="sel1"> Foundation Group:</label>
                                                        <select class="form-control" name="foundationGroup" id="foundationGroup">

                                                            <option disabled selected value>--select an option--</option>
                                                            <%                                                                FoundationGroup foundationGroup[] = FoundationGroup.getAllFoundationGroups(con);
                                                                for (int i = 0; i < foundationGroup.length; i++) {
                                                                    int foundationID = foundationGroup[i].getID();
                                                                    out.println("<option value=" + foundationID + ">" + foundationGroup[i].getName() + "</option>");
                                                                }

                                                            %>

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-4" id="foundationSubjects">
                                                    <div class="form-group">
                                                        <label for="sel1"> Foundation Subjects:</label>
                                                        <select class="form-control" name="foundationSubject" id="foundationSubject">

                                                            <option disabled selected value>--select an option--</option>
                                                            <%                                                                Subject subject[] = Subject.getAllSubjects(con);
                                                                for (int i = 0; i < subject.length; i++) {
                                                                    int subjectID = subject[i].getSubjectID();
                                                                    out.println("<option value=" + subjectID + ">" + subject[i].getSubjectName() + "</option>");
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
                                                        <h3 class="text-center">PAPER DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Sr. No.</th>
                                                                    <th>Paper Name</th>
                                                                    <th>Status</th>
                                                                    <th>Exams</th>
                                                                    <th>Credits</th>
                                                                    
                                                                    
                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>


                                                                <%                                                                  
                                                                    Papers paper[] = Papers.getAllPapers(con);
                                                                    for (int i = 0; i < paper.length; i++) {
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + paper[i].getPaperID() + "</td>"
                                                                                + "<td>" + paper[i].getPaperName() + "</td>"
                                                                                + "<td>" + paper[i].getStatus() + "</td>"
                                                                                + "<td>" + paper[i].getHasExam() + "</td>"
                                                                                + "<td>" + paper[i].getCredit() + "</td>");
                                                                        out.println("<td><input type='button' class='edit-btn' name='edit' value='edit'</td>");
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
                $(".edit-btn").click(function () {
                    $("#paper").hide();
                    var row = $(this).closest("tr");
                    var paperID = row.find("td:eq(0)").text();
                    var paperName = row.find("td:eq(1)").text();
                    var status = row.find("td:eq(2)").text();
                    var exams = row.find("td:eq(3)").text();
                    var creditID = row.find("td:eq(4)").text();
                    
                    $("#paperID").val(paperID);
                    $("#paperName").val(paperName);
                    $("#status option[value=" + status + "]").prop('selected', true);
                    $("#exams option[value=" + exams + "]").prop('selected', true);
                    $("#credit option[value=" + creditID + "]").prop('selected', true);
                    
                });
                $("#foundationGroups").hide();
                $("#foundationSubjects").hide();
                $("#generalGroups").hide();
                $("#papers").change(function () {
                    var selectedVal = $(this).val();
                    if (selectedVal === "Core") {
                        $("#foundationGroups").hide();
                        $("#foundationSubjects").hide();
                        $("#generalGroups").hide();
                    } else if (selectedVal === "Elective") {
                        $("#foundationGroups").hide();
                        $("#foundationSubjects").hide();
                        $("#generalGroups").hide();
                    } else if (selectedVal === "GeneralPaper") {
                        $("#generalGroups").show();
                    } else if (selectedVal === "Foundation") {
                        $("#foundationGroups").show();
                        $("#foundationSubjects").show();
                        $("#generalGroups").hide();
                    }

                });
                $("#updateButton").hide();
                $("#paperID1").hide();

                $(".edit-btn").click(function () {
                    $("#paperID1").show();
                    $("#insertButton").hide();
                    $("#updateButton").show();
                });
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);

            });
        </script>
          


       
        
        



        

        


    </body>
</html>

