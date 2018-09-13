package org.ht.dao;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Approveitem;

/**
 * @Name: ApproveDao
 * @Description:认证项设置的Dao层
 * @author chenqingshan
 * @Date: 2017-2-20 Time: 20:24
 */
public interface ApproveDao {
	/**
	 * Description：根据条件获取认证项，如果条件为空则放回所有认证项
	 * 
	 * @param map
	 * @return List
	 */
	public List<Approveitem> queryApproves(Map<String, Object> map);

	/**
	 * Description：添加新认证项
	 * 
	 * @param map
	 */
	public void addApproves(Map<String, Object> map);

	/**
	 * Description：修改认证项
	 * 
	 * @param map
	 */
	public void updateApproves(Map<String, Object> map);
}
