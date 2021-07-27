package com.tms.utils;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.tms.beans.BatchBean;
import com.tms.beans.ClassesBean;
import com.tms.beans.ExamBean;
import com.tms.beans.FacultyBean;
import com.tms.beans.FeesBean;
import com.tms.beans.GenericDropdownBean;
import com.tms.beans.QuestionBean;
import com.tms.beans.QuestionPaperBean;
import com.tms.beans.StudentBean;
import com.tms.beans.TuitionBean;
import com.tms.entities.Batch;
import com.tms.entities.Classes;
import com.tms.entities.Exam;
import com.tms.entities.Faculty;
import com.tms.entities.Fees;
import com.tms.entities.GenericDropdown;
import com.tms.entities.Question;
import com.tms.entities.QuestionPaper;
import com.tms.entities.Student;
import com.tms.entities.Tuition;

public class BeanUtils {

	/**
	 * Generic method for null value check
	 * 
	 * @param object
	 *            Object
	 * @return boolean
	 */
	private static boolean isNotNull(Object object) {
		if (object != null) {
			return true;
		}
		return false;
	}

	/**
	 * This method copies bean to entity
	 * 
	 * @param StudentBean
	 *            AddStudentBean
	 * @return AddStudent AddStudent
	 */
	public static Student populateAddStudent(StudentBean studentBean) {
		System.out.println("AddStudent BEAN  :" + studentBean);

		if (isNotNull(studentBean)) {
			Student student = new Student();
			student.setStudentId(studentBean.getStudentId());
			student.setStudentName(studentBean.getStudentName());
			student.setAddress(studentBean.getAddress());
			student.setDateOfBirth(Date.valueOf(studentBean.getDateOfBirth()));
			student.setEmailId(studentBean.getEmailId());
			student.setNumber(studentBean.getNumber());
			student.setClassname(studentBean.getClassname());
			student.setBatchId(studentBean.getBatchId());
			System.out.println("AddStudent :" + student);
			return student;
		}

		return null;
	}

	/**
	 * This method copies entities to beans
	 * 
	 * @param flats
	 *            List<Flat>
	 * @return flatBeans List<FlatBean>
	 */
	public static List<StudentBean> populateAddStudentBeanList(List<Student> students) {
		List<StudentBean> studentBeans = new ArrayList<StudentBean>();

		if (isNotNull(students) && !students.isEmpty()) {
			for (Student student : students) {
				StudentBean studentBean = new StudentBean();
				studentBean.setStudentId(student.getStudentId());
				studentBean.setStudentName(student.getStudentName());
				studentBean.setAddress(student.getAddress());
				studentBean
						.setDateOfBirth(student.getDateOfBirth() != null ? student.getDateOfBirth().toString() : null);
				studentBean.setEmailId(student.getEmailId());
				studentBean.setNumber(student.getNumber());
				studentBean.setClassname(student.getClassname());
				studentBean.setBatchId(student.getBatchId());
				studentBeans.add(studentBean);
			}
		}
		return studentBeans;
	}

	/**
	 * This method copies entity to bean
	 * 
	 * @param flat
	 *            Flat
	 * @return addStudentBean addStudentBean
	 */
	public static StudentBean populateAddStudentBean(Student student) {
		if (isNotNull(student)) {
			StudentBean studentBean = new StudentBean();
			studentBean.setStudentId(student.getStudentId());
			studentBean.setStudentName(student.getStudentName());
			studentBean.setAddress(student.getAddress());
			studentBean.setDateOfBirth(student.getDateOfBirth() != null ? student.getDateOfBirth().toString() : null);
			studentBean.setEmailId(student.getEmailId());
			studentBean.setNumber(student.getNumber());
			studentBean.setClassname(student.getClassname());
			studentBean.setBatchId(student.getBatchId());
			return studentBean;
		}
		return null;

	}

