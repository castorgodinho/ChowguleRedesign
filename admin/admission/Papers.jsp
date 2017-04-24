<%-- 
    Document   : Papers
    Created on : 16 Mar, 2017, 2:51:18 PM
    Author     : gaurav
--%>

<%@page import="Admission.Foundation"%>
<%@page import="Admission.General"%>
<%@page import="Admission.Elective"%>
<%@page import="Admission.Core"%>
<%@page import="Admission.Paper"%>
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
                    <%@ include file="../sidebar.jsp"%>
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
                                        

                                        if (request.getParameter("insertButton") != null) {
                                            String paper = request.getParameter("papers");

                                            if (paper.contentEquals("Core")) {
                                                Paper papers = new Paper(con,
                                                        0,
                                                        request.getParameter("paperName"),
                                                        request.getParameter("status"),
                                                        request.getParameter("exams"),
                                                        Integer.parseInt(request.getParameter("credit")));
                                                int paperID = papers.insertPaper();
                                                Core core = new Core(con,
                                                        paperID,
                                                        "",
                                                        "",
                                                        "",
                                                        0);
                                                core.insertCorePaper();

                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("paperName") + " Paper added successfully!."
                                                        + "</div>");

                                            } else if (paper.contentEquals("Elective")) {

                                                Paper papers = new Paper(con,
                                                        0,
                                                        request.getParameter("paperName"),
                                                        request.getParameter("status"),
                                                        request.getParameter("exams"),
                                                        Integer.parseInt(request.getParameter("credit")));
                                                int paperID = papers.insertPaper();
                                                Elective elective = new Elective(con,
                                                        paperID,
                                                        "",
                                                        "",
                                                        "",
                                                        0);

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
                                                Paper papers = new Paper(con,
                                                        0,
                                                        request.getParameter("paperName"),
                                                        request.getParameter("status"),
                                                        request.getParameter("exams"),
                                                        Integer.parseInt(request.getParameter("credit")));
                                                int paperID = papers.insertPaper();
                                                General general = new General(con,
                                                        paperID,
                                                        "",
                                                        "",
                                                        "",
                                                        0,
                                                        Integer.parseInt(request.getParameter("generalGroup")),
                                                        "");

                                                try {
                                                    general.insertGeneralPaper();
                                                    out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                            + "<strong>Success!</strong>  " + request.getParameter("paperName") + " Paper  added successfully!."
                                                            + "</div>");
                                                } catch (SQLException sqlexception) {
                                                    out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                            + "<strong>Invalid!</strong> " + request.getParameter("paperName") + " Paper  already exists!."
                                                            + "</div>");

                                                }

                                            } else if (paper.contentEquals("Foundation")) {
                                                Paper papers = new Paper(con,
                                                        0,
                                                        request.getParameter("paperName"),
                                                        request.getParameter("status"),
                                                        request.getParameter("exams"),
                                                        Integer.parseInt(request.getParameter("credit")));
                                                int paperID = papers.insertPaper();
                                                Foundation foundation = new Foundation(con,
                                                        paperID,
                                                        "",
                                                        "",
                                                        "",
                                                        0,
                                                        Integer.parseInt(request.getParameter("foundationGroup")),
                                                        "");

                                                try {
                                                    foundation.insertFoundationPaper();
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
                                            Paper paper = new Paper(con,
                                                    Integer.parseInt(request.getParameter("paperID")),
                                                    request.getParameter("paperName"),
                                                    request.getParameter("status"),
                                                    request.getParameter("exams"),
                                                    Integer.parseInt(request.getParameter("credit")));

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
                                                                    out.println("<option value=" + group[i].getGroupID() + ">" + group[i].getGroupName() + "</option>");
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
                                                                    int foundationID = foundationGroup[i].getGroupID();
                                                                    out.println("<option value=" + foundationID + ">" + foundationGroup[i].getGroupName() + "</option>");
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


                                                                <%                                                                    Paper paper[] = Paper.getAllPaper(con);
                                                                    for (int i = 0; i < paper.length; i++) {
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + paper[i].getPaperID() + "</td>"
                                                                                + "<td>" + paper[i].getPaperName() + "</td>"
                                                                                + "<td>" + paper[i].getStatus() + "</td>"
                                                                                + "<td>" + paper[i].getHasExam() + "</td>"
                                                                                + "<td>" + paper[i].getCredit() + "</td>");
                                                                        out.println("<td><button type='button' class='edit-btn btn btn-warning col-md-12' name='edit'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp; EDIT</button></td>");
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

<%@ include file="../footer.html"%>
        <script>           

            $(document).ready(function () {
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

                $("#generalGroups").hide();
                $("#papers").change(function () {
                    var selectedVal = $(this).val();
                    if (selectedVal === "Core") {
                        $("#foundationGroups").hide();

                        $("#generalGroups").hide();
                    } else if (selectedVal === "Elective") {
                        $("#foundationGroups").hide();

                        $("#generalGroups").hide();
                    } else if (selectedVal === "GeneralPaper") {
                        $("#generalGroups").show();
                    } else if (selectedVal === "Foundation") {
                        $("#foundationGroups").show();

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

