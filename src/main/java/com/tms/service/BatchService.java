package com.tms.service;

import java.util.List;

import com.tms.beans.BatchBean;

public interface BatchService {

	public void add(BatchBean batchBean);

	public void update(BatchBean batchBean);

	public void delete(String batchId);

	public List<BatchBean> findAll();

	public BatchBean findById(String batchId);
}
