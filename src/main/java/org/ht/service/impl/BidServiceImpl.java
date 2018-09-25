package org.ht.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.ht.dao.BidDao;
import org.ht.pojo.Certification;
import org.ht.pojo.InvestInfo;
import org.ht.pojo.Product;
import org.ht.pojo.Trade;
import org.ht.pojo.Users;
import org.ht.service.BidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BidServiceImpl implements BidService {

	@Autowired
	private BidDao bidDao;
	
	
	@Override
	public Integer tosize() {
		return bidDao.tosize().size();
	}
	@Override
	public Integer tosizew() {
		return bidDao.tosizew().size();
	}
	@Override
	public Integer tosizeb() {
		return bidDao.tosizeb().size();
	}

	@Override
	/** 查询当日到期的标 */
	public List<Product> todaoqi() {
		return bidDao.todaoqi();
	}

	@Override
	/** 修改标状态为完成 */
	public void upzt(Integer id) {
		bidDao.upzt(id);
	}

	@Override
	/** 查询投资记录 */
	public List<InvestInfo> totouzilist(Integer id) {
		return bidDao.totouzilist(id);
	}

	@Override
	/**
	 * 标到期
	 * 
	 * 总处理方法 1.加余额 2.加交易表 3.改状态
	 */
	public void chuli() {
		List<Product> pList = bidDao.todaoqi();
		if (pList.size()!=0&&pList!=null) {
			for (Product product : pList) {
				List<InvestInfo> list = bidDao.totouzilist(product.getId());
				for (InvestInfo investInfo : list) {
					// 金额
					Certification certification = bidDao.togetyue(investInfo.getBrrowid());
					Map<String, String> map = new HashMap<String, String>(2);
					Integer ye = Integer.parseInt(certification.getCtotalmoney());// 余额

					System.out.println(">>>>>>>>>>>计算前:" + ye);
					// 余额计算__________(添加时间日期)
					int b = ((investInfo.getInmoney()).intValue() * (Integer.parseInt(product.getPincome())));// 投资金额
//					int b = ((investInfo.getInmoney()).intValue() * (Integer.parseInt(product.getPincome())))*(/12);// 投资金额
					ye = ye + b;
					System.out.println(">>>>>>>>>>>计算后:" + ye);
					map.put("ctotalmoney", ye + "");
					map.put("cserial", investInfo.getBrrowid() + "");
					bidDao.toupyue(map);

					// *****添加到交易记录表*******//
					Users us = bidDao.seluesr(investInfo.getBrrowid());

					Trade trade = new Trade(investInfo.getBrrowid(), us.getUnickname(), us.getUname(), "+" + b,
							product.getPname() + "标到期,返回本金和收益.", new Date(), " ");
					bidDao.toaddtrade(trade);

				}
				// 3.修改标的状态为 :4完成
				bidDao.upzt(product.getId());
			}
		}
	}

	/**借款到期*/
	public void chuli2() {
		//查询到期的标
		List<Product> liProducts = bidDao.togetck();
		if (liProducts.size()!=0&&liProducts!=null) {
			for (Product product : liProducts) {
				//查询投资记录表
				List<InvestInfo> list = bidDao.totouzilist(product.getId());
				for (InvestInfo investInfo : list) {
					//根据用户查询到账户余额
					Certification certification = bidDao.togetyue(investInfo.getBrrowid());
					// 余额计算
					Integer ye = Integer.parseInt(certification.getCtotalmoney());// 余额
					System.out.println(">>>>>>>>>>>计算前:" + ye);
					int b = investInfo.getInmoney().intValue();// 投资金额
					ye = ye + b;
					System.out.println(">>>>>>>>>>>计算后:" + ye);
					//余额修改
					Map<String, String> map = new HashMap<String, String>(2);
					map.put("ctotalmoney", ye + "");
					map.put("cserial", investInfo.getBrrowid() + "");
					bidDao.toupyue(map);
	
					// *****添加到交易记录表*******//
					Users us = bidDao.seluesr(investInfo.getBrrowid());
					Trade trade = new Trade(investInfo.getUserid(), us.getUnickname(), us.getUname(), "+" + b,
							product.getPname() + "标资金筹集未完成,退回本金.", new Date(), " ");
					bidDao.toaddtrade(trade);
				}
				// 修改标的状态为 :3 失效
				bidDao.upzts(product.getId());
			}
		}
	}

}