	/**
	 * This method copies bean to entity
	 * 
	 * @param FacultyBean
	 *            FacultyBean
	 * @return Faculty Faculty
	 */
	public static Faculty populateFaculty(FacultyBean facultyBean) {
		System.out.println("Faculty BEAN  :" + facultyBean);

		if (isNotNull(facultyBean)) {
			Faculty faculty = new Faculty();
			faculty.setFacultyId(facultyBean.getFacultyId());
			faculty.setFacultyName(facultyBean.getFacultyName());
			faculty.setFacultyAddress(facultyBean.getFacultyAddress());
			faculty.setFacultyDOB(Date.valueOf(facultyBean.getFacultyDOB()));
			faculty.setFacultyEmail(facultyBean.getFacultyEmail());
			faculty.setFacultyContact(facultyBean.getFacultyContact());
			faculty.setFaultyClassName(facultyBean.getFaultyClassName());
			faculty.setFacultyDateOfJoning(Date.valueOf(facultyBean.getFacultyDateOfJoining()));
			faculty.setFacultyPhoto(facultyBean.getFacultyPhoto());

			System.out.println("Faculty :" + faculty);
			return faculty;
		}

		return null;
	}

	/**
	 * This method copies entities to beans
	 * 
	 * @param flats
	 *            List<Flat>
	 * @return flatBeans List<FlatBean>
	 */
	public static List<FacultyBean> populateFacultyBeanList(List<Faculty> facultys) {
		List<FacultyBean> facultyBeans = new ArrayList<FacultyBean>();

		if (isNotNull(facultys) && !facultys.isEmpty()) {
			for (Faculty faculty : facultys) {
				FacultyBean facultyBean = new FacultyBean();
				facultyBean.setFacultyId(faculty.getFacultyId());
				facultyBean.setFacultyName(faculty.getFacultyName());
				facultyBean.setFacultyAddress(faculty.getFacultyAddress());
				facultyBean.setFacultyDOB(faculty.getFacultyDOB() != null ? faculty.getFacultyDOB().toString() : null);
				facultyBean.setFacultyEmail(faculty.getFacultyEmail());
				facultyBean.setFacultyContact(faculty.getFacultyContact());
				facultyBean.setFaultyClassName(faculty.getFaultyClassName());
				facultyBean.setFacultyDateOfJoining(
						faculty.getFacultyDateOfJoning() != null ? faculty.getFacultyDateOfJoning().toString() : null);
				facultyBean.setFacultyPhoto(faculty.getFacultyPhoto());
		
				facultyBeans.add(facultyBean);
			}
		}

		return facultyBeans;
	}

	/**
	 * This method copies entity to bean
	 * 
	 * @param flat
	 *            Flat
	 * @return FacultyBean FacultyBean
	 */
	public static FacultyBean populateFacultyBean(Faculty faculty) {
		if (isNotNull(faculty)) {
			FacultyBean facultyBean = new FacultyBean();
			facultyBean.setFacultyId(faculty.getFacultyId());
			facultyBean.setFacultyName(faculty.getFacultyName());
			facultyBean.setFacultyAddress(faculty.getFacultyAddress());
			facultyBean.setFacultyDOB(faculty.getFacultyDOB() != null ? faculty.getFacultyDOB().toString() : null);
			facultyBean.setFacultyEmail(faculty.getFacultyEmail());
			facultyBean.setFacultyContact(faculty.getFacultyContact());
			facultyBean.setFaultyClassName(faculty.getFaultyClassName());
			facultyBean.setFacultyDateOfJoining(
					faculty.getFacultyDateOfJoning() != null ? faculty.getFacultyDateOfJoning().toString() : null);
			facultyBean.setFacultyPhoto(faculty.getFacultyPhoto());

			return facultyBean;
		}
		return null;

	}

	/*
	 * Method name populateTuition copies bean to entity
	 * 
	 * @returns tuition object
	 * 
	 * @param TuitionBean
	 */
	public static Tuition populateTuition(TuitionBean tuitionBean) {

		System.out.println("Tuition Bean" + tuitionBean);
		if (isNotNull(tuitionBean)) {
			Tuition tuition = new Tuition();

			tuition.setTuitionId(tuitionBean.getTuitionId());
			tuition.setOwnerName(tuitionBean.getOwnerName());
			tuition.setTuitionAddress(tuitionBean.getTuitionAddress());
			tuition.setTuitionContactNumber(tuitionBean.getTuitionContactNumber());
			tuition.setTuitionGstNumber(tuitionBean.getTuitionGstNumber());
			tuition.setTuitionEmailAddress(tuitionBean.getTuitionEmailAddress());
			tuition.setTuitionWebsiteAddress(tuitionBean.getTuitionWebsiteAddress());
			tuition.setTuitionEstablishedYear(tuitionBean.getTuitionEstablishedYear());
			tuition.setTuitionRegistrationDate(Date.valueOf(tuitionBean.getTuitionRegistrationDate()));
			tuition.setTuitionName(tuitionBean.getTuitionName());
			System.out.println("Tuition :" + tuition);
			return tuition;
		}

		return null;
	}

