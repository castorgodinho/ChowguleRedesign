<%-- 
    Document   : header
    Created on : 23 Apr, 2017, 7:44:26 PM
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
        <div class="row">
<header class="card-style-container">
<div class="col-md-7">
<nav class="navbar-default pull-left">
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed"
	data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false">
<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
<span class="icon-bar"></span> <span class="icon-bar"></span></button>
</div>
</nav>

</div>
<div class="col-md-5">
<div class="header-rightside">
<ul class="list-inline header-top pull-right">
	<li>Hi Tushar!!</li>
	<li class="dropdown"><a href="#" class="dropdown-toggle"
		data-toggle="dropdown"><img src="<%=request.getContextPath()%>/img/avatar.jpg" alt="user">
	<b class="caret"></b></a>
	<ul class="dropdown-menu">
		<li>
		<div class="navbar-content"><a href="s_profile.jsp" class=""><i class="fa fa-user-circle" aria-hidden="true"></i> View
		Profile</a> 
		<div class="divider"></div>
                <a href="<%=request.getContextPath()%>/admin/Logout.jsp" class="">LogOut</a></div>
		</li>
	</ul>
	</li>
</ul>
</div>
</div>
</header>
</div>
    </body>
</html>
