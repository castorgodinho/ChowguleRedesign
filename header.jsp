<%-- 
    Document   : header
    Created on : 24 Apr, 2017, 12:00:47 AM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div class="pcc-loader">
    <img src="<%=request.getContextPath()%>/img/spcc.png" class="load-img">
    <div class="loader loader-default is-active"></div>
  </div>


  <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
      <div class="loginmodal-container">
        <h1>User Login</h1><br>
        
        <form method="post"  action="<%=request.getContextPath()%>/admin/Loginprocess.jsp">
          <div class="form-group">
            <label>Email ID</label>
            <input type="text" class="form-control" name="username"  placeholder="Enter your Email">
          </div>
          <div class="form-group">
            <label>Password</label>
            <input type="password" class="form-control" name="password" placeholder="Password">
          </div>
          <input type="submit" name="login" class="btn btn-warning" value="Login" >
        </form>

      </div>
    </div>
  </div>
  <div class="navbar-fixed-top">
  <div class="navbar navbar-default" role="navigation" id="slide-nav">
 <img src="<%=request.getContextPath()%>/img/flag_logo-1.png" id="imgtab" class="header-logo img-responsive hidden-xs hidden-sm">
     <nav class="navbar-one">
    <div class="col-md-6 col-sm-6 col-xs-6 hidden-lg hidden-md rmv-padding-col">
    <a href="<%=request.getContextPath()%>/app.jsp" class="btn btn-login btn-block" role="button"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp; APP STORE</a>
    </div>
    <div class="col-md-6 col-sm-6 col-xs-6 hidden-lg hidden-md rmv-padding-col">
    <a href="#" class="btn btn-login btn-block" role="button" data-toggle="modal" data-target="#login-modal"><i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp; LOGIN</a>
    </div>
    <p class="text-right hidden-sm hidden-xs">
    <a href="<%=request.getContextPath()%>/app.jsp" class="btn btn-login " role="button"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp; APP STORE</a>
    <a href="#" class="btn btn-login" role="button" data-toggle="modal" data-target="#login-modal"><i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp; LOGIN</a></p>
        <!--button data-toggle="modal" data-target="#login-modal" style="float:right;">Login</Button-->
      </nav>
  <div class="container-fluid">
   <div class="navbar-header">
    <a class="navbar-toggle" style=""> 
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
     </a>
    <!--  <a class="navbar-brand hidden-lg hidden-md" href="#">Project name</a> -->
   </div>
   <div id="slidemenu">     
    <ul class="nav navbar-nav">
            <li class=""><a href="<%=request.getContextPath()%>/index.jsp"><span class="fa fa-home" aria-hidden="true"></span> HOME</a></li>
            <li><a href="<%=request.getContextPath()%>/autonomy.jsp"><i class="fa fa-flag-o" aria-hidden="true"></i>&nbsp; AUTONOMY</a></li>
			<li class="dropdown dropdown-large hidden-lg hidden-sm">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-book" aria-hidden="true"></i> COURSES <b class="caret"></b></a>
              <ul class="dropdown-menu dropdown-menu-large row">
                <li class="col-sm-4">
                  <ul>
                    <li class="dropdown-header">Bachelors In Science</li>
                    <li><a href="#">Biotechnology</a></li>
                    <li ><a href="#">Botany</a></li>
                    <li><a href="#">Chemistry</a></li>
                    <li><a href="#">Computer Science</a></li>
                    <li><a href="#">Geology</a></li>
                    <li><a href="#">Mathematics</a></li>
                    <li><a href="#">Physics</a></li>
                    <li><a href="#">Zoology</a></li>
                  </ul>
                </li>
                <li class="col-sm-4">
                  <ul>
                    <li class="dropdown-header">Bachelor In Arts</li>
                    <li><a href="#">Economics</a></li>
                    <li><a href="#">English</a></li>
                    <li><a href="#">French</a></li>
                    <li><a href="#">Hindi</a></li>
                    <li><a href="#">History</a></li>
                    <li><a href="#">Konkani</a></li>
                    <li><a href="#">Marathi</a></li>
                    <li><a href="#">Philosophy</a></li>

                  </ul>
                </li>
                <li class="col-sm-4">
                  <ul>
                    <li><a href="#">Portuguese</a></li>
                    <li><a href="#">Psychology</a></li>
                    <li><a href="#">Sociology</a></li>
                    <li class="dropdown-header"> Masters Course</li>
                    <li><a href="#">Msc IT</a></li>
                    <li><a href="#">MA Economics</a></li>
                    <li><a href="#">MA Hindi</a></li>

                  </ul>
                </li>
				

              </ul>

            </li>
			<li class="hidden-lg hidden-md"><a href="<%=request.getContextPath()%>/admission_module/admission.jsp"><i class="fa fa-sticky-note-o" aria-hidden="true"></i>&nbsp; ADMISSIONS</a></li>
			<li class="hidden-lg hidden-md"><a href="#"><i class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp; INTERNSHIP</a></li>
			
          </ul>		  
		  <ul class="nav navbar-nav navbar-right">
            <li><a href="<%=request.getContextPath()%>/student-email.jsp"><i class="fa fa-server" aria-hidden="true"></i>&nbsp;EMAIL DIRECTORY</a></li>
            <li><a href="<%=request.getContextPath()%>/student-services.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp; STUDENT SERVICES</a></li>
          </ul>
          
   </div>
  </div>
  <div class="container-fluid hidden-sm hidden-xs">
   <div class="navbar-header">
    <!--  <a class="navbar-brand hidden-lg hidden-md" href="#">Project name</a> -->
   </div>
   <div id="slidemenu">     
    <ul class="nav navbar-nav">
            <li class="dropdown dropdown-large">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-book" aria-hidden="true"></i> COURSES <b class="caret"></b></a>
              <ul class="dropdown-menu dropdown-menu-large row">
                <li class="col-sm-4">
                  <ul>
                    <li class="dropdown-header">Bachelors In Science</li>
                    <li><a href="course.jsp">Biotechnology</a></li>
                    <li ><a href="#">Botany</a></li>
                    <li><a href="#">Chemistry</a></li>
                    <li><a href="#">Computer Science</a></li>
                    <li><a href="#">Geology</a></li>
                    <li><a href="#">Mathematics</a></li>
                    <li><a href="#">Physics</a></li>
                    <li><a href="#">Zoology</a></li>
                  </ul>
                </li>
                <li class="col-sm-4">
                  <ul>
                    <li class="dropdown-header">Bachelor In Arts</li>
                    <li><a href="#">Economics</a></li>
                    <li><a href="#">English</a></li>
                    <li><a href="#">French</a></li>
                    <li><a href="#">Hindi</a></li>
                    <li><a href="#">History</a></li>
                    <li><a href="#">Konkani</a></li>
                    <li><a href="#">Marathi</a></li>
                    <li><a href="#">Philosophy</a></li>

                  </ul>
                </li>
               <li class="col-sm-4">
                  <ul>
                    <li><a href="#">Portuguese</a></li>
                    <li><a href="#">Psychology</a></li>
                    <li><a href="#">Sociology</a></li>
                    <li class="dropdown-header"> Masters Course</li>
                    <li><a href="course.jsp">Msc IT</a></li>
                    <li><a href="#">MA Economics</a></li>
                    <li><a href="#">MA Hindi</a></li>

                  </ul>
                </li>

              </ul>

            </li>
            <li><a href="<%=request.getContextPath()%>/admission_module/admission.jsp"><i class="fa fa-sticky-note-o" aria-hidden="true"></i>&nbsp; ADMISSIONS</a></li>
          </ul>	  
		  <ul class="nav navbar-nav navbar-right">
            <li><a href="error.jsp"><i class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp; INTERNSHIP</a></li>
          </ul>
          
   </div>
  </div>
 </div>
  </div>
    </body>
</html>
