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
											var form = (event.target.form), url = "/TMS/classes/update/"

											$.post(url,
													$("#edit_classes_form")
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

									var classesId = $('#classes_id_delete')
											.val();
									$('#delete').modal('hide');
									console.log("delete-yes-customerId :"
											+ classesId);

									$.ajax({
										url : '/TMS/classes/delete/',
										data : {
											classes_id :classesId
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

	/* edit function */
			
			'${list.classesId}', '${list.classesName}', '${list.classesDescription}'
			function editFunction(classesId, classesName, classesDescription) {
				$('#Classes_Name1').val(classesName);
				$('#Classes_Description1').val(classesDescription);
				$('#classes_id').val(classesId);
			}
			function viewFunction(classesId, classesName, classesDescription) {
			    document.getElementById("view_class_name").innerHTML = classesName;
			    document.getElementById("view_description").innerHTML = classesDescription;

			}


	/* delete function */

	function deletefunctionTest(classesId) {
		$('#classes_id_delete').val(classesId);
		console.log("Complain Id :" + $('#classes_id_delete').val());
	}

	$(document).ready(function() {
		$('#edit_classes_form').ready({

		}).on('edit_classes_form', function(e) {
			$('#success_message').slideDown({
				opacity : "show"
			}, "slow") // Do something ...

			// Prevent form submission
			e.preventDefault();

			// Get the form instance
			var $form = $(e.target);

			// Get the BootstrapValidator instance
			var bv = $form.data('edit_classes_form');

			// Use Ajax to submit form data
			$.post($form.attr('action'), $form.serialize(), function(result) {
				console.log(result);
			}, 'json');

			$('#edit_classes_form').each(function() {
				this.reset();
			});

			$('#edit_classes_form').click(function() {
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
							<a href="/TMS/add_class" class="btn btn-primary" role="button">Add
								New</a> <br> <br>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o"></i>Class List</h3>
								</div>
						<div class="table-responsive">
          	  				<span id="delete_message" class="color:green"></span>   
              				<table id="content_table"
										class="table table-bordred table-striped">
										<thead>	
        								<tr>
        								<th>#</th>
										<th>Class Name</th>
										<th>Description</th>
										<th>Action</th>
										</tr>
							</thead>
										<tbody>
											<c:forEach items="${classesBeans}" var="list" varStatus = "counter" >
												<tr>
													<td>${counter.count}</td>
													<td>${list.classesName}</td>
													<td>${list.classesDescription}</td>
													<td><button class="btn btn-primary btn-xs" data-title="View"
																data-toggle="modal" data-target="#view"
																onclick="viewFunction('${list.classesId}','${list.classesName}','${list.classesDescription}')">
																<span class="glyphicon glyphicon-th-list" data-placement="top" data-toggle="tooltip" title="View"></span>
															</button>
														<button class="btn btn-primary btn-xs" data-title="Edit"
																data-toggle="modal" data-target="#edit"
																onclick="editFunction('${list.classesId}','${list.classesName}','${list.classesDescription}')">
																<span class="glyphicon glyphicon-pencil" data-placement="top" data-toggle="tooltip" title="Edit"></span>
															</button>
														<button class="btn btn-danger btn-xs" data-title="Delete"
																data-toggle="modal" data-target="#delete">
																<span class="glyphicon glyphicon-trash" data-placement="top" data-toggle="tooltip" title="Delete"
																	onclick="deletefunctionTest('${list.classesId}')"></span>
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
									<form action="/TMS/classes/update/" method="post"
											id="edit_classes_form">
											<div class="form-group">
									<label>Student Name</label> <input class="form-control "
										id="Classes_Name1" name="Classes_Name1" type="text" readonly>
								</div>

								<div class="form-group">
									<label>Student Address</label> <input class="form-control "
										id="Classes_Description1" name="Classes_Description1" type="text">
								</div>

								
								<div class="form-group">
									<input class="form-control " id="classes_id" name="classes_id"
										type="hidden">
								</div>										
									</form>
									</div>
									<div class="modal-footer ">
										<button type="submit" id="submit" class="btn btn-primary btn-lg"
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
											<input class="form-control " id="classes_id_delete"
												name="classes_id" type="hidden">
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
									<div class = "row">
									<div class="col-md-6">
											<div class="form-group">
												<label>Class Name :</label>
												<p id="view_class_name"></p>
											</div>
									</div>
									<div class="col-md-6">
											<div class="form-group">
												<label>Description :</label>
												<p id="view_description"></p>
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
