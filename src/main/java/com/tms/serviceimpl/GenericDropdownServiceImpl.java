package com.tms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.beans.GenericDropdownBean;
import com.tms.dao.GenericDao;
import com.tms.entities.GenericDropdown;
import com.tms.service.GenericDropdownService;
import com.tms.utils.BeanUtils;

@Service
public class GenericDropdownServiceImpl implements GenericDropdownService {
	
		@Autowired
		private GenericDao<GenericDropdown> genericDao;
		
		@Override
		public void add(GenericDropdownBean genericDropdownBean) {
			GenericDropdown genericDropdown = BeanUtils.populateGenericDropdown(genericDropdownBean);
			genericDao.addEntity(genericDropdown);
		}

		@Override
		public void update(GenericDropdownBean genericDropdownBean) {
			GenericDropdown genericDropdown = BeanUtils.populateGenericDropdown(genericDropdownBean);
			genericDao.updateEntity(genericDropdown);
		}

	
		@Override
		public List<GenericDropdownBean> findAll() {
	        List<GenericDropdown> genericDropdowns = genericDao.findAll(GenericDropdown.class);
			return BeanUtils.populateGenericDropdownBeanList(genericDropdowns);
		}

		@Override
		public GenericDropdownBean findById(String genericId) {
			return null;
//			GenericDropdown genericDropdown = genericDao.findEntityById(GenericDropdown.class, genericId);
//			return BeanUtils.populateGenericDropdownBean(genericDropdown);
		}

		@Override
		public void delete(String genericDropdownId) {
			genericDao.deleteEntity(Long.valueOf(genericDropdownId), GenericDropdown.class);			
		}


}
