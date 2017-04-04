<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<h3 class="text-center">PROFILE</h3>
<div class="row">
<div class="col-md-12">
<table class="table  table-bordered">
	<tbody>
		<tr>
			<td colspan="2">
			<h3>VASKAR TUSHAR RAGHOBA</h3>
			<h4>SU1515100</h4>
			</td>
		</tr>

		<tr>
			<td>Date of Birth</td>
			<td>: 18-April-1994</td>
		</tr>
		<tr>
			<td>Email Id</td>
			<td>: tusharvaskar@gmail.com</td>
		</tr>
		<tr>
			<td>Phone</td>
			<td>: (+91) 7350 287 199</td>
		</tr>
		<tr>
			<td>Class</td>
			<td>:M.sc.-IT Part 2</td>
		</tr>
		<tr>
			<td>University Registration Number</td>
			<td>:20110813</td>
		</tr>
		<tr>
			<td>Address</td>
			<td>:H. No. 327, Opposite vishwanath garage mestawada Vasco Goa</td>
		</tr>

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
		<tr>
			<td>Father's Name:</td>
			<td>: Raghoba Vaskar</td>
		</tr>
		<tr>
			<td>Contact Number:</td>
			<td>: 9850452685</td>
		</tr>
		<tr>
			<td>Mother's Name</td>
			<td>: Radhika Vaskar</td>
		</tr>
		<tr>
			<td>Contact Number</td>
			<td>: 9850378557</td>
		</tr>
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
		<tr>
			<td>TYBSC/BCA</td>
			<td>: MES College of Arts & Commerce Zuarinagar</td>
		</tr>
		<tr>
			<td>H.S.S.C.</td>
			<td>: Shantadurga Higher Secondary School, Sancoale</td>
		</tr>
		<tr>
			<td>S.S.C.E.</td>
			<td>: Mother Of Mercy English High School</td>
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
</div>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
<script>
      $(document).ready(function(){
        $('[data-toggle="offcanvas"]').click(function(){
          $("#navigation").toggleClass("hidden-xs");
        });
        $('.nav-dropdown-1').hide();      
        $('.nav-dropdown-link-1').click(function () {
            $('.nav-dropdown-1').slideToggle();
        });
      });
      </script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>
