package com.tms.utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.taglibs.standard.lang.jstl.EqualityOperator;

import com.tms.beans.StudentBean;
import com.tms.beans.BatchBean;
import com.tms.beans.ClassesBean;
import com.tms.beans.ExamBean;
import com.tms.beans.FacultyBean;
import com.tms.beans.FeesBean;
import com.tms.beans.GenericDropdownBean;
import com.tms.beans.QuestionBean;
import com.tms.beans.TuitionBean;

public class RequestUtil {

	public static StudentBean createStudentRequest(HttpServletRequest request, String action) {

		StudentBean studentBean = new StudentBean();
		studentBean.setStudentName(request.getParameter("txtName"));
		studentBean.setAddress(request.getParameter("txtAddress"));
		studentBean.setEmailId(request.getParameter("inputEmail"));
		studentBean.setNumber(request.getParameter("Scontact"));
		studentBean.setClassname(request.getParameter("ddlLoginType2"));
		studentBean.setBatchId(request.getParameter("ddlLoginType"));
		studentBean.setDateOfBirth(request.getParameter("SDOB"));
		return studentBean;

	}

	public static StudentBean updateStudentRequest(HttpServletRequest request, String action) {

		StudentBean studentBean = new StudentBean();
		studentBean.setStudentId(Long.valueOf(request.getParameter("student_id")));
		studentBean.setStudentName(request.getParameter("student_name"));
		studentBean.setAddress(request.getParameter("student_address"));
		studentBean.setEmailId(request.getParameter("student_email"));
		studentBean.setNumber(request.getParameter("student_number"));
		studentBean.setClassname(request.getParameter("student_className"));
		studentBean.setBatchId(request.getParameter("student_batch"));
		studentBean.setDateOfBirth(request.getParameter("student_DOB"));
		return studentBean;

	}

	public static FacultyBean createFacultyRequest(HttpServletRequest request, String action) {

		FacultyBean facultyBean = new FacultyBean();
		facultyBean.setFacultyName(request.getParameter("Faculty_Name"));
		facultyBean.setFacultyAddress(request.getParameter("Address"));
		facultyBean.setFacultyDOB(request.getParameter("Date_Of_Birth"));
		facultyBean.setFacultyEmail(request.getParameter("Email_Id"));
		facultyBean.setFacultyContact(request.getParameter("Contact_No"));
		facultyBean.setFacultyContact(request.getParameter("Class_Name"));
		facultyBean.setFacultyDateOfJoining(request.getParameter("Date_of_Joining"));
		// facultyBean.setFacultyPhoto(Byte.valueOf(request.getParameter("profile-img")));
		// facultyBean.setFacultFingerPrint(Byte.valueOf(request.getParameter("Fingerprint_img")));
		return facultyBean;

	}

	/**
	 * @param request
	 * @param action
	 * @return
	 */
	public static FacultyBean updateFacultyRequest(HttpServletRequest request, String action) {

		FacultyBean facultyBean = new FacultyBean();
		facultyBean.setFacultyId(Long.valueOf(request.getParameter("faculty_id")));
		facultyBean.setFacultyName(request.getParameter("faculty_Name"));
		facultyBean.setFacultyAddress(request.getParameter("faculty_Address"));
		facultyBean.setFacultyDOB(request.getParameter("faculty_DOB"));
		facultyBean.setFacultyEmail(request.getParameter("faculty_Email"));
		facultyBean.setFacultyContact(request.getParameter("faculty_Contact"));
		facultyBean.setFaultyClassName(request.getParameter("faulty_ClassName"));
		facultyBean.setFacultyDateOfJoining(request.getParameter("faculty_DateOfJoning"));
		// facultyBean.setFacultyPhoto(Byte.valueOf(request.getParameter("SDOB")));
		// facultyBean.setFacultFingerPrint(Byte.valueOf(request.getParameter("SDOB")));
		return facultyBean;

	}

	public static TuitionBean createTuitionRequest(HttpServletRequest request, String action) {

		TuitionBean tuitionBean = new TuitionBean();
		tuitionBean.setOwnerName(request.getParameter("Owner_Name"));
		tuitionBean.setTuitionAddress(request.getParameter("Tuition_Address"));
		tuitionBean.setTuitionContactNumber(request.getParameter("Contact_No"));
		tuitionBean.setTuitionEmailAddress(request.getParameter("Tuition_Email"));
		tuitionBean.setTuitionEstablishedYear(request.getParameter("Established_Year"));
		tuitionBean.setTuitionGstNumber(request.getParameter("GST_No"));
		tuitionBean.setTuitionName(request.getParameter("Tution_Name"));
		tuitionBean.setTuitionRegistrationDate(request.getParameter("Register_Date"));
		tuitionBean.setTuitionWebsiteAddress(request.getParameter("Tuition_Website"));
		return tuitionBean;

	}

	public static TuitionBean updateTuitionRequest(HttpServletRequest request, String action) {

		TuitionBean tuitionBean = new TuitionBean();
		tuitionBean.setOwnerName(request.getParameter("owner_name"));
		tuitionBean.setTuitionAddress(request.getParameter("address"));
		tuitionBean.setTuitionContactNumber(request.getParameter("contact_no"));
		tuitionBean.setTuitionEmailAddress(request.getParameter("email_address"));
		tuitionBean.setTuitionEstablishedYear(request.getParameter("estb_year"));
		tuitionBean.setTuitionGstNumber(request.getParameter("gst_no"));
		tuitionBean.setTuitionId(Long.valueOf(request.getParameter("tuition_id")));
		tuitionBean.setTuitionName(request.getParameter("tuition_name"));
		tuitionBean.setTuitionRegistrationDate(request.getParameter("registration_date"));
		tuitionBean.setTuitionWebsiteAddress(request.getParameter("website_address"));
		return tuitionBean;

	}

