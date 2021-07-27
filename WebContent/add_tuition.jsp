<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="links.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
<!-- Tution_Name
Owner_Name
Established_Year
Register_Date
GST_No
Tuition_Address
Tuition_Website
Tuition_Email -->
<style type="text/css">
#success_message {
	display: none;
}
</style>
<script type="text/javascript">
	  $(document).ready(function() {
		    $('#add_tuition_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields: {
		        	Tution_Name : {
		                validators: {
		                        notEmpty: {
		                        message: 'Please Enter Exam Type!'
		                    }
		                }
		            },
		            
		            Owner_Name : {
		                validators: {
		                        notEmpty: {
		                        message: 'Please Set exam time'
		                    }
		                }
		            },
		            Established_Year : {
		                validators: {
		                        notEmpty: {
		                        message: 'Please Set exam time'
		                    }
		                }
		            },
		            
		            
		            GST_No : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Select class'
		                    },
		                   
		                }
		            },
		            
		            Tuition_Address : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Select batch!'
		                    },
		                   
		                }
		            },
		            
		            Tuition_Website : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Select Exam coordinator!'
		                    },
		                   
		                }
		            },
		            
		            
		            Tuition_Email : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Enter exam details!'
		                    },
		                   
		                }
		            },
		            Register_Date :{
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
	           	Contact_No : {
	                validators: {
	                    notEmpty: {
	                        message: 'Add Customer Mobile number'
	                    },
	                    stringLength: {
	                    	min:10,
	                        max: 10,
	                        message: 'Only 10 Digits'
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
		            
		            $( '#add_tuition_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#add_tuition_form').click(function() {
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
		<aside class="main-sidebar">
			<%@include file="aside.jsp"%>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container">
					<div class="row">
						<!-- left column -->
						<div class="col-md-11">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">Tuition Details</h3>
								</div>
								<!-- /.box-header -->
								<!-- form start -->
								<form role="form" action="tuition/add/" method="POST"
									id="add_tuition_form">
									<div class="box-body">
										<div class="row">


											<div class="col-md-6">
												<div class="form-group">
													<label for="Tution_Name"><span class="errorStar">*</span>Tuition Name:</label>
													<input type="text" class="form-control" id="Tution_Name"
														name="Tution_Name" placeholder="Enter Tuition Name">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Owner_Name"><span class="errorStar">*</span>Owner Name:</label>
													<input type="text" class="form-control" id="Owner_Name"
														name="Owner_Name" placeholder="Enter Owner Name">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="Established_Year"><span
														class="errorStar">*</span>Established_Year:</label> <input
														type="text" class="form-control" id="Established_Year"
														name="Established_Year">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Register_Date"><span class="errorStar">*</span>Register Date:</label>
													<input type="date" class="form-control" id="Register_Date"
														name="Register_Date" placeholder="Enter Register Date"
														required="required">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="GST_ No"><span class="errorStar">*</span>GST
														No:</label> <input type="text" class="form-control" id="GST_No"
														name="GST_No" placeholder="Enter GST No">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="TuitionAddress"><span class="errorStar">*</span>Address:</label>
													<input type="text" class="form-control"
														id="Tuition_Address" name="Tuition_Address"
														placeholder="Enter Address">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Tuition_Contact_No"><span
														class="errorStar">*</span>Contact No :</label> <input type="text"
														class="form-control" id="Contact_No" name="Contact_No"
														placeholder="Enter 10 Digit Number">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Tuition_Website"><span
														class="errorStar">*</span>Website :</label> <input type="text"
														class="form-control" id="Tuition_Website"
														name="Tuition_Website" placeholder="https://www.abc.com"
														required="required">
													<div class="help-block with-errors"></div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Tuition_Email1"><span class="errorStar">*</span>Email
														address :</label> <input type="text" class="form-control"
														id="Tuition_Email" name="Tuition_Email">
													<div class="help-block with-errors"></div>
												</div>
											</div>
											<p id="demo"></p>

											</select>
										</div>
									</div>

									<div class="box-footer">
										<div class="alert alert-success" role="alert"
											id="success_message">
											Added <i class="glyphicon glyphicon-thumbs-up"></i>successfully!
										</div>
										<button type="Submit" class="btn btn-primary">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<%@include file="footer.jsp"%>
</body>
</html>
