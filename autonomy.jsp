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
  <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
      <div class="loginmodal-container">
        <h1>User Login</h1><br>
        <form>
          <div class="form-group">
            <label>Email ID</label>
            <input type="email" class="form-control"  placeholder="Enter your Email">
          </div>
          <div class="form-group">
            <label for="">Password</label>
            <input type="password" class="form-control" placeholder="Password">
          </div>
          <input type="submit" name="login" class="btn btn-warning" value="Login" onclick="javascript:location.href='dashboard/dash_index.html'">
        </form>

      </div>
    </div>
  </div>
  <div class="navbar-fixed-top">

    <img src="img/flag_logo.png" class="header-logo img-responsive hidden-xs hidden-sm">
    <img src="img/flag_logo_sm.png" align="left" class="header-logo img-responsive hidden-lg hidden-md">
    <nav class="navbar-one">
      <p class="text-right"><a href="app.html" class="btn btn-login "><i class="fa fa-archive" aria-hidden="true"></i>&nbsp; APP STORE</a>
        <a href="#" class="btn btn-login" role="button" data-toggle="modal" data-target="#login-modal"><i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp; LOGIN</a></p>
        <!--button data-toggle="modal" data-target="#login-modal" style="float:right;">Login</Button-->
      </nav>
      <nav class="navbar navbar-default navbar-static">
        <div class="navbar-header">
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>


        <div class="collapse navbar-collapse js-navbar-collapse">

          <ul class="nav navbar-nav">
            <li class=""><a href="index.html"><span class="fa fa-home" aria-hidden="true"></span> HOME</a></li>
            <li><a href="autonomy.html"><i class="fa fa-flag-o" aria-hidden="true"></i>&nbsp; AUTONOMY</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><i class="fa fa-server" aria-hidden="true"></i>&nbsp; FORMS & DIRECTORY</a></li>
            <li><a href="student-services.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp; STUDENT SERVICES</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </nav>
      <nav class="navbar navbar-default navbar-static">
        <div class="navbar-header">
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>


        <div class="collapse navbar-collapse js-navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="dropdown dropdown-large">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-book" aria-hidden="true"></i> COURSES <b class="caret"></b></a>
              <ul class="dropdown-menu dropdown-menu-large row">
                <li class="col-sm-4">
                  <ul>
                    <li class="dropdown-header">Bachelors In Science</li>
                    <li><a href="#">Biotechnology</a></li>
                    <li ><a href="#">Botany</a></li>
                    <li><a href="#">Chemistry</a></li>
                    <li><a href="#">Computer Science</a></li>
                    <li><a href="#">Geology</a></li>
                    <li><a href="#">Mathematics</a></li>
                    <li><a href="#">Physics</a></li>
                    <li><a href="#">Zoology</a></li>
                  </ul>
                </li>
                <li class="col-sm-4">
                  <ul>
                    <li class="dropdown-header">Bachelor In Arts</li>
                    <li><a href="#">Economics</a></li>
                    <li><a href="#">English</a></li>
                    <li><a href="#">French</a></li>
                    <li><a href="#">Hindi</a></li>
                    <li><a href="#">History</a></li>
                    <li><a href="#">Konkani</a></li>
                    <li><a href="#">Marathi</a></li>
                    <li><a href="#">Philosophy</a></li>

                  </ul>
                </li>
                <li class="col-sm-4">
                  <ul>
                    <li><a href="#">Portuguese</a></li>
                    <li><a href="#">Psychology</a></li>
                    <li><a href="#">Sociology</a></li>
                    <li class="dropdown-header"> Masters Course</li>
                    <li><a href="#">Msc IT</a></li>
                    <li><a href="#">MA Economics</a></li>
                    <li><a href="#">MA Hindi</a></li>

                  </ul>
                </li>

              </ul>

            </li>
            <li><a href="admission/admission.html"><i class="fa fa-sticky-note-o" aria-hidden="true"></i>&nbsp; ADMISSIONS</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><i class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp; INTERNSHIP/PLACEMENTS</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </nav></div>
    <div class="container" style="min-height:100vh;margin-top:250px;">
      <div class="row">
        <h1 class="text-center">AUTONOMY</h1><hr/>
        <div class="row">
          <div class="col-lg-4 ">
            <div class="thumbnail">
              <h3 class="text-center">UGC Guidelines for Autonomous Colleges</h3><hr/>
              <center><button class="btn btn-warning" onclick="javascript:location.href='#'">DOWNLOAD</button><center><br/>
            </div>

          </div>
          <div class="col-lg-4 ">
            <div class="thumbnail">
              <h3 class="text-center">Goa University Statutes related to Autonomous Colleges</h3><hr/>
              <center><button class="btn btn-warning" onclick="javascript:location.href='#'">DOWNLOAD</button><center><br/>
            </div>

          </div>
          <div class="col-lg-4 ">
            <div class="thumbnail">
            <h3 class="text-center">College and Guidelines and Regulations </h3><hr/>
            <center><button class="btn btn-warning" onclick="javascript:location.href='#'">DOWNLOAD</button><center><br/></div>
          </div>
          <div class="col-lg-4 col-lg-offset-4 ">
            <div class="thumbnail">
              <h3 class="text-center">Handbook for Students</h3><hr/>
              <center><button class="btn btn-warning" onclick="javascript:location.href='#'">DOWNLOAD</button><center><br/>
            </div>

          </div>
        </div>
        <div class="row">
          <h1 class="text-center">GOVERNING BODY</h1><hr/>
          <div class="row">
      <div class="col-sm-4">
          <div class="team-members">
              <div class="team-avatar">
                  <img class="img-responsive" src="http://keenthemes.com/assets/bootsnipp/member1.png" alt="">
              </div>
              <div class="team-desc">
                  <h4>John Doe</h4>
                  <span>Marketing</span>
              </div>
          </div>
      </div>
      <div class="col-sm-4">
          <div class="team-members">
              <div class="team-avatar">
                  <img class="img-responsive" src="http://keenthemes.com/assets/bootsnipp/member2.png" alt="">
              </div>
              <div class="team-desc">
                  <h4>Melisa Doe</h4>
                  <span>Founder</span>
              </div>
          </div>
      </div>
      <div class="col-sm-4">
          <div class="team-members">
              <div class="team-avatar">
                  <img class="img-responsive" src="http://keenthemes.com/assets/bootsnipp/member3.png" alt="">
              </div>
              <div class="team-desc">
                  <h4>Alex Atkinson</h4>
                  <span>Director</span>
              </div>
          </div>
      </div>
  </div><!-- //end row -->
        </div>
      </div>
      </div>
