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
.modal-header h4{
color : #ffff;
}
</style>

<!-- Pagination script Ends -->
<script type="text/javascript">

$.ajaxSetup({ cache : false });
$(document).ready(function() {  
    
	/* edit modal submit */
	
	$('#submit').click(function(event) {
		 $('#edit').modal('hide');
        var form = (event.target.form),
            url = "/TMS/faculty/update/"         
           
        $.post(url, $("#edit_faculty_form").serialize(), function(getData) { 
           console.log(getData);       
        }, 'json');
        
        $('#delete_message').text("Customer edited successfully")
    });
	
	$('#edit').on('hidden.bs.modal', function () {
		 location.reload(true);
		 $('#delete_message').text("Customer edited successfully")
		})
    
    /* delete modal submit */
    
    $('#delete-yes').click(function(event) {
    	
    	var facultyId = $('#faculty_id_delete').val();
    	 $('#delete').modal('hide');
    	console.log("delete-yes-customerId :" +facultyId);
    	        	
    		 $.ajax({
    	            url:'/TMS/faculty/delete/',
    	            data:{faculty_id:facultyId},
    	            type:'post',
    	            cache:false,
    	            success:function(data){
    	              console.log(data); 
    	            },
    	            error:function(){
    	              //alert('error');
    	            }
    	         }
    	    );
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

	'${list.faclutyId}', '${list.facultyName}', '${list.facultyAddress}',
			'${list.facultyDOB}', '${list.facultyEmail}',
			'${list.facultyContact}', '${list.faultyClassName}',
			'${list.facultyDateOfJoining}'
	function editFunction(faclutyId, facultyName, facultyAddress, facultyDOB,
			facultyEmail, facultyContact, faultyClassName, facultyDateOfJoining) {
		$('#faculty_Name').val(facultyName);
		$('#faculty_Address').val(facultyAddress);
		$('#faculty_DOB').val(facultyDOB);
		$('#faculty_Email').val(facultyEmail);
		$('#faculty_Contact').val(facultyContact);
		$('#faulty_ClassName').val(faultyClassName);
		$('#faculty_DateOfJoning').val(facultyDateOfJoining);
		$('#faculty_id').val(faclutyId);
	}
			
	function viewFunction(facultyName, facultyAddress, facultyDOB,
			facultyEmail, facultyContact, faultyClassName, facultyDateOfJoining) {
	document.getElementById("view_faculty_name").innerHTML = facultyName;
	document.getElementById("view_address").innerHTML = facultyAddress;
	document.getElementById("view_date_of_birth").innerHTML = facultyDOB;
	document.getElementById("view_email").innerHTML = facultyEmail;
	document.getElementById("view_contact").innerHTML = facultyContact;
	document.getElementById("view_class_name").innerHTML = faultyClassName;
	document.getElementById("view_date_of_joining").innerHTML = facultyDateOfJoining;
	}
	/* delete function */

	function deletefunctionTest(facultyId) {
 		$('#faculty_id_delete').val(facultyId);
		console.log("faculty Id:" + $('#faculty_id_delete').val());
	}

	$(document).ready(function() {
		$('#edit_faculty_form').ready({
		
		}).on('edit_faculty_form', function(e) {
			$('#success_message').slideDown({
				opacity : "show"
			}, "slow") // Do something ...

			// Prevent form submission
			e.preventDefault();

			// Get the form instance
			var $form = $(e.target);

			// Get the BootstrapValidator instance
			var bv = $form.data('edit_faculty_form');

			// Use Ajax to submit form data
			$.post($form.attr('action'), $form.serialize(), function(result) {
				console.log(result);
			}, 'json');

			$('#edit_faculty_form').each(function() {
				this.reset();
			});

			$('#edit_faculty_form').click(function() {
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
							<a href="/TMS/faculty/addNew/" class="btn btn-primary"
								role="button">Add New</a> <br> <br>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o"></i> Faculty List</h3>
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
												<th>ClassName</th>
												<th>Date_of_Joining</th>
												<th>Action</th>
										</tr>
										</thead>
										<tbody>
											<c:forEach items="${facultyBeans}" var="list" varStatus = "counter">
												<tr>
													<td>${counter.count}</td>
													<td>${list.facultyName}</td>
													<td>${list.facultyAddress}</td>
													<td>${list.facultyDOB}</td>
													<td>${list.facultyEmail}</td>
													<td>${list.facultyContact}</td>
													<td>${list.faultyClassName}</td>
													<td>${list.facultyDateOfJoining}</td>
													<td>
													<button class="btn btn-primary btn-xs" data-title="View"
																data-toggle="modal" data-target="#view"
																onclick="viewFunction('${list.facultyName}','${list.facultyAddress}','${list.facultyDOB}','${list.facultyEmail}','${list.facultyContact}','${list.faultyClassName}','${list.facultyDateOfJoining}','${list.facultyPhoto}')">
																<span class="glyphicon glyphicon-th-list" data-placement="top" data-toggle="tooltip"
															title="View"></span>
															</button>
															<button class="btn btn-primary btn-xs" data-title="Edit"
																data-toggle="modal" data-target="#edit"
																onclick="editFunction('${list.facultyId}','${list.facultyName}','${list.facultyAddress}','${list.facultyDOB}','${list.facultyEmail}','${list.facultyContact}','${list.faultyClassName}','${list.facultyDateOfJoining}','${list.facultyPhoto}')">
																<span class="glyphicon glyphicon-pencil" data-placement="top" data-toggle="tooltip"
															title="Edit"></span>
															</button>
															<button class="btn btn-danger btn-xs" data-title="Delete"
																data-toggle="modal" data-target="#delete">
																<span class="glyphicon glyphicon-trash" data-placement="top" data-toggle="tooltip"
															title="Delete"
																	onclick="deletefunctionTest('${list.facultyId}')"></span>
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
							<h4 class="modal-title custom_align" id="Heading">Edit Your
								Detail</h4>

						</div>
					<form role="form" action="/TMS/faculty/update/" method="POST" id="edit_faculty_form">
						
						<div class="modal-body">
						<div class="col-md-6">
								<div class="form-group">
									<label>faculty Name</label> <input class="form-control "
										id="faculty_Name" name="faculty_Name" type="text" readonly>
								</div>

								<div class="form-group">
									<label>faculty Address</label> <input class="form-control "
										id="faculty_Address" name="faculty_Address" type="text">
								</div>

								<div class="form-group">
									<label>Date Of Birth</label> <input class="form-control "
										id="faculty_DOB" name="faculty_DOB" type="Date">
								</div>

								<div class="form-group">
									<label>Email</label> <input class="form-control "
										id="faculty_Email" name="faculty_Email" type="text">
								</div>
								</div>
								<div class="col-md-6">

								<div class="form-group">
									<label>Phone #</label> <input class="form-control "
										id="faculty_Contact" name="faculty_Contact" type="text">
								</div>

								<div class="form-group">
									<label>Class Name</label> <input class="form-control "
										id="faulty_ClassName" name="faulty_ClassName" type="text">
								</div>

								<div class="form-group">
									<label>Date Of Joining</label> <input class="form-control "
										id="faculty_DateOfJoning" name="faculty_DateOfJoning"
										type="Date">
								</div>
								

								<div class="form-group">
									<input class="form-control " id="faculty_id" name="faculty_id"
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
											<input class="form-control " id="faculty_id_delete"
												name="faculty_id" type="hidden">
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
											<label>Faculty Name :</label>
											<p id="view_faculty_name"></p>
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
											<label>Date Of Joining :</label>
											<p id="view_date_of_joining"></p>
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
				</div>	
				</div>
				</section>
				</div>
			
		<!-- /.content-wrapper -->
		<footer class="main-footer">

			<%@include file="footer.jsp"%>
			
</body>
</html>
