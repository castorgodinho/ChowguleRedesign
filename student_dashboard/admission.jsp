<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="<%=request.getContextPath()%>/img/favicon.png" type="image/gif">
  <title>Parvatibai Chowgule College</title>
  <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
  <link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
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
          <%@ include file="sidebar.html" %>
        </div>
        <div class="col-md-10 col-sm-11 display-table-cell v-align">
          <%@ include file="header.html" %>
            <div class="user-dashboard ">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-12 card-style">
                  <h3 class="text-center">SECOND YEAR ADMISSION</h3>
                  <form>
                  <div class="row">
                  <div class="col-md-3">
                  <div class="form-group">
            <label for="sel1">Enter PR Number:</label>
            <input type="text" Value="" class="form-control pull-right" placeholder="Enter PR Number" required>
            </div>
                  </div>
                  <div class="col-md-12">
                  		<h4 class="">Select Elective Papers</h4>
                        <input id="checkbox-1" class="checkbox-custom" name="checkbox-1" type="checkbox" >
                        <label for="checkbox-1" class="checkbox-custom-label">Data Mining</label>
                      </div>
                      <div class="col-md-12">
                        <input id="checkbox-2" class="checkbox-custom" name="checkbox-2" type="checkbox" >
                        <label for="checkbox-2" class="checkbox-custom-label">Data Analysis and Algorithm</label>
                      </div>
                      <div class="col-md-12">
                        <input id="checkbox-3" class="checkbox-custom" name="checkbox-3" type="checkbox" >
                        <label for="checkbox-3" class="checkbox-custom-label">Machine Learning</label>
                      </div>
                      <div class="col-md-12">
                        <input id="checkbox-4" class="checkbox-custom" name="checkbox-4" type="checkbox" >
                        <label for="checkbox-4" class="checkbox-custom-label">Network Security</label>
                      </div>
                      <div class="col-md-3" style="margin-bottom:10px;">
								<label for="sel1">&nbsp;</label>
							<input type="button" class="btn btn-warning pull-right btn-block" value="SUBMIT">
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
      
      <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
      <script>
      $(function () {
$( window ).load(function() {
  // if($( window ).scrollTop() > 10){   scroll down abit and get the action
  $(".progress-bar").each(function(){
    each_bar_width = $(this).attr('aria-valuenow');
    $(this).width(each_bar_width + '%');
  });

 //  }
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
