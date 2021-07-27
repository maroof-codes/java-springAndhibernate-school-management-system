package com.tms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.beans.TuitionBean;
import com.tms.dao.GenericDao;
import com.tms.entities.Tuition;
import com.tms.service.TuitionService;
import com.tms.utils.BeanUtils;

@Service
public class TuitionServiceImpl implements TuitionService {

	@Autowired
	private GenericDao<Tuition> genericDao;

	
	@Override
	public void add(TuitionBean tuitionBean) {
		Tuition tuition = BeanUtils.populateTuition(tuitionBean);
		genericDao.addEntity(tuition);
	}

	@Override
	public void update(TuitionBean tuitionBean) {
		Tuition tuition = BeanUtils.populateTuition(tuitionBean);
		genericDao.updateEntity(tuition);		
	}

	@Override
	public void delete(String tuitionId) {
		genericDao.deleteEntity(Long.valueOf(tuitionId),Tuition.class);
		
	}

	@Override
	public List<TuitionBean> findAll() {
		 List<Tuition> tuitions = genericDao.findAll(Tuition.class);
			return BeanUtils.populateTuitionBeanList(tuitions);
	}

	@Override
	public TuitionBean findById(String tuitionId) {
		return null;
//		 Tuition tuition = genericDao.findEntityById(Tuition.class, tuitionId);
//			return BeanUtils.populateTuitionBean(tuition);
	}

}