	public static BatchBean createBatchRequest(HttpServletRequest request, String action) {

		BatchBean batchBean = new BatchBean();
		batchBean.setBatchNumber(request.getParameter("Batch_no"));
		batchBean.setBatchTiming(request.getParameter("from_time") +" - "+request.getParameter("to_time"));
		batchBean.setClassName(request.getParameter("Batch_class_Name"));
		batchBean.setAssignFaculty(request.getParameter("assign_faculty"));
		batchBean.setNumberOfStudents(Integer.parseInt(request.getParameter("noOf_students")));
		return batchBean;

	}

	public static BatchBean updateBatchRequest(HttpServletRequest request, String action) {

		BatchBean batchBean = new BatchBean();

		batchBean.setBatchId(Long.valueOf(request.getParameter("batch_id")));
		batchBean.setBatchNumber(request.getParameter("batch_number"));
		batchBean.setBatchTiming(request.getParameter("batch_timing"));
		batchBean.setClassName(request.getParameter("batch_class"));
		batchBean.setAssignFaculty(request.getParameter("assign_faculty"));
		batchBean.setNumberOfStudents(Integer.parseInt(request.getParameter("noOf_students")));
		return batchBean;

	}

	public static ClassesBean createClassesRequest(HttpServletRequest request, String action) {

		ClassesBean classesBean = new ClassesBean();
		classesBean.setClassesName(request.getParameter("Class_Name"));
		classesBean.setClassesDescription(request.getParameter("Class_Description"));
		return classesBean;

	}

	public static ClassesBean updateClassesRequest(HttpServletRequest request, String action) {

		ClassesBean classesBean = new ClassesBean();
		classesBean.setClassesId(Long.valueOf(request.getParameter("classes_id")));
		classesBean.setClassesName(request.getParameter("Classes_Name1"));
		classesBean.setClassesDescription(request.getParameter("Classes_Description1"));
		return classesBean;

	}

	public static FeesBean createFeesRequest(HttpServletRequest request, String action) {

		FeesBean feesBean = new FeesBean();
		feesBean.setStudentName(request.getParameter("Student_Name"));
		feesBean.setDateOfFees(request.getParameter("Fees_Date"));
		feesBean.setTotalFees(request.getParameter("Total_Fees"));
		feesBean.setPaidFees(request.getParameter("Paid_Fees"));
		feesBean.setRemainingFees(request.getParameter("Remaining_Fees"));
		return feesBean;

	}

	public static FeesBean updateFeesRequest(HttpServletRequest request, String action) {

		FeesBean feesBean = new FeesBean();
		feesBean.setFeesId(Long.valueOf(request.getParameter("fees_id")));
		feesBean.setStudentName(request.getParameter("student_Name1"));
		feesBean.setDateOfFees(request.getParameter("Fees_Date1"));
		feesBean.setTotalFees(request.getParameter("Total_fees1"));
		feesBean.setPaidFees(request.getParameter("Paid_fees1"));
		feesBean.setRemainingFees(request.getParameter("Remaining_fees1"));
		return feesBean;

	}

	public static ExamBean createExamRequest(HttpServletRequest request, String action) {

		ExamBean examBean = new ExamBean();
		examBean.setExamType(request.getParameter("Exam_type"));
		examBean.setExamDate(request.getParameter("Exam_Date"));
		examBean.setExamTime(request.getParameter("Exam_Time"));
		examBean.setExamTotalMarks(request.getParameter("Exam_Total_Marks"));
		examBean.setExamCoordinator(request.getParameter("Exam_Coordinator"));
		examBean.setClassName(request.getParameter("class_name"));
		examBean.setBatch(request.getParameter("batch"));
		examBean.setDuration(request.getParameter("exam_duration"));
		examBean.setExamDetails(request.getParameter("exam_details"));
		return examBean;

	}

	public static ExamBean updateExamRequest(HttpServletRequest request, String action) {

		ExamBean examBean = new ExamBean();
		examBean.setExamId(Long.valueOf(request.getParameter("exam_id")));
		examBean.setExamType(request.getParameter("Exam_Type"));
		examBean.setExamDate(request.getParameter("Exam_Date"));
		examBean.setExamTime(request.getParameter("Exam_Time"));
		examBean.setExamTotalMarks(request.getParameter("Total_Marks_Of_Exam"));
		examBean.setExamCoordinator(request.getParameter("Exam_Coordinator"));
		return examBean;

	}

	public static GenericDropdownBean createGenericDropdownRequest(HttpServletRequest request) {

		GenericDropdownBean genericDropdownBean = new GenericDropdownBean();
		genericDropdownBean.setMaincategory(request.getParameter("maincategory"));
		genericDropdownBean.setSubcategory(request.getParameter("subcategory"));

		return genericDropdownBean;
	}

	public static GenericDropdownBean updateGenericDropdownRequest(HttpServletRequest request) {

		GenericDropdownBean genericDropdownBean = new GenericDropdownBean();
		genericDropdownBean.setGenericId(Long.valueOf(request.getParameter("genericId")));
		genericDropdownBean.setMaincategory(request.getParameter("maincategory"));
		genericDropdownBean.setSubcategory(request.getParameter("subcategory"));
		return genericDropdownBean;

	}
	
	public static QuestionBean updateQuestion(HttpServletRequest request, String action){
		QuestionBean questionBean = new QuestionBean();
		
		questionBean.setQuestionId(Long.valueOf(request.getParameter("question_id")));
		questionBean.setChapterName(request.getParameter("chap_name"));
		questionBean.setQuestion(request.getParameter("question"));
		questionBean.setMarks(Integer.parseInt(request.getParameter("marks")));
		return questionBean;
		
	}
}
