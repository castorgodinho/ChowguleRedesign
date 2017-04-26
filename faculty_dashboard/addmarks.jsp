<%@page import="Attendance.Teacher"%>
<%@page import="dbExam.DBStudentPaperExam"%>
<%@page import="java.sql.SQLException"%>

<%@page import="Exam.Exam"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page import="Admission.Paper"%>
<%@page import="Admission.Student"%>
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
        <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>

        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
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

                                    <%                                       
                                        if (request.getParameter("upload") != null) {
                                            try {

                                                String student1[] = request.getParameterValues("student");

                                                String marks[] = request.getParameterValues("marksObtained");

                                                for (int i = 0; i < student1.length; i++) {
                                                    Teacher teacher = new Teacher(con,
                                                            0);
                                                    DBStudentPaperExam dbstudentpaperexam = new DBStudentPaperExam(Integer.parseInt(student1[i]),
                                                            Integer.parseInt(request.getParameter("paperID")),
                                                            Integer.parseInt(request.getParameter("examID")),
                                                            Integer.parseInt(marks[i]));

                                                    teacher.insertStudentExamMarks(dbstudentpaperexam);
                                                }
                                            } catch (SQLException sqlexception) {
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> failed!."
                                                        + "</div>");
                                            }

                                        }
                                    %>

                                    <div class="col-md-12 card-style attendance-container " >
                                        <h3 class="text-center">ADD MARKS</h3>
                                        <form action="" method="post">
                                            <div class="row"> 
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Academic Year:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Academic Year" name="academicYear" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <div class="form-group">
                                                        <label for="sel1">Select Paper:</label>
                                                        <select class="form-control"  name="paper" id="paper">
                                                            <option disabled selected value>--Select an Option--</option>
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
                                                        <select class="form-control"  name="exam" id="exam">
                                                            <option disabled selected value>--Select an Option--</option>
                                                            <%
                                                                Exam exam[] = Exam.getAllExam(con);
                                                                for (int i = 0; i < exam.length; i++) {
                                                                    out.println("<option value=" + exam[i].getExamID() + ">" + exam[i].getExamName() + "</option>");
                                                                }
                                                            %>

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-2 ">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit" class="btn btn-warning pull-right btn-block"  value="SUBMIT" name="insertButton" >
                                                </div>

                                            </div>
                                        </form>
                                        <form>
                                            <%
                                                    out.println("<input type='hidden' value='" + request.getParameter("academicYear")+ "' name='academicYear' />"
                                                            + "<input type='hidden' value='" + request.getParameter("paper")+ "' name='paperID' />"
                                                            + "<input type='hidden' value='" + request.getParameter("exam")+ "' name='examID' />");
                                                %>
                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">ADD MARKS DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>

                                                                <tr>
                                                                    <th>Student Name</th>
                                                                    <th>Enter Marks</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                    if (request.getParameter("insertButton") != null) {
                                                                        String academicYear = request.getParameter("academicYear");
                                                                        int paperID = Integer.parseInt(request.getParameter("paper"));
                                                                        int examID=Integer.parseInt(request.getParameter("exam"));
                                                                        
                                                                        
                                                                        Teacher teachers = new Teacher(con,
                                                                                0);
                                                                        Student student[] = teachers.getAllStudents(academicYear, paperID);
                                                                        for (int i = 0; i < student.length; i++) {
                                                                            out.println("<tr>");
                                                                            out.println("<td>" + student[i].getFullName() + "</td>"
                                                                                    + "<td><input type='text' name='marksObtained' ></td>"
                                                                                    + "<td><input type='hidden' name='student' value=" + student[i].getStudentID() + "></td>");
                                                                            out.println("</tr>");
                                                                        }
                                                                    }


                                                                %>

                                                            </tbody>
                                                        </table>
                                                        <div class="col-md-12" style="margin-top:20px;margin-bottom:30px;">
                                                            <div class="col-md-3 col-md-offset-9">
                                                                <button type="submit"  name="upload" class="btn btn-warning btn-block">UPLOAD</button>

                                                            </div>

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



        <!-- Modal -->



<%@ include file="footer.html"%>

        <%@ include file="footer.html"%>


    </body>
</html>
