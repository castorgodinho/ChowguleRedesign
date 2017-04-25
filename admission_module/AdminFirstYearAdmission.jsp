<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="admissionDBClasses.*"%>
<%@ page import="manyToManyTables.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.logging.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.Date"%>
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
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-social.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/blueimp-gallery.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/blueimp-gallery-indicator.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.mCustomScrollbar.css">
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
</head>
	
<body>
	
	<%
	 include file="../header.jsp";
	if(request.getParameter("confirm") != null ){

		Database database = new Database();
		Connection connection = database.openConnection();
		System.out.println("Processing admission request.");
		System.out.println("Adding new student");
		int studentid = Integer.parseInt(request.getParameter("studentid"));
		String fullName=request.getParameter("fullName");
		String dateOfBirth=request.getParameter("dateOfBirth");
		String placeOfBirth=request.getParameter("birthPlace");
		String gender=request.getParameter("gender");
		String bloodGroup=request.getParameter("bloodGroup");
		String nationality=request.getParameter("nationality");
		String religion=request.getParameter("religion");
		String caste=request.getParameter("caste");
		String martialStatus=request.getParameter("martialStatus");
		String physciallyChallenged=request.getParameter("physicallyChallenged");
		String details=request.getParameter("details");
		String uniRegNumber=request.getParameter("uniRegNumber");
		String status="false";
		String userName="-";
		String password="-";
		String familyMonthlyIncome=request.getParameter("familyMonthlyIncome");
		String rollNumber="-";
		Student newStudent = new Student(connection);
		newStudent.setFullName(fullName);
		newStudent.setDateOfBirth(dateOfBirth);
		newStudent.setPlaceOfBirth(placeOfBirth);
		newStudent.setGender(gender);
		newStudent.setBloodGroup(bloodGroup);
		newStudent.setNationality(nationality);
		newStudent.setReligion(religion);
		newStudent.setCategory(caste);
		newStudent.setMaritalStatus(martialStatus);
		newStudent.setPhysicalyChallenged(physciallyChallenged);
		newStudent.setUniversityNumber(uniRegNumber);
		newStudent.setStatus("student");
		newStudent.setUsername("");
		newStudent.setPassword("");
		newStudent.setFamilyIncome(familyMonthlyIncome);
		newStudent.setStudentID(studentid);
		newStudent.updateStudent();
		/*String gaurdianId[] = request.getParameterValues("gaurdian");
		if(martialStatus.equalsIgnoreCase("unmarried")){
			System.out.println("Unmarried student---");
		    ParentGaurdian mother = new ParentGaurdian(connection);
		    ParentGaurdian father = new ParentGaurdian(connection);
			String fatherName=request.getParameter("fatherName");
			String fatherQualification=request.getParameter("fatherQualification");
			String fatherOccupation=request.getParameter("fatherOccupation");
			String fatherNumber=request.getParameter("fatherNumber");
			String motherName=request.getParameter("motherName");
			String motherQualification=request.getParameter("motherQualification");
			String motherOccupation=request.getParameter("motherOccupation");
			String motherNumber=request.getParameter("motherNumber");
			System.out.println(fatherName +"\n"+ fatherQualification +"\n"+ fatherOccupation +"\n"+ fatherNumber +"\n"+ motherName +"\n"+ motherQualification);
			System.out.println(motherOccupation +"\n"+ motherNumber);
		    mother.setFullName(motherName);
		    mother.setOccupation(motherOccupation);
		    mother.setQualification(motherQualification);
		    mother.setContactNumber(motherNumber);
		    mother.setType("mother");
		    mother.setParentGaurdianID(Integer.parseInt(gaurdianId[0]));
		    father.setFullName(fatherName);
		    father.setOccupation(fatherOccupation);
		    father.setQualification(fatherQualification);
		    father.setContactNumber(fatherNumber);
		    father.setType("father");
		    father.setParentGaurdianID(Integer.parseInt(gaurdianId[1]));
		    mother.updateParentGaurdian();
		    father.updateParentGaurdian();
		}else{
			ParentGaurdian partner = new ParentGaurdian(connection);
			System.out.println("Married student---");
			String partnerName=request.getParameter("fatherName");
			String partnerQualification=request.getParameter("fatherQualification");
			String partnerOccupation=request.getParameter("fatherOccupation");
			String partnerNumber=request.getParameter("fatherNumber");
			partner.setFullName(partnerName);
			partner.setOccupation(partnerOccupation);
			partner.setQualification(partnerQualification);
			partner.setContactNumber(partnerNumber);
			partner.setParentGaurdianID(Integer.parseInt(gaurdianId[0]));
			if(gender.equalsIgnoreCase("male")){
				partner.setType("wife");
			}else{
				partner.setType("husband");
			}
			partner.updateParentGaurdian();
			System.out.println(partnerName +"\n"+ partnerQualification +"\n"+ partnerOccupation +"\n"+ partnerNumber);
		}
		
		System.out.println("Contact Information----");
		String contactMobileNumber=request.getParameter("contactMobileNumber");
		String alternativeNumber=request.getParameter("alternativeNumber");
		String emailID=request.getParameter("emailID");
		System.out.println(contactMobileNumber +"\n"+ alternativeNumber +"\n"+ emailID);
		
		if(request.getParameter("permanentAddress") != null){
			ContactInfo contact = new ContactInfo(connection);
			System.out.println("Corresponding address same as permanent address--------------");
			String fullAddress=request.getParameter("fullAddress");
			String country=request.getParameter("country");
			String state=request.getParameter("state");
			String cityTown=request.getParameter("cityTown");
			String taluka=request.getParameter("taluka");
			String pincode=request.getParameter("pincode");
			contact.setAddress(fullAddress);
			contact.setCityTownVillage(cityTown);
			contact.setCountry(country);
			contact.setTaluka(taluka);
			contact.setState(state);
			contact.setPinCode(pincode);
			contact.setContactNo(contactMobileNumber);
			contact.setAlternateNo(alternativeNumber);
			contact.setEmailID(emailID);
			contact.setType("permanent");
			contact.insertContactInfo(studentid);
			System.out.println(fullAddress);
			System.out.println(country +"\n"+ state  +"\n"+cityTown +"\n"+taluka  +"\n"+pincode);
		}else{
			System.out.println("Corresponding address is different as permanent address--------------");
			ContactInfo contactPermanent = new ContactInfo(connection);
			ContactInfo contactCorresponding = new ContactInfo(connection);
			String fullAddress=request.getParameter("fullAddress");
			String country=request.getParameter("country");
			String state=request.getParameter("state");
			String cityTown=request.getParameter("cityTown");
			String taluka=request.getParameter("taluka");
			String pincode=request.getParameter("pincode");
			contactCorresponding.setAddress(fullAddress);
			contactCorresponding.setCityTownVillage(cityTown);
			contactCorresponding.setCountry(country);
			contactCorresponding.setTaluka(taluka);
			contactCorresponding.setState(state);
			contactCorresponding.setPinCode(pincode);
			contactCorresponding.setContactNo(contactMobileNumber);
			contactCorresponding.setAlternateNo(alternativeNumber);
			contactCorresponding.setEmailID(emailID);
			contactCorresponding.setType("corresponding");
			String permanentfullAddress=request.getParameter("permanentfullAddress");
			String permanentCountry=request.getParameter("permanentCountry");
			String permanentState=request.getParameter("permanentState");
			String permanentCityTown=request.getParameter("permanentCityTown");
			String permanentTaluka=request.getParameter("permanentTaluka");
			String permanentPincode=request.getParameter("permanentPincode");
			contactPermanent.setAddress(permanentfullAddress);
			contactPermanent.setCityTownVillage(permanentCityTown);
			contactPermanent.setCountry(permanentCountry);
			contactPermanent.setTaluka(permanentTaluka);
			contactPermanent.setState(permanentState);
			contactPermanent.setPinCode(permanentPincode);
			contactPermanent.setContactNo(contactMobileNumber);
			contactPermanent.setAlternateNo(alternativeNumber);
			contactPermanent.setEmailID(emailID);
			contactPermanent.setType("permanent");
			contactPermanent.insertContactInfo(studentid);
			contactCorresponding.insertContactInfo(studentid);
			System.out.println("(Corresponding address)");
			System.out.println(fullAddress);
			System.out.println(country +"\n"+ state  +"\n"+cityTown +"\n"+taluka  +"\n"+pincode);
			System.out.println("(Permanent address)");
			System.out.println(fullAddress);
			System.out.println(permanentCountry +"\n"+ permanentState  +"\n"+permanentCityTown +"\n"+permanentTaluka  +"\n"+permanentPincode);
		}
		
		System.out.println("HSSC Information----");
		String nameOfSchool, examiningBody, monthYearOfPassing, grade;
	    int marksObtained, totalMarks;
	    PreviousEducation hssc = new PreviousEducation(connection);
		String hsscNameOfSchool=request.getParameter("hsscNameOfSchool");
		String hsscExaminationBody=request.getParameter("hsscExaminationBody");
		String hsscCategory=request.getParameter("hsscCategory");
		String hsscMonth=request.getParameter("hsscMonth");
		String hsscYear=request.getParameter("hsscYear");	
		String hsscMarksObtained=request.getParameter("hsscMarksObtained");
		String hsscTotalMarks=request.getParameter("hsscTotalMarks");
		String hsscGrade=request.getParameter("hsscGrade");
		hssc.setNameOfSchool(hsscNameOfSchool);
		hssc.setExaminingBody(hsscExaminationBody);
		hssc.setGrade(hsscGrade);
		hssc.setTotalMarks(Integer.parseInt(hsscTotalMarks));
		hssc.setMarksObtained(Integer.parseInt(hsscMarksObtained));
		hssc.setMonthYearOfPassing(hsscMonth+" "+hsscYear);
		hssc.setStream(hsscCategory);
		System.out.println(hsscNameOfSchool +"\n"+ hsscExaminationBody +"\n"+ hsscCategory +"\n"+ hsscMonth +"\n"+ hsscYear+"\n"+hsscCategory) ;
		System.out.println(hsscMarksObtained +"\n"+ hsscTotalMarks+"\n"+hsscGrade);
		hssc.insertPreviousEducation(studentid);
		
		System.out.println("SSC Information----");
		PreviousEducation ssc = new PreviousEducation(connection);
		String sscMarksObtained=request.getParameter("sscMarksObtained");
		String sscTotalMarks=request.getParameter("sscTotalMarks");
		String sscGrade=request.getParameter("sscGrade");
		String sscNameOfSchool=request.getParameter("sscNameOfSchool");
		String sscExaminationBody=request.getParameter("sscExaminationBody");
		String sscMonth=request.getParameter("sscMonth");
		String sscYear=request.getParameter("sscYear");
		ssc.setNameOfSchool(sscNameOfSchool);
		ssc.setTotalMarks(Integer.parseInt(sscTotalMarks));
		ssc.setMarksObtained(Integer.parseInt(sscTotalMarks));
		ssc.setExaminingBody(sscExaminationBody);
		ssc.setMonthYearOfPassing(sscMonth+" "+sscYear);
		ssc.setGrade(sscGrade);
		ssc.insertPreviousEducation(studentid);
		System.out.println(sscNameOfSchool +"\n"+ sscExaminationBody +"\n"+ sscMonth +"\n"+ sscYear);
		
		
		//inserting course details
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
		if(subjectSelected.length == 1){
			compatibilityID = subject1.getCompatibleID(Integer.parseInt(subjectSelected[0]));
		}else{
			compatibilityID = subject1.getCompatibleID(Integer.parseInt(subjectSelected[1]));
		}
		

		AdmissionDetails admissionDetails = new AdmissionDetails(connection);
	    
	    admissionDetails.setStudentID(studentid);
	    admissionDetails.setCompatibleID(compatibilityID);
	    admissionDetails.setCorseID(1);
	    admissionDetails.setDegreeID(courseid);
	    admissionDetails.setStructureID(structureid);
	    admissionDetails.setType(1);
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
		for(int i=0;i<semester.length;i++){
			newStudent.selectPaper(Integer.parseInt(component[i]), Integer.parseInt(semester[i]));
		}*/
		%>
		
	<div class='container' style="margin-top: 250px;">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="panel panel-default"> 
						<div class="panel-body">
						<h3>Student added successfully.</h3>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>	
		</div>
	<%
		} else {
	%>




	<div class="container" style="margin-top: 250px;">
		<form class="fy-admission-form" action="" method="POST">
			<h1 class="text-center" style="margin-top: 10px;">FYBA/BSC
				Admissions Form</h1>
			<div class="text-left">
				<div style="width: 250px; margin-bottom: 30px;">
					<h4>Select Your Programme</h4>
					<select class="form-control course-dropdown" name="degree" required>
					
						<%
								int STUDENT_TOKEN = 0;
								String ACADEMIC_YEAR = Calendar.getInstance().get(Calendar.YEAR)+"-"+(Calendar.getInstance().get(Calendar.YEAR)+1);
				        
								if(request.getParameter("tokennumber") != null){
									STUDENT_TOKEN = Integer.parseInt(request.getParameter("tokennumber"));
								}
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
								Degree ug = new Degree();
								ug.setCon(con);
								ug.setDegreeID(DEGREE_ID);
								out.println("<option disabled selected value>select a course</option>");
								Course ugCourses[] = ug.getCourses();
								Student student = new Student(con);
								student.setStudentID(STUDENT_TOKEN);
								Admission admissionDetail = new Admission(con);
								admissionDetail.setStudent(student);
								Course selectedCourse = null;
								for (int i = 0; i < ugCourses.length; i++) {
									course = ugCourses[i];
									if (course.getStatus().equalsIgnoreCase("on")) {
										if (admissionDetail.getCourse().getCourseID() == course.getCourseID()) {
											out.println("<option class='form-control' selected='true' value='" + course.getCourseID()
													+ "'>" + course.getCourseName() + "</option> ");
											selectedCourse=course;
										} else {
											out.println("<option class='form-control' value='" + course.getCourseID() + "'>"
													+ course.getCourseName() + "</option> ");
										}
									}
								}
								Faculty faculty = new Faculty(con);
								Student student2 = faculty.getStudent(STUDENT_TOKEN);
						%>


					</select>
					<input type='hidden' value='<% out.print(STUDENT_TOKEN); %>' name='studentid' />
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
											String structureName = "";
												Structure structure[] = Structure.getAllStructure(con);
												for (int i = 0; i < structure.length; i++) {
													if (admissionDetail.getStructure().getStructureID() == structure[i].getStructureID()) {
														structureName = structure[i].getStructureName();
										%>
										<div class="radio-inline">
											<label><input type="radio" class="structure-radio"
												checked="checked" name="structureRadio" id="inlineRadio1"
												value="<%out.print(structure[i].getStructureID());%>"
												data-name=" <%out.print(structure[i].getStructureName());%>"
												required> <%
										 	out.print(structure[i].getStructureName());
										 %> </label>
										</div>

										<%
											} else {
										%>
										<div class="radio-inline">
											<label><input type="radio" class="structure-radio"
												name="structureRadio" id="inlineRadio1"
												value="<%out.print(structure[i].getStructureID());%>"
												data-name=" <%out.print(structure[i].getStructureName());%>"
												required> <%
										 	out.print(structure[i].getStructureName());
										 %> </label>
										</div>
										<%
											}
												}
												Subject subject3 = new Subject(con);
												//int selectedSubject[] = subject3.getSubjectIDs(admissionDetail.getCompatibleID());
												Papers selectedPapers[] = student.getSelectedPapers();
												int internshipPaper = 0;
												for(int i=0; i<selectedPapers.length; i++){
													if(selectedPapers[i].getPaperName().equalsIgnoreCase("internship")){
														System.out.println("found.. Paper: "+selectedPapers[i].getPaperName());
														internshipPaper = selectedPapers[i].getSem(ACADEMIC_YEAR)[0];
													}
												}
												ArrayList<Integer> selectedPaperArrayList = new ArrayList<>();
												for(int i=0; i<selectedPapers.length; i++){
													selectedPaperArrayList.add(selectedPapers[i].getPaperID());
												}
										%>

										
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<h4>Component A</h4>
									<div class="row subject-div">
										<%
											String arrayOfStructure[] = structureName.split(" ");
											if(arrayOfStructure.length > 1){
												%>
										<div class="col-lg-3 ">
											<label>Choose <% out.println(arrayOfStructure[0]); %></label> <select
												class="form-control subject-dropdown"
												name="subjectDropdown" required>
												<%
												CourseSubject courseSubject = new CourseSubject(con);
												courseSubject.setCourse(selectedCourse);
												selectedCourse.setCon(con);
													Subject subjects[] = courseSubject.getSubjects();
													for(int i=0; i<subjects.length;i++){
														if(subjects[i].getSubjectID() == admissionDetail.getSubject1().getSubjectID()){
															out.println("<option selected='selected' value='"+subjects[i].getSubjectID()+"'>"+subjects[i].getSubjectName()+"</option>");
																
														}else{
															out.println("<option value='"+subjects[i].getSubjectID()+"'>"+subjects[i].getSubjectName()+"</option>");
				
														}
													}
												%>
											</select>
										</div>
										<div class="col-lg-3 ">
											<label>Choose <% out.println(arrayOfStructure[1]); %></label> <select
												class="form-control subject-dropdown"
												name="subjectDropdown" required>
												<%
													Subject firstSubject = new Subject(con);
													firstSubject.setSubjectID(admissionDetail.getSubject1().getSubjectID());
													Subject subject2[] = firstSubject.getCompatibleSubjects();
												
													for(int i=0; i<subject2.length;i++){
														if(subject2[i].getSubjectID() == admissionDetail.getSubject2().getSubjectID()){
															out.println("<option selected='selected' value='"+subject2[i].getSubjectID()+"'>"+subject2[i].getSubjectName()+"</option>");
																
														}else{
															out.println("<option value='"+subject2[i].getSubjectID()+"'>"+subject2[i].getSubjectName()+"</option>");
				
														}
													}
												%>
											</select>
										</div>
										<%
											}else{
												%> 
												<div class="col-lg-3 ">
											<label>Choose <% out.println(arrayOfStructure[0]); %></label> <select
												class="form-control subject-dropdown"
												name="subjectDropdown" required>
												<%
													CourseSubject subject4 = new CourseSubject(con);
													subject4.setCourse(selectedCourse);
													selectedCourse.setCon(con);
													Subject subjects[] = subject4.getSubjects();
													for(int i=0; i<subjects.length;i++){
														if(subjects[i].getSubjectID() == admissionDetail.getSubject1().getSubjectID()){
															out.println("<option selected='selected' value='"+subjects[i].getSubjectID()+"'>"+subjects[i].getSubjectName()+"</option>");
																
														}else{
															out.println("<option value='"+subjects[i].getSubjectID()+"'>"+subjects[i].getSubjectName()+"</option>");
				
														}
													}
												%>
											</select>
												<%
												
											}
										%>
									</div>
								</div>
								<div class="form-group">
									<h4>Component B</h4>
									<div class="row">
										<div class="col-lg-4 compB">
											<%
												Subject subject1 = new Subject(con);
												subject1.setSubjectID(admissionDetail.getSubject1().getSubjectID());
												FoundationGroup[] groups1 = subject1.getFoundationGroupsWithComponentIDCourseID(2, admissionDetail.getCourse().getCourseID());
												for(int i=0; i< groups1.length; i++){
													if(groups1[i].getPapers().length == 1){
															out.println("<div class='form-inline' style='margin: 10px;'><p>" + groups1[i].getPapers()[0].getPaperName() + " (Semester " + groups1[i].getPapers()[0].getSem(ACADEMIC_YEAR)[0] + ")<input type='hidden' value='"+groups1[i].getPapers()[0].getSem(ACADEMIC_YEAR)[0]+"' name='semester' /></p><input type='hidden' value='" +groups1[i].getPapers()[0].getPaperID() + "' name='component'/></div>");
													}else{
														Papers[] papers = groups1[i].getPapers();
														out.println("<div class='form-inline' style='margin: 10px;'><select class='form-control' name='component' required>");
														for(int j=0; j < papers.length; j++){
															if(selectedPaperArrayList.contains(papers[j].getPaperID())){
       														 out.println("<option selected='selected' value='"+papers[j].getPaperID() +"'>" + papers[j].getPaperName() + "</option>");
															}else{ 
																out.println("<option value='"+papers[j].getPaperID() +"'>" + papers[j].getPaperName() + "</option>");
															}
														}

														out.println(" </select>(Semester "+ papers[0].getSem(ACADEMIC_YEAR)[0] + ")</div>");
														
													}
												}
											%>
										</div>
									</div>
								</div>
								<div class="form-group">
									<h4>Component C</h4>
									<div class="row">
										<div class="col-lg-4 compC">
											<%
											GeneralGroup[] groups = subject1.getGeneralGroupsWithComponentIDCourseID(3, admissionDetail.getCourse().getCourseID());
												for(int i=0; i< groups.length; i++){
													if(groups[i].getPapers().length == 1){
															out.println("<div class='form-inline' style='margin: 10px;'><p>" + groups[i].getPapers()[0].getPaperName() + " (Semester " + groups[i].getPapers()[0].getSem(ACADEMIC_YEAR)[0] + ")<input type='hidden' value='"+groups[i].getPapers()[0].getSem(ACADEMIC_YEAR)[0]+"' name='semester' /></p><input type='hidden' value='" +groups[i].getPapers()[0].getPaperID() + "' name='component'/></div>");
													}else{
														Papers[] papers = groups[i].getPapers();
														out.println("<div class='form-inline' style='margin: 10px;'><select class='form-control' name='component' required>");
														for(int j=0; j < papers.length; j++){
															if(selectedPaperArrayList.contains(papers[j].getPaperID())){
       														 out.println("<option selected='selected' value='"+papers[j].getPaperID() +"'>" + papers[j].getPaperName() + "</option>");
															}else{ 
																out.println("<option value='"+papers[j].getPaperID() +"'>" + papers[j].getPaperName() + "</option>");
															}
														}

														out.println(" </select>(Semester "+ papers[0].getSem(ACADEMIC_YEAR)[0] + ")</div>");
														
													}
												}
											%>
										</div>
									</div>
								</div>
								<div class="form-group">
									<h4>Component D</h4>
									<div class="row">
										<div class="col-lg-4 compD">
											<label>Internship</label><br>
											<%
											groups = subject1.getGeneralGroupsWithComponentIDCourseID(4, admissionDetail.getCourse().getCourseID());
											
											out.println("<input type='hidden' value='"+groups[0].getPapers()[0].getPaperName()+"' name='component' />");
											for(int i=0; i<groups[0].getPapers()[0].getSem(ACADEMIC_YEAR).length;i++ ){
												if(internshipPaper == groups[0].getPapers()[0].getSem(ACADEMIC_YEAR)[i])
													out.println("<label><input checked=\"checked\" type='radio' value='"+groups[0].getPapers()[0].getSem(ACADEMIC_YEAR)[i]+"' name='semester' required />" + "Semester"+groups[0].getPapers()[0].getSem(ACADEMIC_YEAR)[i] + "</label></br>");
												else
													out.println("<label><input type='radio' value='"+groups[0].getPapers()[0].getSem(ACADEMIC_YEAR)[i]+"' name='semester' required />" + "Semester"+groups[0].getPapers()[0].getSem(ACADEMIC_YEAR)[i] + "</label></br>");
											}
											 %>
										</div>
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
											placeholder="Full Name as per SSC/HSSC Marsheet"
											name="fullName" value="<% out.print(student2.getFullName()); %>" required>
									</div>
									<div class="col-lg-6">
										<div class="col-lg-12">
										<%
											out.println("<script>$(document).ready(function(){"+
											"$(\".genderRadio[value="+student2.getGender()+"]\").prop('checked', true);"+
													
													"});</script>");
										%>
											<label class=""> <input class="genderRadio" type="radio" name="gender"
												id="inlineRadio1" value="male" required>Male
											</label> <label class=""> <input type="radio" class="genderRadio" name="gender"
												id="inlineRadio2" value="female" required> Female
											</label> <label class=""> <input type="radio" class="genderRadio" name="gender"
												id="inlineRadio3" value="transgender" required>
												Transgender
											</label> </label>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<label>Nationality</label> <input type="text" Value="Indian"
											class="form-control" name="nationality" value="<% out.print(student2.getNationality()); %>" required>
										<div class="row"></div>
									</div>
									<div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="dtp_input2" class=" control-label">Date Picking</label>
                                                        <div class="input-group date form_date " data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                            <input class="form-control" size="16" type="text" name="examDate" id="examDate" value="" >

                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        </div>
                                                        <input type="hidden" id="dtp_input2" value="" /><br/>
                                                    </div>

                                                </div>
									<!--  <div class="col-lg-4">
										<label>Date of Birth</label> <input type="text"
											class="form-control" name="dateOfBirth" value="<% out.print(student2.getDateOfBirth()); %>" required>
									</div>-->
									<div class="col-lg-4">
										<label>Birth place</label> <input type="text"
											class="form-control" name="birthPlace" value="<% out.print(student2.getPlaceOfBirth()); %>" required>
										<div class="row"></div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<%
											
											out.println("<script>$(document).ready(function(){"+
													"$(\".religion [value='"+student2.getReligion()+"']\").prop('selected', true);"+
													"$(\".bloodGroup [value='"+student2.getBloodGroup()+"']\").prop('selected', true);"+
													"$(\".caste [value='"+student2.getCategory()+"']\").prop('selected', true);"+
													"$(\".familyIncomeDropdown [value='"+student2.getFamilyIncome()+"']\").prop('selected', true);"+
													"});</script>");
										%>
										<label>Blood Group</label> <select class="form-control bloodGroup selectedPapers"
											name="bloodGroup" required>
											<option value='A+'>A+</option>
											<option value='A'>A-</option>
											<option value='B+'>B+</option>
											<option value='B-'>B-</option>
											<option value='Ab+'>Ab+</option>
											<option value='Ab-'>Ab-</option>
											<option value='O+'>O+</option>
											<option value='O-'>O-</option>
										</select>
									</div>
									<div class="col-lg-4">
										<label>Religion</label> <select class="form-control religion"
											name="religion" required>
											<option value='BUDDHIST'>BUDDHIST</option>
											<option value='CHRISTAIN'>CHRISTAIN</option>
											<option value='HINDU'>HINDU</option>
											<option value='JAIN'>JAIN</option>
											<option value='MUSLIM'>MUSLIM</option>
											<option value='PARSI'>PARSI</option>
											<option value='SIKH'>SIKH</option>
											<option value='OTHERS'>OTHERS</option>
										</select>
									</div>
									<div class="col-lg-4">
										<label>Caste</label> <select class="form-control caste" name="caste"
											required>
											<option value="GENERAL">GEN</option>
											<option value="EBC">EBC</option>
											<option value="OBC">OBC</option>
											<option value="SC">SC</option>
											<option value="SC">ST</option>

										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
									<%
											out.println("<script>$(document).ready(function(){"+
											"$(\".marraginStatus[value="+student2.getMaritalStatus()+"]\").prop('checked', true);"+
													
													"});</script>");
										%>
										<label>Marital Status</label><br /> <label class="">
											<input type="radio" class="status-married marraginStatus"
											name="martialStatus" id="inlineRadio1" value="married"
											required> Married
										</label> <label class=""> <input type="radio"
											class="status-unmarried marraginStatus" name="martialStatus"
											id="inlineRadio2" value="unmarried" checked="checked"
											required> Unmarried
										</label>
									</div>
									<div class="col-lg-4">
										<%
											if(!student2.getPhysicalyChallenged().equalsIgnoreCase("")){
											out.println("<script>$(document).ready(function(){"+
												"$(\".physically[value='yes']\").prop('checked', true);"+
												"$('.pr-details').show();"+
												"});</script>");
											}else{
												out.println("<script>$(document).ready(function(){"+
														"$(\".physically[value='no']\").prop('checked', true);"+
																"$('.pr-details').hide();"+
																"});</script>");
											}
										%>
										<label>Physically Challenged</label><br /> <label class="">
											<input type="radio" class="physically" name="physicallyChallengedRadio"
											id="inlineRadio1" value="yes" required> Yes
										</label> <label class=""> <input type="radio"
											name="physicallyChallengedRadio" class="physically" id="inlineRadio2" value="no"
											 required> No
										</label>
									</div>
									
									<div class="col-lg-4 pr-details">
										<label>Provide Details(If yes*)</label><br />
										<textarea class="form-control" name="physicallyChallenged" value="" rows="3" name="details"><% if(!student2.getPhysicalyChallenged().equalsIgnoreCase("")){
										out.println(student2.getPhysicalyChallenged());
										} %></textarea>
									</div>
									<div class="col-lg-4">
										<div class="form-group">
											<label>University Registration Number(If Any*)</label> <input
												type="text" class="form-control"
												placeholder="Enter PR Number" value="<% out.print(student2.getUniversityNumber()); %>" name="uniRegNumber">
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
						<%
							ParentGaurdian[] pg = student.getParentGaurdian();
							
						%>
						<div class="panel-body">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-3">
										<input type="hidden" value="<% out.print(pg[0].getParentGaurdianID()); %>" name="gaurdian" />
 										<label class="father-name">Father's Name</label> <input
											type="text" class="form-control" placeholder=""
											name="fatherName" value="<% out.println(pg[0].getFullName()); %>" required>
									</div>
									<div class="col-lg-3">
										<label class="father-qualification">Father's
											Qualification</label> <input type="text" name="fatherQualification"
											class="form-control" value="<% out.println(pg[0].getEmail()); %>" placeholder=" " required>
									</div>
									<div class="col-lg-3">
										<label class="father-occupation">Father's Occupation</label> <input
											type="text" class="form-control" value="<% out.println(pg[0].getOccupation()); %>" placeholder=" "
											name="fatherOccupation" required>
									</div>
									<div class="col-lg-3">
										<label class="father-phone">Father's Phone Number</label> <input
											type="text" class="form-control" value="<% out.println(pg[0].getContactNumber()); %>" placeholder=" "
											name="fatherNumber" required>
									</div>
								</div>
							</div>
							
							<% if(pg.length > 1){ %>
							<div class="form-group mother-details">
								<div class="row">
								<input type="hidden" value="<% out.print(pg[1].getParentGaurdianID()); %>" name="gaurdian" />
 										
									<div class="col-lg-3">
										<label>Mother's Name</label> <input type="text"
											class="form-control mother-inputs"  name="motherName"
											placeholder="" value="<% out.println(pg[1].getFullName()); %>" required>
									</div>
									<div class="col-lg-3">
										<label>Mother's Qualification</label> <input type="text"
											class="form-control mother-inputs" name="motherQualification"
											placeholder="" value="<% out.println(pg[1].getEmail()); %>" required>
									</div>
									<div class="col-lg-3">
										<label>Mother's Occupation</label> <input type="text"
											class="form-control mother-inputs" name="motherOccupation"
											placeholder="" value="<% out.println(pg[1].getOccupation()); %>" required>
									</div>
									<div class="col-lg-3">
										<label>Mother's Phone Number</label> <input type="text"
											class="form-control mother-inputs" name="motherNumber"
											placeholder="" value="<% out.println(pg[1].getContactNumber()); %>" required>
									</div>
								</div>
							</div>
							<% }else { 
								out.println("<script>$(document).ready(function(){$(\".father-name\").html(\"Spouse's Name\");"+						
					            "$(\".father-occupation\").html(\"Spouse's Occupation\");"+	
					            "$(\".father-phone\").html(\"Spouse's Phone Number\");"+	
					            "$(\".mother-inputs\").prop('required',false);"+	
					            "$(\".mother-details\").fadeOut();});</script>");
							%>
								<div class="form-group mother-details">
								<div class="row">
									<div class="col-lg-3">
										<label>Mother's Name</label> <input type="text"
											class="form-control mother-inputs"  name="motherName"
											placeholder="" required>
									</div>
									<div class="col-lg-3">
										<label>Mother's Qualification</label> <input type="text"
											class="form-control mother-inputs" name="motherQualification"
											placeholder=""  required>
									</div>
									<div class="col-lg-3">
										<label>Mother's Occupation</label> <input type="text"
											class="form-control mother-inputs" name="motherOccupation"
											placeholder="" required>
									</div>
									<div class="col-lg-3">
										<label>Mother's Phone Number</label> <input type="text"
											class="form-control mother-inputs" name="motherNumber"
											placeholder="" required>
									</div>
								</div>
							</div>
							<% } %>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-6">
									<%  %>
										<label>Family Monthly Income</label> <select
											class="form-control familyIncomeDropdown" name="familyMonthlyIncome" required>
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
								<%
										ContactInfo[] contact = student.getContactInfo();
										if(contact.length>1){
									%>
									<div class="col-lg-6">
									<label>Correspondence Address</label>
										<textarea class="form-control co-address" rows="3"
											value="" name="fullAddress" required><% out.println(contact[1].getAddress()); %></textarea>
										<%out.println("<script>$(document).ready(function(){"+
												"$(\".co-country [value='"+contact[1].getCountry()+"']\").prop('selected', true);"+
												"$(\".pr-country [value='"+contact[0].getCountry()+"']\").prop('selected', true);"+
												"});</script>"); %>
										<label>Country</label> <select name="country"
											class="form-control co-country" required>
											<option>Indian</option>
											<option>USA</option>
										</select> <label>State</label> <input type="text"
											value="<% out.println(contact[1].getState()); %>"class="form-control co-state" name="state" placeholder=" "
											required> <label>City/Town</label> <input type="text"
											value="<% out.println(contact[1].getCityTownVillage()); %>" class="form-control co-city" placeholder=" " name="cityTown"
											required> <label>Taluka</label> <input type="text"
											value="<% out.println(contact[1].getTaluka()); %>" class="form-control co-taluka" placeholder=" " name="taluka"
											required> <label>Pincode</label> <input type="text"
											value="<% out.println(contact[1].getPinCode()); %>"class="form-control co-pincode" placeholder=" "
											name="pincode" required>
									</div>
									<div class="col-lg-6">
										<label>Permanent Address&nbsp; <input type="checkbox"
											value="yes" name="permanentAddress" class="address-checkbox">
											Same as Correspondence Address
										</label>
										<textarea class="form-control pr-address" rows="3"
											value="" name="permanentfullAddress" required><% out.println(contact[0].getAddress()); %></textarea>
										<label>Country</label> <select name="permanentCountry"
											class="form-control pr-country" required>
											<option>Indian</option>
											<option>USA</option>
										</select> <label>State</label> <input type="text" class="form-control pr-state"
											value="<% out.println(contact[0].getState()); %>" name="permanentState pr-state" placeholder=" " required>
										<label>City/Town</label> <input type="text"
											value="<% out.println(contact[0].getCityTownVillage()); %>" name="permanentCityTown" class="form-control pr-city"
											placeholder=" " required> <label>Taluka</label> <input
											value="<% out.println(contact[0].getTaluka()); %>" type="text" name="permanentTaluka"
											class="form-control pr-taluka" placeholder=" " required>
										<label>Pincode</label> <input type="text"
											value="<% out.println(contact[0].getPinCode()); %>"name="permanentPincode" class="form-control pr-pincode"
											placeholder=" " required>
									</div>
									<% }else{ %>
									<%out.println("<script>$(document).ready(function(){"+
												"$(\".co-country [value='"+contact[0].getCountry()+"']\").prop('selected', true);"+
												"$(\".pr-country [value='"+contact[0].getCountry()+"']\").prop('selected', true);"+
												"});</script>"); %>
									<div class="col-lg-6">
									<label>Correspondence Address</label>
										<textarea class="form-control co-address" rows="3"
											value="" name="fullAddress" required><% out.println(contact[0].getAddress()); %></textarea>
										<label>Country</label> <select name="country"
											class="form-control co-country" required>
											<option>Indian</option>
											<option>USA</option>
										</select> <label>State</label> <input type="text"
											value="<% out.println(contact[0].getState()); %>" class="form-control co-state" name="state" placeholder=" "
											required> <label>City/Town</label> <input type="text"
											value="<% out.println(contact[0].getCityTownVillage()); %>"  class="form-control co-city" placeholder=" " name="cityTown"
											required> <label>Taluka</label> <input type="text"
											class="form-control co-taluka" placeholder=" " name="taluka"
											value="<% out.println(contact[0].getTaluka()); %>" required> <label>Pincode</label> <input type="text"
											value="<% out.println(contact[0].getPinCode()); %>"class="form-control co-pincode" placeholder=" "
											name="pincode" required>
									</div>
									<div class="col-lg-6">
										<label>Permanent Address&nbsp; <input type="checkbox"
											value="yes" name="permanentAddress" class="address-checkbox">
											Same as Correspondence Address
										</label>
										<textarea class="form-control pr-address" rows="3"
											value="" name="permanentfullAddress" required><% out.println(contact[0].getAddress()); %></textarea>
										<label>Country</label> <select name="permanentCountry"
											class="form-control pr-country" required>
											<option>Indian</option>
											<option>USA</option>
										</select> <label>State</label> <input type="text" class="form-control"
											value="<% out.println(contact[0].getState()); %>" name="permanentState pr-state" placeholder=" " required>
										<label>City/Town</label> <input type="text"
											value="<% out.println(contact[0].getCityTownVillage()); %>" name="permanentCityTown" class="form-control pr-city"
											placeholder=" " required> <label>Taluka</label> <input
											value="<% out.println(contact[0].getTaluka()); %>" type="text" name="permanentTaluka"
											class="form-control pr-taluka" placeholder=" " required>
										<label>Pincode</label> <input type="text"
											value="<% out.println(contact[0].getPinCode()); %>" name="permanentPincode" class="form-control pr-pincode"
											placeholder=" " required>
									</div>
									
									<%} %>
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
											value="<% out.println(contact[0].getContactNo()); %>" class="form-control" name="contactMobileNumber"
											placeholder=" " required>
									</div>
									<div class="col-lg-4">
										<label>Alternate Number</label> <input type="text"
											value="<% out.println(contact[0].getAlternateNo()); %>"class="form-control" placeholder=" " name="alternativeNumber"
											required>
									</div>
									<div class="col-lg-4">
										<label>Email Id</label> <input type="email"
											value="<% out.println(contact[0].getEmailID()); %>"class="form-control" placeholder=" " name="emailID" required>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				PreviousEducation[] education = student.getPreviousEducation();
				%>
				<%
				String monthYearHSSC[] = education[0].getMonthYearOfPassing().split(" ");
				String monthYearSSC[] = education[1].getMonthYearOfPassing().split(" ");
				out.println("<script>$(document).ready(function(){"+
												"$(\".examinationBodyHSSC [value='"+education[0].getExaminingBody()+"']\").prop('selected', true);"+
												"$(\".hsscCategory [value='"+education[0].getStream()+"']\").prop('selected', true);"+
												"$(\".hsscCategory [value='"+education[0].getStream()+"']\").prop('selected', true);"+
												"$(\".hsscMonth [value='"+monthYearHSSC[0]+"']\").prop('selected', true);"+
												"$(\".hsscYear [value='"+monthYearHSSC[1]+"']\").prop('selected', true);"+
												"$(\".sscExaminationBody [value='"+education[1].getExaminingBody()+"']\").prop('selected', true);"+
												"$(\".sscMonth [value='"+monthYearSSC[0]+"']\").prop('selected', true);"+
												"$(\".sscYear [value='"+monthYearSSC[1]+"']\").prop('selected', true);"+
												"});</script>"); %>
								
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">HSSC Exam Information</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<label>Name Of the School</label> <input type="text"
											value="<%out.println(education[0].getNameOfSchool()); %>" class="form-control" placeholder=" " name="hsscNameOfSchool"
											required>
									</div>
									<div class="col-lg-4">
										<label>Name of the Examination Body</label> <select
											class="form-control examinationBodyHSSC" name="hsscExaminationBody" required>
											<option value="GOA BOARD">GOA BOARD</option>
											<option value="ICSE">ICSE</option>
											<option value="CBSE">CBSE</option>
											<option value="ANY OTHER">ANY OTHER</option>
										</select>
									</div>
									<div class="col-lg-4">
										<label>Category</label> <select class="form-control hsscCategory"
											name="hsscCategory" required>
											<option value="XII SCIENCE">XII SCIENCE</option>
											<option value="XII COMMERCE">XII COMMERCE</option>
											<option value="XII ARTS">XII ARTS</option>
											<option value="XII VOCATIONAL">XII VOCATIONAL</option>
											<option value="DIPLOMA IN ELECTRONICS">DIPLOMA IN ELECTRONICS</option>
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
												<select class="form-control hsscMonth" name="hsscMonth" required>
													<option value="JANUARY">JANUARY</option>
													<option value="FEBRUARY">FEBRUARY</option>
													<option value="MARCH">MARCH</option>
													<option value="APRIL">APRIL</option>
													<option value="MAY">MAY</option>
													<option value="JUNE">JUNE</option>
													<option value="JULY">JULY</option>
													<option value="AUGUST">AUGUST</option>
													<option value="SEPTEMBER">SEPTEMBER</option>
													<option value="OCTOBER">OCTOBER</option>
													<option value="NOVEMBER">NOVEMBER</option>
													<option value="DECEMBER">DECEMBER</option>
												</select>
											</div>
											<div class="col-lg-6">
												<select class="form-control hsscYear" name="hsscYear" required>
													<option value="2016">2016</option>
													<option value="2015">2015</option>
													<option value="2014">2014</option>
													<option value="2013">2013</option>
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
						<!-- 	<div class="form-group">
								<div class="row">
									<div class="col-lg-12"></div>
									<div class="col-lg-4">
										<label>Marks Obtained</label> <input type="text"
											value="<%out.println(education[0].getMarksObtained()); %>" class="form-control" placeholder=" " name="hsscMarksObtained"
											required>
									</div>
									<div class="col-lg-4">
										<label>Total Marks(Out of)</label> <input type="text"
											value="<%out.println(education[0].getTotalMarks()); %>"class="form-control" placeholder=" " name="hsscTotalMarks"
											required>
									</div>
									<div class="col-lg-4">
										<label>Grade</label> <input type="text" class="form-control"
											value="<%out.println(education[0].getGrade()); %>" placeholder=" " name="hsscGrade" required>
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
													value="<%out.println(education[1].getNameOfSchool()); %>" class="form-control" placeholder=" " name="sscNameOfSchool"
													required>
											</div>
											<div class="col-lg-4">
												<label>Name of the Examination Body</label> <select
													class="form-control sscExaminationBody" name="sscExaminationBody" required>
													<option value="GOA BOARD">GOA BOARD</option>
														<option value="ICSE">ICSE</option>
														<option value="CBSE">CBSE</option>
														<option value="ANY OTHER">ANY OTHER</option>
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
														<select class="form-control sscMonth" name="sscMonth" required>
															<option value="JANUARY">JANUARY</option>
															<option value="FEBRUARY">FEBRUARY</option>
															<option value="MARCH">MARCH</option>
															<option value="APRIL">APRIL</option>
															<option value="MAY">MAY</option>
															<option value="JUNE">JUNE</option>
															<option value="JULY">JULY</option>
															<option value="AUGUST">AUGUST</option>
															<option value="SEPTEMBER">SEPTEMBER</option>
															<option value="OCTOBER">OCTOBER</option>
															<option value="NOVEMBER">NOVEMBER</option>
															<option value="DECEMBER">DECEMBER</option>
														</select>
													</div>
													<div class="col-lg-6">
														<select class="form-control sscYear" name="sscYear" required>
															<option value="2016">2016</option>
															<option value="2015">2015</option>
															<option value="2014">2014</option>
															<option value="2013">2013</option>
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
													value="<%out.println(education[1].getMarksObtained()); %>" class="form-control" placeholder=" "
													name="sscMarksObtained" required>
											</div>
											<div class="col-lg-4">
												<label>TOTAL MARKS(Out Of)</label> <input type="text"
													value="<%out.println(education[1].getTotalMarks()); %>"class="form-control" placeholder=" " name="sscTotalMarks"
													required>
											</div>
											<div class="col-lg-4">
												<label>Grade</label> <input type="text" class="form-control"
													value="<%out.println(education[1].getGrade()); %>" placeholder=" " name="sscGrade" required>
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
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12 text-right">
											<label class="radio-inline">  <input
												id="applyAdmission" type="submit" class="btn btn-warning"
												value="Decline" style="color: black" /> <input
												id="applyAdmission" type="submit" name="confirm" class="btn btn-warning"
												value="Confirm" />
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
	
	<%} %>
	
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
        $("input[name$='physicallyChallengedRadio']").click(function () {
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
                                var semester = "";
                                var dropdown = "<div class='form-inline' style='margin: 10px;'><select class='form-control' name='component' required>";
                                $.each(value1, function (index2, value2) {
                                    semester = value2[2];
                                    dropdown += "<option value='"+ value2[0] +"'>" + value2[1] + "</option>";
                                });
                                dropdown = dropdown + "</select><input type='hidden' value='"+semester+"' name='semester' />";
                                dropdown += "(Semester "+ semester + ")</div>"
                                $(".compB").append(dropdown);
                            });

                        }
                        if (index == "single") {
                            $(".compB").append("<div class='form-inline' style='margin: 10px;'><p>" + value[1] + " (Semester " + value[2] + ")<input type='hidden' value='"+value[2]+"' name='semester' /></p><input type='hidden' value='" + value[0] + "' name='component'/></div>");
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
                data: {"componentSubject": selectedSubjectID, "courseID": $(".course-dropdown").val(), "CompC": 1},
                success: function (data) {
                    $(".compC").empty();
                    subJSON = JSON.parse(data);
                    $.each(subJSON, function (index, value) {
                        if (index == "multiple") {

                            $.each(value, function (index1, value1) {
                                var semester = "";
                                var dropdown = "<div class='form-inline' style='margin: 10px;'><select class='form-control' name='component' required>";
                                $.each(value1, function (index2, value2) {
                                    semester = value2[2];
                                    dropdown += "<option value='"+ value2[0] +"'>" + value2[1] + "</option>";
                                });
                                dropdown = dropdown + "</select><input type='hidden' value='"+semester+"' name='semester' />";
                                dropdown += "(Semester "+ semester + ") </div>";
                                $(".compC").append(dropdown);
                            });

                        }
                        if (index == "single") {
                            $(".compC").append("<div class='form-inline' style='margin: 10px;'><p>" + value[1] + " (Semester " + value[2] + ")</p><input type='hidden' value='"+value[2]+"' name='semester' /><input type='hidden' name='component' value='"+ value[0] +"' /></div>");
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

        $(".course-dropdown").change(function () {
            if (currentStructureSelected != null) {
            	clearComponents();
                populateSubjectDropdown($(this).val(), $(".structure-radio:checked").val());
            }
        });
        $(".structure-radio").click(function () {
        	clearComponents();
            currentStructureSelected = $(this);
            structureid = $(this).val();
            addSubjectDropdown(currentStructureSelected);
            populateSubjectDropdown($(".course-dropdown").val(), structureid);
        });
        $(document).on('change', '.subject-dropdown:first', function () {
            var selectedSubjectID = $(this).val();
            $(".subject-div").find(".subject-dropdown").eq(1).empty();
            populateCompatibleSubjectDropdown(selectedSubjectID);
            addComponentB(selectedSubjectID);
            addComponentC(selectedSubjectID);
            addComponentD(selectedSubjectID);
        });

    });

</script>
	


</body>
</html>
