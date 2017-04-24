<%-- 
    Document   : DepartmentPaper
    Created on : 3 Apr, 2017, 12:16:38 PM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Attendance.Department"%>
<%@page import="Attendance.AttendanceAdmin"%>
<%@page import="dbAttendance.DBDepartmentPaper"%>

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
                                            AttendanceAdmin attendanceAdmin=new AttendanceAdmin(con);
                                            DBDepartmentPaper dbdepartmentpaper = new DBDepartmentPaper(
                                                    Integer.parseInt(request.getParameter("department")),
                                            Integer.parseInt(request.getParameter("paper")),
                                            "",
                                            "");
                                            try{
                                            attendanceAdmin.insertDepartmentPaper(dbdepartmentpaper);
                                             out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Department Paper added successfully!."
                                                        + "</div>");
                                        }catch(SQLException sqlexception){
                                            out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Department Paper already exists!."
                                                        + "</div>");
                                        }
                                            
                                            

                                        } else if (request.getParameter("delete") != null) {
                                           AttendanceAdmin attendanceAdmin=new AttendanceAdmin(con);
                                            DBDepartmentPaper dbdepartmentpaper = new DBDepartmentPaper(
                                                    Integer.parseInt(request.getParameter("departmentID")),
                                            Integer.parseInt(request.getParameter("paperID")),
                                            "",
                                            "");
                                            
                                           try{
                                            attendanceAdmin.deleteDepartmentPaper(dbdepartmentpaper);
                                             out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Department Paper added successfully!."
                                                        + "</div>");
                                           }catch(SQLException sqlexception){
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> failed!."
                                                        + "</div>");
                                           }
                                        }
                                    %>

                                    <form action="" method="post">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">LINK DEPARTMENT PAPER</h3>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Department:</label>
                                                        <select class="form-control"  name="department" id="department">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%
                                                                Department department[] = Department.getAllDepartment(con);
                                                                for (int i = 0; i < department.length; i++) {
                                                                    out.println("<option value=" + department[i].getDepartmentID() + ">" + department[i].getName() + "</option>");
                                                                }

                                                            %>
                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Paper:</label>
                                                        <select class="form-control" name="paper" id="paper">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%                                                                Paper paper[] = Paper.getAllPaper(con);
                                                                for (int i = 0; i < paper.length; i++) {
                                                                    out.println("<option value=" + paper[i].getPaperID() + ">" + paper[i].getPaperName() + "</option>");
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
                                                        <h3 class="text-center">DEPARTMENT PAPER DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>

                                                                    <th>Department</th>
                                                                    <th>Paper</th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th>Delete</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                                                  
                                                                    DBDepartmentPaper dbdepartmentpaper[] = AttendanceAdmin.getAllDepartmentPaper(con);
                                                                    for (int j = 0; j < dbdepartmentpaper.length; j++) {
                                                                        out.println("</form>");
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + dbdepartmentpaper[j].departmentName + "</td>"
                                                                                + "<td>" + dbdepartmentpaper[j].papername+ "</td>"
                                                                                + "<td><input type='hidden' name=departmentID value=" + dbdepartmentpaper[j].departmentID + "></td>"
                                                                                + "<td><input type='hidden' name=paperID value=" + dbdepartmentpaper[j].paperID+ "></td>");
                                                                        out.println("<td><button type='sumbit' name='delete' id='deleteBtn' class='delete-btn btn btn-warning col-md-12'><i class='fa fa-trash-o' aria-hidden='true'></i>&nbsp; DELETE</button></td>");
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


