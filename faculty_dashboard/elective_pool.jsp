<%@page import="Admission.Paper"%>
<%@page import="Admission.Elective"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<%@page import="Admission.Subject"%>
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
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
              rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
        <link href="<%=request.getContextPath()%>/css/font-awesome.css"
              rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
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
                    id="navigation"><%@ include file="sidebar.html"%>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align"><%@ include
                        file="header.html"%>
                        <div class="user-dashboard ">
                            <div class="container-fluid">

                                <div class="row">
                                    <div class="col-md-12 card-style">
                                        <h3 class="text-center">SECOND YEAR ADMISSION</h3>

                                        <%
                                            Database database = new Database();
                                            Connection con = database.openConnection();
                                            if(request.getParameter("insertButton")!=null){
                                                // String paper[]=request.getParameterValues("paper");
                                                Paper papers=new Paper(con,
                                                Integer.parseInt(request.getParameter("paper")),
                                                request.getParameter("papername"),
                                                "OFF",
                                                request.getParameter("hasExam"),
                                                Integer.parseInt(request.getParameter("credit")));
                                               
                                                
                                                    papers.updatePapers();
                                                
                                            }
                                        %>
                                        <div class="row">
                                            <form>
                                                <div class="col-md-12">
                                                    <h3 class="">SELECT ELECTIVE POOL</h3>


                                                    <%
                                                        int subjectid = 11;
                                                        Subject subject = new Subject(con,
                                                                subjectid,
                                                                "",
                                                                "",
                                                                "");
                                                        Elective elective[] = subject.getElectivePaper(1);

                                                        for (int i = 0; i < elective.length; i++) {
                                                            out.println("<input type='hidden' name='papername' value="+elective[i].getPaperName()+">" 
                                                                    + "<input type='hidden' name='hasExam' value="+elective[i].getHasExam()+"> "
                                                                    + "<input type='hidden' name='credit' value="+elective[i].getCredit()+"> ");                       
                                                            out.println("<div class='checkbox'>");
                                                            out.println("<label style='font-size: 1em'>");
                                                            out.println("<input type='checkbox' name='paper' value=" + elective[i].getPaperID() + " ><span class='cr'><i class='cr-icon fa fa-check'></i>"
                                                                    
                                                                 
                                                                    + "</span>" + elective[i].getPaperName() + "</label>");
                                                                                             }


                                                    %>


                                                </div>    
                                                       <div class="col-md-3" style="margin-bottom:10px;">
                                            <label for="sel1">&nbsp;</label>
                                            <input type="submit" class="btn btn-warning pull-right btn-block" value="SUBMIT" name="insertButton" id="insertButton">
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
        </div>
        <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
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
            $('.form_date').datetimepicker({
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
            $('.form_time').datetimepicker({
                language: 'fr',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 1,
                minView: 0,
                maxView: 1,
                forceParse: 0,
                showMeridian: 1

            });
        </script>


    </body>
</html>
