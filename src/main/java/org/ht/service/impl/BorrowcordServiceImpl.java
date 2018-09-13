package org.ht.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.ht.dao.BorrowcordDao;
import org.ht.pojo.Borrowcord;
import org.ht.service.BorrowcordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BorrowcordServiceImpl implements BorrowcordService {

	@Autowired
	private BorrowcordDao dao;

	@Override
	/** 根据借款表ID查询还款记录 **/
	public List<Borrowcord> selborr(Integer wid) {
		return dao.selborr(wid);
	}

	@Override
	public void updborr(Integer wid) {
		dao.updborr(wid);
	}

	@Override
	public void borradd(String yss, Integer beyid, String fangshi) {
		int ys = Integer.parseInt(yss);
		Date date = new Date();
		Borrowcord borrowcord = new Borrowcord();
		borrowcord.setBstatue(0);
		borrowcord.setBid(beyid);
		Calendar calendar = Calendar.getInstance();
		if (fangshi != "1") {
			for (int i = 0; i < ys; i++) {
				calendar.setTime(date);
				calendar.add(Calendar.SECOND,  60 * 60 * 24 * 30);
				date = calendar.getTime();
				borrowcord.setBdate(date);
				borrowcord.setBcs(i + 1);
				dao.borradd(borrowcord);
			}
		} else {
			calendar.setTime(date);
			calendar.add(Calendar.SECOND, 1000 * 60 * 60 * 24 * 30 * ys);
			date = calendar.getTime();
			borrowcord.setBdate(date);
			borrowcord.setBcs(1);
			dao.borradd(borrowcord);
		}
	}
}
