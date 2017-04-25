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
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-social.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/blueimp-gallery.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/blueimp-gallery-indicator.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.mCustomScrollbar.css">
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
</head>
<body>
  <%@ include file="header.jsp"%>
    <div class="container" style="min-height:100vh;margin-top:250px;">
      <div class="row card-style view-gallery" id="links" style="">
        <h3 class="text-center">TATHASTU 2017</h3><hr/>
        <div class="col-lg-4">
      <a href="img/22.jpg" title="Banana" class="img-responsive">
          <img src="img/22.jpg" alt="Banana" class="img-responsive">
      </a>
        </div>
        <div class="col-lg-4">
      <a href="img/23.jpg" title="Banana" class="img-responsive">
          <img src="img/23.jpg" alt="Banana" class="img-responsive">
      </a>
        </div>

        <div class="col-lg-4">
          <a href="img/24.jpg" title="Banana" class="img-responsive">
              <img src="img/24.jpg" alt="Banana" class="img-responsive">
          </a>
        </div>
        <div class="col-lg-4">
          <a href="img/24.jpg" title="Banana" class="img-responsive">
              <img src="img/24.jpg" alt="Banana" class="img-responsive">
          </a>
        </div>
        <div class="col-lg-4">
          <a href="img/25.jpg" title="Banana" class="img-responsive">
              <img src="img/25.jpg" alt="Banana" class="img-responsive">
          </a>
        </div>
        <div class="col-lg-4">
          <a href="img/26.jpg" title="Banana" class="img-responsive">
              <img src="img/26.jpg" alt="Banana" class="img-responsive">
          </a>
        </div>
      </div>

<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i></a>
    <a class="next"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></a>
    <a class="close"><i class="fa fa-times-circle" aria-hidden="true"></i></a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>

      </div>
</div>

      <%@ include file="footer.html"%>
      <script>
      $(document).ready(function(){
        $(window).scroll(function() {
          if ($(document).scrollTop() > 50) {
            $('.header-logo').addClass('shrink-header');
          } else {
            $('.header-logo').removeClass('shrink-header');
          }
        });
        var index = 1;
        $('.count').html(index);
        var count = $(".result").children().length;
        $('.total').html(count);
        $(".cards").hide();
        $(".cards:nth-child("+index+")").show();
        $(".next1").click(function(){
          if(index < count){
            $(".cards:nth-child("+index+")").hide();
            index = index + 1;
            $(".cards:nth-child("+index+")").fadeIn(500);
            $('.count').html(index);
          }
        });
        $(".prev1").click(function(){
          if(index > 1){
            $(".cards:nth-child("+index+")").hide();
            index = index -1;
            $(".cards:nth-child("+index+")").fadeIn(500);
            $('.count').html(index);
          }
        });
        $(function () {
          $(".demo1").bootstrapNews({
            newsPerPage: 4,
            autoplay: true,
            pauseOnHover:true,
            navigation: true,
            direction: 'up',
            newsTickerInterval: 4000,
            onToDo: function () {
              //console.log(this);
            }
          });
        });
        document.getElementById('links').onclick = function (event) {
          event = event || window.event;
          var target = event.target || event.srcElement,
          link = target.src ? target.parentNode : target,
          options = {index: link, event: event},
          links = this.getElementsByTagName('a');
          blueimp.Gallery(links, options);
        };
        blueimp.Gallery(
          document.getElementById('links').getElementsByTagName('a'), {
            container: '#blueimp-gallery-carousel',
            carousel: true
          }
        );
      });
      </script>
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="js/bootstrap.min.js"></script>
      <script src="js/blueimp-gallery.min.js"></script>
    </body>
    </html>
