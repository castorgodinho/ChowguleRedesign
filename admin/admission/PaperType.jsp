<%-- 
    Document   : PaperType
    Created on : 27 Mar, 2017, 12:41:11 PM
    Author     : gaurav
--%>

<%@page import="Admission.AdmissionAdmin"%>
<%@page import="dbAdmission.DBPaperType"%>
<%@page import="java.sql.SQLException"%>

<%@page import="Admission.Type"%>
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
                                      
                                            DBPaperType dbPaperType = new DBPaperType(
                                            Integer.parseInt(request.getParameter("type")),
                                            Integer.parseInt(request.getParameter("paper")));
                                          

                                            try{
                                            admissionAdmin.linkDBPaperType(dbPaperType);
                                            out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> Paper Type added successfully!."
                                                        + "</div>");
                                            }catch(SQLException sqlexception){
                                                out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> Paper Type already exists!."
                                                        + "</div>");
                                            }

                                        } else if (request.getParameter("delete") != null) {
                                          
                                          
                                            DBPaperType dbPaperType = new DBPaperType(
                                            Integer.parseInt(request.getParameter("typeID")),
                                            Integer.parseInt(request.getParameter("paperID")));
                                           

                                            
                                            try{
                                            admissionAdmin.deleteDBPaperType(dbPaperType);
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
                                            <h3 class="text-center">LINK PAPER TYPE</h3>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Paper:</label>
                                                        <select class="form-control"  name="paper" id="paper">
                                                            <option  disabled selected value>--select an option--</option>
                                                            <%
                                                                Paper paper[] = Paper.getAllPaper(con);
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
                                                                    out.println("<option value=" + typeID + ">" + type[i].getTypeName() + "</option>");
                                                                }
                                                            %>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="INSERT PAPER TYPE LINK" id="insertButton">

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
                                                                   
                                                                    DBPaperType dbpapertype[] = admissionAdmin.getAllDBPaperType();
                                                                    for (int i = 0; i < dbpapertype.length; i++) {
                                                                        out.println("<form>");
                                                                        out.println("<tr>");
                                                                        out.println("<td>" + dbpapertype[i].paperName + "</td>"
                                                                                + "<td>" + dbpapertype[i].typeName+ "</td>"
                                                                                + "<td><input type='hidden' name='paperID' value=" + dbpapertype[i].paperID+ " ></td>"
                                                                                + "<td><input type='hidden' name='typeID' value=" + dbpapertype[i].typeID + " ></td>");
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

