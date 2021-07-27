package com.tms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.beans.FeesBean;
import com.tms.dao.GenericDao;
import com.tms.entities.Fees;
import com.tms.service.FeesService;
import com.tms.utils.BeanUtils;

@Service
public class FeesServiceImpl implements FeesService{
	
	@Autowired
	private GenericDao<Fees> genericDao;

	@Override
	public void add(FeesBean feesBean) {
		Fees fees = BeanUtils.populateFees(feesBean);
		genericDao.addEntity(fees);
	}

	@Override
	public void update(FeesBean feesBean) {
		Fees fees = BeanUtils.populateFees(feesBean);
		genericDao.updateEntity(fees);
	}

	@Override
	public void delete(String feesId) {
		genericDao.deleteEntity(Long.valueOf(feesId),Fees.class);
	}

	@Override
	public List<FeesBean> findAll() {
        List<Fees> feess = genericDao.findAll(Fees.class);
		return BeanUtils.populateFeesBeanList(feess);
	}

	@Override
	public FeesBean findById(String feesId) {
		return null;
//        Fees fees = genericDao.findEntityById(Fees.class, feesId);
//		return BeanUtils.populateFeesBean(fees);
	}

	
	
	

}
