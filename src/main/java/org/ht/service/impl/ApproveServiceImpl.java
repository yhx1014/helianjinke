package org.ht.service.impl;

import java.util.List;
import java.util.Map;

import org.ht.dao.ApproveDao;
import org.ht.pojo.Approveitem;
import org.ht.service.ApproveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Name: ApproveServiceImpl
 * @Description:认证项设置的Service的实现层
 * @author chenqingshan
 * @Date: 2017-2-20 Time: 20:24
 */
@Service
@Transactional
public class ApproveServiceImpl implements ApproveService {
	@Autowired
	private ApproveDao approveDao;

	/**
	 * Description：根据条件获取认证项，如果条件为空则放回所有认证项
	 * 
	 * @return List
	 */
	@Override
	public List<Approveitem> queryApproves(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Approveitem> approveitems = approveDao.queryApproves(map);
		return approveitems;
	}

	/**
	 * Description：修改认证项
	 * 
	 * @param map
	 */
	@Override
	public void updateApproves(Map<String, Object> map) {
		// TODO Auto-generated method stub
		approveDao.updateApproves(map);
	}

	/**
	 * Description：添加认证项
	 * 
	 * @param map
	 */
	@Override
	public void addApproves(Map<String, Object> map) {
		// TODO Auto-generated method stub
		approveDao.addApproves(map);
	}

}
