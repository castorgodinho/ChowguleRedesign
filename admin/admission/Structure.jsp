<%-- 
    Document   : Structure
    Created on : 16 Mar, 2017, 3:53:21 PM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Admission.Structure"%>
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

                                            Structure structure = new Structure(con);
                                            String structureName = request.getParameter("structureName");
                                            structure.setStructureName(structureName);
                                            structure.setStatus(request.getParameter("status"));
                                            try {
                                                structure.insertStructure();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("structureName") + " structure added successfully!."
                                                        + "</div>");

                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("structureName") + " structure already exists!."
                                                        + "</div>");
                                            }
                                        } else if (request.getParameter("updateButton") != null) {
                                            Structure structure = new Structure(con);
                                            structure.setStructureID(Integer.parseInt(request.getParameter("structureID")));
                                            structure.setStructureName(request.getParameter("structureName"));
                                            structure.setStatus(request.getParameter("status"));
                                            try {
                                                structure.updateStructure();
                                                out.println("<div class=\"alert alert-success\" id=\"updateSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("structureName") + " structure updated successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> failed!."
                                                        + "</div>");
                                            }
                                        }
                                    %>
                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">ADD STRUCTURE</h3>
                                            <div class="row">
                                                <div class="col-md-3" id="structureID1">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Structure ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" id="structureID" name="structureID">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Structure Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Structure Name" name="structureName" id="structureName" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1"> Status:</label>
                                                        <select class="form-control"  name="status" id="status">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <option value="ON" >ON</option>
                                                            <option value="OFF" >OFF</option>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit" class="btn btn-warning pull-right btn-block" value="SUBMIT" name="insertButton" id="insertButton">
                                                    <input type="submit" class="btn btn-warning pull-right btn-block" value="UPDATE" name="updateButton" id="updateButton">
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
                                                                    <th>Structure Name</th>
                                                                    <th>Status</th>
                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                                                    Structure structure[] = Structure.getAllStructure(con);
                                                                    for (int i = 0; i < structure.length; i++) {
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + structure[i].getStructureID() + "</td>"
                                                                                + "<td>" + structure[i].getStructureName() + "</td>"
                                                                                + "<td>" + structure[i].getStatus() + "</td>");
                                                                        out.println("<td><button type='button' name='edit' class='edit-btn btn btn-warning col-md-6'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp;EDIT</button></td>");
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
                $("#updateButton").hide();
                $("#structureID1").hide();
                $(".edit-btn").click(function () {
                    $("#insertButton").hide();
                    $("#updateButton").show();
                    $("#structureID1").show();
                    var row = $(this).closest("tr");
                    var structureID = row.find("td:eq(0)").text();
                    var structureName = row.find("td:eq(1)").text();
                    var structureStatus = row.find("td:eq(2)").text();
                    $("#structureID").val(structureID);
                    $("#structureName").val(structureName);
                    $("#status option[value='" + structureStatus + "']").prop('selected', true);
                });

            });
        </script>
         
    </body>
</html>

