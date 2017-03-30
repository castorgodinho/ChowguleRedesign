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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="home">
<div class="display-table">
<div class="row display-table-row">
<div
	class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container"
	id="navigation"><%@ include file="sidebar.html"%>
</div>
<div class="col-md-10 col-sm-11 display-table-cell v-align">
<%@ include file="header.html"%>
<div class="user-dashboard ">
              <div class="container-fluid">

                <div class="row">
                  <div class="">
                    <!--div class="col-md-12 card-style">
                      <h4 class="text-center"> Attendance</h4>
                      <div id="bar-example" style="height: 250px;"></div>

                    </div-->
                    <div class="col-md-12 card-style attendance-container " >
                      <h3 class="text-center">ATTENDANCE</h3>
                      <div class="row">
                        <div class="col-md-4 col-md-offset-2">
                          <div class="form-group">
                            <label for="sel1">Select Subject:</label>
                            <select class="form-control" id="sel1">
                              <option>ENGLISH</option>
                              <option>CHEMISTRY</option>
                              <option>BOTANY</option>
                              <option>WEB TECH</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-4">
                           <div class="form-group">
                <label for="dtp_input2" class=" control-label">Date Picking</label>
                <div class="input-group date form_date " data-date="" data-date-format="mm dd yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
            </div>

                            </div>
                        </div>
                      <div class="attend-scroll">
                      <table class="table table-bordered ">
                        <thead class="">
                          <tr>
                            <th colspan="3"><h4 class="pull-left">SUBJECT: CHEMISTRY</h4><input type="submit" class="btn btn-warning pull-right" value="Insert" name="submit" style="margin-left:10px;"></th>



                          </tr>
                        </thead>
  <thead class="thead-inverse">

    <tr>
      <th>Roll No.</th>
      <th>Full Name</th>
      <th>#</th>


    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>Nel Gibson</td>

        <td>
          <div>
        <input id="checkbox-1" class="checkbox-custom" name="checkbox-1" type="checkbox" checked>
        <label for="checkbox-1" class="checkbox-custom-label"></label>
      </div>
      </td>

    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Bruce Wayne</td>
      <td>
        <div>
      <input id="checkbox-2" class="checkbox-custom" name="checkbox-2" type="checkbox" checked>
      <label for="checkbox-2" class="checkbox-custom-label"></label>
    </div>
      </td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Mark Walberg</td>
      <td>
        <div>
      <input id="checkbox-3" class="checkbox-custom"  name="checkbox-3" type="checkbox" checked>
      <label for="checkbox-3" class="checkbox-custom-label"></label>
    </div>
      </td>
    </tr>
    <tr>
      <th scope="row">4</th>
      <td>Bittu Sharma</td>
      <td>
        <div>
      <input id="checkbox-4" class="checkbox-custom"  name="checkbox-4" type="checkbox" checked>
      <label for="checkbox-4" class="checkbox-custom-label"></label>
    </div>
      </td>
    </tr>
    <tr>
      <th scope="row">5</th>
      <td>Samuel Jackson</td>
      <td>
        <div>
      <input id="checkbox-5" class="checkbox-custom"  name="checkbox-5" type="checkbox" checked>
      <label for="checkbox-5" class="checkbox-custom-label"></label>
    </div>
      </td>
    </tr>
    <tr>
      <th scope="row">6</th>
      <td>Daisy Johns</td>
      <td>
        <div>
      <input id="checkbox-6" class="checkbox-custom"  name="checkbox-6" type="checkbox" checked>
      <label for="checkbox-6" class="checkbox-custom-label"></label>
    </div>
      </td>
    </tr>
    <tr>
      <th scope="row">7</th>
      <td>Daisy Johns</td>
      <td>
        <div>
      <input id="checkbox-7" class="checkbox-custom"  name="checkbox-7" type="checkbox" checked>
      <label for="checkbox-7" class="checkbox-custom-label"></label>
    </div>
      </td>
    </tr>
    <tr>
      <th scope="row">8</th>
      <td>Daisy Johns</td>
      <td>
        <div>
      <input id="checkbox-8" class="checkbox-custom"  name="checkbox-8" type="checkbox" checked>
      <label for="checkbox-8" class="checkbox-custom-label"></label>
    </div>
      </td>
    </tr>
    <tr>
      <th scope="row">9</th>
      <td>Daisy Johns</td>
      <td>
        <div>
      <input id="checkbox-9" class="checkbox-custom"  name="checkbox-9" type="checkbox" checked>
      <label for="checkbox-9" class="checkbox-custom-label"></label>
    </div>
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
</div>
</div>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
 <script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script>
      $(document).ready(function(){
        

        $('[data-toggle="offcanvas"]').click(function(){
          $("#navigation").toggleClass("hidden-xs");
        });

      });
	  $('.form_date').datetimepicker({
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
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
