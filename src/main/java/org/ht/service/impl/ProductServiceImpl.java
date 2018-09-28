package org.ht.service.impl;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.ht.dao.DetailsDao;
import org.ht.dao.ProductDao;
import org.ht.pojo.Details;
import org.ht.pojo.Product;
import org.ht.service.ProductService;
import org.ht.util.TimeCompare;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;

	@Resource
	DetailsDao detailsDao;

	@Override
	public Product get(Integer id) {
		// TODO Auto-generated method stub
		return dao.get(id);
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		detailsDao.deleteByPid(id);
		dao.delete(id);
	}

	@Override
	public void create(Product product) {
		// 这里设置了新增主表的时候返回主表的主键ID,为了把这个主键的ID加给副表的主键(返回主表的ID在xml那里已经配置了)

		dao.create(product);
		// 新增标的时候需要级联新增详情表
		Details details = product.getDetails();
		// 把主表的ID给附表的ID，让他们的值一样
		if (details != null) {
			details.setPid(product.getId());
			detailsDao.create(details);
		}
	}

	@Override
	public int update(Product product) {
		// TODO Auto-generated method stub

		return dao.update(product);
	}

	@Override
	public List<Product> findList(Map<String, Object> map) {
		List<Product> borrowmoneys = dao.findList(map);
		return borrowmoneys;
	}

	@Override
	public void updateProgres(List<Product> product) {

		for (Product product2 : product) {
			if (product2.getPtotalmoney() == null || product2.getPtotalmoney().equals("")
					|| product2.getPmoney() == 0) {
				product2.setPtotalmoney(0);
				product2.setPmoney(1);
			}
			double money = (product2.getPmoney());// 已募集总金额
			double count = product2.getPtotalmoney(); // 总投标数
			if (money >= count) {
				product2.setProgress(100 + "");
			} else {
				double sum = (money / count) * 100;
				DecimalFormat df = new DecimalFormat("#.00");
				String result = df.format(sum);
				if (result.length() < 4) {
					result = "0" + result;
				}
				product2.setProgress(result + "");
			}

			dao.updateProgres(product2);
		}
	}

	@SuppressWarnings("deprecation")
	@Override
	public void updateStatus(List<Product> product) {

		for (Product product2 : product) {
			double pragess = Double.parseDouble(product2.getProgress());
			Date ptime = product2.getPtime();// 项目期限
			TimeCompare time = new TimeCompare();
			int flag = time.Compare(new Date().toLocaleString(), ptime.toLocaleString());
			if (pragess < 100 && flag == 1) {
				product2.setPstate("1"); // 筹集中
			} else if (pragess >= 100 && flag == -1) {
				product2.setPstate("2"); // 筹集完
			} else if (pragess < 100 && flag == 0) {
				product2.setPstate("3"); // 失效
			}
			dao.updateStatus(product2);
		}
	}

	@Override
	public int setRateAndDeadline(Product product) {
		return dao.setRateAndDeadline(product);
	}

	@Override
	public List<Product> selList(Map<String, Object> map) {
		return dao.myList(map);
	}

	@Override
	public int selIsExitsPrimaryKey() {
		return dao.selIsExitsPrimaryKey();
	}

}
