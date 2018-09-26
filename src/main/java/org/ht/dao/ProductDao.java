package org.ht.dao;

import java.util.List;
import java.util.Map;
import org.ht.pojo.Product;

public interface ProductDao extends BaseDao<Object, Product> {
	public void updateProgres(Product product);
	public void updateStatus(Product product);
	public List<Product> myList(Map<String,Object> map);
	public int setRateAndDeadline(Product product);
	public List<Product> todaoqilist();
	int  selIsExitsPrimaryKey();
}