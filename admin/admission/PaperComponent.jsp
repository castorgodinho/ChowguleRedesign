<%-- 
    Document   : PaperComponent
    Created on : 16 Mar, 2017, 11:29:41 PM
    Author     : gaurav
--%>

<%@page import="Admission.AdmissionAdmin"%>
<%@page import="dbAdmission.DBPaperComponent"%>
<%@page import="Admission.Course"%>

<%@page import="java.sql.SQLException"%>
<%@page import="Admission.Component"%>
<%@page import="Admission.Paper"%>
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
                                            
                                            DBPaperComponent dbpapercomponent = new DBPaperComponent(
                                                    Integer.parseInt(request.getParameter("papers")),
                                                    "",
                                                    Integer.parseInt(request.getParameter("component")),
                                                    "");

                                            try {
                                               admissionAdmin.linkPaperWithComponent(dbpapercomponent);
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Paper Component added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Paper Component already exists!."
                                                        + "</div>");
                                            }

                                        } else if (request.getParameter("delete") != null) {
                                           
                                            DBPaperComponent dbpapercomponent = new DBPaperComponent(
                                                   Integer.parseInt(request.getParameter("paperID")),
                                                    "",
                                                    Integer.parseInt(request.getParameter("componentID")),
                                                    "");
                                            
                                            try {
                                               admissionAdmin.breakDBPaperComponentLink(dbpapercomponent);
                                                out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Paper Component deleted successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> failed!."
                                                        + "</div>");
                                            }
                                        }%>




                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">Link Paper Component</h3>
                                            <div class="row">

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Component:</label>
                                                        <select class="form-control" name="component" id="component">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%                                                                Component component[] = Component.getAllComponent(con);
                                                                for (int i = 0; i < component.length; i++) {

                                                                    int componentID = component[i].getComponentID();
                                                                    out.println("<option value=" + componentID + ">" + component[i].getComponentName() + "</option>");

                                                                }
                                                            %>


                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Paper:</label>
                                                        <select class="form-control" name="papers" id="papers">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%                                                    Paper papers[] = Paper.getAllPaper(con);
                                                                for (int i = 0; i < papers.length; i++) {
                                                                    int paperID = papers[i].getPaperID();

                                                                    out.println("<option value=" + paperID + ">" + papers[i].getPaperName() + "</option>");
                                                                }

                                                            %>


                                                        </select>
                                                    </div>
                                                </div>



                                                <div class="col-md-2">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="SUBMIT" id="insertButton">

                                                </div>

                                            </div>









                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">PAPER COMPONENT DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>

                                                                    <th>Course</th>
                                                                    <th>Subject</th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th>Delete</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>


                                                                <%             
                                                                  
                                                                    DBPaperComponent dbpapercomponent[] = admissionAdmin.getAllComponent();
                                                                    for (int i = 0; i < dbpapercomponent.length; i++) {
                                                                        out.println("<form>");
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + dbpapercomponent[i].paperName + "</td>"
                                                                                + "<td>" + dbpapercomponent[i].componentName + "</td>"
                                                                                + "<td><input type='hidden' name='paperID' value=" + dbpapercomponent[i].paperID + "></td> "
                                                                                + "<td><input type='hidden' name='componentID' value=" + dbpapercomponent[i].componentID + "></td>");
                                                                        out.println("<td><button type='submit' class='delete-btn btn btn-warning col-md-12' name='delete'><i class='fa fa-trash-o' aria-hidden='true'></i>&nbsp; DELETE</button></td>");
                                                                        out.println("</tr>");
                                                                        out.println("</form>");
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
                $("#insertSuccess").fadeOut(3000);
                $("#invalid").fadeOut(3000);
            });



        </script>

    </body>
</html>

