package org.ht.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ht.dao.BankcardDao;
import org.ht.service.BankcardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BankcardServiceImpl implements BankcardService {
	@Autowired
	public BankcardDao bdao;

	@Override
	public Map<String, Object> selectbc(String currpage,Map<String, Object> findmap) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> ma = new HashMap<String, Object>();
		Map<String, Object> m = new HashMap<String, Object>();
		int pagerow = 2;//每页2行
		int currpages = 1;//当前页
		int totalrow = 0;//总行数
		m.put("uname", findmap.get("uname"));
		m.put("yyy", findmap.get("yyy"));
		m.put("yyyy", findmap.get("yyyy"));
		m.put("zname", findmap.get("zname"));
		totalrow = bdao.bankcount(m);
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
		map.put("yyy", findmap.get("yyy"));
		map.put("yyyy", findmap.get("yyyy"));
		map.put("zname", findmap.get("zname"));
		ma.put("pagerow", pagerow);
		ma.put("currpages", currpages);
		ma.put("totalpage", totalpage);
		ma.put("totalrow", totalrow);
		return ma;
	}
}
