<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Fess Details</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<%@include file="links.jsp"%>


</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header"> <!-- Logo --> <%@include
			file="header.jsp"%> </header>
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
								<h3 class="box-title">Add Fees</h3>
							</div>

							<form method="POST" action="/TMS/question/uploadExcel/"
								enctype="multipart/form-data">
									<div class="box-body">
								<div class="col-md-8">
									<div class="form-group">
										<label for="Fees_Batch_No"><span class="errorStar">*</span>
											File to Upload :</label> <input type="file" class="form-control"
											name="file" id="file"><br />
									</div>
								</div>
								<div class="col-md-10">
								<span style = "color:red;font:20px;">${msg}</span>
									<div class="box-footer">
										<button type="Submit" class="btn btn-primary">Upload</button>
									</div>
								</div>
								
							</form>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>




		<!-- /.content-wrapper -->
		<footer class="main-footer"> <%@include file="footer.jsp"%>
</body>
</html>
