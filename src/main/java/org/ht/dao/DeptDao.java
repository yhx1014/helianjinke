package org.ht.dao;

import java.util.List;

import org.ht.pojo.Dept;

public interface DeptDao {

	List<Dept> findall();

	Dept findbyid(Integer did);

	int insert(Dept dept);

	int del(Integer did);

	int upd(Dept dept);
}
