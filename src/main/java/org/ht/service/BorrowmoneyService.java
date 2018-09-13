package org.ht.service;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Approveitem;
import org.ht.pojo.Borrowmoney;
import org.ht.pojo.Log;

import com.github.pagehelper.PageInfo;

public interface BorrowmoneyService {

	public List<Borrowmoney> findList(Map<String, Object> map);

	PageInfo<Borrowmoney> findList(Borrowmoney Borrowmoney, Integer pageNo, Integer pageSize);

	int delete(Integer id);

	int create(Borrowmoney record);

	Borrowmoney get(Integer id);

	int update(Borrowmoney record);

	/*
	 * ygx 2017 2 25 效仿陈庆山分页
	 */
	public List<Borrowmoney> pagingSel(Map<String, Object> map);
	/*
	 * zq 2017年3月3日10:40:48 
	 */
	public void toaddborr(Borrowmoney borrowmoney);
	public List<Borrowmoney> updhuankuan();
	public Borrowmoney borrowget(Integer ids);

	
	/**
	 * hjy
	 */
	Map<String, Object> selecthjy(String currpage);
}