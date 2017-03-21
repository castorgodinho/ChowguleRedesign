<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" ="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Parvatibai Chowgule College Autonomous</title>
  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="css/bootstrap-social.css">
  <link rel="stylesheet" href="css/blueimp-gallery.css">
  <link rel="stylesheet" href="css/blueimp-gallery-indicator.css">
  <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
  <link type="text/css" rel=”stylesheet” href="https://calendar.google.com/calendar/render#main_7/969ff39784188d8d017a0c60c8f2558aembedcompiled_fastui.css">
  <script type="text/javascript" src="https://www.google.com/calendar/969ff39784188d8d017a0c60c8f2558aembedcompiled__en_gb.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <link rel='stylesheet' href="css/fullcalendar.css" />
  <link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
</head>
<body>
<div class="pcc-loader">
    <img src="img/spcc.png" class="load-img">
    <div class="loader loader-default is-active"></div>
  </div>

	<!--  This is where the header goes -->
	<%@ include file="header.html" %>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="img/05.jpg">
          </div>

          <div class="item">
            <img src="img/02.jpg">
          </div>

          <div class="item">
            <img src="img/04.jpg">
          </div>

          <div class="item">
            <img src="img/05.jpg">
          </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      <div class="container">
        <div class="row feeds">
          <div class="col-lg-8 card-style newsfeed">
            <h3 class="text-center"><i class="fa fa-bars" aria-hidden="true"></i>&nbsp;NEWSFEED</h3><hr/>
            <div class="row">
              <div class="col-md-12">
                <div class="panel panel-default">
                  <!--div class="panel-heading"> <span class="glyphicon glyphicon-list-alt"></span><b>News</b></div-->
                  <div class="">
                    <div class="col-lg-12" style="background:#fff;">
                      <ul class="demo1">
                        <li class="news-item">
                          <table>
                            <tr>
                              <td>
                                <div class="card-style">
                                  <div class=" row">
                                    <div class="col-lg-2 col-md-2 col-sm-2  card-img">
                                      <h1 class="text-center feed-date">17</h1>
                                      <p class="text-center feed-month">FEB</p>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-10">
                                      <a href="#"><h5 class="media-heading">T.Y.B.A/B.Sc. SEM VI(Regular) & SEM V (Repeat) EXAMINATION 2017</h5></a>
                                      <button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#modal-fullscreen">Read More</button>
                                      <div class="modal modal-fullscreen fade" id="modal-fullscreen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                          <div class="modal-content">
                                            <div class="modal-header">
                                              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                              <h4 class="modal-title" id="myModalLabel">T.Y.B.A/B.Sc. SEMESTER VI(Regular) & SEMESTER V (Repeat) EXAMINATION Of April/May 2017</h4>
                                            </div>
                                            <div class="modal-body">
<p>T.Y.B.A/B.Sc. SEMESTER VI(Regular) & SEMESTER V (Repeat) EXAMINATION Of April/May 2017</p>
                                            </div>
                                            <div class="modal-footer">
                                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div></td>
                              </tr>
                            </table>
                          </li><li style="" class="news-item">
                            <table>
                              <tr>
                                <td>
                                  <div class="card-style">
                                    <div class=" row">
                                      <div class="col-lg-2 col-md-2 col-sm-2 card-img">
                                        <h1 class="text-center feed-date">16</h1>
                                        <p class="text-center feed-month">FEB</p>
                                      </div>
                                      <div class="col-lg-10 col-md-10 col-sm-10">
                                        <a href="#"><h5 class="media-heading">Madgaon School Complex - Millionaire Deposit Scheme</h5></a>
                                        <button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#modal-fullscreen2">Read More</button>
                                      </div>
                                      <div class="modal modal-fullscreen fade" id="modal-fullscreen2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                          <div class="modal-content">
                                            <div class="modal-header">
                                              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                              <h4 class="modal-title" id="myModalLabel">Madgaon School Complex - Millionaire Deposit Scheme</h4>
                                            </div>
                                            <div class="modal-body">
