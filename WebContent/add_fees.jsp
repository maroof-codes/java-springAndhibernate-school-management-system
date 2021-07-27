<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Fess Details</title>
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

<script type="text/javascript">
	  $(document).ready(function() {
		    $('#fees_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields: {
		        	Fees_Student_Id: {
		                validators: {
		                        stringLength: {
		                        min: 2,
		                    },
		                        notEmpty: {
		                        message: 'Add Customer Name'
		                    }
		                }
		            },
		            
		            Student_Name: {
		                validators: {
		                        stringLength: {
		                        min: 2,
		                    },
		                        notEmpty: {
		                        message: 'Add Customer GST'
		                    }
		                }
		            },
		            
		            Fees_Batch_Id: {
		                validators: {
		                    notEmpty: {
		                        message: 'Add Customer Mobile number'
		                    },
		                    stringLength: {
		                        max: 10,

		                        message: 'Only 10 Digits'
		                    }
		                }
		            },
		            
		            Fees_Date:{
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
		     		          
		            Fees_Class_Id: {
		                validators: {
		                    notEmpty: {
		                        message: 'Add Customer Mobile number'
		                    },
		                    stringLength: {
		                        max: 10,
		                        message: 'Only 10 Digits'
		                    }
		                }
		            },
		            Paid_Fees: {
		            	validators: {
		                    notEmpty: {
		                        message: 'Add Customer Mobile number'
		                    },
		                    stringLength: {
		                        min: 3,
		                        message: 'Enter minimum 4 digits'
		                    }
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
		            
		            $( '#fees_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#fees_form').click(function() {
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
			<!-- Logo -->

			<%@include file="header.jsp"%>

		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">

			<%@include file="aside.jsp"%>

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
									<h3 class="box-title">Add Fees</h3>
								</div>
								<!-- /.box-header -->
								<!-- form start -->
								<form role="form" action="/TMS/fees/add/" method="POST"
									id="fees_form">
									<div class="box-body">

										<div class="col-md-5">
											<div class="form-group">
												<label for="Fess_Student_Name"><span
													class="errorStar">*</span>Student Name :</label> <input type="text"
													class="form-control" id="Student_Name" name="Student_Name"
													placeholder="Enter Student Name">
											</div>
										</div>

										<div class="col-md-5">
											<div class="form-group">
												<label for="Fees_Batch_No"><span class="errorStar">*</span>Date
													:</label> <input type="date" class="form-control" id="Fees_Date"
													name="Fees_Date">
											</div>
										</div>
										<div class="col-md-5">
											<div class="form-group">
												<label for="Fees_Class_Name"><span class="errorStar">*</span>Total
													Fees :</label> <input type="text" class="form-control"
													id="Total_Fees" name="Total_Fees">
											</div>
										</div>
										<div class="col-md-5">
											<div class="form-group">
												<label for="Fees_Class_Name"><span class="errorStar">*</span>Paid
													Fees :</label> <input type="text" class="form-control"
													id="Paid_Fees" name="Paid_Fees">
											</div>
										</div>
										<div class="col-md-5">
											<div class="form-group">
												<label for="Fees_Class_Name"><span class="errorStar">*</span>Remaining
													Fees :</label> <input type="text" class="form-control"
													id="Remaining_Fees" name="Remaining_Fees" readonly>
											</div>

										</div>
										<div class="col-md-10">
											<div class="alert alert-success" role="alert"
												id="success_message">
												Added <i class="glyphicon glyphicon-thumbs-up"></i>successfully!
											</div>
											<div class="box-footer">
												<button type="Submit" class="btn btn-primary">Save</button>
											</div>
										</div>
									</div>
								</form>
			</section>
		</div>

		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<script>
				$('#Paid_Fees').keyup(function() {
					var Total_Fees;
					var Paid_Fees;
					Total_Fees = parseFloat($('#Total_Fees').val());
					Paid_Fees = parseFloat($('#Paid_Fees').val());
					var Remaining_Fees = Total_Fees - Paid_Fees;
					console.log("Remaining_Fees :" + Remaining_Fees);
					$('#Remaining_Fees').val(Remaining_Fees.toFixed(2));
				});
			</script>
			<%@include file="footer.jsp"%>
</body>
</html>
