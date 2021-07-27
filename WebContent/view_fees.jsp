<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | FeesList</title>
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
	$(document).ready(function() {
		$('#feesList').DataTable();
	});
</script>
<!-- Pagination script Ends -->
<script type="text/javascript">
	$.ajaxSetup({
		cache : false
	});
	$(document).ready(function() {

		/* edit modal submit */

		$('#submit').click(function(event) {
			$('#edit').modal('hide');
			var form = (event.target.form), url = "/TMS/fees/update/"

			$.post(url, $("#edit_fees_form").serialize(), function(getData) {
				console.log(getData);
			}, 'json');

			$('#delete_message').text("Fees edited successfully")
		});

		$('#edit').on('hidden.bs.modal', function() {
			location.reload(true);
			$('#delete_message').slideDown({
				opacity : "show"
			}, "slow")
		})

		/* delete modal submit */

		$('#delete-yes').click(function(event) {

			var feesId = $('#fees_id_delete').val();
			$('#delete').modal('hide');
			console.log("delete-yes-FeesId :" + feesId);

			$.ajax({
				url : '/TMS/fees/delete/',
				data : {
					fees_id : feesId
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
			$('#delete_message').text("Fees deleted successfully")
			location.reload(true);
		});

	});

	$('#delete').on('hidden.bs.modal', function() {
		$('#delete_message').text("Fees deleted successfully")
		location.reload(true);
		$('#delete_message').text("Fees deleted successfully")
		alert("Fees deleted successfully");
	})

	/* edit function */

	'${list.feesId}', '${list.studentName}', '${list.dateOfFees}',
			'${list.dateOfFees}', '${list.paidFees}', '${list.remainingFees}'
	function editFunction(feesId, studentName, dateOfFees, totalFees, paidFees,
			remainingFees) {
		$('#student_Name1').val(studentName);
		$('#Fees_Date1').val(dateOfFees);
		$('#Total_fees1').val(totalFees);
		console.log("totalFees :" + totalFees);
		$('#Paid_fees1').val(paidFees);
		$('#Remaining_fees1').val(remainingFees);
		$('#fees_id').val(feesId);
	}
	function viewFunction(studentName, dateOfFees, totalFees, paidFees,
			remainingFees) {
		document.getElementById("view_student_name").innerHTML = studentName;
		document.getElementById("view_date").innerHTML = dateOfFees;
		document.getElementById("view_total_fees").innerHTML = totalFees;
		document.getElementById("view_paid_fees").innerHTML = paidFees;
		document.getElementById("view_remaining_fees").innerHTML = remainingFees;
	}
	/* delete function */

	function deletefunctionTest(feesId) {
		$('#fees_id_delete').val(feesId);
		console.log("fees Id:" + $('#fees_id_delete').val());
	}

	$(document).ready(function() {
		$('#edit_fees_form').ready({

		}).on('edit_fees_form', function(e) {
			$('#success_message').slideDown({
				opacity : "show"
			}, "slow") // Do something ...

			// Prevent form submission
			e.preventDefault();

			// Get the form instance
			var $form = $(e.target);

			// Get the BootstrapValidator instance
			var bv = $form.data('edit_fees_form');

			// Use Ajax to submit form data
			$.post($form.attr('action'), $form.serialize(), function(result) {
				console.log(result);
			}, 'json');

			$('#edit_fees_form').each(function() {
				this.reset();
			});

			$('#edit_fees_form').click(function() {
				window.location.assign("/TMS/fees/get/");
				location.reload(forceGet);

			});
		});
	});
</script>
<!-- <style type="text/css">
.alert{
display :none;
}
</style> -->
<script type="text/javascript">
	$(document).ready(function() {

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
							<a href="/TMS/add_fees" class="btn btn-primary" role="button">Add
								New</a> <br> <br>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o"></i>Fees List
									</h3>

								</div>
								<div class="box-body table-responsive no-padding">
									<table id="content_table" class="table table-dark table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Student Name</th>
												<th>Date</th>
												<th>Total Fees</th>
												<th>Paid Fees</th>
												<th>Remaining Fees</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${feesBeans}" var="list"
												varStatus="counter">
												<tr>
													<!--  <td><input type="checkbox" class="checkthis" /></td> -->
													<td>${counter.count}</td>
													<td>${list.studentName}</td>
													<td>${list.dateOfFees}</td>
													<td>${list.totalFees}</td>
													<td>${list.paidFees}</td>
													<td>${list.remainingFees}</td>
													<td>
														<button class="btn btn-primary btn-xs" data-title="View"
															data-toggle="modal" data-target="#view"
															onclick="viewFunction('${list.studentName}','${list.dateOfFees}','${list.totalFees}','${list.paidFees}','${list.remainingFees}')">
															<span class="glyphicon glyphicon-th-list "
																data-placement="top" data-toggle="tooltip" title="View"></span>
														</button>


														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit"
															onclick="editFunction('${list.feesId}','${list.studentName}','${list.dateOfFees}','${list.totalFees}','${list.paidFees}','${list.remainingFees}')">
															<span class="glyphicon glyphicon-pencil"
																data-placement="top" data-toggle="tooltip" title="Edit"></span>
														</button>


														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"
																data-placement="top" data-toggle="tooltip"
																title="Delete"
																onclick="deletefunctionTest('${list.feesId}')"></span>
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
									<h4 class="modal-title custom_align" id="Heading">Edit
										Your Detail</h4>



								</div>
								<div class="modal-body">
									<form role="form" action="/TMS/fees/update/" method="POST"
										id="edit_fees_form">
										<div class="col-md-6">
											<div class="form-group">
												<label>Student Name</label> <input class="form-control "
													id="student_Name1" name="student_Name1" type="text">
											</div>
											<div class="form-group">
												<label>Date of Fees</label> <input class="form-control "
													id="Fees_Date1" name="Fees_Date1" type="Date">
											</div>

											<div class="form-group">
												<label>Total Fees</label> <input class="form-control "
													id="Total_fees1" name="Total_fees1" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Paid Fees</label> <input class="form-control "
													id="Paid_fees1" name="Paid_fees1" type="text">
											</div>

											<div class="form-group">
												<label>Remaining Fees</label> <input class="form-control "
													id="Remaining_fees1" name="Remaining_fees1" type="text">
											</div>

											<div class="form-group">
												<input class="form-control " id="fees_id" name="fees_id"
													type="hidden">
											</div>
										</div>
								</div>
								<div class="modal-footer ">
									<button type="submit" id="submit"
										class="btn btn-primary btn-lg" style="width: 100%;">
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
										<input class="form-control " id="fees_id_delete"
											name="fees_id" type="hidden">
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
									<h4 class="modal-title custom_align" id="Heading">Edit
										Your Detail</h4>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Student Name:</label>
												<p id="view_student_name"></p>
											</div>
											<div class="form-group">
												<label>Date :</label>
												<p id="view_date"></p>
											</div>

											<div class="form-group">
												<label>Total Fees:</label>
												<p id="view_total_fees"></p>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>paid Fees:</label>
												<p id="view_paid_fees"></p>
											</div>
											<div class="form-group">
												<label>Remaining Fees:</label>
												<p id="view_remaining_fees"></p>
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
					<!-- /.modal-dialog -->
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">

			<%@include file="footer.jsp"%>
</body>
</html>
