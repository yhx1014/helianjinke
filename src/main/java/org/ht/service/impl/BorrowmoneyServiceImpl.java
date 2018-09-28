package org.ht.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.ht.dao.BorrowmoneyDao;
import org.ht.pojo.Borrowmoney;
import org.ht.service.BorrowmoneyService;
import org.ht.util.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Transactional
public class BorrowmoneyServiceImpl implements BorrowmoneyService {

	@Autowired
	BorrowmoneyDao dao;

	@Override
	public Borrowmoney get(Integer id) {
		// TODO Auto-generated method stub
		return dao.get(id);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public int create(Borrowmoney record) {
		// TODO Auto-generated method stub
		return dao.create(record);
	}

	@Override
	public int update(Borrowmoney record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public PageInfo<Borrowmoney> findList(Borrowmoney params, Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 3 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		List<Borrowmoney> list = dao.findList(BeanUtils.toMap(params));

		PageInfo<Borrowmoney> page = new PageInfo<Borrowmoney>(list);
		System.out.println(" PageNum " + page.getPageNum());
		System.out.println("PageSize " + page.getPageSize());
		System.out.println("StartRow " + page.getStartRow());
		System.out.println("EndRow " + page.getEndRow());
		System.out.println("Total " + page.getTotal());
		System.out.println("Pages " + page.getPages());
		System.out.println("FirstPages  " + page.getFirstPage());
		System.out.println("LastPage " + page.getLastPage());
		System.out.println("isHasPreviousPage " + page.isHasPreviousPage());
		System.out.println("HasNextPage " + page.isHasNextPage());

		return page;
	}

	@Override
	public List<Borrowmoney> findList(Map<String, Object> map) {
		List<Borrowmoney> borrowmoneys = dao.findList(map);
		return borrowmoneys;
	}

	/*
	 * 
	 * @ygx 2017 2 25
	 */
	public List<Borrowmoney> pagingSel(Map<String, Object> map) {
		return dao.pagingList(map);
	}

	// michael 2017年3月3日10:41:28
	@Override
	public void toaddborr(Borrowmoney borrowmoney) {
		dao.toaddborr(borrowmoney);
	}

	@Override
	public List<Borrowmoney> updhuankuan() {
		// TODO Auto-generated method stub
		return dao.updhuankuan();
	}

	@Override
	// 获取方法一条详细信息
	public Borrowmoney borrowget(Integer ids) {
		return dao.borrowget(ids);
	}

	/**
	 * hjy
	 */
	@Override
	public Map<String, Object> selecthjy(String currpage) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> m = new HashMap<String, Object>();
		int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = dao.hjycount();// 总行数
		totalpage = (totalrow + pagerow - 1) / pagerow;
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			currpages = totalpage;
		}
		int l1 = (currpages - 1) * pagerow;
		int l2 = pagerow;
		m.put("l1", l1);
		m.put("l2", l2);

		List<Borrowmoney> llist = dao.selecthjy(m);
		map.put("pagerow", pagerow);
		map.put("currpages", currpages);
		map.put("llist", llist);
		map.put("totalpage", totalpage);
		map.put("totalrow", totalrow);
		return map;
	}

}
