<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Parvatibai Chowgule College</title>
  <!-- Bootstrap -->
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
      <div class="row display-table-row">
        <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container" id="navigation">
          <%@ include file="sidebar.html" %>
        </div>
        <div class="col-md-10 col-sm-11 display-table-cell v-align">
          <%@ include file="header.html" %>
            <div class="user-dashboard ">
              <div class="container-fluid">

                <div class="row">
                  <div class="">
                    <!--div class="col-md-12 card-style">
                      <h4 class="text-center"> Attendance</h4>
                      <div id="bar-example" style="height: 250px;"></div>

                    </div-->
                    <div class="col-md-12 card-style attendance-container " >
                      <h3 class="text-center">COURSE, TEACHING & SUPPORT SERVICE EVALUATION BY STUDENT <br/><b>BY IQAC</b></h3><hr/>
                      <div class="row">
                        <div class="alert alert-warning col-lg-12">
                          <strong>Note:</strong> The assessment/evaluation consists of three parts A,B and C. To complete the assessment, please read each statement and select the response that best matches your opinion. Tick mark the appropriate point for each question. Under each category you can also write suggestions for improvement.
                          </div>
                        <div class="col-lg-4" >
                          <div class="thumbnail" style="padding:20px;">
                            <center><img src="<%=request.getContextPath()%>/img/spcc.png" width="200" style="" class="img-responsive"></center>
                            <h3 class="text-center">PART - A</h3>
                            <p class="text-center">Tick mark the respective Options for the six different evaluation points.Your assessment is valuable for us.</p><hr/>
                            <center><button class="btn btn-warning" onclick="javascript:location.href='view_assesment1.jsp'">View</button><center>
                          </div>
                        </div>
                        <div class="col-lg-4" >
                          <div class="thumbnail" style="padding:20px;">
                            <center><img src="<%=request.getContextPath()%>/img/spcc.png" width="200" style="" class="img-responsive"></center>
                            <h3 class="text-center">PART - B</h3>
                            <p class="text-center">Tick mark the respective Options for the six different evaluation points.Your assessment is valuable for us.</p><hr/>
                            <center><button class="btn btn-warning" onclick="javascript:location.href='view_assesment2.jsp'">View</button><center>
                          </div>
                        </div>
                        <div class="col-lg-4" >
                          <div class="thumbnail" style="padding:20px;">
                            <center><img src="<%=request.getContextPath()%>/img/spcc.png" width="200" style="" class="img-responsive"></center>
                            <h3 class="text-center">PART - C</h3>
                            <p class="text-center">Has six different parts say; A,B,C,D,E and F.
								Fill all and help us improve ourselves. Your assessment is valuable for us.</p><hr/>
                            <center><button class="btn btn-warning" onclick="javascript:location.href='view_assesment3.jsp'">View</button><center>
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
      <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>     
      <script>
      $(document).ready(function(){
        $('[data-toggle="offcanvas"]').click(function(){
          $("#navigation").toggleClass("hidden-xs");
        });
      });
      </script>
      
    </body>
    </html>
