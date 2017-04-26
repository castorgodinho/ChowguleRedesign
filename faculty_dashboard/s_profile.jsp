<%@page import="Admission.PreviousEducation"%>
<%@page import="Admission.ParentGaurdian"%>
<%@page import="Admission.ContactInfo"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page import="Admission.Student"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <link rel="icon" href="<%=request.getContextPath()%>/img/favicon.png" type="image/gif">
        <title>Parvatibai Chowgule College</title>
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
              rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
        <link href="<%=request.getContextPath()%>/css/font-awesome.css"
              rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
    </head>
    <body>
    <body class="home">
        <div class="display-table">
            <div class="row display-table-row">
                <div
                    class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container"
                    id="navigation"><%@ include file="sidebar.jsp"%>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align"><%@ include
                        file="header.html"%>
                        <div class="user-dashboard ">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class=""><!--div class="col-md-12 card-style">
                                                          <h4 class="text-center"> Attendance</h4>
                                                          <div id="bar-example" style="height: 250px;"></div>
                                                        </div-->
                                        <div class="col-md-12 card-style attendance-container ">
                                            <h3 class="text-center">PROFILE</h3>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <table class="table  table-bordered">
                                                        <tbody>
                                                            <%
                                                                Database database = new Database();
                                                                Connection con = database.openConnection();
                                                                Student student = new Student(con,
                                                                       Integer.parseInt(session.getAttribute("userid").toString()));
                                                                Student students = student.getStudent(con);
                                                                out.println("<tr>");
                                                                out.println("<td colspan='2'>"
                                                                        + "<h3>" + students.getFullName() + "</h3>"
                                                                        + "<h4>" + students.getRollNumber() + "</h4>"
                                                                        + "</td>");
                                                                out.println("</tr>");

                                                                out.println("<tr>");
                                                                out.println("<td>Date of Birth</td>"
                                                                            + "<td>" + students.getDateOfBirth() + "</td>");
                                                                out.println("</tr>");

                                                                out.println("<tr>");
                                                                out.println("<td>Place Of Birth</td>"
                                                                        + "<td>" + students.getPlaceOfBirth() + "</td>");
                                                                out.println("</tr>");
                                                                
                                                                out.println("<tr>");
                                                                out.println("<td>Gender</td>"
                                                                        + "<td>" + students.getGender() + "</td>");
                                                                out.println("</tr>");
                                                                
                                                                out.println("<tr>");
                                                                out.println("<td>Blood Group</td>"
                                                                        + "<td>" + students.getBloodGroup() + "</td>");
                                                                out.println("</tr>");
                                                                
                                                                out.println("<tr>");
                                                                out.println("<td>Nationality</td>"
                                                                        + "<td>" + students.getNationality() + "</td>");
                                                                out.println("</tr>");
                                                                
                                                                out.println("<tr>");
                                                                out.println("<td>Religion</td>"
                                                                        + "<td>" + students.getReligion() + "</td>");
                                                                out.println("</tr>");

                                                                out.println("<tr>");
                                                                out.println("<td>category</td>"
                                                                        + "<td>" + students.getCategory() + "</td>");
                                                                out.println("</tr>");

                                                                out.println("<tr>");
                                                                out.println("<td>Martial Status</td>"
                                                                        + "<td>" + students.getMartialstatus() + "</td>");
                                                                out.println("</tr>");

                                                                out.println("<tr>");
                                                                out.println("<td>physicalychallenged</td>"
                                                                        + "<td>" + students.getPhysicalychallenged() + "</td>");
                                                                out.println("</tr>");


                                                            %>


                                                            <%                                                          
                                                                ContactInfo contactinfo = students.getContactInfos(con);
                                                                out.println("<tr>");
                                                                out.println("<td>Email ID:</td>"
                                                                        + "<td>:" + contactinfo.getEmailID() + "</td>");
                                                                out.println("</tr>");

                                                                out.println("<tr>");
                                                                out.println("<td>phone:</td>"
                                                                        + "<td>:" + contactinfo.getContactno() + "</td>");
                                                                out.println("</tr>");

                                                                out.println("<tr>");
                                                                out.println("<td>University Registration Number:</td>"
                                                                        + "<td>:" + students.getUniversitynumber() + "</td>");
                                                                out.println("</tr>");

                                                                out.println("<tr>");
                                                                out.println("<td>Address:</td>"
                                                                        + "<td>:" + contactinfo.getAddress() + "</td>");
                                                                out.println("</tr>");
                                                            %>


                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-md-12">
                                                    <table class="table  table-bordered">
                                                        <tbody>

                                                            <tr>
                                                                <th colspan="2" class="">
                                                                    <h4 class="text-center">PARENT DETAILS</h4>
                                                                </th>

                                                            </tr>

                                                            <%
                                                                ParentGaurdian parentGaurdian[] = students.getParentGaurdian();
                                                                for (int i = 0; i < parentGaurdian.length; i++) {
                                                                    out.println("<tr>");
                                                                    out.println("<td>Type:</td>"
                                                                            + "<td>" + parentGaurdian[i].getType() + "</td>");
                                                                    out.println("</tr>");

                                                                    out.println("<tr>");
                                                                    out.println("<td>" + parentGaurdian[i].getType() + " Name:</td>"
                                                                            + "<td>" + parentGaurdian[i].getFullName() + "</td>");
                                                                    out.println("</tr>");
                                                                    out.println("<tr>");
                                                                    out.println("<td>Occupation:</td>"
                                                                            + "<td>" + parentGaurdian[i].getOccupation() + "</td>");
                                                                    out.println("</tr>");
                                                                    out.println("<tr>");
                                                                    out.println("<td>Contact Number:</td>"
                                                                            + "<td>" + parentGaurdian[i].getContactNumber() + "</td>");
                                                                    out.println("</tr>");
                                                                }


                                                            %>



                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-md-12">
                                                    <table class="table  table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <th colspan="2">
                                                                    <h4 class="text-center">EDUCATIONAL BACKGROUND</h4>
                                                                </th>

                                                            </tr>
                                                            
                                                            <%
                                                            PreviousEducation previousEducation[]=students.getPreviousEducation();
                                                                    for(int i=0;i<previousEducation.length;i++){
                                                                        out.println("<tr>");
                                                                        out.println("<td>"+previousEducation[i].getStream()+"</td>"
                                                                        + "<td>"+previousEducation[i].getNameOfSchool()+"</td>");
                                                                        out.println("</tr>");
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
            <%@ include file="footer.html"%>
            <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
            <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('[data-toggle="offcanvas"]').click(function () {
                        $("#navigation").toggleClass("hidden-xs");
                    });
                    $('.nav-dropdown-1').hide();
                    $('.nav-dropdown-2').hide();
                    $('.nav-dropdown-link-1').click(function () {
                        $('.nav-dropdown-1').slideToggle();

                    });
                    $('.nav-dropdown-link-2').click(function () {
                        $('.nav-dropdown-2').slideToggle();

                    });
                });
            </script>

        </body>
    </html>
