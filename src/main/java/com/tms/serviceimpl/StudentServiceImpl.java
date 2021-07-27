package com.tms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.beans.StudentBean;
import com.tms.dao.GenericDao;
import com.tms.entities.Student;
import com.tms.service.StudentService;
import com.tms.utils.BeanUtils;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private GenericDao<Student> genericDao;

	@Override
	public void add(StudentBean studentBean) {
		Student student = BeanUtils.populateAddStudent(studentBean);
		genericDao.addEntity(student);
	}

	@Override
	public void update(StudentBean studentBean) {
		Student student = BeanUtils.populateAddStudent(studentBean);
		genericDao.updateEntity(student);
	}

	@Override
	public void delete(String studentId) {
		genericDao.deleteEntity(Long.valueOf(studentId),Student.class);
	}

	@Override
	public List<StudentBean> findAll() {
        List<Student> students = genericDao.findAll(Student.class);
		return BeanUtils.populateAddStudentBeanList(students);
	}

	@Override
	public StudentBean findById(String addStudentId) {
		return null;
//        Student student = genericDao.findEntityById(Student.class, addStudentId);
//		return BeanUtils.populateAddStudentBean(student);
	}


}
