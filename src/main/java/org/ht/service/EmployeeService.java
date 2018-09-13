package org.ht.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ht.pojo.Employee;

public interface EmployeeService {

	// 无条件查询所有加分页
	List<Employee> findlist();

	// 添加新员工
	int insert(Employee emp);

	// 登录
	Employee empLogin(@Param("ename") String ename, @Param("epassword") String epassword);
	//添加员工
	int add(Employee emp);
	int del(Integer did);
	Employee toupd(Integer did);
	int upd(Employee emp);
	List<Employee> selectlike(String ename);
	Employee findByName(String ename);
}
