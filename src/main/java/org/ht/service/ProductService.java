package org.ht.service;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Product;

public interface ProductService {
	public List<Product> findList(Map<String, Object> map);

	void delete(Integer id);

	void create(Product product);

	Product get(Integer id);

	int   selIsExitsPrimaryKey();
	
	int update(Product product);
	
	void  updateProgres(List<Product>  product);
	void  updateStatus(List<Product>  product);
	
	List<Product> selList(Map<String, Object> map);
	
	/**
	 * 
	 * @param product
	 * @explain 设置修改年利率，筹款结束时间，还款时间
	 * 
	 */
	public int setRateAndDeadline(Product product);
}
