package org.ht.dao;

import java.util.List;
import java.util.Map;

import javax.swing.plaf.metal.OceanTheme;

import org.ht.pojo.Product;

public interface ProductDao extends BaseDao<Object, Product> {

	public void updateProgres(Product product);
	
	public void updateStatus(Product product);
	
	public List<Product> myList(Map<String,Object> map);
	
	/**
	 * @author 陈庆山
	 * @param product
	 * @explain 设置修改年利率，筹款结束时间，还款时间
	 */
	public int setRateAndDeadline(Product product);
	
	//-------------募集资金到期------------------//
	
	public List<Product> todaoqilist();
	
	int  selIsExitsPrimaryKey();
	   
}