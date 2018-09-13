package org.ht.service.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ht.dao.RechargeDao;
import org.ht.pojo.Recharge;
import org.ht.service.RechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class RechargeServiceImpl implements RechargeService{
	@Autowired
	public RechargeDao rdao;

	@Override
	public Map<String, Object> selectrc(String currpage,Map<String, Object> findmap) {
		Map<String, Object> map = new  HashMap<String, Object>();
		Map<String, Object> ma = new HashMap<String, Object>();
		Map<String, Object> m = new HashMap<String, Object>();
		int pagerow = 2;//每页2行
		int currpages = 1;//当前页
		int totalrow = 0;//总行数
		ma.put("uname", findmap.get("uname"));
		ma.put("zflx", findmap.get("zflx"));
		ma.put("yyy", findmap.get("yyy"));
		ma.put("yyyy", findmap.get("yyyy"));
		ma.put("statu", findmap.get("statu"));
		totalrow = rdao.selectcount(ma);
		int totalpage = (totalrow + pagerow - 1) / pagerow;//总页数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		if (currpages < 1) {currpages = 1;}
		if (currpages > totalpage) {currpages = totalpage;}
		int l1 = (currpages-1)*pagerow;
		int l2 = pagerow;
		map.put("l1", l1);
		map.put("l2", l2);
		map.put("uname", findmap.get("uname"));
		map.put("zflx", findmap.get("zflx"));
		map.put("yyy", findmap.get("yyy"));
		map.put("yyyy", findmap.get("yyyy"));
		map.put("statu", findmap.get("statu"));
		List<Recharge> lrc = rdao.selectrc(map);
		m.put("lrc", lrc);
		m.put("pagerow", pagerow);
		m.put("currpages", currpages);
		m.put("totalrow", totalrow);
		m.put("totalpage", totalpage);
		return m;
	}

	@Override
	public List<Recharge> selectall() {
		return rdao.selectall();
	}

	@Override
	public int sumczmoneyre() {
		return rdao.sumczmoneyre();
	}

	@Override
	public int sumdzmoneyre() {
		return rdao.sumdzmoneyre();
	}

	
}
