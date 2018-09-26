package org.ht.dao;

import java.util.List;
import java.util.Map;
import org.ht.pojo.Approveitem;

public interface ApproveDao {
	
	public List<Approveitem> queryApproves(Map<String, Object> map);
	public void addApproves(Map<String, Object> map);
	public void updateApproves(Map<String, Object> map);
}
