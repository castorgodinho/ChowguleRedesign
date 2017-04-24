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
<div class=""><!--div class="col-md-12 card-style">
                      <h4 class="text-center"> Attendance</h4>
                      <div id="bar-example" style="height: 250px;"></div>

                    </div-->
<div class="col-md-12 card-style attendance-container ">
<h3 class="text-center">ATTENDANCE</h3>

<div class="row">
<div class="col-md-6 col-md-offset-3">
<div class="form-group"><label for="sel1">Select Subject:</label>
<select class="form-control" id="sel1">
	<option>ENGLISH</option>
	<option>CHEMISTRY</option>
	<option>BOTANY</option>
	<option>WEB TECH</option>
</select></div>
</div>

</div>

<div class="attend-scroll">
<table class="table table-hover" id="task-table">
	<thead>
		<tr>
			<th>Paper Name</th>
			<th>Lectures</th>
			<th>Percentage</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>WEB TECHNOLOGY</th>
			<td>10 / 15</td>
			<td>70</td>
		</tr>
		<tr>
			<th>SOFTWARE ARCHITECTURE</th>
			<td>12 / 15</td>
			<td>70</td>
		</tr>
		
		
		<tr>
			<th>COMPUTER GRAPHICS</th>
			<td>12 / 15</td>
			<td>70</td>
		</tr>
		<tr>
			<th>DATABASE DESIGN</th>
			<td>12 / 15</td>
			<td>70</td>
		</tr>
		<tr>
			<th>LINUX & KERNAL EDITING</th>
			<td>12 / 15</td>
			<td>70</td>
		</tr>
		<tr>
			<th>OPERATING SYSTEM</th>
			<td>12 / 15</td>
			<td>70</td>
		</tr>
		<tr>
			<th>SOFTWARE ENGINEERING</th>
			<td>12 / 15</td>
			<td>70</td>
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
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {

		$('[data-toggle="offcanvas"]').click(function() {
			$("#navigation").toggleClass("hidden-xs");
		});

	});;
</script>

<script src="../js/bootstrap.min.js"></script>
</body>
</html>
