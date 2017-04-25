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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-social.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/blueimp-gallery.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/blueimp-gallery-indicator.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.mCustomScrollbar.css">
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
</head>
<body>
  <%@ include file="header.jsp" %>
    <div class="container" style="min-height:100vh;margin-top:250px;">
      <div class="row">
        <h1 class="text-center">APP STORE</h1><hr/>
        <div class="col-lg-4 col-lg-offset-2" >
          <div class="thumbnail" style="padding:20px;">
            <center><img src="img/spcc.png" width="200" style="" class="img-responsive"></center>
            <h3 class="text-center">Chowgule College Official App</h3><hr/>
            <center><a href="img/PCC-App-ver-1.0.apk" class="btn btn-warning">DOWNLOAD</a><center>
          </div>

        </div>
        <div class="col-md-4 " >
          <div class="thumbnail" style="padding:20px;">
            <center><img src="img/spcc.png" width="200" style="" class="img-responsive"></center>
            <h3 class="text-center">C-Translate App</h3><hr/>
            <center><a href="img/Ctranslate.apk" class="btn btn-warning">DOWNLOAD</a><center>
          </div>

        </div>
      </div>

      </div>
	</div>
	<%@ include file="footer.html" %>
    </body>
    </html>
