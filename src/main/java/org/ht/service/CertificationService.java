package org.ht.service;

import java.util.Map;

import org.ht.pojo.Certification;

public interface CertificationService {
	public String selectM(Integer uid);
	public boolean updateM(Map<String,Object> map);
	public boolean undate(Map<String, Object> map);
	public boolean upm(Map<String, Object> map); 
	public int insert(Certification cer);
	public Certification select(Integer uid);
}
