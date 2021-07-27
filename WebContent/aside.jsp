<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/TMS/resources/photos\user2-160x160.jpg" class="img alt="User Image">
        </div>
        <div class="pull-left info">
          <p>SANDEEPRAJ</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
         <ul class="treeview-menu">
            
			<li><a href="login.html"><i class="fa fa-circle-o"></i> Login</a></li>
          </ul>
        </li>
		
		<li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i> <span>Tuition Details</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
         <ul class="treeview-menu">
            <li class="active"><a href="/TMS/tuition/get/"><i class="fa fa-circle-o"></i>Tuition List</a></li>
            <li><a href="/TMS/add_tuition"><i class="fa fa-circle-o"></i> Add Tuition</a></li>
		  </ul>
        </li>
		
		<li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i> <span>Class Details</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
         <ul class="treeview-menu">
            <li class="active"><a href="/TMS/classes/get/"><i class="fa fa-circle-o"></i>Class List</a></li>
            <li><a href="/TMS/add_class"><i class="fa fa-circle-o"></i> Add Class</a></li>
		  </ul>
        </li>
		
		<li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i> <span>Batch Details</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
         <ul class="treeview-menu">
            <li class="active"><a href="/TMS/batch/get/"><i class="fa fa-circle-o"></i>Batch List</a></li>
            <li><a href="/TMS/batch/addNew/"><i class="fa fa-circle-o"></i> Add Batch</a></li>
		  </ul>
        </li>

		
		<li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i> <span>Registration</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="/TMS/faculty/get/"><i class="fa fa-circle-o"></i> Faculties</a></li>
            <li><a href="/TMS/addstudent/get/"><i class="fa fa-circle-o"></i> Students</a></li>
			<li><a href="/TMS/document/get/"><i class="fa fa-circle-o"></i> Documents</a></li>
		  </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i> <span>Fees</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
         <ul class="treeview-menu">
            <li class="active"><a href="/TMS/fees/get/"><i class="fa fa-circle-o"></i> Fees List</a></li>
            <li><a href="/TMS/add_fees"><i class="fa fa-circle-o"></i> Add Fees</a></li>
		  </ul>
        </li>
		
		<li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i> <span>Attendance</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="attendanceResult.html"><i class="fa fa-circle-o"></i>Attendance Result</a></li>
            <li><a href="attendance.html"><i class="fa fa-circle-o"></i>Attendance </a></li>
		  </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i> <span>Exam</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="/TMS/exam/addNew/"><i class="fa fa-circle-o"></i>Schedule Exam</a></li>
            <li><a href="/TMS/exam/get/"><i class="fa fa-circle-o"></i>Exams</a></li>
            <li><a href="/TMS/upload_questions"><i class="fa fa-circle-o"></i>Upload Questions</a></li>
            <li><a href="/TMS/question/get/"><i class="fa fa-circle-o"></i>View Questions</a></li>
            <li><a href="/TMS/questionPaper/get/"><i class="fa fa-circle-o"></i>Question Papers</a></li>
		  </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i> <span>Payment</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="paymentform.html"><i class="fa fa-circle-o"></i>Payment form</a></li>
		  </ul>
        </li>
      </ul>
    </section>
