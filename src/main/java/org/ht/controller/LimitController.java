package org.ht.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.ht.pojo.Dept;
import org.ht.pojo.Employee;
import org.ht.pojo.Limi;
import org.ht.service.DeptService;
import org.ht.service.EmployeeService;
import org.ht.service.LimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("limit")
public class LimitController {
	
	@Autowired
	private LimitService limitService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DeptService deptService;
	
	
	@RequestMapping("findlist")
	public String findlist(Model model){
		List<Employee> emplist = employeeService.findlist();
		model.addAttribute("emp", emplist);
		// 查询部门
		List<Dept> deptlist = deptService.findall();
		model.addAttribute("depts", deptlist);
		return "/WEB-INF/view/limit";
	}
	
	
	@RequestMapping("toupd")
	public String toupd(@RequestParam(value = "eid", required = false) Integer eid,
			HttpServletRequest requeset,
			Model model){
		//根据ID查询权限
		List<?> list = limitService.limitByeid(eid);
		List<String> list2 = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			Limi limi = (Limi) list.get(i);
			list2.add(limi.getMid());
		}
		//将list 返回到页面
		requeset.setAttribute("listss", list2);
		System.out.println(list.size());
		model.addAttribute("eid", eid);
		return "/WEB-INF/view/limitupd";
	}

	@RequestMapping("upd")
	public String upd(@RequestParam(value = "eid", required = false) Integer eid,
			@RequestParam(value = "inp", required = false) String [] rools,
			Model model){
		//先清空原有的数据（删除）--根据ID查询  很多数据
		limitService.limitdel(eid);
		//System.out.println(eid+"------------");
		//System.out.println(liss.size()+"--------------");
		
		if( rools==null || "".equals(rools)){
			System.out.println("rools大小为0");
		}else{
			for (int i = 0; i < rools.length; i++) {
				Limi limit = new Limi();
				limit.setMid(rools[i]);
				limit.setEid(eid);
				//执行添加的方法
				limitService.limitadd(limit);
			}
		}
		return "redirect:/limit/findlist.do";
	}
	
	
}
