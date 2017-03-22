<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Parvatibai Chowgule College</title>
  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="css/bootstrap-social.css">
  <link href="css/font-awesome.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <%@ include file="header.html" %>
    <div class="container" style="min-height:100vh;margin-top:250px;">
      <div class="col-md-12">
				<div class="panel panel-success">
          <h3 class="text-center">STUDENT EMAIL DIRECTORY</h3>
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
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Tushar Vaskar</td>
								<td>MSC-IT</td>
								<td>tuv001@chowgules.ac.in</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Gaurav PhalDessai</td>
								<td>MSC-IT</td>
								<td>grv002@chowgules.ac.in</td>
							</tr>
							<tr>
								<td>3</td>
                <td>Rhugveda Desai</td>
								<td>TYBSC</td>
								<td>rsd002@chowgules.ac.in</td>
							</tr>
							<tr>
								<td>4</td>
                <td>Shubam Pednekar</td>
								<td>SYBSC</td>
								<td>spd001@chowgules.ac.in</td>
							</tr>
							<tr>
								<td>5</td>
                <td>Shreya Jain</td>
								<td>TYBA</td>
								<td>srj002@chowgules.ac.in</td>
							</tr>
							<tr>
								<td>6</td>
                <td>Arya Prabhudessai</td>
								<td>SYBA</td>
								<td>apb002@chowgules.ac.in</td>
							</tr>
							<tr>
								<td>7</td>
                <td>Gaurav PhalDessai</td>
								<td>MSC-IT</td>
								<td>grv002@chowgules.ac.in</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
</div>
<%@ include file="footer.html" %>
    </body>
    </html>
