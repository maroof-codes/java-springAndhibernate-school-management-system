package com.tms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.beans.FacultyBean;
import com.tms.dao.GenericDao;
import com.tms.entities.Faculty;
import com.tms.service.FacultyService;
import com.tms.utils.BeanUtils;

@Service
public class FacultyServiceImpl implements FacultyService {
	
	@Autowired
	private GenericDao<Faculty> genericDao;

	@Override
	public void add(FacultyBean facultyBean) {
		Faculty faculty = BeanUtils.populateFaculty(facultyBean);
		genericDao.addEntity(faculty);
	}

	@Override
	public void update(FacultyBean facultyBean) {
		Faculty faculty = BeanUtils.populateFaculty(facultyBean);
		genericDao.updateEntity(faculty);
	}

	@Override
	public void delete(String facultyId) {
		genericDao.deleteEntity(Long.valueOf(facultyId),Faculty.class);
	}

	@Override
	public List<FacultyBean> findAll() {
        List<Faculty> facultys = genericDao.findAll(Faculty.class);
		return BeanUtils.populateFacultyBeanList(facultys);
	}

	@Override
	public FacultyBean findById(String facultyId) {
		return null;
//        Faculty faculty = genericDao.findEntityById(Faculty.class, facultyId);
//		return BeanUtils.populateFacultyBean(faculty);
	}


}
