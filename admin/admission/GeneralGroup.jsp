<%-- 
    Document   : GeneralGroup
    Created on : 16 Mar, 2017, 3:14:59 PM
    Author     : gaurav
--%>

<%@page import="Admission.GeneralGroup"%>
<%@page import="java.sql.SQLException"%>
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
                                            GeneralGroup generalgroup = new GeneralGroup(con,
                                                    0,
                                                    request.getParameter("generalGroupName"));

                                            try {

                                                generalgroup.insertGeneralGroup();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("generalGroupName") + " group added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("generalGroupName") + "  group already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("updateButton") != null) {
                                            GeneralGroup generalgroup = new GeneralGroup(con,
                                                    Integer.parseInt(request.getParameter("generalGroupID")),
                                                    request.getParameter("generalGroupName"));
                                           
                                            try {
                                                generalgroup.updateGeneralGroup();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("generalGroupName") + " group updated successfully!."
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
                                            <h3 class="text-center">ADD GENERAL GROUP</h3>
                                            <div class="row">
                                                <div class="col-md-4" id="generalGroupID1">
                                                    <div class="form-group">
                                                        <label for="sel1"> General Group ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" name="generalGroupID" id="generalGroupID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter General Group Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter General Group Name"  name="generalGroupName" id="generalGroupName" required>
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
                                                        <h3 class="text-center">GENERAL GROUP DIRECTORY</h3>
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


                                                                <%                                                                    GeneralGroup generalgroup[] = GeneralGroup.getAllGeneralGroups(con);
                                                                    for (int i = 0; i < generalgroup.length; i++) {
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + generalgroup[i].getGroupID() + "</td>"
                                                                                + "<td>" + generalgroup[i].getGroupName() + "</td>");
                                                                        out.println("<td><button type='button'  class='edit-btn btn btn-warning col-md-6' name='edit'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp; EDIT</button></td>");
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



		<%@ include file="../footer.html"%>
        <script>        

            $(document).ready(function () {
                $("#generalGroupID").hide();
                $("#generalGroupID1").hide();
                $("#updateButton").hide();
                $(".edit-btn").click(function () {
                    $("#updateButton").show();
                    $("#insertButton").hide();
                    $("#generalGroupID").show();
                    $("#generalGroupID1").show();
                    var row = $(this).closest("tr");
                    var generalGroupID = row.find("td:eq(0)").text();
                    var generalGroupName = row.find("td:eq(1)").text();

                    $("#generalGroupID").val(generalGroupID);
                    $("#generalGroupName").val(generalGroupName);
                });
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);

            });

        </script>








    </body>
</html>

