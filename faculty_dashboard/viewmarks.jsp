<%@page import="dbExam.DBStudentPaperExam"%>
<%@page import="Exam.Exam"%>
<%@page import="Admission.Paper"%>
<%@page import="Attendance.Teacher"%>
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
                    <%@ include file="sidebar.jsp"%>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <%@ include file="header.jsp"%>

                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">
                                    
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">VIEW MARKS</h3>
                                            <form action="" method="post">
                                            <div class="row"> 
                                                <div class="col-md-3 ">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Paper:</label>
                                                        <select class="form-control" name="paper" id="paper">
                                                            <%
                                                              Teacher teacher = new Teacher(con,
                                                                        Integer.parseInt(session.getAttribute("teacherid").toString()));
                                                                Paper paper[] = teacher.getPapers(con);
                                                                for (int i = 0; i < paper.length; i++) {
                                                                    out.println("<option value=" + paper[i].getPaperID() + ">" + paper[i].getPaperName() + "</option>");
                                                                }

                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Exam:</label>
                                                        <select class="form-control" name="exam" id="exam">
                                                            <%                                    Exam exam[] = Exam.getAllExam(con);
                                                                for (int i = 0; i < exam.length; i++) {
                                                                    out.println("<option value=" + exam[i].getExamID() + ">" + exam[i].getExamName() + "</option>");
                                                                }
                                                            %>

                                                        </select>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-2 ">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit" class="btn btn-warning pull-right btn-block" name="insertButton" value="Submit">
                                                </div>

                                            </div>


</form>
                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">VIEW MARKS</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Roll Number</th>
                                                                    <th>Student Name</th>
                                                                    <th>Marks</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <%
                                                                    if (request.getParameter("insertButton") != null) {
                                                                        int paperID = Integer.parseInt(request.getParameter("paper"));
                                                                        int examID = Integer.parseInt(request.getParameter("exam"));
                                                                        
                                                                        Teacher teachers = new Teacher(con,
                                                                        Integer.parseInt(session.getAttribute("teacherid").toString()));
                                                                        DBStudentPaperExam dbStudentPaperExam[] = teachers.getStudentPaperMarks(paperID, examID);
                                                                        for (int i = 0; i < dbStudentPaperExam.length; i++) {
                                                                            out.println("<tr>");
                                                                            out.println("<td>" + dbStudentPaperExam[i].rollNumber + "</td>"
                                                                                    + "<td>" + dbStudentPaperExam[i].studentName + "</td>"
                                                                                    + "<td>" + dbStudentPaperExam[i].paperName + "</td>"
                                                                                    + "<td>" + dbStudentPaperExam[i].examName + "</td>"
                                                                                    + "<td>"+dbStudentPaperExam[i].marksObtained+"</td>");
                                                                            out.println("</tr>");
                                                                        }

                                                                    }
                                                                %>
                                                               
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@ include file="footer.html"%>
    </body>
</html>
