package org.ht.service;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Approveitem;
import org.springframework.stereotype.Service;

/**
 * @Name: ApproveService
 * @author chenqingshan
 * @Date: 2017-2-20 Time: 20:24
 */
public interface ApproveService {
	/**
	 * 
	 * @return List
	 */
	public List<Approveitem> queryApproves(Map<String, Object> map);

	/**
	 * 
	 * @param map
	 */
	public void addApproves(Map<String, Object> map);

	/**
	 * 
	 * @param map
	 */
	public void updateApproves(Map<String, Object> map);
}
