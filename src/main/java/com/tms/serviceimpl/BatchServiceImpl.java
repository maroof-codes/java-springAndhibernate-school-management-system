package com.tms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.beans.BatchBean;
import com.tms.dao.GenericDao;
import com.tms.entities.Batch;
import com.tms.service.BatchService;
import com.tms.utils.BeanUtils;

@Service
public class BatchServiceImpl implements BatchService {
	
	@Autowired
	private GenericDao<Batch> genericDao;
	
	@Transactional
	@Override
	public void add(BatchBean batchBean) {
		Batch batch = BeanUtils.populateBatch(batchBean);
		genericDao.addEntity(batch);
	}

	@Transactional
	@Override
	public void update(BatchBean batchBean) {
		Batch batch = BeanUtils.populateBatch(batchBean);
		genericDao.updateEntity(batch);		
	}

	@Transactional
	@Override
	public void delete(String batchId) {
		genericDao.deleteEntity(Long.valueOf(batchId),Batch.class);
	}

	@Transactional
	@Override
	public List<BatchBean> findAll() {
		 List<Batch> batch = genericDao.findAll(Batch.class);
			return BeanUtils.populateBatchBeanList(batch);
	}

	@Transactional
	@Override
	public BatchBean findById(String batchId) {
		return null; // remove later
//		 Batch batch = genericDao.findEntityById(Batch.class, batchId);
//			return BeanUtils.populateBatchBean(batch);
	}

}
