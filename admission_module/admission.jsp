<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <input type="submit" name="login" class="btn btn-warning" value="Login">
        </form>

      </div>
    </div>
  </div>
 <%@ include file="../header.html" %>

  <div class="container" style="margin-top:250px;">
    <h1 class="text-center">AUTONOMOUS ADMISSION </h1><hr/>
    <div class="panel-group" id="accordion">
   <div class="panel panel-primary">
     <div class="panel-heading">
       <h3 class="panel-title" data-toggle="collapse" data-parent="#accordion" href="#collapse1">
         ADMISSION
       </h3>
     </div>
     <div id="collapse1" class="panel-collapse collapse in">
       <div class="panel-body">
         <div class="list-group row ">
           <div class="col-md-4">
            <li class="list-group-item"><a href="firstYearAdmissionForm.jsp">FYBA/BSC</a></li>
           </div>
           <div class="col-md-4">
            <li class="list-group-item"><a href="sy_admission.html">SYBA/BSC</a></li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item">TYBA/BSC</li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item"><a href="PGAdmissionPage.jsp">PG PART 1</a></li>
           </div>
           <div class="col-md-4">
            <li class="list-group-item">PG PART 2</li>
           </div>
         </div>
         <h3 class="text-center">MERIT LIST</h3><hr width="85%"/>
         <div class="list-group row ">
           <div class="col-md-4">
            <li class="list-group-item"><a href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> FYBA/BSC</a></li>
           </div>
           <div class="col-md-4">
            <li class="list-group-item"><a href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> SYBA/BSC</a></li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> TYBA/BSC</li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item"><a href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> PG PART 1</a></li>
           </div>
           <div class="col-md-4">
            <li class="list-group-item"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> PG PART 2</li>
           </div>
         </div>
       </div>
     </div>
   </div>
   <div class="panel panel-primary">
     <div class="panel-heading">
       <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion" href="#collapse2">
         FEE STRUCTURE
       </h4>
     </div>
     <div id="collapse2" class="panel-collapse collapse">
       <div class="panel-body">
         <div class="list-group row ">
           <div class="col-md-4">
              <li class="list-group-item">FYBA/BSC</li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item">SYBA/BSC</li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item">SYBA/BSC</li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item">PG PART 1</li>
           </div>
           <div class="col-md-4">
            <li class="list-group-item">PG PART 2</li>
           </div>
         </div>
       </div>
     </div>
   </div>
   <div class="panel panel-primary">
     <div class="panel-heading">
       <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion" href="#collapse3">
         PROSPECTUS
       </h4>
     </div>
     <div id="collapse3" class="panel-collapse collapse">
       <div class="panel-body">
         <div class="list-group row ">
           <div class="col-md-4">
              <li class="list-group-item">FYBA/BSC</li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item">SYBA/BSC</li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item">SYBA/BSC</li>
           </div>
           <div class="col-md-4">
             <li class="list-group-item">PG PART 1</li>
           </div>
           <div class="col-md-4">
            <li class="list-group-item">PG PART 2</li>
           </div>
         </div>
       </div>
     </div>
   </div>
  </div>
  <div class="panel panel-primary">
    <div class="panel-heading">NOTE</div>
    <div class="panel-body">
      <h2 class="text-center">Mode of Payment & Documents Required</h2>
      NOTE : No Partial Payment is allowed.Payment should be done after meeting the counselor in the college.</br>
      The Fees can be paid in any of the following manner:-
      <ul class="list-group">
   <li class="list-group-item">1) Pay your fees by Demand Draft(DD) drawn in favour of Principal, Parvatibai Chowgule College, Margao. </li>
   <li class="list-group-item">2) Through Swiping Machine by using Debit or Credit Cards. (1.5% on Total Fees Bank Charges Applicable ) </li>
   <li class="list-group-item">3) Direct transfer of Amount to our Account Number: 100610210000084 through NEFT or RTGS. Beneficiary - " Parvatibai Chowgule College of Arts & Science, Miscellaneous"
  IFSC Code BKID0001006.Branch code :1006. Banker - Bank of India, Branch- Margao Goa . </li>
  <li class="list-group-item">4) Through Net Banking :- Transfer of Funds from your Bank A/c to our Bank Account Number: 100610210000084. IFSC Code BKID0001006.Branch code :1006. Banker - Bank of India, Branch- Margao Goa . </li>
  </ul>
    </div>
  </div>
  </div>
	<%@ include file="../footer.html" %>
  
  
</body>
</html>