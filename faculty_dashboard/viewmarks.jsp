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
  <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
  <link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
</head>
<body>
  <body class="home">
    <div class="display-table">
      <div class="row display-table-row">
        <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box card-style-container" id="navigation">
          <%@ include file="sidebar.html"%>
        </div>
        <div class="col-md-10 col-sm-11 display-table-cell v-align">
          <%@ include file="header.html"%>
          
            <div class="user-dashboard ">
              <div class="container-fluid">

                <div class="row">
                  <div class="">
                    <form action="" method="">
                    <div class="col-md-12 card-style attendance-container " >
                      <h3 class="text-center">VIEW MARKS</h3>
                      <div class="row"> 
                        <div class="col-md-3 ">
                          <div class="form-group">
                            <label for="sel1">Select Paper:</label>
                            <select class="form-control" id="sel1">
                              <option>ENGLISH</option>
                              <option>HINDI</option>
                              <option>MARATHI</option>
                              <option>KONKANI</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-3 ">
                          <div class="form-group">
                            <label for="sel1">Select Exam:</label>
                            <select class="form-control" id="sel1">
                              <option>ISA</option>
                              <option>END SEM</option>
                              
                            </select>
                          </div>
                        </div>
						<div class="col-md-3">
								<div class="form-group">
                            <label for="sel1">Enter Academic Year:</label>
                            <input type="number" Value="" class="form-control pull-right" placeholder="Enter Academic Year" required>
                          </div>
								</div>
								<div class="col-md-2 ">
								<label for="sel1">&nbsp;</label>
							<input type="button" class="btn btn-warning pull-right btn-block" value="SUBMIT">
							</div>

                        </div>



                      <div class="attend-scroll">
                        <div class="col-md-12">
                  				<div class="panel panel-success">
                            <h3 class="text-center">VIEW MARKS</h3>
                  					<div class="panel-body">
                              <div class="col-md-6 col-md-offset-3">
                                <input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
                              </div>

                  					</div>
                  					<table class="table table-hover" id="task-table">
                  						<thead>
                  							<tr>
                  							<th>Roll Number</th>
                  								<th>Student Name</th>
                  								<th>Marks</th>
                  								
                  							</tr>
                  						</thead>
                  						<tbody>
                  							<tr>
                  								<td>151501131</td>
                  								<td>Tushar</td>
                  								<td>65</td>
                  							</tr>
                  							<tr>
                  								<td>151501126</td>
                  								<td>Deepraj</td>
                  								<td>75</td>
                  							</tr>
                  						</tbody>
                  					</table>
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
        </div>
      </div>
      <%@ include file="footer.html"%>
      <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
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
      $(document).ready(function(){
        $('[data-toggle="offcanvas"]').click(function(){
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

      </script>
    </body>
    </html>
