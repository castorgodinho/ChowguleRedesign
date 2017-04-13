<%-- 
    Document   : Compatible
    Created on : 17 Mar, 2017, 12:11:34 AM
    Author     : gaurav
--%>

<%@page import="Admission.Compitable" %>
<%@page import="java.sql.SQLException" %>
<%@page import="Admission.Subject" %>
<%@page import="java.sql.Connection" %>
<%@page import="Admission.Database" %>
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
                                            Compitable compitable = new Compitable(con);

                                            Subject subject1 = new Subject(con);

                                            subject1.setSubjectID(Integer.parseInt(request.getParameter("major")));
                                            compitable.setSubject1(subject1);
                                            Subject subject2 = new Subject(con);
                                            subject2.setSubjectID(Integer.parseInt(request.getParameter("minor")));
                                            compitable.setSubject2(subject2);
                                            try {
                                                compitable.insertCompatible();
                                                out.println("<div class=\"alert alert-success \"  id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong>  compatible added successfully!."
                                                        + "</div>");
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong>  compatible already exists!."
                                                        + "</div>");

                                            }
                                        }


                                    %>
                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center"> COMPATIBLE</h3>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Subject:</label>

                                                        <select class="form-control" id="major" name="major" required>
                                                            <option disabled selected value> -- select an option -- </option>

                                                            <%                                                    Subject subject[] = Subject.getAllSubjects(con);
                                                                for (int i = 0; i < subject.length; i++) {
                                                                    int subjectid = subject[i].getSubjectID();
                                                                    out.println("<option value=" + subjectid + ">" + subject[i].getSubjectName() + "</option>");

                                                                }


                                                            %>
                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1"> Subject:</label>
                                                        <%                                                            Subject subjects[] = Subject.getAllSubjects(con);
                                                            for (int i = 0; i < subjects.length; i++) {
                                                                int subjectid = subjects[i].getSubjectID();
                                                                out.println("<div class='checkbox'>"
                                                                        + "<label><input type='checkbox' value=" + subjectid + "  name='minor'>" + subjects[i].getSubjectName() + "</label> "
                                                                        + "</div>");
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
                                                        <h3 class="text-center">COMPATIBLE DIRECTORY</h3>
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

        <!-- Modal -->
	




        

         
        


    </body>
</html>


