package org.ht.dao;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Approveitem;
import org.ht.pojo.Certifrecord;
import org.ht.pojo.Users;

public interface InfromationDao {
	// 我的账户
	public Users query(Map<String, Object> map);

	// 账户设置
	public Users find(Map<String, Object> map);

	// 查询认证表
	public List<Approveitem> appquery();

	// 添加身份证信息
	public int addUsers(Map<String, Object> map);

	// 添加认证信息到认证信息表
	public int addcertifrecord(Certifrecord cer);
	
	//模拟添加第三方身份信息
	public int upucertnum(Map<String, Object> map);

	// 修改密码
	public int updPassword(Map<String, Object> map);
	//修改手机号码
	public int updphone(Map<String, Object> map);
}
