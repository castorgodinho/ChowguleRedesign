<%-- 
    Document   : f_index
    Created on : 23 Apr, 2017, 7:26:42 PM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        
          <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Parvatibai Chowgule College</title>
        <!-- Bootstrap -->
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
              rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
        <link href="<%=request.getContextPath()%>/css/font-awesome.css"
              rel="stylesheet">
        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/datepicker.css">
    </head>
    <body>
        <div class="display-table">
<div class="row display-table-row">
<div
	class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container"
	id="navigation"><%@ include file="sidebar.jsp"%>

</div>
<div class="col-md-10 col-sm-11 display-table-cell v-align"><!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
<%@ include file="header.html"%>
<div class="user-dashboard ">
<div class="container-fluid">

<div class="row">
<div class="col-md-12 card-style"></div>


</div>
</div>
</div>
</div>
</div>

</div>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('[data-toggle="offcanvas"]').click(function() {
			$("#navigation").toggle('slow');
		});

		$('.nav-dropdown').hide();
		$('.nav-dropdown-1').hide();
		$('.nav-dropdown-2').hide();
		$('.nav-dropdown-3').hide();
                $('.nav-dropdown-4').hide();
		$('.nav-dropdown-5').hide();
                
                $('.nav-dropdown-6').hide();
		$('.nav-dropdown-7').hide();
                
                $('.nav-dropdown-8').hide();
		$('.nav-dropdown-9').hide();
                
                $('.nav-dropdown-10').hide();
		$('.nav-dropdown-11').hide();
		$('.nav-dropdown-link').click(function() {
			$('.nav-dropdown').slideToggle();
		});
		$('.nav-dropdown-link-1').click(function() {
			$('.nav-dropdown-1').slideToggle();
		});
		$('.nav-dropdown-link-2').click(function() {
			$('.nav-dropdown-2').slideToggle();
		});
		$('.nav-dropdown-link-3').click(function() {
			$('.nav-dropdown-3').slideToggle();
		});
                $('.nav-dropdown-link-4').click(function() {
			$('.nav-dropdown-4').slideToggle();
		});
                 $('.nav-dropdown-link-5').click(function() {
			$('.nav-dropdown-5').slideToggle();
		});
                $('.nav-dropdown-link-6').click(function() {
			$('.nav-dropdown-6').slideToggle();
		});
                $('.nav-dropdown-link-7').click(function() {
			$('.nav-dropdown-7').slideToggle();
		});
                $('.nav-dropdown-link-8').click(function() {
			$('.nav-dropdown-8').slideToggle();
		});
                $('.nav-dropdown-link-9').click(function() {
			$('.nav-dropdown-9').slideToggle();
		});
                $('.nav-dropdown-link-10').click(function() {
			$('.nav-dropdown-10').slideToggle();
		});
                $('.nav-dropdown-link-11').click(function() {
			$('.nav-dropdown-11').slideToggle();
		});
		$('[data-toggle="offcanvas"]').click(function() {
			$("#navigation").toggleClass("hidden-xs");
		});
	});
</script>
    </body>
</html>
