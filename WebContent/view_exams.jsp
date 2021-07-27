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
			var form = (event.target.form), url = "/TMS/exam/update/"

			$.post(url, $("#edit_exam_form").serialize(), function(getData) {
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

			var examId = $('#exam_id_delete').val();
			$('#delete').modal('hide');
			console.log("delete-yes-examId :" + examId);

			$.ajax({
				url : "/TMS/exam/delete/",
				data : {
					exam_id : examId
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

	'${list.examId}', '${list.examType}', '${list.examDate}',
			'${list.examTime}', '${list.examTotalMarks}',
			'${list.examCoordinator}', '${list.className}', '${list.batch}',
			'${list.duration}', '${list.examDetails}'
	function editFunction(examId, examType, examDate, examTime, examTotalMarks,
			examCoordinator, className, batch, duration, examDetails) {
		$('#Exam_Type').val(examType);
		$('#Exam_Date').val(examDate);
		$('#Exam_Time').val(examTime);
		$('#Total_Marks_Of_Exam').val(examTotalMarks);
		$('#Exam_Coordinator').val(examCoordinator);
		$('#class_name').val(className);
		$('#edit_batch').val(batch);
		$('#duration').val(duration);
		$('#exam_details').val(examDetails);
		$('#exam_id').val(examId);
	}

	function viewFunction(examType, examDate, examTime, examTotalMarks,
			examCoordinator, className, batch, duration, examDetails) {
		document.getElementById("view_exam_type").innerHTML = examType;
		document.getElementById("view_exam_date").innerHTML = examDate;
		document.getElementById("view_exam_time").innerHTML = examTime;
		document.getElementById("view_total_marks").innerHTML = examTotalMarks;
		document.getElementById("view_exam_coordinator").innerHTML = examCoordinator;
		document.getElementById("view_class_name").innerHTML = className;
		document.getElementById("view_batch").innerHTML = batch;
		document.getElementById("view_duration").innerHTML = duration;
		document.getElementById("view_exam_details").innerHTML = examDetails;
	}
	/* delete function */

	function deletefunctionTest(studentId) {
		$('#exam_id_delete').val(studentId);
		console.log("exam id :" + $('#exam_id_delete').val());
	}

	$(document).ready(function() {
		$('#edit_exam_form').ready({

		}).on('edit_exam_form', function(e) {
			$('#success_message').slideDown({
				opacity : "show"
			}, "slow") // Do something ...

			// Prevent form submission
			e.preventDefault();

			// Get the form instance
			var $form = $(e.target);

			// Get the BootstrapValidator instance
			var bv = $form.data('edit_exam_form');

			// Use Ajax to submit form data
			$.post($form.attr('action'), $form.serialize(), function(result) {
				console.log(result);
			}, 'json');

			$('#edit_exam_form').each(function() {
				this.reset();
			});

			$('#edit_exam_form').click(function() {
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
								href="/TMS/exam/addNew/" class="btn btn-primary" role="button">Add
								New</a> <br> <br>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o"></i> Exam's List
									</h3>
								</div>
								<div class="table-responsive">
									<span id="delete_message" class="color:green"></span>
									<table id="content_table"
										class="table table-bordred table-responsive">
										<thead>
											<tr>
												<th>#</th>
												<th>Exam Type</th>
												<th>Exam Date</th>
												<th>Exam Time</th>
												<th>Total Marks Of Exam</th>
												<th>Exam Coordinator</th>
												<th>Class</th>
												<th>Batch</th>
												<th>duration</th>
												<th>exam_details</th>
												<th>Action</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${examBeans}" var="list" varStatus="counter">
												<tr>
													<td>${counter.count}</td>
													<td>${list.examType}</td>
													<td>${list.examDate}</td>
													<td>${list.examTime}</td>
													<td>${list.examTotalMarks}</td>
													<td>${list.examCoordinator}</td>
													<td>${list.className}</td>
													<td>${list.batch}</td>
													<td>${list.duration}</td>
													<td>${list.examDetails}</td>
													<td><button class="btn btn-primary btn-xs" data-title="View"
																data-toggle="modal" data-target="#view"
																onclick="viewFunction('${list.examType}','${list.examDate}','${list.examTime}','${list.examTotalMarks}','${list.examCoordinator}' ,'${list.className}' ,'${list.batch}','${list.duration}','${list.examDetails}')">
																<span class="glyphicon glyphicon-th-list" data-placement="top" data-toggle="tooltip" title="View"></span>
															</button>
															<button class="btn btn-primary btn-xs" data-title="Edit"
																data-toggle="modal" data-target="#edit"
																onclick="editFunction('${list.examId}','${list.examType}','${list.examDate}','${list.examTime}','${list.examTotalMarks}','${list.examCoordinator}','${list.className}','${list.batch}','${list.duration}','${list.examDetails}')">
																<span class="glyphicon glyphicon-pencil" data-placement="top" data-toggle="tooltip" title="Edit"></span>
															</button>
															<button class="btn btn-danger btn-xs" data-title="Delete"
																data-toggle="modal" data-target="#delete">
																<span class="glyphicon glyphicon-trash" data-placement="top" data-toggle="tooltip" title="Delete"
																	onclick="deletefunctionTest('${list.examId}')"></span>
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
						<form role="form" action="/TMS/exam/update/" method="POST"
							id="edit_exam_form">
							<div class="col-md-6">
							<div class="form-group">
								<label>Exam Type</label> <input class="form-control "
									id="Exam_Type" name="Exam_Type" type="text" readonly>
							</div>

							<div class="form-group">
								<label>Exam Date</label> <input class="form-control "
									id="Exam_Date" name="Exam_Date" type="text">
							</div>

							<div class="form-group">
								<label>Exam Time</label> <input class="form-control "
									id="Exam_Time" name="Exam_Time" type="time">
							</div>

							<div class="form-group">
								<label>Total Marks Of Exam</label> <input class="form-control "
									id="Total_Marks_Of_Exam" name="Total_Marks_Of_Exam" type="text">
							</div>

							<div class="form-group">
								<label>Exam Coordinator</label> <input class="form-control "
									id="Exam_Coordinator" name="Exam_Coordinator" type="text">
							</div>
							</div>
							<div class="col-md-6">
							<div class="form-group">
								<label>Class</label> <input class="form-control "
									id="class_name" name="class_name" type="text">
							</div>
							<div class="form-group">
								<label>Batch</label> <input class="form-control "
									id="edit_batch" name="edit_batch" type="text">
							</div>
							<div class="form-group">
								<label>duration</label> <input class="form-control "
									id="duration" name="duration" type="text">
							</div>
							<div class="form-group">
								<label>Exam details</label> <input class="form-control "
									id="exam_details" name="exam_details" type="text">
							</div>

							<div class="form-group">
								<input class="form-control " id="exam_id" name="exam_id"
									type="hidden">
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
						<h4 class="modal-title custom_align" id="Heading">Delete this
							entry</h4>
					</div>
					<div class="modal-body">
						<span class="color:red">${deleteMessage}</span>
						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Are you
							sure you want to delete this Record?
						</div>
						<div class="form-group">
							<input class="form-control " id="exam_id_delete" name="exam_id"
								type="hidden">
						</div>
					</div>
					<div class="modal-footer ">
						<button id="delete-yes" type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span>Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
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
						<h4 class="modal-title custom_align" id="Heading">Your Detail</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>Exam Type :</label>
									<p id="view_exam_type"></p>
								</div>
								<div class="form-group">
									<label>Exam Date :</label>
									<p id="view_exam_date"></p>
								</div>
								<div class="form-group">
									<label>Exam Time :</label>
									<p id="view_exam_time"></p>
								</div>
								<div class="form-group">
									<label>class Name :</label>
									<p id="view_class_name"></p>
								</div>
								<div class="form-group">
									<label>Batch :</label>
									<p id="view_batch"></p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Total Marks :</label>
									<p id="view_total_marks"></p>
								</div>
								<div class="form-group">
									<label>Exam Coordinator :</label>
									<p id="view_exam_coordinator"></p>
								</div>
								<div class="form-group">
									<label>Duration :</label>
									<p id="view_duration"></p>
								</div>
								<div class="form-group">
									<label>Exam Details :</label>
									<p id="view_exam_details"></p>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">Close</button>
						</div>

					</div>

					<!-- /.modal-content -->
				</div>
			</div>
			</section>
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<%@include file="footer.jsp"%>
</body>
</html>