	/*
	 * copies Entities to bean List
	 * 
	 * @returns TuitionBean list
	 */
	public static List<TuitionBean> populateTuitionBeanList(List<Tuition> tuitions) {
		List<TuitionBean> tuitionBeans = new ArrayList<TuitionBean>();

		if (isNotNull(tuitions) && !tuitions.isEmpty()) {
			for (Tuition tuition : tuitions) {
				TuitionBean tuitionBean = new TuitionBean();

				tuitionBean.setOwnerName(tuition.getOwnerName());
				tuitionBean.setTuitionAddress(tuition.getTuitionAddress());
				tuitionBean.setTuitionContactNumber(tuition.getTuitionContactNumber());
				tuitionBean.setTuitionEmailAddress(tuition.getTuitionEmailAddress());
				tuitionBean.setTuitionEstablishedYear(tuition.getTuitionEstablishedYear());
				tuitionBean.setTuitionGstNumber(tuition.getTuitionGstNumber());
				tuitionBean.setTuitionId(tuition.getTuitionId());
				tuitionBean.setTuitionName(tuition.getTuitionName());
				tuitionBean.setTuitionRegistrationDate(tuition.getTuitionRegistrationDate() != null
						? tuition.getTuitionRegistrationDate().toString() : null);
				tuitionBean.setTuitionWebsiteAddress(tuition.getTuitionWebsiteAddress());
				tuitionBeans.add(tuitionBean);
			}
		}
		return tuitionBeans;
	}

	/*
	 * this method copies entities to bean
	 * 
	 * @param Tuition tuition
	 * 
	 * @return tuitionBean
	 */
	public static TuitionBean populateTuitionBean(Tuition tuition) {
		if (isNotNull(tuition)) {
			TuitionBean tuitionBean = new TuitionBean();
			tuitionBean.setOwnerName(tuition.getOwnerName());
			tuitionBean.setTuitionAddress(tuition.getTuitionAddress());
			tuitionBean.setTuitionContactNumber(tuition.getTuitionContactNumber());
			tuitionBean.setTuitionEmailAddress(tuition.getTuitionEmailAddress());
			tuitionBean.setTuitionEstablishedYear(tuition.getTuitionEstablishedYear());
			tuitionBean.setTuitionGstNumber(tuition.getTuitionGstNumber());
			tuitionBean.setTuitionId(tuition.getTuitionId());
			tuitionBean.setTuitionName(tuition.getTuitionName());
			tuitionBean.setTuitionRegistrationDate(tuition.getTuitionRegistrationDate() != null
					? tuition.getTuitionRegistrationDate().toString() : null);
			tuitionBean.setTuitionWebsiteAddress(tuition.getTuitionWebsiteAddress());
			return tuitionBean;
		}
		return null;
	}

	/*
	 * Method name populateTuition copies bean to entity
	 * 
	 * @returns batch object
	 * 
	 * @param BatchBean batchBean
	 */
	public static Batch populateBatch(BatchBean batchBean) {

		System.out.println("Batch Bean" + batchBean);
		if (isNotNull(batchBean)) {
			Batch batch = new Batch();
			batch.setBatchId(batchBean.getBatchId());
			batch.setAssignFaculty(batchBean.getAssignFaculty());
			batch.setBatchNumber("B-" + batchBean.getBatchNumber());
			batch.setBatchTiming(batchBean.getBatchTiming());
			batch.setClassName(batchBean.getClassName());
			batch.setNumberOfStudents(batchBean.getNumberOfStudents());
			System.out.println("Batches :" + batch);
			return batch;
		}

		return null;
	}

