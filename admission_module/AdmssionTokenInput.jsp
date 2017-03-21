<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="admissionDBClasses.*"%>
<%@ page import="manyToManyTables.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.logging.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Parvatibai Chowgule College</title>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet" href="../css/bootstrap-social.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

</head>
<body>
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="Login" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="loginmodal-container">
				<h1>User Login</h1>
				<br>
				<form>
					<div class="form-group">
						<label>Email ID</label> <input type="email" class="form-control"
							placeholder="Enter your Email">
					</div>
					<div class="form-group">
						<label for="">Password</label> <input type="password"
							class="form-control" placeholder="Password">
					</div>
					<input type="submit" name="login" class="btn btn-warning"
						value="Login">
				</form>

			</div>
		</div>
	</div>
	<%@ include file="../header.html"%>

	

	<%
		Database database = new Database();
		Connection con = database.openConnection();						
		if(request.getParameter("tokennumber") != null){
			int tokennumber = Integer.parseInt(request.getParameter("tokennumber"));
			Student student = new Student(con);
			student.setStudentID(tokennumber);
			Degree degree[] = student.getSelectedDegrees();
			if(degree[0].getDegreeID() == 1){
				request.setAttribute("tokennumber", tokennumber);
				RequestDispatcher dispatcher = request.getRequestDispatcher("AdminFirstYearAdmission.jsp");
				dispatcher.forward( request, response );
				response.sendRedirect("AdminFirstYearAdmission.jsp");
			}else{
				//response.sendRedirect("AdminFirstYearAdmission.jsp");
			}
		}
	%>
	<div class="container" style="margin-top: 250px;">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="margin: 30px 0px;">
		<center><h1>Admissions</h1></center></center>
			<form> 
				<label>Enter Token Number*</label>
				<input class="form-control" type="text" value="" name="tokennumber" required \><br>
				<input class="btn btn-warning" type='submit' value="Fetch Student" />
				
			</form>
		</div>
		<div class="col-md-2"></div>
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
					<li><a href="#">FAQ's</a></li>
				</ul>
			</div>
			<div class="col-lg-2"></div>
			<div class="col-lg-4 text-left">
				<div class="col-lg-12" style="margin-bottom: 20px;">
					<div class="row">
						<div class="col-lg-2">
							<a class="btn btn-social-icon btn-openid"> <span
								class="fa fa-map-marker"></span>
							</a>
						</div>
						<div class="col-lg-10">
							<p>Parvatibai Chowgule College of Arts & Science
								Gogol-Margao, Goa 403602.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-12" style="margin-bottom: 20px;">
					<div class="row">
						<div class="col-lg-2">
							<a class="btn btn-social-icon btn-openid"> <span
								class="fa fa-phone"></span>
							</a>
						</div>
						<div class="col-lg-10">
							<p>
								Phone:0832-2722222 <br /> Fax:0832-2759067
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-12" style="margin-bottom: 20px;">
					<div class="row">
						<div class="col-lg-2">
							<a class="btn btn-social-icon btn-openid"> <span
								class="fa fa-envelope"></span>
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
					<h5 class="text-left">
						<span class="fa fa-copyright"></span> 2017 Parvatibai Chowgule
						College
					</h5>
				</div>
				<div class="col-lg-4"></div>
				<div class="col-lg-4 text-right">
					<a class="btn btn-social-icon btn-facebook"
						href="https://www.facebook.com/Parvatibai-Chowgule-College-of-Arts-and-Science-Autonomous-472987226207999/"
						target="_blank"> <span class="fa fa-facebook"></span>
					</a> <a class="btn btn-social-icon btn-twitter"
						href="https://twitter.com/chowgulecollege" target="_blank"> <span
						class="fa fa-twitter"></span>
					</a> <a class="btn btn-social-icon btn-pinterest"> <span
						class="fa fa-youtube"></span>
					</a>
				</div>
			</div>
		</div>
	</div>

	</footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="http://www.jqueryscript.net/demo/Responsive-jQuery-News-Ticker-Plugin-with-Bootstrap-3-Bootstrap-News-Box/scripts/jquery.bootstrap.newsbox.min.js"
		type="text/javascript"></script>
	<script>
    $(document).ready(function () {
        var index = 1;
        $('.count').html(index);
        var count = $(".result").children().length;
        $('.total').html(count);
        $(".cards").hide();
        $(".cards:nth-child(" + index + ")").show();
        $(".next1").click(function () {
            if (index < count) {
                $(".cards:nth-child(" + index + ")").hide();
                index = index + 1;
                $(".cards:nth-child(" + index + ")").fadeIn(500);
                $('.count').html(index);
            }
        });
        $(".prev1").click(function () {
            if (index > 1) {
                $(".cards:nth-child(" + index + ")").hide();
                index = index - 1;
                $(".cards:nth-child(" + index + ")").fadeIn(500);
                $('.count').html(index);
            }
        });
        
        var flag=1;
        $(window).scroll(function() {
		  if ($(document).scrollTop() > 50) {
			  if(flag==1){
				  flag=0;
				  $("#imgtab").animate({
					  width: "300"
				  }, 50);
				  
			  }
			  
		  } else {
			  if(flag==0){
				  flag=1;
				  $("#imgtab").animate({
					  width: "400"
				  }, 50);
				  
			  }
			  
		  }
});
        $(function () {
            $(".demo1").bootstrapNews({
                newsPerPage: 3,
                autoplay: true,
                pauseOnHover: true,
                direction: 'up',
                newsTickerInterval: 4000,
                onToDo: function () {
                    //console.log(this);
                }
            });
        });
        $(".pr-details").hide();
        $("input[name$='physicallyChallenged']").click(function () {
            if ($(this).attr("value") == "yes") {
                $(".pr-details").fadeIn();

            } else {
                $(".pr-details").fadeOut();
            }
        });

        $(".comp-a-minor").hide();
        $(".comp-a-major2").hide();
        $(".single-major").click(function () {
            $(".comp-a-major").fadeIn();
            $(".comp-a-minor").fadeOut();
            $(".comp-a-major2").hide();
        });
        $(".major-minor").click(function () {
            $(".comp-a-major").fadeIn();
            $(".comp-a-minor").fadeIn();
            $(".comp-a-major2").hide();
        });
        $(".double-major").click(function () {
            $(".comp-a-major").fadeIn();
            $(".comp-a-minor").hide();
            $(".comp-a-major2").fadeIn();
        });
        $(".address-checkbox").click(function () {
            var flag = $('.address-checkbox').prop('checked');
            if (flag == true) {
                $('.address-checkbox').prop('checked', "false");
                $(".pr-address").html($(".co-address").val());
                $(".pr-country").val($(".co-country").val());
                $(".pr-state").attr('value', $(".co-state").val());
                $(".pr-city").attr('value', $(".co-city").val());
                $(".pr-taluka").attr('value', $(".co-taluka").val());
                $(".pr-pincode").attr('value', $(".co-pincode").val());
            } else if (flag == false) {
                $(".pr-address").html("");
                $(".pr-state").attr('value', '');
                $(".pr-city").attr('value', "");
                $(".pr-taluka").attr('value', '');
                $(".pr-pincode").attr('value', '');
            }

        });
        $(".status-married").click(function () {
            $(".father-name").html("Spouse's Name");
            $(".father-qualification").html("Spouse's Qualification");
            $(".father-occupation").html("Spouse's Occupation");
            $(".father-phone").html("Spouse's Phone Number");
            $(".mother-inputs").prop('required',false);
            $(".mother-details").fadeOut();
        });
        $(".status-unmarried").click(function () {
            $(".father-name").html("Father's Name");
            $(".father-qualification").html("Father's Qualification");
            $(".father-occupation").html("Father's Occupation");
            $(".father-phone").html("Father's Phone Number");
            $(".mother-inputs").prop('required',true);
            $(".mother-details").fadeIn();
        });
//admisison jquery
        $(".loading").hide();
//All global variables declared

        /*
         setStructure function will set the number of dropdown for subjects required
         according to cource structure selected eg (MM, Mm, M).
         */


        function populateSubjectDropdown(courceSeleted) {
        	$.ajax({
                method: "get",
                url: "http://localhost:8080/ChowguleCollegeRedesign/AdmissionAJAX",
                data: {"mscCourseid": courceSeleted},
                success: function (data) {;
                	$(".subject-div").empty();
                    subJSON = JSON.parse(data);
                    $(".subject-div").append("<option disabled selected value>select a subject</option>");
                    $.each(subJSON, function (index, value) {
                        $.each(value, function (index1, value1) {
                            $(".subject-div").append("<option value='" + value1[1] + "'>" + value1[0] + "</option>");
                        });
                    });

                },
                error: function () {
                    alert("Error. Please select a course");
                }
            });
        }


        $(".course-dropdown").change(function () {
        	populateSubjectDropdown($(this).val());
        });
 

    });

</script>
	<script src="js/bootstrap.min.js"></script>
	
	
</body>
</html>
