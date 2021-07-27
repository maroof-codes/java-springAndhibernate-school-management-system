<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="links.jsp" %>
 <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
<!-- add_batch_form
	Batch_no
	Batch_class_Name
	noOf_students
	from_time
	to_time
	assign_faculty
	 -->
	<style type="text/css">
#success_message {
	display: none;
}
</style>
<script type="text/javascript">
	  $(document).ready(function() {
		    $('#add_batch_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields: {
		        	Batch_no: {
		                validators: {
		                        stringLength: {
		                        min: 1,
		                    },
		                        notEmpty: {
		                        message: 'Enter batch number'
		                    }
		                }
		            },
		            
		            Batch_class_Name: {
		                validators: {
		                        stringLength: {
		                        min: 2,
		                    },
		                        notEmpty: {
		                        message: 'Select Class Name'
		                    }
		                }
		            },
		            
		            noOf_students: {
		                validators: {
		                    notEmpty: {
		                        message: 'Enter No. of Students'
		                    },
		                  
		                }
		            },
		            
		            from_time :{
	                    validators: {
	                        notEmpty: {
	                            message: 'Start time is required'
	                        },
	                                  }
	           	 },
		     		          
	           	to_time: {
		                validators: {
		                    notEmpty: {
		                        message: 'End time is required'
		                    },
		                }
		                  
		            },
		            assign_faculty: {
		            	validators: {
		                    notEmpty: {
		                        message: 'please Select Faculty!!'
		                    },
		                   
		                }
		            },
		           
		            
		            }
		        })
		        .on('success.form.bv', function(e) {
		            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
		               
		           
		            // Prevent form submission
		            e.preventDefault();

		            // Get the form instance
		            var $form = $(e.target);

		            // Get the BootstrapValidator instance
		            var bv = $form.data('bootstrapValidator');

		            // Use Ajax to submit form data
		            $.post($form.attr('action'), $form.serialize(), function(result) {
		                console.log(result);
		            }, 'json');
		            
		            $( '#add_batch_form' ).each(function(){
		                this.reset();
		            });
		            
		            $('#add_batch_form').click(function() {
		                location.reload(true);
		            });
		        });
		});

	  // Allow Only numbers Validation
	  
	  $(document).ready(function () {
  //called when key is pressed in textbox
  $("#customer_phone").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
  $("#customer_phone").attr('maxlength','10');
});
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
   <%@include file="header.jsp" %>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
  <%@include file="aside.jsp" %>
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
					<h3 class="box-title">Batch Details</h3>
				</div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action = "/TMS/batch/add/" method = "Post" id = "add_batch_form">
			<div class="box-body">
				<div class="row">
				<div class="col-md-6">
				<div class="form-group">
                  <label for="Batch_name"><span class="errorStar">*</span>Batch No:</label>
                  <input type="text" class="form-control" id="Batch_no" name = "Batch_no" placeholder="Enter Batch No" required="required">
                </div>
				</div>
				
				<div class="col-md-6">
				<div class="form-group">
				<label for="Batch_class_Name"><span class="errorStar">*</span>Class Name :</label>
				<select onchange="mewhat(this.value);" name = "Batch_class_Name" id="Batch_class_Name" class="form-control"required="required">
				<option disabled selected>Select Class</option>
			<c:forEach var="list" items="${classesBeans}">
					<option value="${list.classesName}">${list.classesName}</option>
			</c:forEach>
				</select>
                </div>
				</div>
				
				<div class="col-md-6">
				<div class="form-group">
                  <label for="Batch_No_Student"><span class="errorStar">*</span>No of Student :</label>
                  <input type="text" class="form-control" id="noOf_students" name = "noOf_students" placeholder="Enter the no of student" required="required">
                </div>
				</div>
				
				<div class="col-md-3">
				<div class="form-group">
				 <label for="time"><span class="errorStar">*</span>From :</label>
                  <input type="time" class="form-control" id="from_time" name = "from_time" required="required">
                </div>
				</div>
				
				<div class="col-md-3">
				<div class="form-group">
				 <label for="time"><span class="errorStar">*</span>To :</label>
                  <input type="time" class="form-control" id="to_time" name = "to_time" required="required">
                </div>
				</div>
				
				<div class="col-md-6">
				<div class="form-group">
				<label for="Batch"><span class="errorStar">*</span>Assign faculty :</label>
				<select name="assign_faculty" onchange="mewhat(this.value);" id="assign_faculty" class="form-control" required="required">
				<option disabled selected>Select Faculty</option>
					<c:forEach var="list" items="${facultyBeans}">
					<option value="${list.facultyName}">${list.facultyName}</option>
			</c:forEach>
				</select>
                </div>
				</div>
				</div>
             
              <div class="box-footer">
              <div class="alert alert-success" role="alert"
												id="success_message">
												Added <i class="glyphicon glyphicon-thumbs-up"></i>successfully!
											</div>
                <button type="Submit" class="btn btn-primary">Save</button>
              </div>
              </div>
              </form>
              </div>
              </div>
  
            </div> 
			</div> 

    </section>
	 </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
<%@include file="footer.jsp" %>
</div>
</body>
</html>