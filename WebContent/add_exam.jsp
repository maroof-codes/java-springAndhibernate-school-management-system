<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 |Add Exam Details</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<%@include file="links.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
<style type="text/css">
#success_message {
	display: none;
}
</style>

<!-- exam_form
Exam_type
Exam_Date
Exam_Time
class_name
batch
Exam_Total_Marks
exam_duration
Exam_Coordinator
exam_details -->
<script type="text/javascript">
	  $(document).ready(function() {
		    $('#exam_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields: {
		        	Exam_type : {
		                validators: {
		                        notEmpty: {
		                        message: 'Please Enter Exam Type!'
		                    }
		                }
		            },
		            
		            Exam_Time : {
		                validators: {
		                        notEmpty: {
		                        message: 'Please Set exam time'
		                    }
		                }
		            },
		            
		            
		            class_name : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Select class'
		                    },
		                   
		                }
		            },
		            
		            batch : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Select batch!'
		                    },
		                   
		                }
		            },
		            
		            Exam_Coordinator : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Select Exam coordinator!'
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
		            Exam_Date :{
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
		            
		            $( '#exam_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#exam_form').click(function() {
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
									<h3 class="box-title">Exam Details</h3>
								</div>
								<!-- /.box-header -->
								<!-- form start -->
								<form role="form" action="/TMS/exam/add/" method="POST"
									id="exam_form">
									<div class="box-body">
										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label for="Scontact"><span class="errorStar">*</span>Exam
														Type :</label> <input type="text" class="form-control"
														name="Exam_type" id="Exam_type">
												</div>
											</div>

			
											<div class="col-md-6">
												<div class="form-group">
													<label for="Date"><span class="errorStar">*</span>Exam
														Date :</label> <input type="date" class="form-control"
														id="Exam_Date" name="Exam_Date" required="required">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Time"><span class="errorStar">*</span>Exam
														Time :</label> <input type="Time" class="form-control"
														id="Exam_Time" name="Exam_Time" required="required">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="class_name"><span class="errorStar">*</span>Class
														: </label> <select name="class_name" id="class_name"
														class="form-control">
														<c:forEach var="list" items="${classesBeans}">
															<option value="${list.classesName}">${list.classesName}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="batch"><span class="errorStar">*</span>Batch
														: </label> <select name="batch" id="batch" class="form-control">
													<c:forEach var="list" items="${batchBeans}">
															<option value="${list.batchNumber}">${list.batchNumber}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="AExam"><span class="errorStar">*</span>Total
														Marks :</label> <input type="text" class="form-control"
														id="Exam_Total_Marks" name="Exam_Total_Marks"
														required="required">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exam_duration"><span class="errorStar">*</span>Exam
														Duration:</label> <input type="text" class="form-control"
														id="exam_duration" name="exam_duration"
														required="required">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="ExamCoordinator"><span
														class="errorStar">*</span>Exam Coordinator:</label> <select
														name="Exam_Coordinator" id="Exam_Coordinator"
														class="form-control">
														<c:forEach var="list" items="${facultyBeans}">
															<option value="${list.facultyName}">${list.facultyName}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Time"><span class="errorStar">*</span>Exam
														Details :</label>
													<textarea class="form-control" rows="5" id="comment"
														id="exam_details" name="exam_details" required="required"></textarea>
												</div>
											</div>

										</div>


										<div class="box-footer">
										<div class="alert alert-success" role="alert"
												id="success_message">
												Added <i class="glyphicon glyphicon-thumbs-up"></i>successfully!
											</div>
											<button type="Submit" id="Submit" class="btn btn-primary">Submit</button>
										</div>

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

			reader.onload = function(e) {
				$('#profile-img-tag').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#profile-img").change(function() {
		readURL(this);
	});
</script>
</html>
