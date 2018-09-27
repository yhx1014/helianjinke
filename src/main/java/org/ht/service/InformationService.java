package org.ht.service;

import java.util.List;
import java.util.Map;
import org.ht.pojo.Approveitem;
import org.ht.pojo.Borrowmoney;
import org.ht.pojo.Certifrecord;
import org.ht.pojo.Users;

public interface InformationService {
	
	public Users query(Map<String, Object> map);
	public Users find(Map<String, Object> map);
	public Borrowmoney queryInfo(Map<String, Object> map);
	public List<Approveitem> appquery();
	public int addUsers(Map<String, Object> map);
	public int addcertifrecord(Certifrecord cer);
	public int upucertnum(Map<String, Object> map);
	public int updPassword(Map<String, Object> map);
	public int updphone(Map<String, Object> map);
	public int userpay(Map<String, Object > map);
}
