<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Faculty Register</title>
<style type="text/css">
#success_message {
	display: none;
}
</style>


<!-- faculty_form
Faculty_Name
Address
Date_Of_Birth
Email_Id
Contact_No
Class_Name
Date_of_Joining	 -->

<%@include file="links.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>

<script type="text/javascript">
	  $(document).ready(function() {
		    $('#faculty_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields: {
		        	Faculty_Name : {
		                validators: {
		                        notEmpty: {
		                        message: 'Please Enter Faculty Name!'
		                    }
		                }
		            },
		            
		            Address : {
		                validators: {
		                        notEmpty: {
		                        message: 'Please Set faculty Address'
		                    }
		                }
		            },
		            
		            
		            Class_Name : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Select class'
		                    },
		                   
		                }
		            },
		            
		            Contact_No : {
		                validators: {
		                    notEmpty: {
		                        message: 'Enter Numbers only'
		                    },
		                    stringLength :{
		                    	max:10,
		                    	min:10,
		                    	message: 'Enter 10 numbers'
		                    }
		                   
		                }
		            },
		            
		            Email_Id : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Enter Email Id!'
		                    },
		                   
		                }
		            },
		            
		            
		            exam_details : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Enter exam details!'
		                    },
		                   
		                }
		            },
		            Date_Of_Birth :{
	                    validators: {
	                        notEmpty: {
	                            message: 'The date is required'
	                        },
	                        date: {
	                            format: 'YYYY/MM/DD',
	                            message: 'The date is not a valid'
	                        }
	                    }
	           	 },
		     		       
	           	
	           	Date_of_Joining :{
                    validators: {
                        notEmpty: {
                            message: 'The date is required'
                        },
                        date: {
                            format: 'YYYY/MM/DD',
                            message: 'The date is not a valid'
                        }
                    }
           	 },
	           	Exam_Total_Marks : {
		                validators: {
		                    notEmpty: {
		                        message: 'please Enter Total marks'
		                    },
		                    stringLength: {
		                    	min: 2,
		                        max: 3,
		                        message: '3 digits only'
		                    }
		                }
		            },
		            exam_duration : {
		            	validators: {
		                    notEmpty: {
		                        message: 'Please enter exam duration'
		                    },
		                    
		                }
		            },
		            Total_Fees: {
		                validators: {
		                    notEmpty: {
		                        message: 'Add Customer Mobile number'
		                    },
		                    stringLength: {
		                        min: 4,
		                        message: 'Enter minimum 4 digits'
		                    }
		                }
		            },
		            
		            }
		        })
		        .on('success.form.bv', function(e) {
		            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
		               
		           
		            // Prevent form submission
		            e.preventDefault();

		            // Get the form instance
		            var $form = $(e.target);

		            // Get the BootstrapValidator instance
		            var bv = $form.data('bootstrapValidator');

		            // Use Ajax to submit form data
		            $.post($form.attr('action'), $form.serialize(), function(result) {
		                console.log(result);
		            }, 'json');
		            
		            $( '#faculty_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#faculty_form').click(function() {
		                location.reload(true);
		            });
		        });
		});

	  // Allow Only numbers Validation
	  
	  $(document).ready(function () {
  //called when key is pressed in textbox
  $("#customer_phone").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
  $("#customer_phone").attr('maxlength','10');
});
	  
	  
	</script>


</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">

			<%@include file="header.jsp"%>

		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- /.sidebar -->

			<%@include file="aside.jsp"%>
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- /Flat Form Strat -->
			<section class="content-header">
				<div class="container">
					<div class="row">
						<!-- left column -->
						<div class="col-md-11">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">Faculty Registration</h3>
								</div>
								<!-- /.box-header -->
								<!-- form start -->
								<form role="form" action="/TMS/faculty/add/" method="POST"
									id="faculty_form">
									<div class="box-body">
										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label for="Faculty_Name"><span class="errorStar">*</span>Faculty
														Name :</label> <input type="text" class="form-control"
														id="Faculty_Name" name="Faculty_Name"
														placeholder="Enter Faculty Name" required="required">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Address"><span class="errorStar">*</span>Address
														:</label> <input type="text" class="form-control" id="Address"
														name="Address" placeholder="Enter Address"
														required="required">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Date_Of_Birth"><span class="errorStar">*</span>Date
														Of Birth :</label> <input type="date" class="form-control"
														id="Date_Of_Birth" name="Date_Of_Birth"
														required="required">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Email1_Id"><span class="errorStar">*</span>Email
														Id :</label> <input type="text" class="form-control" id="Email_Id"
														name="Email_Id" placeholder="name@email.com"
														required="required">
													<div class="help-block with-errors"></div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Contact_No"><span class="errorStar">*</span>Contact
														No :</label> <input type="text" class="form-control"
														id="Contact_No" name="Contact_No"
														placeholder="Enter 10 Digit Number" required="required">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Class_Name"><span class="errorStar">*</span>Class
														Name :</label> <select name="Class_Name"
														onchange="mewhat(this.value);" id="Class_Name"
														name="Class_Name" class="form-control" required="required">
														<c:forEach var="list" items="${classesBeans}">
															<option value="${list.classesName}">${list.classesName}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Date_of_Joining"><span
														class="errorStar">*</span>Date of Joining :</label> <input
														type="date" class="form-control" id="Date_of_Joining"
														name="Date_of_Joining" required="required">
												</div>
											</div>


											<div class="col-md-6">
												<div class="form-group">
													<label for="image">Profile Photo :</label> <input
														type="file" name="file" id="profile-img"
														name="profile-img"> <img src="photos/download.png"
														class="img-thumbnail" id="profile-img-tag" width="100px" />
												</div>
											</div>
										</div>

										<div class="box-footer">
											<div class="alert alert-success" role="alert"
												id="success_message">
												Added <i class="glyphicon glyphicon-thumbs-up"></i>successfully!
											</div>
											<button type="submit" class="btn btn-primary">Register</button>
										</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- /Flat Form End -->

		<!-- /.content-wrapper -->
		<footer class="main-footer">

			<%@include file="footer.jsp"%>
</body>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#profile-img-tag').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#profile-img").change(function(){
        readURL(this);
    });
</script>
</html>
