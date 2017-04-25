<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="admissionDBClasses.*"%>
<%@ page import="Admission.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.logging.*"%>
<%@ page import="java.util.*"%>
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
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-social.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/blueimp-gallery.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/blueimp-gallery-indicator.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">

</head>
<body>
<%@ include file="../header.jsp"; %>
  <div class="pcc-loader">
    <img src="/ChowguleCollegeRedesign/img/spcc.png" class="load-img">
    <div class="loader loader-default is-active"></div>
  </div>
  <%
  	out.println("Hello world"+request.getContentType());
  %>
	
	<%
	
	if(request.getParameter("degree") != null ){
		int DEGREE_ID = 1;
		int YEAR_TYPE = 1; 
		Database database = new Database();
		Connection connection = database.openConnection();
		System.out.println("Processing admission request.");
		System.out.println("Adding new student");
		/*
			Getting student details and creating student object will all its attributes
		*/
		String fullName=request.getParameter("fullName");
		String dateOfBirth=request.getParameter("dateOfBirth");
		String placeOfBirth=request.getParameter("birthPlace");
		String gender=request.getParameter("gender");
		String bloodGroup=request.getParameter("bloodGroup");
		String nationality=request.getParameter("nationality");
		String religion=request.getParameter("religion");
		String caste=request.getParameter("caste");
		String martialStatus=" ";
		String physciallyChallenged=request.getParameter("physicallyChallenged");
		String details=request.getParameter("details");
		String uniRegNumber=request.getParameter("uniRegNumber");
		String status="false";
		String userName="-";
		String password="-";
		String familyMonthlyIncome=request.getParameter("familyMonthlyIncome");
		String rollNumber="-";
		Users user = new Users(
				connection,
				0,
				"",
				"",
				3);
		int userID = user.insertUser();
		Student newStudent = new Student(
				connection, 
				0, 
				fullName, 
				dateOfBirth, 
				placeOfBirth, 
				gender, 
				bloodGroup,
				nationality,
				religion,
				caste,
				martialStatus,
				physciallyChallenged,
				uniRegNumber,
				status,
				familyMonthlyIncome,
				"",
				"",
				userID);
		//AdmissionAdmin admin = new AdmissionAdmin(connection);

		System.out.println("Inserting student to database");
		System.out.println("Student object details..");
		System.out.println(fullName +"\n"+  dateOfBirth  +"\n"+ placeOfBirth  +"\n"+ gender 
				+"\n"+ bloodGroup +"\n"+  nationality  +"\n"+ religion +"\n"+ 
				caste +"\n"+  martialStatus +"\n"+ physciallyChallenged +"\n"+ 
				uniRegNumber +"\n"+"off"+"\n"+ familyMonthlyIncome);
		
		
		int studentid = newStudent.insertStudent();
			/*
				Getting parent details and insert into database
			*/
			System.out.println("Unmarried student---");
		    
			String fatherName=request.getParameter("fatherName");
			String  fatherEmail=request.getParameter("fatherEmail");
			String fatherOccupation=request.getParameter("fatherOccupation");
			String fatherNumber=request.getParameter("fatherNumber");
			String motherName=request.getParameter("motherName");
			String motherOccupation=request.getParameter("motherOccupation");
			String motherEmail=request.getParameter("motherEmail");
			String motherNumber=request.getParameter("motherNumber");
			System.out.println(fatherName +"\n"+ fatherEmail +"\n"+ fatherOccupation +"\n"+ fatherNumber +"\n"+ motherName +"\n"+ motherEmail);
			System.out.println(motherOccupation +"\n"+ motherNumber);
			ParentGaurdian mother = new ParentGaurdian(
		    		connection,
		    		0,
		    		motherName,
		    		motherOccupation,
		    		motherNumber,
		    		"Mother",
		    		studentid,
		    		motherEmail
		    		);
		    ParentGaurdian father = new ParentGaurdian(
		    		connection,
		    		0,
		    		fatherName,
		    		fatherOccupation,
		    		fatherNumber,
		    		"father",
		    		studentid,
		    		fatherEmail);
		    mother.insertParentGaurdian(studentid);
		    father.insertParentGaurdian(studentid);
		
		/*
			Get the contact information of the student
		*/
		System.out.println("Contact Information----");
		String contactMobileNumber=request.getParameter("contactMobileNumber");
		String alternativeNumber=request.getParameter("alternativeNumber");
		String emailID=request.getParameter("emailID");
		System.out.println(contactMobileNumber +"\n"+ alternativeNumber +"\n"+ emailID);
		/*
			If permanentAddress is null ie the permernant address checkbox is checked
			than the permernant and corresponmdace address is the same.
		*/
		if(request.getParameter("permanentAddress") != null){
			System.out.println("Corresponding address same as permanent address--------------");
			System.out.println("Adding permanent address");
			String fullAddress=request.getParameter("fullAddress");
			String country=request.getParameter("country");
			String state=request.getParameter("state");
			String cityTown=request.getParameter("cityTown");
			String taluka=request.getParameter("taluka");
			String pincode=request.getParameter("pincode");

			ContactInfo contact = new ContactInfo(
					connection,
					0,
					fullAddress,
					country,
					state,
					cityTown,
					taluka,
					pincode,
					contactMobileNumber,
					alternativeNumber,
					emailID,
					"permanent",
					studentid
					);
			contact.insertContactInfo(studentid);
			
			System.out.println(country +"\n"+ state  +"\n"+cityTown +"\n"+taluka  +"\n"+pincode);
			System.out.println("Address added.");
		}else{
			System.out.println("Corresponding address is different as permanent address--------------");
			
			String fullAddress=request.getParameter("fullAddress");
			String country=request.getParameter("country");
			String state=request.getParameter("state");
			String cityTown=request.getParameter("cityTown");
			String taluka=request.getParameter("taluka");
			String pincode=request.getParameter("pincode");
			
			ContactInfo contactCorresponding = new ContactInfo(
					connection,
					0,
					fullAddress,
					country,
					state,
					cityTown,
					taluka,
					pincode,
					contactMobileNumber,
					alternativeNumber,
					emailID,
					"corresponding",
					studentid
					);
			String permanentfullAddress=request.getParameter("permanentfullAddress");
			String permanentCountry=request.getParameter("permanentCountry");
			String permanentState=request.getParameter("permanentState");
			String permanentCityTown=request.getParameter("permanentCityTown");
			String permanentTaluka=request.getParameter("permanentTaluka");
			String permanentPincode=request.getParameter("permanentPincode");
			ContactInfo contactPermanent = new ContactInfo(
					connection,
					0,
					permanentfullAddress,
					permanentCountry,
					permanentState,
					permanentCityTown,
					permanentTaluka,
					pincode,
					contactMobileNumber,
					alternativeNumber,
					emailID,
					"permanent",
					studentid
					);
			contactPermanent.insertContactInfo(studentid);
			contactCorresponding.insertContactInfo(studentid);
			System.out.println("(Corresponding address)");
			System.out.println(fullAddress);
			System.out.println(country +"\n"+ state  +"\n"+cityTown +"\n"+taluka  +"\n"+pincode);
			System.out.println("(Permanent address)");
			System.out.println(fullAddress);
			System.out.println(permanentCountry +"\n"+ permanentState  +"\n"+permanentCityTown +"\n"+permanentTaluka  +"\n"+permanentPincode);
			System.out.println("Status: Ok. Permernant and Corrensponding address added successfully");
		}
		
		System.out.println("HSSC Information----");
		String nameOfSchool, examiningBody, monthYearOfPassing, grade;
	    int marksObtained, totalMarks;
	    
		String hsscNameOfSchool=request.getParameter("hsscNameOfSchool");
		String hsscExaminationBody=request.getParameter("hsscExaminationBody");
		String hsscCategory=request.getParameter("hsscCategory");
		String hsscMonth=request.getParameter("hsscMonth");
		String hsscYear=request.getParameter("hsscYear");	
		int hsscMarksObtained=Integer.parseInt(request.getParameter("hsscMarksObtained"));
		int hsscTotalMarks=Integer.parseInt(request.getParameter("hsscTotalMarks"));
		String hsscGrade=request.getParameter("hsscGrade");
		//name = HSSCMarks HSSCSubjectID
			
		
		PreviousEducation hssc = new PreviousEducation(
				connection,
				0,
				hsscNameOfSchool,
				hsscExaminationBody,
				hsscMonth+" "+hsscMonth,
				hsscGrade,
				hsscCategory,
				hsscTotalMarks,
				hsscTotalMarks);
		System.out.println(hsscNameOfSchool +"\n"+ hsscExaminationBody +"\n"+ hsscCategory +"\n"+ hsscMonth +"\n"+ hsscYear+"\n"+hsscCategory) ;
		System.out.println(hsscMarksObtained +"\n"+ hsscTotalMarks+"\n"+hsscGrade);
		hssc.insertPreviousEducation(studentid);
		/*String hsscSubjectID[] = request.getParameterValues("HSSCSubjectID");
		String hsscSubjectMarks[] = request.getParameterValues("HSSCMarks");
		for(int i=0; i<hsscSubjectMarks.length;i++){
			DBPreviousEducationSubject hsscSubject = new DBPreviousEducationSubject(0,
					hsscSubjectID[i],
					);
			hssc.insertPreviousEducationSubject(dbPreviousEducationSubject);
			System.out.println("sub id-"+hsscSubjectMarks[i]);
		}
		*/
		System.out.println("SSC Information----");
		int sscMarksObtained=Integer.parseInt(request.getParameter("sscMarksObtained"));
		int sscTotalMarks=Integer.parseInt(request.getParameter("sscTotalMarks"));
		String sscGrade=request.getParameter("sscGrade");
		String sscNameOfSchool=request.getParameter("sscNameOfSchool");
		String sscExaminationBody=request.getParameter("sscExaminationBody");
		String sscMonth=request.getParameter("sscMonth");
		String sscYear=request.getParameter("sscYear");
		PreviousEducation ssc = new PreviousEducation(
				connection, 
				0, 
				sscNameOfSchool, 
				sscExaminationBody,
				sscMonth + " "+sscYear,
				sscGrade,
				"",
				sscMarksObtained,
				sscTotalMarks);
		ssc.insertPreviousEducation(studentid);
		System.out.println(sscNameOfSchool +"\n"+ sscExaminationBody +"\n"+ sscMonth +"\n"+ sscYear);
		
		/*
		//inserting course details
		Admission admissionDetails = new Admission(connection);
		System.out.println("Inserting course details...");	
		int courseid = Integer.parseInt(request.getParameter("degree"));
		int structureid = Integer.parseInt(request.getParameter("structureRadio"));
		String subjectSelected[] = request.getParameterValues("subjectDropdown");
		for(int i=0; i<subjectSelected.length;i++){
			System.out.println("sub id-"+subjectSelected[i]);
		}
		int compatibilityID = 0;
		Subject subject1 = new Subject(connection);
		subject1.setSubjectID(Integer.parseInt(subjectSelected[0]));
		Subject sub1 = new Subject(connection);
		if(subjectSelected.length == 1){
			sub1.setSubjectID(Integer.parseInt(subjectSelected[0]));
		    admissionDetails.setSubject1(sub1);
		    sub1.setSubjectID(Integer.parseInt(subjectSelected[1]));
		    admissionDetails.setSubject2(sub1);
		}else{
			sub1.setSubjectID(Integer.parseInt(subjectSelected[0]));
		    admissionDetails.setSubject1(sub1);
		}
		

		Course course = new Course(connection);
		course.setCourseID(courseid);
		Degree degree = new Degree(connection);
		degree.setDegreeID(DEGREE_ID);
		Structure structure = new Structure(connection);
		structure.setStructureID(structureid);
		admissionDetails.setStructure(structure);
		admissionDetails.setCourse(course);
		admissionDetails.setDegree(degree);
	    admissionDetails.setStudent(newStudent);
	    admissionDetails.setType(YEAR_TYPE);
	    admissionDetails.setPayStatus("NP");
	    admissionDetails.insertAdmissionDetails();
		int paperid=0;
		String semester[] = request.getParameterValues("semester");
		for(int i=0; i<semester.length;i++){
			System.out.println("sem id-"+semester[i]);
		}
		
		
		System.out.println("Getting paperid of component");
		String component[] = request.getParameterValues("component");
		System.out.println(component.length);
		
		for(int i=0; i<component.length;i++){
			System.out.println("compID id-"+component[i]);
		}
		StudentPaper studentPaper = new StudentPaper(connection);
		PaperSem paperSem = new PaperSem(connection);
		Papers paper = new Papers(connection);
		String academicYear = Calendar.getInstance().get(Calendar.YEAR)+"-"+(Calendar.getInstance().get(Calendar.YEAR)+1);
        for(int i=0;i<semester.length;i++){
			studentPaper.setStudent(newStudent);
			paper.setPaperID(Integer.parseInt(component[i]));
			paperSem.setAcdemicYear(academicYear);
			paperSem.setSem(Integer.parseInt(semester[i]));
			int paperSemID = paperSem.getPaperSemID();
			studentPaper.setPaperSem(paperSem);
		}
        */
		%>
	
		<div class='container' style="margin-top: 250px;">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="panel panel-default"> 
						<div class="panel-body">
						<h3>Admission Successful!</h3>
						<h5>Your token number is: <% out.println(studentid); %></h5>	
						<ul>
						<li>Get the following documents during admission.</li>
						<li>Get two passport size photos</li>
						<li>Photo copies of your marksheets</li>
						<li>And some other things..</li>
					</ul>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>	
		</div>
	<%}else{  %>

	


	<div class="container" style="margin-top: 250px;">
		
		<form class="fy-admission-form" action="" method="POST">
		<h1 class="text-center" style="margin-top: 10px;">FYBA/BSC
			Admissions Form</h1>
		<div class="text-left">
			<div style="width: 250px; margin-bottom: 30px;">
				<h4>Select Your Programme</h4>
				<select class="form-control course-dropdown" name="degree" required>
					<%
							/*
								Setting degree id
							*/
							int DEGREE_ID = 1;
                            Connection con = null;
                            Course course = null;
                            Database db = new Database();
                            try {
                                con = db.openConnection();
                                out.println("<h1>Connection value" + con + "</h1>");
                                
                            } catch (ClassNotFoundException ex) {
                                out.println("<h1>Connection value" + con + "</h1>");
                                con.close();
                            } catch (SQLException ex) {
                                out.println("<h1>Connection value" + con + "</h1>");
                                con.close();
                            }
                            Degree ug = new Degree(con, DEGREE_ID);
							out.println("<option disabled selected value>select a course</option>");
                            Course ugCourses[] = ug.getCourses();
                            for (int i = 0; i < ugCourses.length; i++) {
                                course = ugCourses[i];
                                if (course.getStatus().equalsIgnoreCase("on")) {
                                    out.println("<option class='form-control' value='"+
                                + course.getCourseID() + "'>" + course.getCoursename() + "</option> ");
                                }
                            }
                        %>


				</select>
			</div>
		</div>
		
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">Programme Details</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="row structure-div">
									<div class="col-lg-6">
										<%
                                                Structure structure[] = Structure.getAllStructure(con);
                                                for (int i = 0; i < structure.length; i++) {

                                            %>
										<div class="radio-inline">
											<label><input type="radio" class="structure-radio"
												name="structureRadio" id="inlineRadio1"
												value="<% out.print(structure[i].getStructureID());%>"
												data-name=" <% out.print(structure[i].getStructureName());%>" required>
												<% out.print(structure[i].getStructureName());%>
											</label>
										</div>

										<%
                                                }
                                            %>

									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<h4>Component A</h4>
									<div class="row subject-div"></div>
								</div>
								<div class="form-group">
									<h4>Component B</h4>
									<div class="row">
										<div class="col-lg-4 compB"></div>
									</div>
								</div>
								<div class="form-group">
									<h4>Component C</h4>
									<div class="row">
										<div class="col-lg-4 compC"></div>
									</div>
								</div>
								<div class="form-group">
									<h4>Component D</h4>
									<div class="row">
										<div class="col-lg-4 compD"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">Personal Information</div>
						<div class="panel-body">
							<div class="form-group">
								<label>Name as per Marksheet</label>
								<div class="row">
									<div class="col-lg-6">
										<input type="text" class="form-control"
											placeholder="Full Name as per SSC/HSSC Marsheet" name="fullName" required>
									</div>
									<div class="col-lg-6">
										<div class="col-lg-12">
											<label class=""> <input
												type="radio" name="gender" id="inlineRadio1"
												value="male" required>Male</label>
											<label class=""> <input type="radio"
												name="gender" id="inlineRadio2" value="female"
												required> Female</label>
											<label class=""> <input type="radio"
												name="gender" id="inlineRadio3" value="transgender"
												required> Transgender</label>
											</label>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<label>Nationality</label> <input type="text" Value="Indian"
											class="form-control" name="nationality" required>
										<div class="row"></div>
									</div>
									<div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="dtp_input2" class=" control-label">Date Of Birth</label>
                                                        <div class="input-group date form_date " data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                            <input class="form-control" size="16" type="text" name="examDate" id="examDate" value="" >

                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        </div>
                                                        <input type="hidden" id="dtp_input2" value="" /><br/>
                                                    </div>

                                                </div>
							<!-- 		<div class="col-lg-4">
										<label>Date of Birth</label> <input type="text"
											class="form-control" name="dateOfBirth" required>
									</div> -->
									<div class="col-lg-4">
										<label>Birth place</label> <input type="text"
											class="form-control" name="birthPlace" required>
										<div class="row"></div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<label>Blood Group</label> <select class="form-control"  name="bloodGroup" required>
											<option>A+</option>
											<option>A-</option>
											<option>B+</option>
											<option>B-</option>
											<option>Ab+</option>
											<option>Ab-</option>
											<option>O+</option>
											<option>O-</option>
										</select>
									</div>
									<div class="col-lg-4">
										<label>Religon</label> <select class="form-control" name="religion" required>
											<option>BUDDHIST</option>
											<option>CHRISTAIN</option>
											<option>HINDU</option>
											<option>JAIN</option>
											<option>MUSLIM</option>
											<option>PARSI</option>
											<option>SIKH</option>
											<option>OTHERS</option>
										</select>
									</div>
									<div class="col-lg-4">
										<label>Caste</label> <select class="form-control" name="caste" required>
											<option value="GENERAL">GEN</option>
											<option value="EBC" >EBC</option>
											<option value="OBC">OBC</option>
											<option value="SC" >SC</option>
											<option value="SC">ST</option>
											
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<label>Physically Challenged</label><br /> <label
											class=""> <input type="radio"
											name="physicallyChallenged" id="inlineRadio1"
											value="yes" required> Yes
										</label> <label class=""> <input type="radio"
											name="physicallyChallenged" id="inlineRadio2"
											value="no" checked="checked" required> No
										</label>
									</div>
									<div class="col-lg-4 pr-details">
										<label>Provide Details(If yes*)</label><br />
										<textarea class="form-control" rows="3" name="details"></textarea>
									</div>
									<div class="col-lg-4">
										<div class="form-group">
											<label>University Registration Number(If Any*)</label> <input
												type="text" class="form-control"
												placeholder="Enter PR Number" name="uniRegNumber">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">Parent Guardian Details</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-3">
										<label class="father-name">Father's Name</label> <input
											type="text" class="form-control" placeholder="" name="fatherName" required>
									</div>
									<div class="col-lg-3">
										<label class="father-qualification">Father's
											Email</label> <input type="email" name="fatherEmail" class="form-control"
											placeholder=" "  required>
									</div>
									<div class="col-lg-3">
										<label class="father-occupation">Father's Occupation</label> <input
											type="text" class="form-control" placeholder=" " name="fatherOccupation" required >
									</div>
									<div class="col-lg-3">
										<label class="father-phone">Father's Phone Number</label> <input
											type="text" class="form-control" placeholder=" " name="fatherNumber"  required>
									</div>
								</div>
							</div>
							<div class="form-group mother-details">
								<div class="row">
									<div class="col-lg-3">
										<label>Mother's Name</label> <input type="text"
											class="form-control mother-inputs" name="motherName" placeholder=""  required>
									</div>
									<div class="col-lg-3">
										<label>Mother's Email</label> <input type="email"
											class="form-control mother-inputs" name="motherEmail" placeholder="" required>
									</div>
									<div class="col-lg-3">
										<label>Mother's Occupation</label> <input type="text"
											class="form-control mother-inputs" name="motherOccupation" placeholder="" required>
									</div>
									<div class="col-lg-3">
										<label>Mother's Phone Number</label> <input type="text"
											class="form-control mother-inputs" name="motherNumber" placeholder="" required>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-6">
										<label>Family Monthly Income</label> <select
											class="form-control" name="familyMonthlyIncome"  required>
											<option value="0" selected="selected">-- Select --</option>
											<option value="&lt;5000">&lt;5000</option>
											<option value="5000-10000">5,000-10,000</option>
											<option value="10000-20000">10,000-20,000</option>
											<option value="20000-30000">20,000-30,000</option>
											<option value="30000-40000">30,000-40,000</option>
											<option value="40000-50000">40,000-50,000</option>
											<option value="50000-60000">50,000-60,000</option>
											<option value="60000-70000">60,000-70,000</option>
											<option value="70000-80000">70,000-80,000</option>
											<option value="&gt;80000">&gt;80,000</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">Contact Information</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-6">
										<label>Correspondence Address</label>
										<textarea class="form-control co-address" rows="3"  name="fullAddress" required></textarea>
										<label>Country</label> <select name="country" class="form-control co-country" required>
											<option>Indian</option>
											<option>USA</option>
										</select> <label>State</label> <input type="text"
											class="form-control co-state" name="state" placeholder=" "  required>
										<label>City/Town</label> <input type="text"
											class="form-control co-city" placeholder=" " name="cityTown" required >
										<label>Taluka</label> <input type="text"
											class="form-control co-taluka" placeholder=" " name="taluka"  required>
										<label>Pincode</label> <input type="text"
											class="form-control co-pincode" placeholder=" " name="pincode" required >
									</div>
									<div class="col-lg-6">
										<label>Permanent Address&nbsp; <input type="checkbox"
											value="yes" name="permanentAddress" class="address-checkbox" > Same as
											Correspondence Address
										</label>
										<textarea class="form-control pr-address" rows="3" name="permanentfullAddress" required></textarea>
										<label>Country</label> <select name="permanentCountry" class="form-control pr-country" required>
											<option>Indian</option>
											<option>USA</option>
										</select> <label>State</label> <input type="text"
											class="form-control pr-state" name="permanentState" placeholder=" " required> <label>City/Town</label>
										<input type="text" name="permanentCityTown" class="form-control pr-city"
											placeholder=" " required> <label>Taluka</label> <input
											type="text" name="permanentTaluka" class="form-control pr-taluka" placeholder=" " required>
										<label>Pincode</label> <input type="text" name="permanentPincode"
											class="form-control pr-pincode" placeholder=" " required>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">Contact Information</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<label>Contact/ Mobile Number</label> <input type="text"
											class="form-control"  name="contactMobileNumber" placeholder=" "  required>
									</div>
									<div class="col-lg-4">
										<label>Alternate Number</label> <input type="text"
											class="form-control" placeholder=" " name="alternativeNumber"  required>
									</div>
									<div class="col-lg-4">
										<label>Email Id</label> <input type="email"
											class="form-control" placeholder=" " name="emailID"  required>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">HSSC Exam Information</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<label>Name Of the School</label> <input type="text"
											class="form-control" placeholder=" " name="hsscNameOfSchool" required>
									</div>
									<div class="col-lg-4">
										<label>Name of the Examination Body</label> <select
											class="form-control" name="hsscExaminationBody"  required>
											<option>GOA BOARD</option>
											<option>ICSE</option>
											<option>CBSE</option>
											<option>ANY OTHER</option>
										</select>
									</div>
									<div class="col-lg-4">
										<label>Category</label> <select class="form-control" name="hsscCategory"  required>
											<option>XII SCIENCE</option>
											<option>XII COMMERCE</option>
											<option>XII ARTS</option>
											<option>XII VOCATIONAL</option>
											<option>DIPLOMA IN ELECTRONICS</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<label>Month and year of passing</label>
										<div class="row">
											<div class="col-lg-6">
												<select class="form-control" name="hsscMonth"  required>
													<option>JANUARY</option>
													<option>FEBRUARY</option>
													<option>MARCH</option>
													<option>APRIL</option>
													<option>MAY</option>
													<option>JUNE</option>
													<option>JULY</option>
													<option>AUGUST</option>
													<option>SEPTEMBER</option>
													<option>OCTOBER</option>
													<option>NOVEMBER</option>
													<option>DECEMBER</option>
												</select>
											</div>
											<div class="col-lg-6">
												<select class="form-control" name="hsscYear"  required>
													<option>2016</option>
													<option>2015</option>
													<option>2014</option>
													<option>2013</option>
												</select>
											</div>
										</div>
									</div>


								</div>
							</div>
							<div class="form-group">
                  <div class="row">
                  <h4 style="margin-left:20px;">MARKS</h4>
                    <div class="col-md-12">
                    <div class="col-lg-4">
                      <label>Marks Obtained</label>
                      <input type="text" class="form-control"  placeholder=" " required>
                    </div>
                    <div class="col-lg-4">
                      <label>Total Marks(Out of)</label>
                      <input type="text" class="form-control"  placeholder=" " required>
                    </div>
                    </div>
                    <div class="col-md-12">
                    <div class="col-lg-4">
                      <label>Marks Obtained</label>
                      <input type="text" class="form-control"  placeholder=" " required>
                    </div>
                    <div class="col-lg-4">
                      <label>Total Marks(Out of)</label>
                      <input type="text" class="form-control"  placeholder=" " required>
                    </div>
                    </div>
                    <div class="col-md-12">
                    <div class="col-lg-4">
                      <label>Marks Obtained</label>
                      <input type="text" class="form-control"  placeholder=" " required>
                    </div>
                    <div class="col-lg-4">
                      <label>Total Marks(Out of)</label>
                      <input type="text" class="form-control"  placeholder=" " required>
                    </div>
                    </div>
                  </div>
                </div>
							
					<!-- 		<div class="form-group">
								<div class="row">
									<div class="col-lg-12"></div>
									<div class="col-lg-4">
										<label>Marks Obtained</label> <input type="text"
											class="form-control" placeholder=" " name="hsscMarksObtained"  required>
									</div>
									<div class="col-lg-4">
										<label>Total Marks(Out of)</label> <input type="text"
											class="form-control" placeholder=" " name="hsscTotalMarks"  required>
									</div>
									<div class="col-lg-4">
										<label>Grade</label> <input type="text"
											class="form-control" placeholder=" " name="hsscGrade"  required>
									</div>
								</div>
								<div class="row ">
									<div class='col-md-12 HSSCMarksDiv'>
										<div class='form-group'>
										</div>
									</div>
								</div>
							</div>  -->
							
							
						</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">SSC Exam Information</div>
						<div class="panel-body">
							<div class="panel-body">
								<div class="form-group">
									<div class="row">
										<div class="col-lg-4">
											<label>Name Of the School</label> <input type="text"
												class="form-control" placeholder=" " name="sscNameOfSchool" required >
										</div>
										<div class="col-lg-4">
											<label>Name of the Examination Body</label> <select
												class="form-control"  name="sscExaminationBody" required >
												<option>GOA BOARD</option>
												<option>ICSE</option>
												<option>CBSE</option>
												<option>ANY OTHER</option>
											</select>
										</div>

									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-4">
											<label>Month and year of passing</label>
											<div class="row">
												<div class="col-lg-6">
													<select class="form-control" name="sscMonth" required >
														<option>JANUARY</option>
														<option>FEBRUARY</option>
														<option>MARCH</option>
														<option>APRIL</option>
														<option>MAY</option>
														<option>JUNE</option>
														<option>JULY</option>
														<option>AUGUST</option>
														<option>SEPTEMBER</option>
														<option>OCTOBER</option>
														<option>NOVEMBER</option>
														<option>DECEMBER</option>
													</select>
												</div>
												<div class="col-lg-6">
													<select class="form-control" name="sscYear"  required>
														<option>2016</option>
														<option>2015</option>
														<option>2014</option>
														<option>2013</option>
													</select>
												</div>
											</div>
										</div>

									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12"></div>
										<div class="col-lg-4">
											<label>TOTAL MARKS OBTAINED</label> <input type="text"
												class="form-control" placeholder=" " name="sscMarksObtained" required >
										</div>
										<div class="col-lg-4">
											<label>TOTAL MARKS(Out Of)</label> <input type="text"
												class="form-control" placeholder=" " name="sscTotalMarks"  required>
										</div>
										<div class="col-lg-4">
											<label>Grade</label> <input type="text"
												class="form-control" placeholder=" " name="sscGrade" required >
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">&nbsp;</div>
						<div class="panel-body">
						<div class="terms-conditions-div panel panel-info">
							<h2>Terms and Conditions</h2>
										<div class="text-justify panel-body">I hereby apply for the admission to
											"Parvatibai Chowgule College of Arts and Science". I submit
											that the information given herein by me is true and correct to
											the best of my knowledge and that no part of it is false. In
											case it is found that any material information is suppressed
											and/or untrue, the Principal shall be free to cancel my
											admission and that I shall not have any claim for damages or
											otherwise against the college. I have read and understood the
											disciplinary and general rules in the college prospectus & I am
											aware of the timings (TimeTable) of my class and I agree to
											abide by the same & I accept the same. I shall follow all the
											rules and shall accept the decision given by the Principal on
											all the matters including the matters of rejecting the
											application, admission and/or discipline. I have noted Rules
											No. 6, 15 and 16 mentioned as Rules of Discipline in the
											college prospectus for 2015-16 and I shall abide by them along
											with other rules. I accept and agree with the mode of
											submitting application for admission on line as prescribed by
											the college. I agree and undertake that the decision of the
											Principal of college relating to the admission shall be final
											and binding on me. I undertake to sign the hard copy of my
											application as and when required by the college. I have also
											read and understood the Goa University/Board Statutes and
											Ordinances governing admission, rate of fees, refund of fees,
											course of study, examinations, eligibility conditions etc., as
											applicable from time to time and I undertake to abide by them.
		
											I accept and undertake to abide by Goa University's/Board
											statutes, ordinances and other rules governing my admission,
											courses, examinations, fees, refund of fees etc., as applicable
											form time to time. That any dispute arising in respect of
											application for admission and/or Admission or rejection thereof
											shall be subject to the Jurisdiction of Margao. I accept and
											undertake to abide by rules stated in the college Sports
											Policy, College IT & Cyber Crime Policy and College Plagiarism
											Policy. NATIONAL RAGGING PREVENTION PROGRAM On Line Affidavit
											are given on www.amanmovement.org.
											</div>
										</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-6">
										<label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio1" value="option1">
											I accpet the terms and condition <br /> 
											<h5 class="terms-condtions">Read the terms and condition</h5>
										</label>
									</div>

									<div class="col-lg-12 text-right">
										<label class="radio-inline"> <input
											id="" type="submit" class="btn btn-warning"
											value="Apply For Admission">
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	</form>
	</div>
	<% }  %>
	
	
	<%@ include file="../footer.html"%>
	
	<script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
        <script>
            $(document).ready(function () {

            });
            $('.form_date').datetimepicker({
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
            $('.form_time').datetimepicker({
                language: 'fr',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 1,
                minView: 0,
                maxView: 1,
                forceParse: 0,
                showMeridian: 1

            });
        </script>
	<script>
    $(document).ready(function () {
    	$("#applyAdmission").click(function(){
    		$(".pcc-loader").show();
    	});
    	$(".pcc-loader").hide();
    	$(".terms-conditions-div").hide();
    	$(".terms-condtions").click(function(){
    		$(".terms-conditions-div").slideToggle();
    	});
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
         var currentStructureSelected = "";
        function addSubjectDropdown(currentStructureSelected) {
            structureid = currentStructureSelected.val();
            var structurename = currentStructureSelected.attr("data-name");
            var arrayOfStructures = structurename.split(" ");
            $(".subject-div").empty();
            for (var i = 0; i < arrayOfStructures.length; i++) {
                if (arrayOfStructures[i] != "") {
                    $(".subject-div").append(" <div class=\"col-lg-3 \">\
                            <label>Choose " + arrayOfStructures[i] + "</label>\
                            <select class=\"form-control subject-dropdown\" name=\"subjectDropdown\" required>\
                            </select>\
                          </div>");
                }
            }
        }


        function populateSubjectDropdown(courceSeleted, structureid) {
        	$.ajax({
                method: "get",
                url: "http://localhost:8080/ChowguleCollegeRedesign/AdmissionAJAX",
                data: {"courseid": courceSeleted, "structureid": structureid},
                success: function (data) {
                    $(".subject-dropdown:first").empty();
                    subJSON = JSON.parse(data);
                    $(".subject-dropdown:first").append("<option disabled selected value>select a subject</option>");
                    $.each(subJSON, function (index, value) {																																				
                        $.each(value, function (index1, value1) {
                            $(".subject-div").find(".subject-dropdown:first").append("<option value='" + value1[1] + "'>" + value1[0] + "</option>");
                        });
                    });

                },
                error: function () {
                    alert("Error. Please select a course");
                }
            });
        }


        function populateCompatibleSubjectDropdown(selectedSubjectID) {
            $.ajax({
                method: "get",
                url: "http://localhost:8080/ChowguleCollegeRedesign/AdmissionAJAX",
                data: {"electiveSubject": selectedSubjectID},
                success: function (data) {
                    $(".subject-div").find(".subject-dropdown").eq(1).empty();
                    subJSON = JSON.parse(data);
                    $(".subject-div").find(".subject-dropdown").eq(1).append("<option disabled selected value>select a subject</option>");
                    $.each(subJSON, function (index, value) {
                        $.each(value, function (index1, value1) {
                            $(".subject-div").find(".subject-dropdown").eq(1).append("<option value='" + value1[1] + "'>" + value1[0] + "</option>");
                        });
                    });
                },
                error: function () {
                    alert("Error: Compatible subject");
                }
            });
        }

        function addComponentB(selectedSubjectID) {
            $.ajax({
                method: "get",
                url: "http://localhost:8080/ChowguleCollegeRedesign/AdmissionAJAX",
                data: {"componentSubject": selectedSubjectID, "courseID": $(".course-dropdown").val(), "CompB": 1},
                success: function (data) {
                    $(".compB").empty();
                    subJSON = JSON.parse(data);
                    $.each(subJSON, function (index, value) {
                        if (index == "multiple") {
                            $.each(value, function (index1, value1) {
                                var dropdown = "<div class='form-inline' style='margin: 10px;'><select class='form-control' name='component' required>";
                                $.each(value1, function (index2, value2) {
                                    dropdown += "<option value='"+ value2[0] +"'>" + value2[1] + "</option>";
                                });
                                $(".compB").append(dropdown);
                            });

                        }
                        if (index == "single") {
                        	$.each(value, function (index2, value2) {
                            	$(".compB").append("<div class='form-inline' style='margin: 10px;'><p>" + value2[1] + "</p><input type='hidden' value='" + value2[0] + "' name='component'/></div>");
                        	});
                        }

                    });
                },
                error: function () {
                    alert("Error. Component B");
                }
            });
        }

        function addComponentC(selectedSubjectID) {
            $.ajax({
                method: "get",
                url: "http://localhost:8080/ChowguleCollegeRedesign/AdmissionAJAX",
                data: {"componentSubject": selectedSubjectID, "courseID": $(".course-dropdown").val(), "structureID": $(".structure-radio").val(), "CompC": 1},
                success: function (data) {
                    $(".compC").empty();
                    subJSON = JSON.parse(data);
                    
                    $.each(subJSON, function (index, value) {
                        if (index == "multiple") {
                            $.each(value, function (index1, value1) {
                                var dropdown = "<div class='form-inline' style='margin: 10px;'><select class='form-control' name='component' required>";
                                $.each(value1, function (index2, value2) {
                                    dropdown += "<option value='"+ value2[0] +"'>" + value2[1] + "</option>";
                                });
                                dropdown = dropdown + "</select>";
                                $(".compC").append(dropdown);
                            });

                        }
                        if (index == "single") {
                        	if(value !=""){
                        		$.each(value, function (index2, value2) {
                                   	$(".compC").append("<div class='form-inline' style='margin: 10px;'><p>" + value2[1] + "</p><input type='hidden' value='" + value2[0] + "' name='component'/></div>");
                                }); 
                        	}
                        	  
                        }

                    });
                },
                error: function () {
                    alert("Error. Component C");
                }
            });
        }

        function addComponentD(selectedSubjectID) {
            $.ajax({
                method: "get",
                url: "http://localhost:8080/ChowguleCollegeRedesign/AdmissionAJAX",
                data: {"componentSubject": selectedSubjectID, "courseID": $(".course-dropdown").val(), "CompD": 1},
                success: function (data) {
                    $(".compD").empty();
                    subJSON = JSON.parse(data);
                    $(".compD").append("<label>Internship</label><br>");
                    var semesterOptions = "";
                    $.each(subJSON, function (index, value) {  
                    	semesterOptions += "<input type='hidden' value='"+index+"' name='component' />";
                        $.each(value, function (index1, value1) {
                            semesterOptions += "<label><input type='radio' value='"+value1+"' name='semester' required />" + "Semester"+value1 + "</label></br>";
                        });
                    });
                    $(".compD").append(semesterOptions);
                },
                error: function () {
                    alert("CompD: error occured");
                }
            });
        }
        
        function clearComponents(){
        	$(".compB").empty();
        	$(".compC").empty();
        	$(".compD").empty();
        }

        function addHSSCMarksList(selectedSubjectID){
        	 $.ajax({
                 method: "get",
                 url: "http://localhost:8080/ChowguleCollegeRedesign/AdmissionAJAX",
                 data: {"componentSubject": selectedSubjectID, "courseID": $(".course-dropdown").val(), "HSSCmarks": 1},
                 success: function (data) {
                     $(".HSSCMarksDiv").empty();
                     alert(data);
                     subJSON = JSON.parse(data);
                     
                     $.each(subJSON, function (index, value) {		
                    	 $(".HSSCMarksDiv").append("");
                         $.each(value, function (index1, value1) {
                            $(".HSSCMarksDiv").append("<input type='hidden' name='HSSCSubjectID' value='"+value1[1]+"' /><input class='form-control col-md-3' type='text' name='HSSCMarks' value='' placeholder='"+value1[0]+"'/>");
                         });
                     });
                    
                     
                 },
                 error: function () {
                     alert("HSSC: error occured");
                 }
             });
        }
        
        $(".course-dropdown").change(function () {
            if (currentStructureSelected != null) {
            	$(".pcc-loader").show();
            	clearComponents();
                populateSubjectDropdown($(this).val(), $(".structure-radio:checked").val());
                $(".pcc-loader").hide();
            }
        });
        $(".structure-radio").click(function () {
        	$(".pcc-loader").show();
        	clearComponents();
            currentStructureSelected = $(this);
            structureid = $(this).val();
            addSubjectDropdown(currentStructureSelected);
            populateSubjectDropdown($(".course-dropdown").val(), structureid);
            $(".pcc-loader").hide();
        });
        $(document).on('change', '.subject-dropdown:first', function () {
        	$(".pcc-loader").show().delay(500).hide(100);
        	var selectedSubjectID = $(this).val();
            $(".subject-div").find(".subject-dropdown").eq(1).empty();
            populateCompatibleSubjectDropdown(selectedSubjectID);
            addComponentB(selectedSubjectID);
            addComponentC(selectedSubjectID);
            //addComponentD(selectedSubjectID);
            addHSSCMarksList(selectedSubjectID);
        });

    });

</script>
	<script src="js/bootstrap.min.js"></script>
	
	
</body>
</html>
