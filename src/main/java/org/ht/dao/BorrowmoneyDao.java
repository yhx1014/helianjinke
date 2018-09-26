package org.ht.dao;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Borrowmoney;

public interface BorrowmoneyDao extends BaseDao<Object, Borrowmoney> {
	public List<Borrowmoney> pagingList(Map<String, Object> map);
	public void toaddborr(Borrowmoney borrowmoney);
	public List<Borrowmoney> updhuankuan();
	public Borrowmoney borrowget(Integer ids);
	List<Borrowmoney> selecthjy(Map<String, Object> map);
	int hjycount();
}