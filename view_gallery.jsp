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
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="css/bootstrap-social.css">
  <link rel="stylesheet" href="css/blueimp-gallery.css">
  <link rel="stylesheet" href="css/blueimp-gallery-indicator.css">
  <link href="css/font-awesome.css" rel="stylesheet">
</head>
<body>
  	<%@ include file="header.jsp" %>
    <div class="container" style="min-height:100vh;margin-top:250px;">
      <div class="row card-style view-gallery" id="links">
        <h3 class="text-center">I-RIX 2017</h3><hr/>
        <div class="col-lg-4">
      <a href="img/03.jpg" title="Banana" class="img-responsive">
          <img src="img/03.jpg" alt="Banana" class="img-responsive">
      </a>
        </div>
        <div class="col-lg-4">
      <a href="img/01.jpg" title="Banana" class="img-responsive">
          <img src="img/01.jpg" alt="Banana" class="img-responsive">
      </a>
        </div>

        <div class="col-lg-4">
          <a href="img/11.jpg" title="Banana" class="img-responsive">
              <img src="img/11.jpg" alt="Banana" class="img-responsive">
          </a>
        </div>
        <div class="col-lg-4">
          <a href="img/12.jpg" title="Banana" class="img-responsive">
              <img src="img/12.jpg" alt="Banana" class="img-responsive">
          </a>
        </div>
        <div class="col-lg-4">
          <a href="img/13.jpg" title="Banana" class="img-responsive">
              <img src="img/13.jpg" alt="Banana" class="img-responsive">
          </a>
        </div>
        <div class="col-lg-4">
          <a href="img/14.jpg" title="Banana" class="img-responsive">
              <img src="img/14.jpg" alt="Banana" class="img-responsive">
          </a>
        </div>
      </div>

<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>

      </div>
</div>
<%@ include file="footer.html" %>
    </body>
    </html>
