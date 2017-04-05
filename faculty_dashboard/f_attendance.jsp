<%@page import="Attendance.Teacher"%>
<%@page import="Attendance.Lecture"%>
<%@page import="java.sql.Connection"%>
<%@page import="Admission.Database"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
<body class="home">
<div class="display-table">
<div class="row display-table-row">
<div
	class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container"
	id="navigation"><%@ include file="sidebar.html"%>
</div>
<div class="col-md-10 col-sm-11 display-table-cell v-align"><%@ include
	file="header.html"%>
<div class="user-dashboard ">
<div class="container-fluid">
    
    <%
        Database database=new Database();
        Connection con=database.openConnection();
        if(request.getParameter("insertButton")!=null){
            Lecture lecture=new Lecture(con);
            Teacher teacher=new Teacher(con);
            lecture.setDate(request.getParameter("examDate"));
            lecture.setTime(request.getParameter("examTime"));
            teacher.setTeacherID(1);
            lecture.setTeacher(teacher);
            lecture.insertLecture();
        }
        %>
<form>
<div class="row">
<div class="">
<div class="col-md-12 card-style attendance-container ">
<h3 class="text-center">ATTENDANCE</h3>

<div class="row">
<div class="col-md-3">
<div class="form-group"><label for="dtp_input2"
	class=" control-label">Date Picking</label>
<div class="input-group date form_date " data-date=""
	data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
	data-link-format="yyyy-mm-dd"><input class="form-control"
	size="16" type="text" name="examDate" id="examDate" value="">

<span class="input-group-addon"><span
	class="glyphicon glyphicon-calendar"></span></span></div>
<input type="hidden" id="dtp_input2" value="" /><br />
</div>

</div>
<div class="col-md-3">
<div class="form-group"><label for="dtp_input3"
	class=" control-label">Time Picking</label>
<div class="input-group date form_time" data-date=""
	data-date-format="HH:ii p" data-link-field="dtp_input3"
	data-link-format="HH:ii"><input class="form-control" size="16"
	type="text" name="examTime" id="examTime" value=""> <span
	class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
</div>
<input type="hidden" id="dtp_input3" value="" /><br />
</div>

</div>


<div class="col-md-3 ">

<div class="form-group"><label for="sel1">Enter Academic
Year:</label> <input type="text" Value="" class="form-control pull-right"
	placeholder="Enter Academic Year" required></div>
</div>
<div class="col-md-3"><label for="sel1">&nbsp;</label> <input
	type="submit" class="btn btn-warning pull-right btn-block "
        value="SUBMIT" name="insertButton" id="insertButton" ></div>
</div>

<div class="attend-scroll">
<div class="col-md-12">
<div class="panel panel-success">
<h3 class="text-center">ATTENDANCE DIRECTORY</h3>
<div class="panel-body">
<div class="col-md-6 col-md-offset-3"><input type="text"
	class="form-control" id="task-table-filter" data-action="filter"
	data-filters="#task-table" placeholder="Filter Tasks" /></div>

</div>
<table class="table table-hover" id="task-table">
	<thead>
		<tr>
			<th>Roll No.</th>
			<th> Name</th>
			<th>Attendance</th>		
			<th>Edit</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1515001131</td>
			<td>Tushar Vaskar</td>
			<td>
			<div><input id="checkbox-1" class="checkbox-custom"
				name="checkbox-1" type="checkbox" checked> <label
				for="checkbox-1" class="checkbox-custom-label"></label></div>
			</td>
			<td>
			<button type='button' class='edit-btn btn btn-warning col-md-6'
				name='edit'><i class='fa fa-pencil-square-o'
				aria-hidden='true'></i>&nbsp; EDIT</button>
			</td>
			</tr>
			<tr>
			<td>1515001126</td>
			<td>Deepraj Naik</td>
			<td>
			<div><input id="checkbox-2" class="checkbox-custom"
				name="checkbox-2" type="checkbox" checked> <label
				for="checkbox-2" class="checkbox-custom-label"></label></div>
			</td>
			<td>
			<button type='button' class='edit-btn btn btn-warning col-md-6'
				name='edit'><i class='fa fa-pencil-square-o'
				aria-hidden='true'></i>&nbsp; EDIT</button>
			</td>
			</tr>
	</tbody>
</table>
</div>
</div>

</div>

</div>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</div>

<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script>
(function () {
    'use strict';
    var $ = jQuery;
    $.fn.extend({
        filterTable: function () {
            return this.each(function () {
                $(this).on('keyup', function (e) {
                    $('.filterTable_no_results').remove();
                    var $this = $(this),
                            search = $this.val().toLowerCase(),
                            target = $this.attr('data-filters'),
                            $target = $(target),
                            $rows = $target.find('tbody tr');

                    if (search == '') {
                        $rows.show();
                    } else {
                        $rows.each(function () {
                            var $this = $(this);
                            $this.text().toLowerCase().indexOf(search) === -1 ? $this.hide() : $this.show();
                        })
                        if ($target.find('tbody tr:visible').size() === 0) {
                            var col_count = $target.find('tr').first().find('td').size();
                            var no_results = $('<tr class="filterTable_no_results"><td colspan="' + col_count + '">No results found</td></tr>')
                            $target.find('tbody').append(no_results);
                        }
                    }
                });
            });
        }
    });
    $('[data-action="filter"]').filterTable();
})(jQuery);

$(function () {
    // attach table filter plugin to inputs
    $('[data-action="filter"]').filterTable();

    $('.container').on('click', '.panel-heading span.filter', function (e) {
        var $this = $(this),
                $panel = $this.parents('.panel');

        $panel.find('.panel-body').slideToggle();
        if ($this.css('display') != 'none') {
            $panel.find('.panel-body input').focus();
        }
    });
    $('[data-toggle="tooltip"]').tooltip();
})
	$(document).ready(function() {

		$('[data-toggle="offcanvas"]').click(function() {
			$("#navigation").toggleClass("hidden-xs");
		});
		$('.nav-dropdown-1').hide();
        $('.nav-dropdown-2').hide();   
        $('.nav-dropdown-link-1').click(function () {
            $('.nav-dropdown-1').slideToggle();
            
        });
        $('.nav-dropdown-link-2').click(function () {
            $('.nav-dropdown-2').slideToggle();
            
        });

	});
	$('.form_date').datetimepicker({
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0
	});
	$('.form_time').datetimepicker({
		language : 'fr',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 1,
		minView : 0,
		maxView : 1,
		forceParse : 0,
		showMeridian : 1

	});
</script>

<script src="../js/bootstrap.min.js"></script>
</body>
</html>
