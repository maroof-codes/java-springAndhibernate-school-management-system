package com.tms.service;

import java.util.List;

import com.tms.beans.FeesBean;

public interface FeesService {

	public void add(FeesBean feesBean);

	public void update(FeesBean feesBean);

	public void delete(String facultyId);

	public List<FeesBean> findAll();

	public FeesBean findById(String feesId);

}
