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
  <link rel="stylesheet" href="css/blueimp-gallery.min.css">
  <link rel="stylesheet" href="css/bootstrap-social.css">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <%@ include file="header.jsp"%>
    <div class="container" style="min-height:100vh;margin-top:250px;">
      <div class="row card-style view-gallery" id="links" style="">
        <h3 class="text-center">GEOGRAPHIZE 2017</h3><hr/>
        <div class="col-lg-4">
      <a href="img/16.jpg" title="Banana" class="img-responsive">
          <img src="img/16.jpg" alt="Banana" class="img-responsive">
      </a>
        </div>
        <div class="col-lg-4">
      <a href="img/17.jpg" title="Banana" class="img-responsive">
          <img src="img/17.jpg" alt="Banana" class="img-responsive">
      </a>
        </div>

        
        
        <div class="col-lg-4">
          <a href="img/20.jpg" title="Banana" class="img-responsive">
              <img src="img/20.jpg" alt="Banana" class="img-responsive">
          </a>
        </div>
        <div class="col-lg-4">
          <a href="img/21.jpg" title="Banana" class="img-responsive">
              <img src="img/21.jpg" alt="Banana" class="img-responsive">
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
      
    </body>
    </html>
