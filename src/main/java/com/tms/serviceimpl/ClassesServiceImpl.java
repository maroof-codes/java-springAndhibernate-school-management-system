package com.tms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.beans.ClassesBean;
import com.tms.dao.GenericDao;
import com.tms.entities.Classes;
import com.tms.service.ClassesService;
import com.tms.utils.BeanUtils;

@Service
public class ClassesServiceImpl implements ClassesService{
	
	@Autowired
	private GenericDao<Classes> genericDao;

	@Override
	public void add(ClassesBean classesBean) {
		Classes classes = BeanUtils.populateClasses(classesBean);
		genericDao.addEntity(classes);
	}

	@Override
	public void update(ClassesBean classesBean) {
		Classes classes = BeanUtils.populateClasses(classesBean);
		genericDao.updateEntity(classes);
	}

	@Override
	public void delete(String classesId) {
		genericDao.deleteEntity(Long.valueOf(classesId),Classes.class);
	}

	@Override
	public List<ClassesBean> findAll() {
        List<Classes> classess = genericDao.findAll(Classes.class);
		return BeanUtils.populateClassesBeanList(classess);
	}

	@Override
	public ClassesBean findById(String classesId) {
		return null;
//        Classes classes = genericDao.findEntityById(Classes.class, classesId);
//		return BeanUtils.populateClassesBean(classes);
	}

	
	
	

}