	/*
	 * copies Entities to bean List
	 * 
	 * @returns batchBeans
	 */
	public static List<BatchBean> populateBatchBeanList(List<Batch> batches) {
		List<BatchBean> batchBeans = new ArrayList<BatchBean>();

		if (isNotNull(batches) && !batches.isEmpty()) {
			for (Batch batch : batches) {
				BatchBean batchBean = new BatchBean();
				batchBean.setBatchId(batch.getBatchId());
				batchBean.setAssignFaculty(batch.getAssignFaculty());
				batchBean.setBatchNumber(batch.getBatchNumber());
				batchBean.setBatchTiming(batch.getBatchTiming());
				batchBean.setClassName(batch.getClassName());
				batchBean.setNumberOfStudents(batch.getNumberOfStudents());
				batchBeans.add(batchBean);
			}
		}
		return batchBeans;
	}

	public static BatchBean populateBatchBean(Batch batch) {
		if (isNotNull(batch)) {
			BatchBean batchBean = new BatchBean();
			batchBean.setBatchId(batch.getBatchId());
			batchBean.setBatchNumber(batch.getBatchNumber());
			batchBean.setAssignFaculty(batch.getAssignFaculty());
			batchBean.setBatchTiming(batch.getBatchTiming());
			batchBean.setClassName(batch.getClassName());
			batchBean.setNumberOfStudents(batch.getNumberOfStudents());
			return batchBean;
		}
		return null;
	}

	/**
	 * This method copies bean to entity
	 * 
	 * @param ClassesBean
	 *            ClassesBean
	 * @return Classes Classes
	 */
	public static Classes populateClasses(ClassesBean classesBean) {
		System.out.println("Classes BEAN  :" + classesBean);

		if (isNotNull(classesBean)) {
			Classes classes = new Classes();
			classes.setClassesId(classesBean.getClassesId());
			classes.setClassesName(classesBean.getClassesName());
			classes.setClassesDescription(classesBean.getClassesDescription());
			System.out.println("Classes :" + classes);
			return classes;
		}

		return null;
	}

	/**
	 * This method copies entities to beans
	 * 
	 * @param flats
	 *            List<Flat>
	 * @return flatBeans List<FlatBean>
	 */
	public static List<ClassesBean> populateClassesBeanList(List<Classes> classess) {
		List<ClassesBean> classesBeans = new ArrayList<ClassesBean>();

		if (isNotNull(classess) && !classess.isEmpty()) {
			for (Classes classes : classess) {
				ClassesBean classesBean = new ClassesBean();
				classesBean.setClassesId(classes.getClassesId());
				classesBean.setClassesName(classes.getClassesName());
				classesBean.setClassesDescription(classes.getClassesDescription());
				classesBeans.add(classesBean);
			}
		}

		return classesBeans;
	}

	/**
	 * This method copies entity to bean
	 * 
	 * @param flat
	 *            Flat
	 * @return ClassesBean ClassesBean
	 */
	public static ClassesBean populateClassesBean(Classes classes) {
		if (isNotNull(classes)) {
			ClassesBean classesBean = new ClassesBean();
			classesBean.setClassesId(classes.getClassesId());
			classesBean.setClassesName(classes.getClassesName());
			classesBean.setClassesDescription(classes.getClassesDescription());
			return classesBean;
		}
		return null;

	}

	/**
	 * This method copies bean to entity
	 * 
	 * @param FeesBean
	 *            FeesBean
	 * @return Fees Fees
	 */
	public static Fees populateFees(FeesBean feesBean) {
		System.out.println("Fees BEAN  :" + feesBean);

		if (isNotNull(feesBean)) {
			Fees fees = new Fees();
			fees.setFeesId(feesBean.getFeesId());
			fees.setStudentName(feesBean.getStudentName());
			String dateTemp = feesBean.getDateOfFees();
			String SqlDate = dateTemp.replaceAll("/", "-");
			fees.setDateOfFees(Date.valueOf(SqlDate));
			fees.setTotalFees(feesBean.getTotalFees());
			fees.setPaidFees(feesBean.getPaidFees());
			fees.setRemainingFees(feesBean.getRemainingFees());
			System.out.println("Fees :" + fees);
			return fees;
		}

		return null;
	}

