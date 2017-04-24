<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Parvatibai Chowgule College</title>
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
<link href="<%=request.getContextPath()%>/css/font-awesome.css"
	rel="stylesheet">
</head>
<body class="home">
<div class="display-table">
<div class="row display-table-row">
<div
	class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container"
	id="navigation"><%@ include file="../sidebar.jsp"%>

</div>
<div class="col-md-10 col-sm-11 display-table-cell v-align"><!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
<%@ include file="../header.html"%>
<div class="user-dashboard ">
<div class="container-fluid">

<div class="row">
<div class="col-md-12 card-style">
<h1 class="text-center">DASHBOARD</h1>
<hr />
<div class="row">
<div class="col-md-3">
<div class="panel  card" style="padding: 10px;">
<h4 class="text-center">STUDENTS</h4>
<i class="fa fa-address-card-o fa-5x fa-fw" aria-hidden="true">&nbsp;1806</i>
<a href="#">
<div class="panel-footer announcement-bottom">
<div class="row">
<div class="col-xs-8">View Student Details</div>
<div class="col-xs-4 text-right"><i
	class="fa fa-arrow-circle-right"></i></div>
</div>
</div>
</a></div>
</div>
<div class="col-md-3 ">
<div class="panel  card" style="padding: 10px;">
<h4 class="text-center">DEPARTMENTS</h4>
<i class="fa fa-eye fa-5x fa-fw" aria-hidden="true">&nbsp;0030</i> <a
	href="#">
<div class="panel-footer announcement-bottom">
<div class="row">
<div class="col-xs-8">View Department Details</div>
<div class="col-xs-4 text-right"><i
	class="fa fa-arrow-circle-right"></i></div>
</div>
</div>
</a></div>
</div>
<div class="col-md-3 ">
<div class="panel  card" style="padding: 10px;">
<h4 class="text-center">USERS</h4>
<i class="fa fa-eye fa-5x fa-fw" aria-hidden="true">&nbsp;2017</i> <a
	href="<%=request.getContextPath()%>/admin/userdetails.jsp">
<div class="panel-footer announcement-bottom">
<div class="row">
<div class="col-xs-8">View Student Details</div>
<div class="col-xs-4 text-right"><i
	class="fa fa-arrow-circle-right"></i></div>
</div>
</div>
</a></div>
</div>
<div class="col-md-8">
<h3 class="">NEWSFEED</h3>
<table class="table table-hover" id="task-table">
	<thead>
		<tr>
			<th>DATE</th>
			<th>TITLE</th>
			
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>2017, April 8</td>
			<td>Schedule of Repeat Practical Examination for SYBSc Semester IV Geography (Affiliated) April 2017</td>
		</tr>
		<tr>
			<td>2017, April 8</td>
			<td>Schedule of Repeat Practical Examination for SYBSc Semester IV Geography (Affiliated) April 2017</td>
		</tr>
		<tr>
			<td>2017, April 8</td>
			<td>Schedule of Repeat Practical Examination for SYBSc Semester IV Geography (Affiliated) April 2017</td>
		</tr>
		<tr>
			<td>2017, April 8</td>
			<td>Schedule of Repeat Practical Examination for SYBSc Semester IV Geography (Affiliated) April 2017</td>
		</tr>
		<tr>
			<td>2017, April 8</td>
			<td>Schedule of Repeat Practical Examination for SYBSc Semester IV Geography (Affiliated) April 2017</td>
		</tr>
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
<%@ include file="../footer.html"%>

</body>
</html>
