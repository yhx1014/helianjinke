package org.ht.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ht.dao.EmployeeDao;
import org.ht.pojo.Employee;
import org.ht.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	public EmployeeDao employeedao;

	public List<Employee> findlist() {
		List<Employee> elist = employeedao.findlist();
		return elist;
	}

	public int insert(Employee emp) {
		return employeedao.insert(emp);
	}

	// 登录
	public Employee empLogin(@Param("ename") String ename, @Param("epassword") String epassword) {
		System.out.println("----------------" + ename + "mima" + epassword);
		Employee emp = employeedao.empLogin(ename, epassword);
		if (emp == null || emp.equals("")) {
			emp = null;
			return emp;
		} else {
			if (!emp.getEpassword().equals(epassword)) {
				emp = null;
			}
			return emp;
		}
	}
	

	public int add(Employee emp) {
		return employeedao.add(emp);
	}


	public int del(Integer did) {
		return employeedao.del(did);
	}

	
	public Employee toupd(Integer did) {
		return employeedao.toupd(did);
	}

	
	public int upd(Employee emp) {
		return employeedao.upd(emp);
	}

	public List<Employee> selectlike(String ename) {
		return employeedao.selectlike(ename);
	}

	
	public Employee findByName(String ename) {
		Employee ee = employeedao.empLogin(ename, "");
		return ee;
	}

}
