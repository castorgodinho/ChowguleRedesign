<%-- 
    Document   : FoundationGroup
    Created on : 16 Mar, 2017, 3:37:25 PM
    Author     : gaurav
--%>

<%@page import="Admission.FGroup"%>
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

                                            FoundationGroup foundationgroup = new FoundationGroup(con,
                                                    0,
                                                    request.getParameter("foundationGroupName"),
                                                    Integer.parseInt(request.getParameter("fgroup")),
                                                    "");

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
                                        }
                                        else if (request.getParameter("updateButton") != null) {
                                           
                                            FoundationGroup foundationgroup = new FoundationGroup(con,
                                                   Integer.parseInt(request.getParameter("foundationGroupID")) ,
                                                    request.getParameter("foundationGroupName"),
                                                    Integer.parseInt(request.getParameter("fgroup")),
                                            "");
                                           
                                            try {
                                                foundationgroup.updateFoundationGroup();
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
                                                <div class="col-md-3" id="foundationGroupID1">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Foundation Group ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder=""  id="foundationGroupID" name="foundationGroupID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Foundation Group Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Foundation Group Name" id="foundationGroupName" name="foundationGroupName" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter F Group:</label>
                                                        <select class="form-control" name="fgroup" id="fgroup">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <%
                                                                FGroup fgroup[] = FGroup.getAllFGroups(con);
                                                                for (int i = 0; i < fgroup.length; i++) {
                                                                    out.println("<option value=" + fgroup[i].getId() + ">" + fgroup[i].getName() + "</option>");
                                                                }

                                                            %>
                                                        </select>
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
                                                                <%                                                                    FoundationGroup foundationGroup[] = FoundationGroup.getAllFoundationGroups(con);
                                                                    for (int i = 0; i < foundationGroup.length; i++) {

                                                                        out.println("<tr>");
                                                                        out.println("<td>" + foundationGroup[i].getGroupID() + "</td>"
                                                                                + "<td>" + foundationGroup[i].getGroupName() + "</td>"
                                                                                + "<td>" + foundationGroup[i].getFgName() + "</td>"
                                                                                + "<td style='display:none;'>"+foundationGroup[i].getFgpoupID()+"</td>");
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

			<%@ include file="../footer.html"%>
        <script>
            
            $(document).ready(function () {
                
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
                    var fgroupID = row.find("td:eq(3)").text();
                    alert(fgroupID)

                    $("#foundationGroupID").val(foundationGroupID);
                    $("#foundationGroupName").val(foundationGroupName);
                    $("#fgroup option[value='" + fgroupID + "']").prop('selected', true);

                });

            });

        </script>
    </body>
</html>

