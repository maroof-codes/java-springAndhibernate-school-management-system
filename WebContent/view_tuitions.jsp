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
.modal-header h4{
color : #ffff;
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
											var form = (event.target.form), url = "/TMS/tuition/update/"

											$.post(url,
													$("#edit_tuition_form")
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

									var complainId = $('#tuition_id_delete')
											.val();
									$('#delete').modal('hide');
									console.log("delete-yes-customerId :"
											+ complainId);

									$.ajax({
										url : '/TMS/tuition/delete/',
										data : {
											tuition_id : complainId
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
		$('#delete_message').text("Customer deleted successfully")
		location.reload(true);
		$('#delete_message').text("Customer deleted successfully")
		alert("Customer deleted successfully");
	})
	
	/* view function 

	'${list.tuitionId}', '${list.tuitionName}', '${list.ownerName}',
			'${list.tuitionEstablishedYear}',
			'${list.tuitionRegistrationDate}', '${list.tuitionGstNumber}',
			'${list.tuitionAddress}', '${list.tuitionContactNumber}',
			'${list.tuitionWebsiteAddress}', '${list.tuitionEmailAddress}'
	function viewFunction(tuitionId, tuitionName, ownerName,
			tuitionEstablishedYear, tuitionRegistrationDate, tuitionGstNumber,
			tuitionAddress, tuitionContactNumber, tuitionWebsiteAddress,
			tuitionEmailAddress) {

				$('#view_tuition_name').val(tuitionName);
				$('#view_owner_name').val(ownerName);
				$('#view_estb_year').val(tuitionEstablishedYear);
				$('#view_registration_date').val(tuitionRegistrationDate);
				$('#view_gst_no').val(tuitionGstNumber);
				$('#view_address').val(tuitionAddress);
				$('#view_contact_no').val(tuitionContactNumber);
				$('#view_website_address').val(tuitionWebsiteAddress);
				$('#view_email_address').val(tuitionEmailAddress); console.log("tuitionEmailAddress :"+tuitionEmailAddress);

	}
			*/
			'${list.tuitionId}', '${list.tuitionName}', '${list.ownerName}',
			'${list.tuitionEstablishedYear}',
			'${list.tuitionRegistrationDate}', '${list.tuitionGstNumber}',
			'${list.tuitionAddress}', '${list.tuitionContactNumber}',
			'${list.tuitionWebsiteAddress}', '${list.tuitionEmailAddress}'
			function viewFunction(tuitionId, tuitionName, ownerName,
					tuitionEstablishedYear, tuitionRegistrationDate, tuitionGstNumber,
					tuitionAddress, tuitionContactNumber, tuitionWebsiteAddress,
					tuitionEmailAddress) {
			    document.getElementById("view_tuition_name").innerHTML = tuitionName;
			    document.getElementById("view_owner_name").innerHTML = ownerName;
			    document.getElementById("view_estb_year").innerHTML = tuitionEstablishedYear;
			    document.getElementById("view_registration_date").innerHTML = tuitionRegistrationDate;
			    document.getElementById("view_gst_no").innerHTML = tuitionGstNumber;
			    document.getElementById("view_address").innerHTML = tuitionAddress;
			    document.getElementById("view_contact_no").innerHTML = tuitionContactNumber;
			    document.getElementById("view_website_address").innerHTML = tuitionWebsiteAddress;
			    document.getElementById("view_email_address").innerHTML = tuitionEmailAddress;

			}

	/* edit function */

	'${list.tuitionId}', '${list.tuitionName}', '${list.ownerName}',
			'${list.tuitionEstablishedYear}',
			'${list.tuitionRegistrationDate}', '${list.tuitionGstNumber}',
			'${list.tuitionAddress}', '${list.tuitionContactNumber}',
			'${list.tuitionWebsiteAddress}', '${list.tuitionEmailAddress}'
	function editFunction(tuitionId, tuitionName, ownerName,
			tuitionEstablishedYear, tuitionRegistrationDate, tuitionGstNumber,
			tuitionAddress, tuitionContactNumber, tuitionWebsiteAddress,
			tuitionEmailAddress) {

		$('#tuition_name').val(tuitionName);
		$('#owner_name').val(ownerName);
		$('#estb_year').val(tuitionEstablishedYear);
		$('#registration_date').val(tuitionRegistrationDate);
		$('#gst_no').val(tuitionGstNumber);
		$('#address').val(tuitionAddress);
		$('#contact_no').val(tuitionContactNumber);
		$('#website_address').val(tuitionWebsiteAddress);
		$('#email_address').val(tuitionEmailAddress);
		$('#tuition_id').val(tuitionId);

		
		
	}

	/* delete function */

	function deletefunctionTest(tuitionId) {
		$('#tuition_id_delete').val(tuitionId);
		console.log("Complain Id :" + $('#tuition_id_delete').val());
	}

	$(document).ready(function() {
		$('#edit_tuition_form').ready({

		}).on('edit_tuition_form', function(e) {
			$('#success_message').slideDown({
				opacity : "show"
			}, "slow") // Do something ...

			// Prevent form submission
			e.preventDefault();

			// Get the form instance
			var $form = $(e.target);

			// Get the BootstrapValidator instance
			var bv = $form.data('edit_tuition_form');

			// Use Ajax to submit form data
			$.post($form.attr('action'), $form.serialize(), function(result) {
				console.log(result);
			}, 'json');

			$('#edit_tuition_form').each(function() {
				this.reset();
			});

			$('#edit_tuition_form').click(function() {
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
							<a href="/TMS/add_tuition" class="btn btn-primary" role="button">Add
								New</a> <br> <br>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o"></i>Tuition List</h3>

								</div>
								<div class="box-body table-responsive no-padding">
									<table id = "content_table" class="table table-dark table-hover">
										<thead>
											<tr>
										
												<th>#</th>
												<th>Tuition Name</th>
												<th>Owner Name</th>
												<th>Address</th>
												<th>Contact NO</th>
												<th>Website</th>
												<th>Email Address</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${tuitionBeans}" varStatus = "counter">
												<tr>
													<td>${counter.count}</td>
													<td>${list.tuitionName}</td>
													<td>${list.ownerName}</td>
													<td>${list.tuitionAddress}</td>
													<td>${list.tuitionContactNumber}</td>
													<td>${list.tuitionWebsiteAddress}</td>
													<td>${list.tuitionEmailAddress}</td>
													<td><button class="btn btn-primary btn-xs" data-title="view"
																data-toggle="modal" data-target="#view"
																onclick="viewFunction('${list.tuitionId}', '${list.tuitionName}',
																							'${list.ownerName}', '${list.tuitionEstablishedYear}'
																							, '${list.tuitionRegistrationDate}', '${list.tuitionGstNumber}'
																							, '${list.tuitionAddress}', '${list.tuitionContactNumber}'
																							, '${list.tuitionWebsiteAddress}', '${list.tuitionEmailAddress}')">
																<span class="glyphicon glyphicon-th-list" 	title="View"></span>
															</button>
															<button class="btn btn-primary btn-xs" data-title="Edit"
																data-toggle="modal" data-target="#edit"
																onclick="editFunction('${list.tuitionId}', '${list.tuitionName}',
																							'${list.ownerName}', '${list.tuitionEstablishedYear}'
																							, '${list.tuitionRegistrationDate}', '${list.tuitionGstNumber}'
																							, '${list.tuitionAddress}', '${list.tuitionContactNumber}'
																							, '${list.tuitionWebsiteAddress}', '${list.tuitionEmailAddress}')">
																<span class="glyphicon glyphicon-pencil" title="Edit"></span>
															</button>
														
												
															<button class="btn btn-danger btn-xs" data-title="Delete"
																data-toggle="modal" data-target="#delete">
																<span class="glyphicon glyphicon-trash"	title="Delete"
																	onclick="deletefunctionTest('${list.tuitionId}')"></span>
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
										<form action="/TMS/tuition/update/" method="post"
											id="edit_tuition_form">
											<div class="col-md-6">
											<div class="form-group">
												<label>Tuition Name :</label> <input class="form-control "
													id="tuition_name" name="tuition_name" type="text">
											</div>

											<div class="form-group">
												<label>Owner Name :</label> <input class="form-control "
													id="owner_name" name="owner_name" type="text">
											</div>
											<div class="form-group">
												<label>Established Year :</label> <input
													class="form-control " id="estb_year" name="estb_year"
													type="text">
											</div>
											<div class="form-group">
												<label>Registration Date :</label> <input
													class="form-control " id="registration_date"
													name="registration_date" type="date">
											</div>
											<div class="form-group">
												<label>Gst No :</label> <input class="form-control "
													id="gst_no" name="gst_no" type="text">
											</div>
											</div>
											<div class="col-md-6">
											<div class="form-group">
												<label>Address :</label> <input class="form-control "
													id="address" name="address" type="text">
											</div>
											<div class="form-group">
												<label>Contact No :</label> <input class="form-control "
													id="contact_no" name="contact_no" type="text">
											</div>
											<div class="form-group">
												<label>Website :</label> <input class="form-control "
													id="website_address" name="website_address" type="text">
											</div>
											<div class="form-group">
												<label>Email Address :</label> <input class="form-control "
													id="email_address" name="email_address" type="text">
											</div>


											<div class="form-group">
												<input class="form-control " id="tuition_id"
													name="tuition_id" type="hidden">
											</div>
											</div>
									</form>
									</div>
									<div class="modal-footer ">
										<button type="button" id="submit" class="btn btn-primary btn-lg"
											style="width: 100%;">
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
											<input class="form-control " id="tuition_id_delete"
												name="tuition_id" type="hidden">
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
										<h4 class="modal-title custom_align" id="Heading">View Detail</h4>
									</div>
									<div class="modal-body">

									<div class = "row">
									<div class="col-md-6">
											<div class="form-group">
												<label>Tuition Name :</label>
												<p id="view_tuition_name"></p>
											</div>
											<div class="form-group">
												<label>Owner Name :</label>
												<p id="view_owner_name"></p>
											</div>
											
											
											<div class="form-group">
												<label>Established Year :</label>
												<p id="view_estb_year"></p>
											</div>
											<div class="form-group">
												<label>Registration Date :</label>
												<p id="view_registration_date"></p>	
											</div>
									
											<div class="form-group">
												<label>Gst No :</label> 
													<p id="view_gst_no"></p>
											</div>
											</div>
									<div class="col-md-6">
											<div class="form-group">
												<label>Address :</label>
													<p id="view_address"></p>
											</div>
											<div class="form-group">
												<label>Contact No :</label>
													<p id="view_contact_no"></p>
											</div>
											<div class="form-group">
												<label>Website :</label>
													<p id="view_website_address"></p>
											</div>
											<div class="form-group">
												<label>Email Address :</label>
													<p id="view_email_address"></p>
											</div>
											</div>
										</div>
										 <div class="modal-footer">
                						<button class="btn btn-default" data-dismiss="modal">Close</button>
           								 </div>
									</div>
									</div>
								<!-- /.modal-content -->
							</div>
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
