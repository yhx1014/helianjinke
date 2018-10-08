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
	public int setRateAndDeadline(Product product);
}
