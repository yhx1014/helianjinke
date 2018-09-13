package org.ht.service.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ht.dao.WithdrawalDao;
import org.ht.pojo.Withdrawal;
import org.ht.service.WithdrawalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class WithdrawalServiceImpl implements WithdrawalService{
	@Autowired
	public WithdrawalDao wdao;

	@Override
	public Map<String, Object>  withdrawallist(String currpage,String btn,Map<String, Object> findmap) {

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> m = new HashMap<String, Object>();
		Map<String, Object> ma = new HashMap<String, Object>();
		int pagerow = 2;//每页2行
		int currpages = 1;//当前页
		int totalpage = 0;//总页数
		ma.put("btn", btn);
		ma.put("wname", findmap.get("wname"));
		ma.put("yyy", findmap.get("yyy"));
		ma.put("yyyy", findmap.get("yyyy"));
		ma.put("wstatu", findmap.get("wstatu"));
		int totalrow = wdao.withdrawalcount(ma);//总行数
		totalpage = (totalrow + pagerow - 1) / pagerow;
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		if (currpages < 1) {currpages = 1;}
		if (currpages > totalpage) {currpages = totalpage;}
		int l1 = (currpages-1)*pagerow;
		
		int l2 = pagerow;
		m.put("l1", l1);
		m.put("l2", l2);
		m.put("btn", btn);
		m.put("wname", findmap.get("wname"));
		m.put("yyy", findmap.get("yyy"));
		m.put("yyyy", findmap.get("yyyy"));
		m.put("wstatu", findmap.get("wstatu"));
		List<Withdrawal> llist = wdao.withdrawallist(m);
		map.put("pagerow", pagerow);
		map.put("currpages", currpages);
		map.put("llist", llist);
		map.put("totalpage", totalpage);
		map.put("totalrow", totalrow);
		return map;
	}

	@Override
	public List<Withdrawal> selectallw() {
		return wdao.selectallw();
	}

	@Override
	public Withdrawal selectone(int id) {
		return wdao.selectone(id);
	}

	
	@Override
	public int sumtxmoney() {
		return wdao.sumtxmoney();
	}

	@Override
	public int sumdzmoney() {
		return wdao.sumdzmoney();
	}

	@Override
	public int sumsxf() {
		return wdao.sumsxf();
	}

	@Override
	public int updwith(int gg, int wid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gg", gg);
		map.put("wid", wid);
	return	wdao.updwith(map);
	}

	@Override
	public int updwiths(int gg,int wid,String wname) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gg", gg);
		map.put("wid", wid);
		map.put("shwho", wname);
		map.put("zztime", new Date());
		map.put("shtime", new Date());
		return wdao.updwiths(map);
	}

	@Override
	public int updmoney(int txmoney, int uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("txmoney", txmoney);
		map.put("uid", uid);
		return wdao.updmoney(map);
	}

	@Override
	public int intmoney(Withdrawal w,int i) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", w.getuID());
		map.put("uname", w.getUname());
		map.put("zname", w.getZname());
		map.put("jymoney",w.getTxmoney());
		if(i==0){
		map.put("what", "get money  failure");
		}else if(i==1){
			map.put("what", "transfer failure");
		}else if(i==2){
			map.put("what", "transfer success");
		}
		map.put("jytime", new Date());
		map.put("other", "less");
		return wdao.intmoney(map);
	}

	
}