	/**
	 * This method copies entities to beans
	 * 
	 * @param flats
	 *            List<Flat>
	 * @return flatBeans List<FlatBean>
	 */
	public static List<FeesBean> populateFeesBeanList(List<Fees> feess) {
		List<FeesBean> feesBeans = new ArrayList<FeesBean>();

		if (isNotNull(feess) && !feess.isEmpty()) {
			for (Fees fees : feess) {
				FeesBean feesBean = new FeesBean();
				feesBean.setFeesId(fees.getFeesId());
				feesBean.setStudentName(fees.getStudentName());
				feesBean.setDateOfFees(fees.getDateOfFees() != null ? fees.getDateOfFees().toString() : null);
				feesBean.setTotalFees(fees.getTotalFees());
				feesBean.setPaidFees(fees.getPaidFees());
				feesBean.setRemainingFees(fees.getRemainingFees());
				feesBeans.add(feesBean);
			}
		}

		return feesBeans;
	}

	/**
	 * This method copies entity to bean
	 * 
	 * @param flat
	 *            Flat
	 * @return FeesBean FeesBean
	 */
	public static FeesBean populateFeesBean(Fees fees) {
		if (isNotNull(fees)) {
			FeesBean feesBean = new FeesBean();
			feesBean.setFeesId(fees.getFeesId());
			feesBean.setStudentName(fees.getStudentName());
			feesBean.setDateOfFees(fees.getDateOfFees() != null ? fees.getDateOfFees().toString() : null);
			feesBean.setTotalFees(fees.getTotalFees());
			feesBean.setPaidFees(fees.getPaidFees());
			feesBean.setRemainingFees(fees.getRemainingFees());
			return feesBean;
		}
		return null;

	}

	/**
	 * This method copies bean to entity
	 * 
	 * @param ExamBean
	 *            ExamBean
	 * @return Exam Exam
	 */
	public static Exam populateExam(ExamBean examBean) {
		System.out.println("Exam BEAN  :" + examBean);

		if (isNotNull(examBean)) {
			Exam exam = new Exam();
			exam.setExamId(examBean.getExamId());
			exam.setExamType(examBean.getExamType());
			exam.setExamTime(examBean.getExamTime());
			exam.setExamDate(Date.valueOf(examBean.getExamDate()));
			exam.setExamTotalMarks(examBean.getExamTotalMarks());
			exam.setExamCoordinator(examBean.getExamCoordinator());
			exam.setClassName(examBean.getClassName());
			exam.setBatch(examBean.getBatch());
			exam.setDuration(examBean.getDuration());
			exam.setExamDetails(examBean.getExamDetails());
			System.out.println("Exam :" + exam);
			return exam;
		}

		return null;
	}

	/**
	 * This method copies entities to beans
	 * 
	 * @param flats
	 *            List<Flat>
	 * @return flatBeans List<FlatBean>
	 */
	public static List<ExamBean> populateExamBeanList(List<Exam> exams) {
		List<ExamBean> examBeans = new ArrayList<ExamBean>();

		if (isNotNull(exams) && !exams.isEmpty()) {
			for (Exam exam : exams) {
				ExamBean examBean = new ExamBean();
				examBean.setExamId(exam.getExamId());
				examBean.setExamType(exam.getExamType());
				examBean.setExamTime(exam.getExamTime());
				examBean.setExamDate(exam.getExamDate() != null ? exam.getExamDate().toString() : null);
				examBean.setExamTotalMarks(exam.getExamTotalMarks());
				examBean.setExamCoordinator(exam.getExamCoordinator());
				examBean.setBatch(exam.getBatch());
				examBean.setClassName(exam.getClassName());
				examBean.setDuration(exam.getDuration());
				examBean.setExamDetails(exam.getExamDetails());
				examBeans.add(examBean);
			}
		}

		return examBeans;
	}

	/**
	 * This method copies entity to bean
	 * 
	 * @param flat
	 *            Flat
	 * @return ExamBean ExamBean
	 */
	public static ExamBean populateExamBean(Exam exam) {
		if (isNotNull(exam)) {
			ExamBean examBean = new ExamBean();
			examBean.setExamId(exam.getExamId());
			examBean.setExamType(exam.getExamType());
			examBean.setExamTime(exam.getExamTime());
			examBean.setExamDate(exam.getExamDate() != null ? exam.getExamDate().toString() : null);
			examBean.setExamTotalMarks(exam.getExamTotalMarks());
			examBean.setExamCoordinator(exam.getExamCoordinator());
			examBean.setBatch(exam.getBatch());
			examBean.setClassName(exam.getClassName());
			examBean.setDuration(exam.getDuration());
			examBean.setExamDetails(exam.getExamDetails());

			return examBean;
		}
		return null;

	}

