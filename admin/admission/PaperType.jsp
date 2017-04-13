<%-- 
    Document   : PaperType
    Created on : 27 Mar, 2017, 12:41:11 PM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Admission.PaperType"%>
<%@page import="Admission.Type"%>
<%@page import="Admission.Papers"%>
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
                                            Papers paper = new Papers(con);
                                            Type type = new Type(con);
                                            PaperType papertype = new PaperType(con);

                                            paper.setPaperID(Integer.parseInt(request.getParameter("paper")));
                                            type.setTypeID(Integer.parseInt(request.getParameter("type")));
                                            papertype.setPaper(paper);
                                            papertype.setType(type);
                                            try{
                                            papertype.insertPaperType();
                                            out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Paper Type added successfully!."
                                                        + "</div>");
                                            }catch(SQLException sqlexception){
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Paper Type already exists!."
                                                        + "</div>");
                                            }

                                        } else if (request.getParameter("delete") != null) {
                                            Papers paper = new Papers(con);
                                            Type type = new Type(con);
                                            PaperType papertype = new PaperType(con);

                                            paper.setPaperID(Integer.parseInt(request.getParameter("paperID")));
                                            type.setTypeID(Integer.parseInt(request.getParameter("typeID")));
                                            papertype.setPaper(paper);
                                            papertype.setType(type);
                                            try{
                                            papertype.deletePaperType();
                                            out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Paper Type deleted successfully!."
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
                                            <h3 class="text-center">Link Paper Type</h3>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Paper:</label>
                                                        <select class="form-control"  name="paper" id="paper">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%
                                                                Papers paper[] = Papers.getAllPapers(con);
                                                                for (int i = 0; i < paper.length; i++) {
                                                                    int paperID = paper[i].getPaperID();

                                                                    out.println("<option value=" + paperID + ">" + paper[i].getPaperName() + "</option>");
                                                                }


                                                            %>
                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Type:</label>
                                                        <select class="form-control" name="type" id="type">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%                                                                Type type[] = Type.getAllType(con);
                                                                for (int i = 0; i < type.length; i++) {
                                                                    int typeID = type[i].getTypeID();
                                                                    out.println("<option value=" + typeID + ">" + type[i].getName() + "</option>");
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
                                                        <h3 class="text-center">PAPER TYPE DIRECTORY</h3>
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
                                                                    PaperType papertype[] = PaperType.getAllPaperType(con);
                                                                    for (int i = 0; i < papertype.length; i++) {
                                                                        out.println("<form>");
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + papertype[i].getPaper().getPaperName() + "</td>"
                                                                                + "<td>" + papertype[i].getType().getName() + "</td>"
                                                                                + "<td><input type='hidden' name='paperID' value=" + papertype[i].getPaper().getPaperID() + " ></td>"
                                                                                + "<td><input type='hidden' name='typeID' value=" + papertype[i].getType().getTypeID() + " ></td>");
                                                                        out.println("<td><input type='submit'  name='delete' id='deleteBtn' class='delete-btn' value='Delete'/></td>");
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

