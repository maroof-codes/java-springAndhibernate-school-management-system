<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="links.jsp"%>
<%@include file="pagination_data.jsp"%>

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
	$(document)
			.ready(
					function() {

						/* edit modal submit */

						$('#submit')
								.click(
										function(event) {
											$('#edit').modal('hide');
											var form = (event.target.form), url = "/TMS/batch/update/"

											$.post(url,
													$("#edit_batch_form")
															.serialize(),
													function(getData) {
														console.log(getData);
													}, 'json');

											$('#delete_message')
													.text(
															"Customer edited successfully")
										});

						$('#edit').on(
								'hidden.bs.modal',
								function() {
									location.reload(true);
									$('#delete_message').text(
											"Customer edited successfully")
								})

						/* delete modal submit */

						$('#delete-yes').click(
								function(event) {

									var batchId = $('#batch_id_delete')
											.val();
									$('#delete').modal('hide');
									console.log("delete-yes-customerId :"
											+ batchId);

									$.ajax({
										url : '/TMS/batch/delete/',
										data : {
											batch_id : batchId
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
									$('#delete_message').text(
											"Customer deleted successfully")
									location.reload(true);
								});

					});

	$('#delete').on('hidden.bs.modal', function() {
		$('#delete_message').text("Batch deleted successfully")
		location.reload(true);
		$('#delete_message').text("Batch deleted successfully")
		alert("Customer deleted successfully");
	})

	/* edit function */

	'${list.batchId}', '${list.batchNumber}', '${list.className}',
	'${list.numberOfStudents}', '${list.batchTiming}','${list.assignFaculty}'
	function editFunction(batchId, batchNumber, className,
			numberOfStudents, batchTiming, assignFaculty) {

		$('#batch_number').val(batchNumber);
		$('#class_name').val(className);
		$('#noOf_students').val(numberOfStudents);
		$('#batch_timing').val(batchTiming);
		$('#assign_faculty').val(assignFaculty);
		$('#batch_id').val(batchId);
	

	}
	function viewFunction(batchId, batchNumber, className,
			numberOfStudents, batchTiming, assignFaculty) {
	    document.getElementById("view_batch_number").innerHTML = batchNumber;
	    document.getElementById("view_class_name").innerHTML = className;
	    document.getElementById("view_number_of_students").innerHTML = numberOfStudents;
	    document.getElementById("view_batch_timing").innerHTML = batchTiming;
	    document.getElementById("view_assigned_faculty").innerHTML = assignFaculty;
	}

	/* delete function */

	function deletefunctionTest(batchId) {
		$('#batch_id_delete').val(batchId);
		console.log("Batch Id :" + $('#batch_id_delete').val());
	}

	$(document).ready(function() {
		$('#edit_batch_form').ready({

		}).on('edit_batch_form', function(e) {
			$('#success_message').slideDown({
				opacity : "show"
			}, "slow") // Do something ...

			// Prevent form submission
			e.preventDefault();

			// Get the form instance
			var $form = $(e.target);

			// Get the BootstrapValidator instance
			var bv = $form.data('edit_batch_form');

			// Use Ajax to submit form data
			$.post($form.attr('action'), $form.serialize(), function(result) {
				console.log(result);
			}, 'json');

			$('#edit_batch_form').each(function() {
				this.reset();
			});

			$('#edit_batch_form').click(function() {
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
							<a href="/TMS/batch/addNew/" class="btn btn-primary"
								role="button">Add New</a> <br> <br>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o"></i>Batch List
									</h3>

								</div>
								<div class="box-body table-responsive no-padding">
									<table id="content_table" class="table table-dark table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Batch No</th>
												<th>Class_Name</th>
												<th>No_of_Student</th>
												<th>Batch Time</th>
												<th>Assigned Faculty</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${batchBeans}" varStatus = "counter">
												<tr>
													<!--  <td><input type="checkbox" class="checkthis" /></td>-->
													<td>${counter.count}</td>
													<td>${list.batchNumber}</td>
													<td>${list.className}</td>
													<td>${list.numberOfStudents}</td>
													<td>${list.batchTiming}</td>
													<td>${list.assignFaculty}</td>
													<td><button class="btn btn-primary btn-xs" data-title="view"
																data-toggle="modal" data-target="#view"
																onclick="viewFunction('${list.batchId}', '${list.batchNumber}', '${list.className}',
																							'${list.numberOfStudents}', '${list.batchTiming}', '${list.assignFaculty}')">
																<span class="glyphicon glyphicon-th-list" data-placement="top" data-toggle="tooltip" title="View"></span>
															</button>
														<button class="btn btn-primary btn-xs" data-title="Edit"
																data-toggle="modal" data-target="#edit"
																onclick="editFunction('${list.batchId}', '${list.batchNumber}', '${list.className}',
																							'${list.numberOfStudents}', '${list.batchTiming}', '${list.assignFaculty}')">
																<span class="glyphicon glyphicon-pencil" data-placement="top" data-toggle="tooltip" title="Edit"></span>
															</button>
															<button class="btn btn-danger btn-xs" data-title="Delete"
																data-toggle="modal" data-target="#delete">
																<span class="glyphicon glyphicon-trash" data-placement="top" data-toggle="tooltip" title="Delete"
																	onclick="deletefunctionTest('${list.batchId}')"></span>
															</button>
														</p></td>
												</tr>
											</c:forEach>
									</table>
									<div class="col-md-12 text-center">
										<ul class="pagination pagination-lg pager" id="myPager"></ul>
									</div>
								</div>

								<div id="shieldui-grid1"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="modal fade" id="edit" tabindex="-1" role="dialog"
							aria-labelledby="#edit" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
										</button>
										<h4 class="modal-title custom_align" id="Heading">Edit
											Your Detail</h4>


									</div>
									<div class="modal-body">
										<form action="/TMS/batch/update/" method="post"
											id="edit_batch_form">
											<div class="form-group">
												<label>Batch Number :</label> <input class="form-control "
													id="batch_number" name="batch_number" type="text">
											</div>

											<div class="form-group">
												<label>Class Name :</label> <input class="form-control "
													id="class_name" name="class_name" type="text">
											</div>
											<div class="form-group">
												<label>Number of Students :</label> <input
													class="form-control " id="noOf_students"
													name="noOf_students" type="text">
											</div>
											<div class="form-group">
												<label>Batch Timing :</label> <input class="form-control "
													id="batch_timing" name="batch_timing" type="text">
											</div>

											<div class="form-group">
												<label>Assigned Faculty :</label> <input
													class="form-control " id="assign_faculty"
													name="assign_faculty" type="text">
											</div>

											<div class="form-group">
												<input class="form-control " id="batch_id" name="batch_id"
													type="hidden">
											</div>
										</form>
									</div>
									<div class="modal-footer ">
										<button type="button" id="submit"
											class="btn btn-primary btn-lg" style="width: 100%;">
											<span class="glyphicon glyphicon-ok-sign"></span>Update
										</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<div class="modal fade" id="delete" tabindex="-1" role="dialog"
							aria-labelledby="edit" aria-hidden="true">
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
											<span class="glyphicon glyphicon-warning-sign"></span> Are
											you sure you want to delete this Record?
										</div>
										<div class="form-group">
											<input class="form-control " id="batch_id_delete"
												name="batch_id" type="hidden">
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
										<h4 class="modal-title custom_align" id="Heading">Your
											Detail</h4>


									</div>
									<div class="modal-body">

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Batch Number:</label>
													<p id="view_batch_number"></p>
												</div>
												<div class="form-group">
													<label>Class Name :</label>
													<p id="view_class_name"></p>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Number Of Students :</label>
													<p id="view_number_of_students"></p>
												</div>
												<div class="form-group">
													<label>Batch Timing :</label>
													<p id="view_batch_timing"></p>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Number Of Students :</label>
													<p id="view_assigned_faculty"></p>
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
							<!-- /.modal-dialog -->
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
