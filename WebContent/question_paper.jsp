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
	$(document).ready(function() {

		/* delete modal submit */

		$('#delete-yes').click(function(event) {

			var questionIdInQuestionPaper = $('#question_id_delete').val();
			$('#delete').modal('hide');
			$.ajax({
				url : '/TMS/questionPaper/delete/',
				data : {
					question_id : questionIdInQuestionPaper
				},
				type : 'post',
				cache : false,
				success : function(data) {
				},
				error : function() {
					//alert('error');
				}
			});
			location.reload(true);
		});

	});
	/* delete function */

	function deletefunctionTest(questionIdInQuestionPaper) {
		$('#question_id_delete').val(questionIdInQuestionPaper);
		console.log("question Id :" + $('#question_id_delete').val());
	}

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
							<br> <br>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o"></i>Question Paper
									</h3>
								</div>
								<div class="table-responsive">

									<table id="content_table"
										class="table table-bordred table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th>Chapter Name</th>
												<th>Questions</th>
												<th>Marks</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${questionPaperBeans}" var="list" varStatus= "counter">
												<tr>
													<td>${counter.count}</td>
													<td>${list.chapterName}</td>
													<td>${list.preparedQuestion}</td>
													<td>${list.marks}</td>
													<td><p data-placement="top" data-toggle="tooltip"
															title="Delete">
															<button class="btn btn-danger btn-xs" data-title="Delete"
																data-toggle="modal" data-target="#delete">
																<span class="glyphicon glyphicon-trash"
																	onclick="deletefunctionTest('${list.questionIdInQuestionPaper}')"></span>
															</button>
														</p></td>
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
					</div>
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<%@include file="footer.jsp"%>
</body>
</html>
