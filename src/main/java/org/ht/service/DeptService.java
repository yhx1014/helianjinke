package org.ht.service;

import java.util.List;

import org.ht.pojo.Dept;

public interface DeptService {
	List<Dept> findall();

	Dept findbyid(Integer did);

	int insert(Dept dept);

	int del(Integer did);

	int upd(Dept dept);
}
