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
<div class="col-md-10 col-sm-11 display-table-cell v-align"><!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
<%@ include file="header.html"%>
<div class="user-dashboard card-style">
<div class="container-fluid">
<div class="row">
<div class="col-md-6 ">
<h3 class="text-center">MY ATTENDANCE</h3>
<table class="table table-bordered ">
	<thead class="">
		<tr>
			<th colspan="3">
			<div class="form-group"><label for="sel1">Select
			Semester:</label> <select class="form-control" id="sel1">
				<option>Semester 1</option>
				<option>Semester 2</option>
				<option>Semester 3</option>
				<option>Semester 4</option>
				<option>Semester 5</option>
				<option>Semester 6</option>
			</select></div>
			</th>
		</tr>
	</thead>
	<thead class="thead-inverse">
		<tr>
			<th>PAPER NAME</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>
			<div class="barWrapper"><span class="progressText"><B>HTML5</B></span>
			<div class="progress">
			<div class="progress-bar" role="progressbar" aria-valuenow="85"
				aria-valuemin="0" aria-valuemax="100"><span class="popOver"
				data-toggle="tooltip" data-placement="top" title="85%"> </span></div>
			</div>
			</div>
			</th>
		</tr>
		<tr>
			<th>
			<div class="barWrapper"><span class="progressText"><B>SOFTWARE
			ARCHITECTURE</B></span>
			<div class="progress ">
			<div class="progress-bar" role="progressbar" aria-valuenow="90"
				aria-valuemin="10" aria-valuemax="100" style=""><span
				class="popOver" data-toggle="tooltip" data-placement="top"
				title="75%"> </span></div>
			</div>
			</div>
			</th>
		</tr>
		<tr>
			<th>
			<div class="barWrapper"><span class="progressText"><B>COMPUTER
			GRAPHICS</B></span>
			<div class="progress">
			<div class="progress-bar" role="progressbar" aria-valuenow="65"
				aria-valuemin="0" aria-valuemax="100"><span class="popOver"
				data-toggle="tooltip" data-placement="top" title="65%"> </span></div>
			</div>
			</div>
			</th>
		</tr>
		<tr>
			<th>
			<div class="barWrapper"><span class="progressText"><B>ADVANCE
			DATABASE</B></span>
			<div class="progress">
			<div class="progress-bar" role="progressbar" aria-valuenow="70"
				aria-valuemin="0" aria-valuemax="100"><span class="popOver"
				data-toggle="tooltip" data-placement="top" title="70%"> </span></div>
			</div>
			</div>
			</th>


		</tr>
		<tr>
			<th>
			<div class="barWrapper"><span class="progressText"><B>UNIX</B></span>
			<div class="progress">
			<div class="progress-bar" role="progressbar" aria-valuenow="75"
				aria-valuemin="0" aria-valuemax="100"><span class="popOver"
				data-toggle="tooltip" data-placement="top" title="75%"> </span></div>
			</div>
			</div>
			</th>
		</tr>
	</tbody>
</table>
</div>
<div class="col-lg-6" style="border-left: 1px solid #000;">
<h3 class="text-center">UPDATES</h3>
<table class="table table-hover" id="task-table">
	<tbody>
		<tr>
			<td>
			<h3 class="text-center">State level Elocution Competition in Hindi</h3>
                        <h5 class="text-center">On 1th March 2017</h5>
			</td>
		</tr>
		<tr>
			<td>
			<h3 class="text-center">State level Elocution Competition in Hindi</h3>
                        <h5 class="text-center">On 1th March 2017</h5>
			</td>
			
		</tr>
		<tr>
			<td>
			<h3 class="text-center">State level Elocution Competition in Hindi</h3>
                        <h5 class="text-center">On 1th March 2017</h5>
			</td>
			
		</tr>
		<tr>
			<td>
			<h3 class="text-center">State level Elocution Competition in Hindi</h3>
                        <h5 class="text-center">On 1th March 2017</h5>
			</td>
			
		</tr>
		<tr>
			<td>
			<h3 class="text-center">State level Elocution Competition in Hindi</h3>
                        <h5 class="text-center">On 1th March 2017</h5>
			</td>
			
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

<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
<script>
      $(function () {
  $('[data-toggle="tooltip"]').tooltip({trigger: 'manual'}).tooltip('show');
});

$( window ).load(function() {
  $(".progress-bar").each(function(){
    each_bar_width = $(this).attr('aria-valuenow');
    $(this).width(each_bar_width + '%');
  });
});
      $(document).ready(function(){
        $('[data-toggle="offcanvas"]').click(function(){
          $("#navigation").toggleClass("hidden-xs");
        });
        
      });

      </script>

<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>