<a href="#">Click here to download the attachement</a>
                                            </div>
                                            <div class="modal-footer">
                                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </li><li style="" class="news-item">
                            <table>
                              <tr>
                                <td>
                                  <div class="card-style">
                                    <div class=" row">
                                      <div class="col-lg-2 col-lg-2 col-sm-2 card-img">
                                        <h1 class="text-center feed-date">14</h1>
                                        <p class="text-center feed-month">FEB</p>
                                      </div>
                                      <div class="col-lg-10 col-md-10 col-sm-10">
                                        <a href="#"><h5 class="media-heading">	Congratulations Aarati Joshi!! </h5></a>
                                        <button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#modal-fullscreen3">Read More</button>
                                      </div>
                                      <div class="modal modal-fullscreen fade" id="modal-fullscreen3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                          <div class="modal-content">
                                            <div class="modal-header">
                                              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                              <h4 class="modal-title" id="myModalLabel">	Congratulations Aarati Joshi!! </h4>
                                            </div>
                                            <div class="modal-body">
                                              <p>Congratulations Aarati Joshi!! Aarati Joshi from SYBA selected by Waseda University, Tokyo, Japan for one year diploma course with scholarship</p>
<a href="#">Click here to download the attachement</a>
                                            </div>
                                            <div class="modal-footer">
                                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </tr>
                              </table>
                            </li><li style="display:none;" class="news-item">
                              <table>
                                <tr>
                                  <td>
                                    <div class="card-style">
                                      <div class=" row">
                                        <div class="col-lg-2 col-sm-2 col-md-2 card-img">
                                          <h1 class="text-center feed-date">13</h1>
                                          <p class="text-center feed-month">FEB</p>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-10">
                                          <a href="#"><h5 class="media-heading">	Notice to T.Y B.A/ B.Sc. students</h5></a>
                                          <button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#modal-fullscreen">Read More</button>
                                        </div>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                              </table>
                            </li><li style="display:none;" class="news-item">
                              <table>
                                <tr>
                                  <td>
                                    <div class="card-style">
                                      <div class=" row">
                                        <div class="col-lg-2 col-md-2 col-sm-2 card-img">
                                          <h1 class="text-center feed-date">10</h1>
                                          <p class="text-center feed-month">FEB</p>
                                        </div>
                                        <div class="col-lg-10 col-sm-10 col-md-10">
                                          <a href="#"><h5 class="media-heading">	Swacch Bharat Pakhwada Valedictory Function</h5></a>
                                          <button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#modal-fullscreen">Read More</button>
                                        </div>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                              </table>
                            </li><li style="display:none;" class="news-item">
                              <table>
                                <tr>
                                  <td>
                                    <div class="card-style">
                                      <div class=" row">
                                        <div class="col-lg-2 col-md-2 col-sm-2 card-img">
                                          <h1 class="text-center feed-date">1</h1>
                                          <p class="text-center feed-month">FEB</p>
                                        </div>
                                        <div class="col-lg-10 col-sm-10 col-md-10">
                                          <a href="#"><h5 class="media-heading">Holiday in the month of February 2017</h5></a>
                                          <button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#modal-fullscreen">Read More</button>
                                        </div>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                              </table>
                            </li><li style="display:none;" class="news-item">
                              <table>
                                <tr>
                                  <td>
                                    <div class="card-style">
                                      <div class=" row">
                                        <div class="col-lg-2 col-sm-2 col-md-2 card-img">
                                          <h1 class="text-center feed-date">16</h1>
                                          <p class="text-center feed-month">JAN</p>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-10 ">
                                          <a href="#"><h5 class="media-heading">Study Experiment at Chowgule College</h5></a>
                                          <button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#modal-fullscreen">Read More</button>
                                        </div>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                              </table>
                            </li></ul>
                            <div class="col-lg-12">
                              <p class="text-center"><a href="feed2.html">More News</a></p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-12">
                        <!--div class="panel-footer">
                        <ul class="pagination pull-right" style="margin: 0px;">
                        <li><a href="#" class="prev"><span class="glyphicon glyphicon-chevron-down"></span></a></li>
                        <li><a href="#" class="next"><span class="glyphicon glyphicon-chevron-up"></span></a></li>
                      </ul><div class="clearfix"></div>
                    </div-->
                  </div>


                </div>

              </div>

            </div>

            <div class="col-lg-4  card-style newsletter">
              <h3 class="text-center"><i class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp;NEWSLETTER</h3><hr/>
              <div class="row">
                <div class="col-lg-12">
                  <div class="card-style media-news">
                      <div class="row">
                        <div class="col-md-12">
                          <h4><a href="#" class="media-heading "><i class="fa fa-newspaper-o" aria-hidden="true"></i> &nbsp;Botany Newsletter Issue 1</a></h4>
                          <p class="date-time">Posted on 22th February 2017</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-12">
                    <div class="card-style media-news">
                        <div class="row">
                          <div class="col-md-12">
                            <h4><a href="#" class="media-heading "><i class="fa fa-newspaper-o" aria-hidden="true"></i> &nbsp;	Computer Science Volume 8 Issue 2</a></h4>
                            <p class="date-time">Posted on 18th march 2017</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-12">
                      <div class="card-style media-news">
                          <div class="row">
                            <div class="col-md-12">
                              <h4><a href="#" class="media-heading "><i class="fa fa-newspaper-o" aria-hidden="true"></i> &nbsp;Tabula Rasa Newsletter VOL XI ISSUE 2</a></h4>
                              <p class="date-time">Posted on 15th February 2017</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-12">
                        <div class="card-style media-news">
                            <div class="row">
                              <div class="col-md-12">
                                <h4><a href="#" class="media-heading "><i class="fa fa-newspaper-o" aria-hidden="true"></i> &nbsp;Geographia Volume IX Issue 3</a></h4>
                                <p class="date-time">Posted on 12th February 2017</p>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-12">
                          <div class="card-style media-news">
                              <div class="row">
                                <div class="col-md-12">
                                  <h4><a href="#" class="media-heading "><i class="fa fa-newspaper-o" aria-hidden="true"></i> &nbsp;	ZOOBUZZ volume 9 issue 3</a></h4>
                                  <p class="date-time">Posted on 12th Febrauary 2017</p>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-lg-12">
                            <div class="card-style media-news">
                                <div class="row">
                                  <div class="col-md-12">
                                    <h4><a href="#" class="media-heading "><i class="fa fa-newspaper-o" aria-hidden="true"></i> &nbsp;	BIOBYTES Volume 7 Issue 2</a></h4>
                                    <p class="date-time">Posted on 7th Feb 2017</p>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-lg-12">
                              <div class="card-style media-news">
                                  <div class="row">
                                    <div class="col-md-12">
                                      <h4><a href="#" class="media-heading "><i class="fa fa-newspaper-o" aria-hidden="true"></i> &nbsp;	Geographia Volume IX Issue 4</a></h4>
                                      <p class="date-time">Posted on 27th January 2017</p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                          </div>
                        </div>

            <div class="col-lg-12 card-style">
              <h2 class="text-center"><i class="fa fa-picture-o" aria-hidden="true"></i>&nbsp; GALLERY</h2><hr/>
              <div class="col-lg-6" style="min-height:532px;">
                <h3>LATEST EVENT</h3><hr/>
                <img src="img/11.jpg" class="img-responsive thumbnail">
                <h3 class="text-center">I-RIX 2016</h3>
                <h5 class="text-center">Posted on 11 Feb 2017</h5>
                  <p class="text-center"><a href="view_gallery.html" class="btn btn-default">View Gallery</a></p><br/>
              </div>
              <div class="col-lg-6 card-style-container" >
                <h3>MORE EVENTS</h3><hr/>
                <div class="row mCustomScrollbar" style="overflow-x:scroll;height:446px;" data-mcs-theme="minimal-dark">
                  <div class="col-lg-12 card-style">
                    <div class="col-lg-6 ">
                      <img src="img/20.jpg" class="img-responsive thumbnail">
                    </div>
                    <div class="col-lg-6">
                      <h3 class="text-center">Geographize 2017</h3>
                      <h5 class="text-center">Posted on 16 Feb 2017</h5>
                      <p class="text-center"><a href="view_gallery_2.html" class="btn btn-default">View Gallery</a></p><br/>
                    </div>
                  </div>
                  <div class="col-lg-12 card-style">
                    <div class="col-lg-6 ">
                      <img src="img/22.jpg" class="img-responsive thumbnail">
                    </div>
                    <div class="col-lg-6">
                      <h3 class="text-center">Tathastu 2017</h3>
                      <h5 class="text-center">Posted on 11 Feb 2017</h5>
                      <p class="text-center"><a href="view_gallery_3.html" class="btn btn-default">View Gallery</a></p><br/>
                    </div>
                  </div>
                  <div class="col-lg-12 card-style">
                    <div class="col-lg-6 ">
                      <img src="img/28.jpg" class="img-responsive thumbnail">
                    </div>
                    <div class="col-lg-6">
                      <h3 class="text-center">Mine Kraft 2017</h3>
                      <h5 class="text-center">Posted on 6 Feb 2017</h5>
                      <p class="text-center"><a href="view_gallery_4.html" class="btn btn-default">View Gallery</a></p><br/>
                    </div>
                  </div>
                  <div class="col-lg-12 card-style">
                    <div class="col-lg-6 ">
                      <img src="img/01.jpg" class="img-responsive thumbnail">
                    </div>
                    <div class="col-lg-6">
                      <h3 class="text-center">Nebula 2016</h3>
                      <h5 class="text-center">Posted on 11 Feb 2017</h5>
                      <p class="text-center"><a href="view_gallery.html" class="btn btn-default">View Gallery</a></p><br/>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-12 card-style">
              <div class="col-lg-6  " style="padding-left:0px;padding-right:0px;">
                <h3 class="text-center"><i class="fa fa-picture-o" aria-hidden="true"></i>&nbsp; CALENDER</h3><hr/>

                <div id='calendar'></div>
                </div>

            </div>


            <div class="col-lg-12 card-style about-us">
              <h2 class="text-center"><i class="fa fa-university" aria-hidden="true"></i>&nbsp;ABOUT US</h2>
              <p class="text-justify">
                Parvatibai Chowgule College is a premier institute in the State of Goa that offers courses in Arts and Science at the Graduate,
                and Postgraduate and Ph.D. levels. It was re-accredited in May 2014 in the 3rd cycle of accreditation by the National Assessment
                and Accreditation Council (NAAC) with Grade ‘A’ with a cumulative grade point average (CGPA) score of 3.41 on a scale ranging
                from 0 to 4. Till date this is highest for any College in Goa. The College has also been conferred with Autonomy by UGC in June 2014.
                The only College in Goa to be Autonomous. The Goa University adjudged the College as the “Best Affiliated College” at the time of its
                Silver Jubilee in the year 2009. Chowgule College was also awarded the Best Educational Institute award by Business Goa at their
                award ceremony awards for Corporate Excellence in 2014
              </p>
            </div>
            <div class="col-lg-12 card-style about-us">
              <h2 class="text-center"><i class="fa fa-flag-o" aria-hidden="true"></i>&nbsp; AUTONOMY</h2>
              <p class="text-justify">
                To achieve excellence in education the College decided to go for Academic Autonomy and it was granted by UGC and Goa University
                in August 2014. Autonomy will provide academic freedom to the College to design its own programmes, courses, methods of instruction
                and the evaluation system. Autonomy will promote healthy practices such as community service and extension activities for the benefit
                of society. Under Autonomy the College has proposed Choice Based Credit System (CBCS) and the Semester pattern of study.
                The main thrust is to develop skills for employment through internships. To sum up, the College is marching towards global
                leadership in imparting relevant education of high standards in a disciplined and conducive environment.
                Chowgule College has been a pioneer in higher education since Goa’s liberation.
                The College believes that constant renewal is the key to excellence.
                The path forward sees us building the community and assisting in nation building by imparting quality higher education.
              </p>
            </div>
          </div>
        </div>
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
<script src="js/jquery.mCustomScrollbar.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<!--script src="http://www.jqueryscript.net/demo/Responsive-jQuery-News-Ticker-Plugin-with-Bootstrap-3-Bootstrap-News-Box/scripts/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script-->
<script src="js/newsbox.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/gcal.js"></script>
<script src="lib/moment.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script>

