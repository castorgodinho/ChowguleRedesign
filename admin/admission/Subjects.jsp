<%-- 
    Document   : Subjects
    Created on : 16 Mar, 2017, 10:17:34 AM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Admission.Subject"%>
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

                                            Subject subject = new Subject(con,
                                                    0,
                                                    request.getParameter("subjectName"),
                                                    request.getParameter("Status"),
                                                    request.getParameter("language"));

                                            try {
                                                subject.insertSubject();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("subjectName") + " Subject added successfully!."
                                                        + "</div>");

                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("subjectName") + " Subject already exists!."
                                                        + "</div>");
                                            }

                                        } else if (request.getParameter("updateButton") != null) {
                                            Subject subject = new Subject(con,
                                                    Integer.parseInt(request.getParameter("subjectID")),
                                                    request.getParameter("subjectName"),
                                                    request.getParameter("Status"),
                                                    request.getParameter("language"));
                                           
                                            try {
                                                subject.updateSubject();
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("subjectName") + " Subject updated successfully!."
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
                                            <h3 class="text-center">ADD SUBJECT</h3>
                                            <div class="row">
                                                <div class="col-md-3" id="subjectID1">
                                                    <div class="form-group">
                                                        <label for="sel1"> Subject ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" name="subjectID" id="subjectID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Subject Name:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Subject" name="subjectName" id="subjectName" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Status:</label>
                                                        <select class="form-control" name="Status" id="status">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <option value="ON">ON</option>
                                                            <option value="OFF">OFF</option>

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Language:</label>
                                                        <select class="form-control" name="language" id="language">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <option value="YES">YES</option>
                                                            <option value="NO">NO</option>

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="SUBMIT" id="insertButton">
                                                    <input type="submit"  name="updateButton" class="btn btn-warning pull-right btn-block" value="UPDATE" id="updateButton">
                                                </div>

                                            </div>

                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">SUBJECT DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Sr. No.</th>
                                                                    <th>Subject Name</th>
                                                                    <th>Status</th>
                                                                    <th>Language</th>
                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                    Subject subject[] = Subject.getAllSubjects(con);
                                                                    for (int i = 0; i < subject.length; i++) {
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + subject[i].getSubjectID() + "</td>"
                                                                                + "<td>" + subject[i].getSubjectName() + "</td>"
                                                                                + "<td>" + subject[i].getStatus() + "</td>"
                                                                                + "<td>" + subject[i].getIsLanguage() + "</td>");
                                                                        out.println("<td><button type='button' class='edit-btn btn btn-warning col-md-6' name='edit'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>&nbsp;EDIT</button></td>");
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

                $("#subjectID1").hide();
                $("#updateButton").hide();
                $(".edit-btn").click(function () {
                    $("#subjectID1").show();
                    $("#updateButton").show();
                    $("#insertButton").hide();
                });
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);
                $(".edit-btn").click(function () {
                    var row = $(this).closest("tr");
                    var subjectID = row.find("td:eq(0)").text();
                    var subjectName = row.find("td:eq(1)").text();
                    var subjectStatus = row.find("td:eq(2)").text();
                    var subIsALanguage = row.find("td:eq(3)").text();
                    $("#subjectID").val(subjectID);
                    $("#subjectName").val(subjectName);
                    $("#status option[value='" + subjectStatus + "']").prop('selected', true);
                    $("#language option[value='" + subIsALanguage + "']").prop('selected', true);
                });

            });
        </script>   
    </body>
</html>
