package com.tms.service;

import java.util.List;

import com.tms.beans.TuitionBean;

public interface TuitionService {
	public void add(TuitionBean tuitionBean);

	public void update(TuitionBean tuitionBean);

	public void delete(String tuitionId);

	public List<TuitionBean> findAll();

	public TuitionBean findById(String tuitionId);

}