$(document).ready(function(){

  $('#calendar').fullCalendar({
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    googleCalendarApiKey: 'AIzaSyA4FdC9lSUHObAdGkQOj3PYsG9NtTgpsKc',
    events: {
        googleCalendarId: '2shar001@gmail.com'
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

  (function($){
    $(window).on("load",function(){
      $(".content").mCustomScrollbar();
      axis:"x";
    });
  })(jQuery);



});
$(".modal-fullscreen").on('show.bs.modal', function () {
  setTimeout( function() {
    $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
  }, 0);
});
$(".modal-fullscreen").on('hidden.bs.modal', function () {
  $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
});
var flag=1;
$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
	  if(flag==1){
		  flag=0;
		  $(".imgtab").animate({
			  width: "300"
		  }, 50);
		  
	  }
	  
  } else {
	  if(flag==0){
		  flag=1;
		  $(".imgtab").animate({
			  width: "400"
		  }, 50);
		  
	  }
	  
  }
});
$(window).load(function() {
// Animate loader off screen
//$('html, body').css('overflow', 'auto');
$(".pcc-loader").delay(2000).fadeOut("fast");

});

</script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="js/blueimp-gallery.min.js"></script>
<script src="js/blueimp-gallery-video.js"></script>
<script src="js/blueimp-gallery-youtube.js"></script>
</body>
</html>