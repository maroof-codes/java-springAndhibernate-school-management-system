<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Class Registration</title>
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
		$('#class_form').bootstrapValidator({
			// To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},

			fields : {
				Class_Name : {
					validators : {
						notEmpty : {
							message : 'Add class Name'
						}
					}
				},

				Class_Description : {
					validators : {
						notEmpty : {
							message : 'Please provide description'
						}
					}
				},

			}
		}).on('success.form.bv', function(e) {
			$('#success_message').slideDown({
				opacity : "show"
			}, "slow") // Do something ...

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

			$('#class_form').each(function() {
				this.reset();
			});

			$('#class_form').click(function() {
				location.reload(true);
			});
		});
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
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container">
					<div class="row">
						<!-- left column -->
						<div class="col-md-11">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">Class Details</h3>
								</div>
								<!-- /.box-header -->
								<!-- form start -->
								<form role="form" action="/TMS/classes/add/" method="POST"
									id="class_form">
									<div class="box-body">
										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label for="Class_Description"><span
														class="errorStar">*</span>Class name :</label> <input type="text"
														class="form-control" id="Class_Name" name="Class_Name"
														placeholder="Enter Class/Course Name" required="required">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="Class_Description"><span
														class="errorStar">*</span>Description :</label> <input type="text"
														class="form-control" id="Classes_Description"
														name="Class_Description"
														placeholder="Enter Class Description" required="required">
												</div>
											</div>
										</div>

										<div class="box-footer">
											<div class="alert alert-success" role="alert"
												id="success_message">
												Added <i class="glyphicon glyphicon-thumbs-up"></i>successfully!
											</div>
											<button type="submit" class="btn btn-primary">Save</button>
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
