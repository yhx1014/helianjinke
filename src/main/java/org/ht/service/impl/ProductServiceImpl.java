package org.ht.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.ht.dao.DetailsDao;
import org.ht.dao.ProductDao;
import org.ht.pojo.Borrowmoney;
import org.ht.pojo.Details;
import org.ht.pojo.Product;
import org.ht.service.ProductService;
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
		return dao.get(id);
	}

	@Override
	public void delete(Integer id) {
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
		return dao.update(product);
	}

	@Override
	public List<Product> findList(Map<String, Object> map) {
		List<Product> borrowmoneys = dao.findList(map);
		return borrowmoneys;
	}

	@Override
	public void updateProgres(List<Product> product) {
	}
	
	@Override
	public void updateStatus(List<Product> product) {
	}

	@Override
	public int setRateAndDeadline(Product product) {
		return dao.setRateAndDeadline(product);
	}

	@Override
	public List<Borrowmoney> selList(Map<String, Object> map) {
		return dao.myList(map);
	}

	@Override
	public int selIsExitsPrimaryKey() {
		return dao.selIsExitsPrimaryKey();
	}

}
