<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Parvatibai Chowgule College</title>
  <!-- Bootstrap -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
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
                    <div class="col-md-12 card-style attendance-container " >
                      <h3 class="text-center">PART - A (Course Content Evaluation)</h3><hr/>
                      <div class="row">
                        <div class="col-lg-12" >
                          <div class="thumbnail" style="padding:20px;">
                            <h3 class="text-left">1. The syllabus of this course is relevant and appropriate</h3>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Neutral</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Agree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Agree</label>
                          </div>
                        </div>
                        <div class="col-lg-12" >
                          <div class="thumbnail" style="padding:20px;">
                            <h3 class="text-left">2. The objective of the course is well defined and made clear to students</h3>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Neutral</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Agree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Agree</label>
                          </div>
                        </div>
                        <div class="col-lg-12" >
                          <div class="thumbnail" style="padding:20px;">
                            <h3 class="text-left">3. Prescribed reference books/Resources for the course are available in the library/CLAAP</h3>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Neutral</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Agree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Agree</label>
                          </div>
                        </div>
                        <div class="col-lg-12" >
                          <div class="thumbnail" style="padding:20px;">
                            <h3 class="text-left">4. Teaching of course syllabus was completed on time</h3>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Neutral</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Agree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Agree</label>
                          </div>
                        </div>
                        <div class="col-lg-12" >
                          <div class="thumbnail" style="padding:20px;">
                            <h3 class="text-left">4. Teaching of course syllabus was completed on time</h3>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Disagree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Neutral</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Agree</label>
                            <label class="radio-inline"><input type="radio" name="optradio">Strongly Agree</label>
                          </div>
                        </div>
                        <div class="col-lg-12" >
                          <div class="thumbnail" style="padding:20px;">
                            <h3 class="text-left">Suggestions if any?</h3>
                            <textarea class="form-control" rows="3"></textarea>
                          </div>
                        </div>
                        <div class="col-lg-12" style="margin-bottom:20px;">
                          <div class="form-group">
                            <button class="btn btn-warning pull-right" type="submit">FINISH</button>
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
      });
      </script>

      <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
    </html>
