<%-- 
    Document   : Rights
    Created on : 19 Apr, 2017, 11:48:51 AM
    Author     : gaurav
--%>

<%@page import="java.sql.SQLException"%>
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
                    <%@ include file="../header.jsp"%>
                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">

                                                <div class="col-md-12">
                                                <%

                                        Database db = new Database();
                                      

                                        if (request.getParameter("insertButton") != null) {
                                            Rights rights=new Rights(con,
                                            0,
                                            request.getParameter("rightName"));
                                            try{
                                            rights.insertRights();
                                            out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("rightName") + " rights added successfully!."
                                                        + "</div>");
                                            }catch(SQLException sqlexception){
                                                  out.println("<div class=\"alert alert-danger\" id=\"invalid\">"
                                                        + "<strong>Invalid!</strong> " + request.getParameter("rightName") + " rights already exists!."
                                                        + "</div>");
                                            }

                                           

                                        } else if (request.getParameter("updateButton") != null) {
                                             Rights rights=new Rights(con,
                                            Integer.parseInt(request.getParameter("rightID")),
                                            request.getParameter("rightName"));
                                             try{
                                             rights.updateRights();
                                              out.println("<div class=\"alert alert-success\" id=\"insertSuccess\">"
                                                        + "<strong>Success!</strong> " + request.getParameter("rightName") + " rights updated successfully!."
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
                                            <h3 class="text-center">ADD RIGHTS</h3>
                                            <div class="row">
                                                <div class="col-md-4" id="groupidtext3">
                                                    <div class="form-group">
                                                        <label for="sel1"> Rights ID:</label>
                                                        <input type="text"   class="form-control pull-right" placeholder="Enter Right ID" name="rightID" id="rightID" readonly>
                                                    </div>
                                                </div>  

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="sel1">Enter Rights Name:</label>
                                                        <input type="text"   class="form-control pull-right" placeholder="Enter Right Name" name="rightName" id="rightName" required>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-3">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit"  name="insertButton" class="btn btn-warning pull-right btn-block" value="INSERT RIGHTS" id="insertButton">
                                                    <input type="submit"  name="updateButton" class="btn btn-warning pull-right btn-block" value="UPDATE RIGHTS" id="updateButton">

                                                </div>

                                            </div>
                                            <div class="attend-scroll">
                                                <div class="col-md-12">
                                                    <div class="panel panel-success">
                                                        <h3 class="text-center">RIGHTS DIRECTORY</h3>
                                                        <div class="panel-body">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover" id="task-table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Sr. No.</th>
                                                                    <th>Right Name</th>
                                                            
                                                                    <th>Edit</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>


                                                                <%        
                                                                      Rights right[]=Rights.getAllRights(con);
                                                                      for(int i=0;i<right.length;i++){
                                                                          out.println("<tr>");
                                                                          out.println("<td>"+right[i].getRightID()+"</td>"
                                                                                  + "<td>"+right[i].getName()+"</td>");
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
        </div>

                            <%@ include file="../footer.html"%>                         
                                                           
                            <script>

            $(document).ready(function () {

                $("#updateButton").hide();
                $("#groupidtext3").hide();

                $(".edit-btn").click(function () {
                    $("#groupidtext3").show();
                    $("#insertButton").hide();
                    $("#updateButton").show();
                });
                $("#invalid").fadeOut(3000);
                $("#insertSuccess").fadeOut(3000);
                $("#updateSuccess").fadeOut(3000);
                $(".edit-btn").click(function () {
                    var row = $(this).closest("tr");
                    var rightID = row.find("td:eq(0)").text();
                    var rightName = row.find("td:eq(1)").text();
                    

                    $("#rightID").val(rightID);
                    $("#rightName").val(rightName);
                    
                });

            });
        </script>
    </body>
</html>

