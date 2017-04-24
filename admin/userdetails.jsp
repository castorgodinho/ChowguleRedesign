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
</head>
<body class="home">
<div class="display-table">
<div class="row display-table-row">
<div
	class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container"
	id="navigation"><%@ include file="sidebar.html"%>

</div>
<div class="col-md-10 col-sm-11 display-table-cell v-align"><!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
<%@ include file="header.html"%>
<div class="user-dashboard ">
<div class="container-fluid">

<div class="row">
<div class="col-md-12 card-style">
<div class="col-md-12">
				<div class="panel panel-success">
          <h3 class="text-center">USER DIRECTORY</h3>
					<div class="panel-body">
            <div class="col-md-6 col-md-offset-3">
              <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
            </div>

					</div>
					<table class="table table-hover" id="task-table">
						<thead>
							<tr>
								<th>Roll No.</th>
								<th>Name</th>
								<th>Class</th>
								<th>Email</th>
								<th>Details</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Tushar Vaskar</td>
								<td>MSC-IT</td>
								<td>tuv001@chowgules.ac.in</td>
								<td><button type="button" class="btn btn-warning">VIEW DETAILS</button></td>
							</tr>
							<tr>
								<td>2</td>
								<td>Gaurav PhalDessai</td>
								<td>MSC-IT</td>
								<td>grv002@chowgules.ac.in</td>
								<td><button type="button" class="btn btn-warning">VIEW DETAILS</button></td>
							</tr>
							<tr>
								<td>3</td>
                <td>Rhugveda Desai</td>
								<td>TYBSC</td>
								<td>rsd002@chowgules.ac.in</td>
								<td><button type="button" class="btn btn-warning">VIEW DETAILS</button></td>
							</tr>
							<tr>
								<td>4</td>
                <td>Shubam Pednekar</td>
								<td>SYBSC</td>
								<td>spd001@chowgules.ac.in</td>
								<td><button type="button" class="btn btn-warning">VIEW DETAILS</button></td>
							</tr>
							<tr>
								<td>5</td>
                <td>Shreya Jain</td>
								<td>TYBA</td>
								<td>srj002@chowgules.ac.in</td>
								<td><button type="button" class="btn btn-warning">VIEW DETAILS</button></td>
							</tr>
							<tr>
								<td>6</td>
                <td>Arya Prabhudessai</td>
								<td>SYBA</td>
								<td>apb002@chowgules.ac.in</td>
								<td><button type="button" class="btn btn-warning">VIEW DETAILS</button></td>
							</tr>
							<tr>
								<td>7</td>
                <td>Gaurav PhalDessai</td>
								<td>MSC-IT</td>
								<td>grv002@chowgules.ac.in</td>
								<td><button type="button" class="btn btn-warning">VIEW DETAILS</button></td>
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
<%@ include file="footer.html"%>
</body>
</html>
