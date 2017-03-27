<%-- 
    Document   : Department
    Created on : 17 Mar, 2017, 2:23:05 PM
    Author     : gaurav
--%>

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
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="../css/datepicker.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
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
                <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container" id="navigation">
                    <div class="logo">
                        <a hef=""><img src="../img/avatar.jpg" alt="profile_pic" class="hidden-xs hidden-sm">
                        </a>
                    </div>
                    <div class="navi">
                        <ul class="nav">
                            <li><a href="dash_index.html"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Home</span></a></li>
                            <li><a href="dash_attendance.html"><i class="fa fa-tasks" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Attendance</span></a></li>
                            <li><a href="#"><i class="fa fa-bar-chart" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Target Setting</span></a></li>
                            <li><a href="assesment.html"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Assesment</span></a></li>
                            <li class="active"><a href="dash_exam.html"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Examination</span></a></li>
                            <li><a href="#"><i class="fa fa-calendar" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Preferences</span></a></li>
                            <li><a href="#"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Setting</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                    <div class="row">
                        <header class="card-style-container">
                            <div class="col-md-7">
                                <nav class="navbar-default pull-left">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                </nav>

                            </div>
                            <div class="col-md-5">
                                <div class="header-rightside">
                                    <ul class="list-inline header-top pull-right">
                                        <li></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="../img/avatar.jpg" alt="user">
                                                <b class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <div class="navbar-content">
                                                        <a href="dash_profile.html" class="">View Profile</a>
                                                        <a href="#" class="">Preferences</a>
                                                        <div class="divider">
                                                        </div>
                                                        <a href="#" class="">LogOut</a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </header>
                    </div>
                    <div class="user-dashboard ">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="">
                                    <form action="" method="">
                                        <div class="col-md-12 card-style attendance-container " >
                                            <h3 class="text-center">ADD DEPARTMENT</h3>
                                            <div class="row">

                                                 <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">DEPARTMENT ID:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="" name="departmentID" id="departmentID" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="sel1">DEPARTMENT NAME:</label>
                                                        <input type="text" Value="" class="form-control pull-right" placeholder="Enter Department Name" name="departmentName" id="departmentName" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="sel1">&nbsp;</label>
                                                    <input type="submit" class="btn btn-warning pull-right btn-block" value="SUBMIT" name="insertButton" id="insertButton">
                                                      <input type="submit" class="btn btn-warning pull-right btn-block" value="UPDATE" name="updateButton" id="updateButton">
                                                </div>

                                            </div>









                                            <div class="attend-scroll">
                                                <table class="table table-bordered " style="margin-top:20px;">
                                                    <thead class="">
                                                        <tr>
                                                            <th colspan="3">
                                                                DEPARTMENT DETAILS
                                                            </th>



                                                        </tr>
                                                    </thead>
                                                    <thead class="thead-inverse">

                                                        <tr>
                                                            <th>DEPARTMENT ID</th>
                                                            <th>DEPARTMENT NAME</th>    
                                                            <th>EDIT</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th>1</th>
                                                            <td> COMPUTER SCIENCE</td>
                                                            <td>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-6">
                                                                        <input type="button" Value="EDIT" class="btn btn-warning btn-block">
                                                                    </div>
                                                                </div>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <th scope="row">2</th>
                                                            <td>ENGLISH</td>


                                                            <td>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-6">
                                                                        <input type="button" Value="EDIT" class="btn btn-warning btn-block">
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">3</th>
                                                            <td>ECONOMICS</td>


                                                            <td>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-6">
                                                                        <input type="button" Value="EDIT" class="btn btn-warning btn-block">
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">4</th>
                                                            <td>CHEMISTRY</td>


                                                            <td>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-6">
                                                                        <input type="button" Value="EDIT" class="btn btn-warning btn-block">
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">5</th>
                                                            <td> MATHS</td>


                                                            <td>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-6">
                                                                        <input type="button" Value="EDIT" class="btn btn-warning btn-block">
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">6</th>
                                                            <td> HINDI</td>


                                                            <td>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-6">
                                                                        <input type="button" Value="EDIT" class="btn btn-warning btn-block">
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">7</th>
                                                            <td> GEOLOGY</td>

                                                            <td>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-6">
                                                                        <input type="button" Value="EDIT" class="btn btn-warning btn-block">
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6">
                                                                <div class="row">
                                                                    <div class="col-md-3 col-md-offset-9">
                                                                        <input type="button" class="btn btn-warning pull-right btn-block " value="SUBMIT">
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>



                                                    </tbody>
                                                </table>

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



        <!-- Modal -->





        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../js/jquery.mCustomScrollbar.js"></script>
        <script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="../js/moment.js"></script>
        <script src="../js/bootstrap-datetimepicker.min.js"></script>
        <script src="../js/bootstrap-datepicker.js"></script>
        <script>
            $(document).ready(function () {


                $('[data-toggle="offcanvas"]').click(function () {
                    $("#navigation").toggleClass("hidden-xs");
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

        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>

