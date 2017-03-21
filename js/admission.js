$(document).ready(function(){
	 var subJSON = [];
	    $(".course-dropdown").change(function(){
	    	var courceSeleted = $(".course-dropdown").val();
	    	$.ajax({
	    		method:"get",
	    		url:"http://localhost:8080/ChowguleCollegeRedesign/AdmissionAJAX",
	    		data: { "courseId": courceSeleted },
	    		success: function(data){
	    			subJSON = JSON.parse(data);
	    			var dropdown1 = $(".subject-div:nth-child(1)");
	    			$.each(subJSON, function(index, value){
	    				$.each(value, function(index1, value1){
	    					$(".subject-div:first").find(".subject-dropdown:first").append("<option>"+value1+"</option>");
	        			});
	    			});
	    		},
	    		error: function(){
	    			alert("error occured");
	    		}
	    		
	    	});
	    });
	    
	    $(".structure-radio").click(function(){
	    	var structureid = $(this).val();
	    	var structurename = $(this).attr("data-name");
	    	var arrayOfStructures = structurename.split(" ");
	    	$(".subject-div").empty();
	    	for(var i=0; i<arrayOfStructures.length; i++){
	    		if(arrayOfStructures[i]!=""){
		    		$(".subject-div").append(" <div class=\"col-lg-3 \">\
		    			    <label>Choose "+ arrayOfStructures[i]+"</label>\
		    			    <select class=\"form-control subject-dropdown\">\
		    			    </select>\
		    			  </div>");
	    		}
	    	}
	    	//making an ajax call to fill all the components A,B,C,D
	    	var courceSeleted = $(".course-dropdown").val();
	    	$.ajax({
	    		method: "get",
	    		url: "http://localhost:8080/ChowguleCollegeRedesign/AdmissionAJAX",
	    		data: {"courseid": courceSeleted, "structureid": structureid},
	    		success: function(data){
	    			var dropdown1 = $(".subject-div:nth-child(1)");
	    			$.each(subJSON, function(index, value){
	    				$.each(value, function(index1, value1){
	    					$(".subject-div:first").find(".subject-dropdown:first").append("<option>"+value1+"</option>");
	        			});
	    			});
	    		},
	    		error: function(data){
	    			alert("error occured");
	    		}
	    	});
	    });
});