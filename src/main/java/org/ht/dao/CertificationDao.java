package org.ht.dao;

import java.util.Map;

import org.ht.pojo.Certification;

public interface CertificationDao {
	public String selMoney(Integer uid); 
	public boolean updMoney(Map<String,Object> map);
	public boolean upmoney(Map<String, Object> map);
	public int insert(Certification cer);
	public Certification select(Integer uid);
}
