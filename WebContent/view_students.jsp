<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="links.jsp"%>
<%@include file="pagination_data.jsp"%>
<style type="text/css">
#success_message {
	display: none;
}
</style>
<style>
.modal-header {
	background-color: #337ab7;
}

.modal-header h4 {
	color: #ffff;
}
</style>

<script type="text/javascript">
	$.ajaxSetup({
		cache : false
	});
	$(document).ready(function() {

		/* edit modal submit */

		$('#submit').click(function(event) {
			$('#edit').modal('hide');
			var form = (event.target.form), url = "/TMS/addstudent/update/"

			$.post(url, $("#edit_student_form").serialize(), function(getData) {
				console.log(getData);
			}, 'json');

			$('#delete_message').text("Customer edited successfully")
		});

		$('#edit').on('hidden.bs.modal', function() {
			location.reload(true);
			$('#delete_message').text("Customer edited successfully")
		})

		/* delete modal submit */

		$('#delete-yes').click(function(event) {

			var studentId = $('#student_id_delete').val();
			$('#delete').modal('hide');
			console.log("delete-yes-studentId :" + studentId);

			$.ajax({
				url : "/TMS/addstudent/delete/",
				data : {
					student_id : studentId
				},
				type : 'post',
				cache : false,
				success : function(data) {
					console.log(data);
				},
				error : function() {
					//alert('error');
				}
			});
			$('#delete_message').text("Customer deleted successfully")
			location.reload(true);
		});

	});

	$('#delete').on('hidden.bs.modal', function() {
		$('#delete_message').text("Customer deleted successfully")
		location.reload(true);
		$('#delete_message').text("Customer deleted successfully")
		alert("Customer deleted successfully");
	})

	/* edit function */

	'${list.studentId}', '${list.studentName}', '${list.dateOfBirth}',
			'${list.emailId}', '${list.number}', '${list.classname}',
			'${list.batchId}'
	function editFunction(studentId, studentName, address, dateOfBirth,
			emailId, number, classname, batchId) {
		$('#student_name').val(studentName);
		$('#student_address').val(address);
		$('#student_DOB').val(dateOfBirth);
		$('#student_email').val(emailId);
		$('#student_number').val(number);
		$('#student_className').val(classname);
		$('#student_batch').val(batchId);
		$('#student_id').val(studentId);
	}
	
			function viewFunction(studentName, address, dateOfBirth,
					emailId, number, classname, batchId) {
			document.getElementById("view_student_name").innerHTML = studentName;
			document.getElementById("view_address").innerHTML = address;
			document.getElementById("view_date_of_birth").innerHTML = dateOfBirth;
			document.getElementById("view_email").innerHTML = emailId;
			document.getElementById("view_contact").innerHTML = number;
			document.getElementById("view_class_name").innerHTML = classname;
			document.getElementById("view_batch").innerHTML = batchId;
			}

	/* delete function */

	function deletefunctionTest(studentId) {
		$('#student_id_delete').val(studentId);
		console.log("invoice id :" + $('#student_id_delete').val());
	}

	$(document).ready(function() {
		$('#edit_student_form').ready({

		}).on('edit_student_form', function(e) {
			$('#success_message').slideDown({
				opacity : "show"
			}, "slow") // Do something ...

			// Prevent form submission
			e.preventDefault();

			// Get the form instance
			var $form = $(e.target);

			// Get the BootstrapValidator instance
			var bv = $form.data('edit_student_form');

			// Use Ajax to submit form data
			$.post($form.attr('action'), $form.serialize(), function(result) {
				console.log(result);
			}, 'json');

			$('#edit_student_form').each(function() {
				this.reset();
			});

			$('#edit_student_form').click(function() {
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
				<div id="page-wrapper">

					<div class="row">
						<div class="col-lg-12">
							<span id="delete_message" class="color:green"></span> <a
								href="/TMS/addstudent/getValues/" class="btn btn-primary" role="button">Add
								New</a> <br> <br>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o"></i> Student's List
									</h3>

								</div>
								<div class="table-responsive">
									<span id="delete_message" class="color:green"></span>
									<table id="content_table"
										class="table table-bordred table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th>Name</th>
												<th>Address</th>
												<th>DOB</th>
												<th>Email</th>
												<th>Contact</th>
												<th>Class Name</th>
												<th>Batch</th>
												<th>Action</th>

											</tr>
										</thead>

										<tbody>

											<c:forEach items="${addStudentBeans}" var="list" varStatus = "counter">
												<tr>
													<td>${counter.count}</td>
													<td>${list.studentName}</td>
													<td>${list.address}</td>
													<td>${list.dateOfBirth}</td>
													<td>${list.emailId}</td>
													<td>${list.number}</td>
													<td>${list.classname}</td>
													<td>${list.batchId}</td>
													<td>
															<button class="btn btn-primary btn-xs" data-title="View"
																data-toggle="modal" data-target="#view"
																onclick="viewFunction('${list.studentName}','${list.address}','${list.dateOfBirth}','${list.emailId}','${list.number}','${list.classname}','${list.batchId}')">
																<span class="glyphicon glyphicon-th-list" title = "View"></span>
															</button>
														
															<button class="btn btn-primary btn-xs" data-title="Edit"
																data-toggle="modal" data-target="#edit"
																onclick="editFunction('${list.studentId}','${list.studentName}','${list.address}','${list.dateOfBirth}','${list.emailId}','${list.number}','${list.classname}','${list.batchId}')">
																<span class="glyphicon glyphicon-pencil" title = "Edit"></span>
															</button>
														
															<button class="btn btn-danger btn-xs" data-title="Delete"
																data-toggle="modal" data-target="#delete">
																<span class="glyphicon glyphicon-trash"title = "Delete"
																	onclick="deletefunctionTest('${list.studentId}')"></span>
															</button>
														</td>
												</tr>
											</c:forEach>


										</tbody>

									</table>
									<div class="col-md-12 text-center">
     								 <ul class="pagination pagination-lg pager" id="myPager"></ul>
      								</div>
									</div>
								</div>

								<div id="shieldui-grid1"></div>
							</div>
						</div>
					</div>

				<div class="modal fade" id="edit" tabindex="-1" role="dialog"
					aria-labelledby="#edit" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</button>
								<h4 class="modal-title custom_align" id="Heading">Edit Your
									Detail</h4>


							</div>
							<div class="modal-body">
								<form role="form" action="/TMS/addstudent/update/" method="POST"
									id="edit_student_form">
									<div class="col-md-6">
									<div class="form-group">
									
										<label>Student Name</label> <input class="form-control "
											id="student_name" name="student_name" type="text" readonly>
									</div>

									<div class="form-group">
										<label>Student Address</label> <input class="form-control "
											id="student_address" name="student_address" type="text">
									</div>

									<div class="form-group">
										<label>Date of Birth</label> <input class="form-control "
											id="student_DOB" name="student_DOB" type="Date">
									</div>

									<div class="form-group">
										<label>E-Mail</label> <input class="form-control "
											id="student_email" name="student_email" type="text">
									</div>
									</div>
									<div class="col-md-6">

									<div class="form-group">
										<label>Phone #</label> <input class="form-control "
											id="student_number" name="student_number" type="text">
									</div>

									<div class="form-group">
										<label>Class Name</label> <input class="form-control "
											id="student_className" name="student_className" type="text">
									</div>

									<div class="form-group">
										<label>Batch</label> <input class="form-control "
											id="student_batch" name="student_batch" type="text">
									</div>

									<div class="form-group">
										<input class="form-control " id="student_id" name="student_id"
											type="hidden">
									</div>
									</div>
							</div>
							<div class="modal-footer ">
								<button type="submit" id="submit" class="btn btn-primary btn-lg"
									style="width: 100%;">
									<span class="glyphicon glyphicon-ok-sign"></span>Update
								</button>
							</div>
							</form>
						</div>
					</div>

					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->


				<div class="modal fade" id="delete" tabindex="-1" role="dialog"
					aria-labelledby="#delete" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</button>
								<h4 class="modal-title custom_align" id="Heading">Delete
									this entry</h4>
							</div>
							<div class="modal-body">
								<span class="color:red">${deleteMessage}</span>
								<div class="alert alert-danger">
									<span class="glyphicon glyphicon-warning-sign"></span> Are you
									sure you want to delete this Record?
								</div>
								<div class="form-group">
									<input class="form-control " id="student_id_delete"
										name="student_id" type="hidden">
								</div>
							</div>
							<div class="modal-footer ">
								<button id="delete-yes" type="button" class="btn btn-success">
									<span class="glyphicon glyphicon-ok-sign"></span>Yes
								</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">
									<span class="glyphicon glyphicon-remove"></span>No
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="view" tabindex="-1" role="dialog"
					aria-labelledby="#view" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</button>
								<h4 class="modal-title custom_align" id="Heading">Edit Your
									Detail</h4>


							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Student Name :</label>
											<p id="view_student_name"></p>
										</div>
										<div class="form-group">
											<label>Address:</label>
											<p id="view_address"></p>
										</div>
										<div class="form-group">
											<label>Date Of Birth :</label>
											<p id="view_date_of_birth"></p>
										</div>

									
										<div class="form-group">
											<label>Email :</label>
											<p id="view_email"></p>
										</div>
										</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Contact :</label>
											<p id="view_contact"></p>
										</div>

										<div class="form-group">
											<label>Class Name :</label>
											<p id="view_class_name"></p>
										</div>
									
										<div class="form-group">
											<label>Batch :</label>
											<p id="view_batch"></p>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>

					<!-- /.modal-content -->
				</div>
			</section>

		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<%@include file="footer.jsp"%>
</body>
</html>
