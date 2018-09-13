package org.ht.dao;

import java.util.Map;

import org.ht.pojo.Certification;

public interface CertificationDao {
	public String selMoney(Integer uid); //查出某个用户金额
	public boolean updMoney(Map<String,Object> map);//修改某个用户金额
	public boolean upmoney(Map<String, Object> map);
	public int insert(Certification cer);//添加钱包数据
	public Certification select(Integer uid);//查出数据
}
