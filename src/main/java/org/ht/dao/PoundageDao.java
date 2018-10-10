package org.ht.dao;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Poundage;



public interface PoundageDao {
	List<Poundage> selectpa(Map<String , Object> map);
	int poundcount(Map<String , Object> map);
	int insert(Poundage po);
}
