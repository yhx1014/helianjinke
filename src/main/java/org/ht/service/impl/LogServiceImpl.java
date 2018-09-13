package org.ht.service.impl;

import java.util.List;
import java.util.Map;

import org.ht.dao.LogDao;
import org.ht.pojo.Borrowmoney;
import org.ht.pojo.Log;
import org.ht.service.LoggerService;
import org.ht.util.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Transactional
public class LogServiceImpl implements LoggerService {

	@Autowired
	private LogDao logDao;

	@Override
	public PageInfo<Log> findList(Log params, Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		// Assert.notNull(params);
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 3 : pageSize;
		PageHelper.startPage(pageNo, pageSize);

		List<Log> list = logDao.findList(BeanUtils.toMap(params));
		// װ
		PageInfo<Log> page = new PageInfo<Log>(list);

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
	public void create(Log log) {

		logDao.create(log);

	}

	@Override
	public List<Log> findList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("map   =========  " + map);
		List<Log> borrowmoneys = logDao.findList(map);
		return borrowmoneys;
	}

}