	/**
	 * This method copies bean to entity
	 * 
	 * @param GenericDropdownBean
	 *            genericDropdownBean
	 * @return GenericDropdown genericDropdown
	 */
	public static GenericDropdown populateGenericDropdown(GenericDropdownBean genericDropdownBean) {
		System.out.println("GENERICDROPDOWN BEAN  :" + genericDropdownBean);

		if (isNotNull(genericDropdownBean)) {
			GenericDropdown genericDropdown = new GenericDropdown();
			genericDropdown.setGenericId(genericDropdownBean.getGenericId());
			genericDropdown.setMaincategory(genericDropdownBean.getMaincategory());
			genericDropdown.setSubcategory(genericDropdownBean.getSubcategory());
			System.out.println("GENERICDROPDOWN :" + genericDropdown);
			return genericDropdown;
		}

		return null;
	}

	/**
	 * This method copies entities to beans
	 * 
	 * @param genericDropdowns
	 *            List<genericDropdown>
	 * @return genericDropdownBeans List<genericDropdownBean>
	 */
	public static List<GenericDropdownBean> populateGenericDropdownBeanList(List<GenericDropdown> genericDropdowns) {
		List<GenericDropdownBean> genericDropdownBeans = new ArrayList<GenericDropdownBean>();

		if (isNotNull(genericDropdowns) && !genericDropdowns.isEmpty()) {
			for (GenericDropdown genericDropdown : genericDropdowns) {
				GenericDropdownBean genericDropdownBean = new GenericDropdownBean();
				genericDropdownBean.setGenericId(genericDropdown.getGenericId());
				genericDropdownBean.setMaincategory(genericDropdown.getMaincategory());
				genericDropdownBean.setSubcategory(genericDropdown.getSubcategory());
				genericDropdownBeans.add(genericDropdownBean);
			}
		}

		return genericDropdownBeans;
	}

	/**
	 * This method copies entity to bean
	 * 
	 * @param genericDropdown
	 *            GenericDropdown
	 * @return genericDropdownBean GenericDropdownBean
	 */
	public static GenericDropdownBean populateGenericDropdownBean(GenericDropdown genericDropdown) {
		if (isNotNull(genericDropdown)) {
			GenericDropdownBean genericDropdownBean = new GenericDropdownBean();
			genericDropdownBean.setGenericId(genericDropdown.getGenericId());
			genericDropdownBean.setMaincategory(genericDropdown.getMaincategory());
			genericDropdownBean.setSubcategory(genericDropdown.getSubcategory());
			return genericDropdownBean;
		}
		return null;

	}

	public static Question populateQuestion(QuestionBean questionBean) {
		if (isNotNull(questionBean)) {
			Question question = new Question();
			question.setChapterName(questionBean.getChapterName());
			question.setMarks(questionBean.getMarks());
			question.setQuestion(questionBean.getQuestion());
			question.setQuestionId(questionBean.getQuestionId());
			return question;
		}
		return null;

	}

	public static List<QuestionPaperBean> populateQuestionPaperBeanList(List<QuestionPaper> questionPapers) {
		List<QuestionPaperBean> questionPaperBeans = new ArrayList<QuestionPaperBean>();

		if (isNotNull(questionPapers) && !questionPapers.isEmpty()) {
			for (QuestionPaper questionPaper : questionPapers) {
				QuestionPaperBean questionPaperBean = new QuestionPaperBean();
				questionPaperBean.setChapterName(questionPaper.getChapterName());
				questionPaperBean.setExamId(questionPaper.getExamId());
				questionPaperBean.setPreparedQuestion(questionPaper.getQuestion());
				questionPaperBean.setQuestionIdInQuestionPaper(questionPaper.getQuestionIdInQuestionPaper() != null
						? questionPaper.getQuestionIdInQuestionPaper().toString() : null);
				questionPaperBean.setMarks(questionPaper.getMarks());
				questionPaperBeans.add(questionPaperBean);
			}
		}
		return questionPaperBeans;
	}

}
