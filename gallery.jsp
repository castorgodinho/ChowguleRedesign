<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="<%=request.getContextPath()%>/img/favicon.png" type="image/gif">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Parvatibai Chowgule College</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="css/bootstrap-social.css">
  <link rel="stylesheet" href="css/blueimp-gallery.css">
  <link rel="stylesheet" href="css/blueimp-gallery-indicator.css">
  <link href="css/font-awesome.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <%@ include file="header.jsp" %>
    <div class="container" style="min-height:100vh;margin-top:250px;">   
        <div class="row">
          <div class="col-lg-12 card-style">
            <h3 class="text-center">IMAGE GALLERY</h3><hr/>       
            <div class="col-lg-4">
                <div class="thumbnail">
                  <img src="img/11.jpg" alt="" class="img-responsive">
                  <div class="caption">
                    <h3 class="text-center"> I-RIX 2017</h3>
                    <p class="card-description text-center"></p>
                    <p class="text-center"><a href="view_gallery.jsp" class="btn btn-default">View Gallery</a></p><br/>
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="thumbnail">
                  <img src="img/18.jpg" alt="" class="img-responsive">
                  <div class="caption">
                    <h3 class="text-center"> GEOGRAPHIZE 2017</h3>
                    <p class="card-description text-center"></p>
                    <p class="text-center"><a href="view_gallery_2.jsp" class="btn btn-default">View Gallery</a></p><br/>
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="thumbnail">
                  <img src="img/22.jpg" alt="" class="img-responsive">
                  <div class="caption">
                    <h3 class="text-center"> TATHASTU 2017</h3>
                    <p class="card-description text-center"></p>
                    <p class="text-center"><a href="view_gallery_3.jsp" class="btn btn-default">View Gallery</a></p><br/>
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="thumbnail">
                  <img src="img/32.jpg" alt="" class="img-responsive">
                  <div class="caption">
                    <h3 class="text-center"> MINECRAFT 2017</h3>
                    <p class="card-description text-center"></p>
                    <p class="text-center"><a href="view_gallery_4.jsp" class="btn btn-default">View Gallery</a></p><br/>
                  </div>
                </div>
              </div>
              
          </div>
        </div>
      </div>

      <%@ include file="footer.html" %>
      
    </body>
    </html>
