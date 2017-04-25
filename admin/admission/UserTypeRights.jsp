<%-- 

    Document   : UserRights
    Created on : 19 Apr, 2017, 3:15:48 PM
    Author     : gaurav
--%>

<%@page import="dbAdmission.DBUserTypeRights"%>
<%@page import="Admission.UserType"%>
<%@page import="Admission.AdmissionAdmin"%>


<%@page import="Admission.Rights"%>
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
                <div class="col-md-2  hidden-xs display-table-cell v-align box card-style-container" id="navigation">
                    <%@ include file="../sidebar.jsp"%>
                </div>
                <div class="col-md-10 col-sm-12 display-table-cell v-align">
                    <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                    <%@ include file="../header.html"%>
                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">
                                    <div class="col-md-12">
                                        <%

                                            Database db = new Database();
                                            

                                            if (request.getParameter("insertButton") != null) {
                                              
                                                String rights[] = request.getParameterValues("rights");
                                                for (int i = 0; i < rights.length; i++) {
                                                    DBUserTypeRights dbUserTypeRights = new DBUserTypeRights(
                                                            Integer.parseInt(request.getParameter("userType")),
                                                            Integer.parseInt(rights[i]),
                                                            "",
                                                            "");
                                                    admissionAdmin.insertUserTypeRights(dbUserTypeRights);

                                                }

                                            } else if (request.getParameter("delete") != null) {
                                                 
                                                int rightID=Integer.parseInt(request.getParameter("rightID"));
                                                admissionAdmin.deleteUserTypeRights(rightID);
                                            }


                                        %>

                                        <form action="" method="post">
                                            <div class="col-md-12 card-style attendance-container " >
                                                <h3 class="text-center">ADD PAGE URL</h3>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label for="sel1">Enter User Type:</label>
                                                            <select class="form-control" name="userType" id="userType">
                                                                <option disabled selected value>--Select an Option--</option>
                                                                <%                                                              
                                                                    UserType userType[] = UserType.getAllUserType(con);
                                                                    for (int i = 0; i < userType.length; i++) {
                                                                        out.println("<option value=" + userType[i].getUserTypeid() + ">" + userType[i].getUserTypeName() + "</option>");
                                                                    }


                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>   

                                                    <div class="col-md-3">
                                                        <div class="form-group">

                                                            <%                                                             
                                                                Rights right[] = Rights.getAllRights(con);
                                                                for (int i = 0; i < right.length; i++) {
                                                                    int rightID = right[i].getRightID();

                                                                    out.println("<input type='checkbox' value=" + rightID + "  name='rights' >" + right[i].getName() + "<br>");
                                                                }


                                                            %>

                                                        </div>
                                                    </div> 



                                                    <div class="col-md-3">
                                                        <label for="sel1">&nbsp;</label>
                                                        <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="SUBMIT" id="insertButton">


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
                                                                        <th>Page Url</th>

                                                                        <th>Delete</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>


                                                                    <%                                                                 
                                                  
                                                                        DBUserTypeRights dbUserTypeRights[] = admissionAdmin.getAllUserTypeRights();
                                                                        for (int i = 0; i < dbUserTypeRights.length; i++) {
                                                                            out.println("<tr>");
                                                                            out.println("<td>" + dbUserTypeRights[i].userTypeName + "</td>"
                                                                                    + "<td>" + dbUserTypeRights[i].rightName + "</td>"
                                                                                    + "<td style='display:none;'><input type='hidden' name='rightID' value=" + dbUserTypeRights[i].rightID + "></td>");
                                                                            out.println("<td><button type='sumbit' name='delete' id='deleteBtn' class='delete-btn btn btn-warning col-md-6'><i class='fa fa-trash-o' aria-hidden='true'></i>&nbsp; DELETE</button></td>");
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
        </div>
<%@ include file="../footer.html"%>
        <script>
           
            $(document).ready(function () {
               
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);


            });
        </script>
    </body>
</html>


