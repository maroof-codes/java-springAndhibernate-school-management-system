<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Student Register</title>
<!-- Tell the browser to be responsive to screen width -->
<%@include file="links.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>

<style type="text/css">
#success_message {
	display: none;
}
</style>
<script type="text/javascript">
	  $(document).ready(function() {
		    $('#student_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields: {
		        	txtName: {
		                validators: {
		                        stringLength: {
		                        min: 3,
		                    },
		                        notEmpty: {
		                        message: 'Please Enter Student Name!'
		                    }
		                }
		            },
		            
		            txtAddress: {
		                validators: {
		                        stringLength: {
		                        min: 10,
		                    },
		                        notEmpty: {
		                        message: 'Please Enter Address'
		                    }
		                }
		            },

		    		contact : {
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
		            
		            SDOB:{
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
		     		          
	           	ddlLoginType2 : {
		                validators: {
		                    notEmpty: {
		                        message: 'Please Select'
		                    }
		                }
		                  },
		            ddlLoginType: {
		            	validators: {
		                    notEmpty: {
		                        message: 'Please select'
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
		            
		            $( '#student_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#student_form').click(function() {
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
									<h3 class="box-title">Student Registration</h3>
								</div>
								<!-- /.box-header -->
								<!-- form start -->
								<form role="form" action="/TMS/addstudent/add/" method="POST"
									id="student_form">
									<div class="box-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="txtname"><span class="errorStar">*</span>Name
														:</label> <input type="text" class="form-control" id="txtName"
														name="txtName" placeholder="Enter First Name">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="txtRaddress"><span class="errorStar">*</span>Address
														:</label> <input type="text" class="form-control" id="txtAddress"
														name="txtAddress" placeholder="Enter Address">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="dob"><span class="errorStar">*</span>Date
														Of Birth :</label> <input type="date" class="form-control"
														id="SDOB" name="SDOB">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="inputEmail1"><span class="errorStar">*</span>Email
														address :</label> <input type="email" class="form-control"
														id="inputEmail" name="inputEmail"
														placeholder="name@email.com">
													<div class="help-block with-errors"></div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="contact"><span class="errorStar">*</span>Contact
														Number :</label> <input type="text" class="form-control"
														id="contact" name = "contact" placeholder="Enter 10 Digit Number">
												</div>
											</div>



											<div class="col-md-6">
												<div class="form-group">
													<label for="Class"><span class="errorStar">*</span>Class
														Name :</label> <select name="ddlLoginType2"
														onchange="mewhat(this.value);" id="ddlLoginType2"
														class="form-control">
														<option disabled selected>Select Class</option>
														<c:forEach var="list" items="${classesBeans}">
															<option value="${list.classesName}">${list.classesName}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="Scontact"><span class="errorStar">*</span>Batch
														:</label> <select name="ddlLoginType"
														onchange="mewhat(this.value);" id="ddlLoginType"
														class="form-control">
														<option disabled selected>Select Batch</option>
														<c:forEach var="list" items="${batchBeans}">
															<option value="${list.batchNumber}">${list.batchNumber}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="image">Preview :</label> <input type="file"
														name="file" id="profile-img"> <img
														src="/TMS/resources/photos/download.png"
														class="img-thumbnail" id="profile-img-tag" width="100px" />
												</div>
											</div>

										</div>

										<div class="box-footer">
										<div class="alert alert-success" role="alert"
												id="success_message">
												Added <i class="glyphicon glyphicon-thumbs-up"></i>successfully!
											</div>
											<button type="Submit" class="btn btn-primary">Register</button>
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
