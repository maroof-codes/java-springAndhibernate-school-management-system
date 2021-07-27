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

						var $select = document.getElementById('select_exam');
						$select.addEventListener('change', function() {
							var examId = $('#select_exam').val();
							alert(examId);

						});
						/* edit modal submit */

						$('#submit')
								.click(
										function(event) {
											$('#edit').modal('hide');
											var form = (event.target.form), url = "/TMS/question/update/"

											$.post(url, $(
													"#edit_questions_form")
													.serialize(), function(
													getData) {
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

						/*Add question script*/
						/* delete modal submit */

						$('#delete-yes').click(
								function(event) {

									var classesId = $('#question_id_delete')
											.val();
									$('#delete').modal('hide');
									$.ajax({
										url : '/TMS/classes/delete/',
										data : {
											question_id : classesId
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

	'${list.questionId}', '${list.chapterName}', '${list.chapterName}',
			'${list.marks}'
	function editFunction(questionId, chapterName, question, marks) {
		$('#chap_name').val(chapterName);
		$('#question').val(question);
		$('#marks').val(marks);
		$('#question_id').val(questionId);
	}
	function viewFunction(marks, chapterName, question) {
		document.getElementById("view_chap_name").innerHTML = chapterName;
		document.getElementById("view_question").innerHTML = question;
		document.getElementById("view_marks").innerHTML = marks;
	}

	/* delete function */

	function deletefunctionTest(classesId) {
		$('#question_id_delete').val(classesId);
		console.log("question Id :" + $('#question_id_delete').val());
	}
	var $select = document.getElementById('select_exam');
	$select.addEventListener('change', function() {
		var examId = $('#select_exam').val();
		alert(examId);
	});

	function addQuestionFunction(questionId, examId) {
		var examId = $('#select_exam').val();
		console.log(examId);
		var question_paper_id = questionId;
		console.log(question_id);
		if (examId == null) {

			alert("please select exam");

		} else {
			$.ajax({
				url : '/TMS/questionPaper/add/',
				data : {
					question_paper_id : questionId,
					examId : examId
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
		}
	}

	$(document).ready(function() {
		$('#edit_questions_form').ready({

		}).on('edit_questions_form', function(e) {
			$('#success_message').slideDown({
				opacity : "show"
			}, "slow") // Do something ...

			// Prevent form submission
			e.preventDefault();

			// Get the form instance
			var $form = $(e.target);

			// Get the BootstrapValidator instance
			var bv = $form.data('edit_questions_form');

			// Use Ajax to submit form data
			$.post($form.attr('action'), $form.serialize(), function(result) {
				console.log(result);
			}, 'json');

			$('#edit_questions_form').each(function() {
				this.reset();
			});

			$('#edit_questions_form').click(function() {
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
							<div class="col-md-6">
								<a href="/TMS/upload_questions" class="btn btn-primary"
									role="button">Add New</a>
							</div>
							<div class="col-md-6" align="right">
								<div class="form-group">
									<select name="select_exam" id="select_exam"
										class="form-control">
										<option disabled selected>Select Exam</option>
										<c:forEach var="list" items="${examBeans}">
											<option value="${list.examId}">${list.examType}on
												${list.examDate}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<br> <br>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o"></i>Class List
									</h3>
								</div>
								<div class="table-responsive">

									<table id="content_table"
										class="table table-bordred table-striped">
										<thead>
											<tr>

												<th>Add to List</th>
												<th>#</th>
												<th>Chapter Name</th>
												<th>Questions</th>
												<th>Marks</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${questionBeans}" var="list"
												varStatus="counter">
												<tr>
													<td><p data-placement="top" data-toggle="tooltip"
															title="Add to Set">
															<button class="btn btn-primary btn-xs">
																<span
																	onclick="addQuestionFunction('${list.questionId}')"
																	class="glyphicon glyphicon-plus"></span>
															</button>
														</p></td>
													<!--  <td><input type="checkbox" class="checkthis" /></td>-->
													<td>${counter.count}</td>
													<td>${list.chapterName}</td>
													<td>${list.question}</td>
													<td>${list.marks}</td>
													<td><button class="btn btn-primary btn-xs"
															data-title="View" data-toggle="modal" data-target="#view"
															onclick="viewFunction('${list.questionId}','${list.chapterName}','${list.question}','${list.marks}')">
															<span class="glyphicon glyphicon-th-list data-placement="
																top" data-toggle="tooltip" title="View"></span>
														</button>
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit"
															onclick="editFunction('${list.questionId}','${list.chapterName}','${list.question}','${list.marks}')">
															<span class="glyphicon glyphicon-pencil"
																data-placement="top" data-toggle="tooltip" title="Edit"></span>
														</button>
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"
																data-placement="top" data-toggle="tooltip"
																title="Delete"
																onclick="deletefunctionTest('${list.questionId}')"></span>
														</button></td>
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
										<form action="/TMS/question/update/" method="post"
											id="edit_questions_form">
											<div class="form-group">
												<label>Chapter Name</label> <input class="form-control "
													id="chap_name" name="chap_name" type="text" readonly>
											</div>
											<div class="form-group">
												<label>Question</label> <input class="form-control "
													id="question" name="question" type="text">
											</div>
											<div class="form-group">
												<label>Marks :</label> <input class="form-control "
													id="marks" name="marks" type="text">
											</div>
											<div class="form-group">
												<input class="form-control " id="question_id"
													name="question_id" type="hidden">
											</div>
										</form>
									</div>
									<div class="modal-footer ">
										<button type="submit" id="submit"
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
											<input class="form-control " id="question_id_delete"
												name="question_id" type="hidden">
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
													<label>Chapter Name :</label>
													<p id="view_chap_name"></p>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Question :</label>
													<p id="view_question"></p>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Marks :</label>
													<p id="view_marks"></p>
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
