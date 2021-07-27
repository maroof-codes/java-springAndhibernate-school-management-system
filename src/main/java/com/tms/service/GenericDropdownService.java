package com.tms.service;

import java.util.List;

import com.tms.beans.GenericDropdownBean;

public interface GenericDropdownService {
	
	public void add(GenericDropdownBean genericDropdownBean);

	public void update(GenericDropdownBean genericDropdownBean);

	public void delete(String genericDropdownId);

	public List<GenericDropdownBean> findAll();

	public GenericDropdownBean findById(String genericId);


}