</div>
<footer class="footer">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 text-left">
        <ul>
          <li><h5>OTHER LINKS</h5></li>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Contact Us</a></li>
          <li><a href="#">Carrer</a></li>
          <li><a href="#">Research and Consultancy</a></li>
        </ul>
      </div>
      <div class="col-lg-3">
        <ul>
          <li><h5>COLLEGE POLICY</h5></li>
          <li><a href="#">IT Policy</a></li>
          <li><a href="#">RTI</a></li>
          <li><a href="#">IQAC and NAAC</a></li>
          <li><a href="faq.html">FAQ's</a></li>
        </ul>
      </div>
      <div class="col-lg-2">
      </div>
      <div class="col-lg-4 text-left">
        <div class="col-lg-12" style="margin-bottom:20px;">
          <div class="row">
            <div class="col-lg-2">
              <a class="btn btn-social-icon btn-openid">
                <span class="fa fa-map-marker"></span>
              </a>
            </div>
            <div class="col-lg-10">
              <p>Parvatibai Chowgule College of Arts & Science Gogol-Margao, Goa 403602.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-12" style="margin-bottom:20px;">
          <div class="row">
            <div class="col-lg-2">
              <a class="btn btn-social-icon btn-openid">
                <span class="fa fa-phone"></span>
              </a>
            </div>
            <div class="col-lg-10">
              <p>Phone:0832-2722222 <br/> Fax:0832-2759067</p>
            </div>
          </div>
        </div>
        <div class="col-lg-12" style="margin-bottom:20px;">
          <div class="row">
            <div class="col-lg-2">
              <a class="btn btn-social-icon btn-openid">
                <span class="fa fa-envelope"></span>
              </a>
            </div>
            <div class="col-lg-10">
              <p>principal@chowgules.ac.in</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <h5 class="text-left"><span class="fa fa-copyright"></span> 2017 Parvatibai Chowhule College</h5>
        </div>
        <div class="col-lg-4">
        </div>
        <div class="col-lg-4 text-right">
          <a class="btn btn-social-icon btn-facebook" href="https://www.facebook.com/Parvatibai-Chowgule-College-of-Arts-and-Science-Autonomous-472987226207999/" target="_blank">
            <span class="fa fa-facebook"></span>
          </a>

          <a class="btn btn-social-icon btn-twitter" href="https://twitter.com/chowgulecollege" target="_blank">
            <span class="fa fa-twitter"></span>
          </a>
          <a class="btn btn-social-icon btn-pinterest">
            <span class="fa fa-youtube"></span>
          </a>
        </div>
      </div>
    </div>
  </div>

</footer>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!--script src="http://www.jqueryscript.net/demo/Responsive-jQuery-News-Ticker-Plugin-with-Bootstrap-3-Bootstrap-News-Box/scripts/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script-->
      <script src="js/newsbox.js"></script>
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
