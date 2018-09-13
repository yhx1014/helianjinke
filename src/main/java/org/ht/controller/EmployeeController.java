package org.ht.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.ht.pojo.Dept;
import org.ht.pojo.Employee;
import org.ht.pojo.Limi;
import org.ht.service.DeptService;
import org.ht.service.EmployeeService;
import org.ht.service.LimitService;
import org.ht.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("employee")
public class EmployeeController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private EmployeeService employeeService;
	@Autowired	
	private DeptService deptService;
	@Autowired
	private LimitService limitService;

	@RequestMapping("list")
	public String list(Model model) {
		List<Employee> emplist = employeeService.findlist();
		model.addAttribute("emp", emplist);
		// 查询部门
		List<Dept> deptlist = deptService.findall();
		model.addAttribute("depts", deptlist);
		return "/WEB-INF/view/bk_emplist";
	}

	@RequestMapping("insert")
	public String insert(
			Employee emp,
			@RequestParam(value = "ename", required = false) String ename,
			@RequestParam(value = "epassword", required = false) String epassword) {

		emp.setEname(ename);
		emp.setEpassword(epassword);
		employeeService.insert(emp);
		return "bglogin";
	}

	@RequestMapping("bglogin")
	public String bglogin(
			Model model,
			HttpSession session,
			@RequestParam(value = "ename", required = false) String ename,
			@RequestParam(value = "epassword", required = false) String epassword) {
		String status;
		System.out.println(ename + "------>>>>--->>>>>>>>>" + epassword);
		Employee emp = employeeService.empLogin(ename, epassword);

		if (emp == null || emp.equals("")) {
			status = "账号或密码有误";
			System.out.println("账号或密码有误");
			model.addAttribute("status", status);
			return "bk_login";
		} else {
			// 登录成功
			System.out.println("登录成功");
			//查询权限
			List limitlist = limitService.limitByeid(emp.getEid());
			List list2 = new ArrayList();
			for (int i = 0; i < limitlist.size(); i++) {
				Limi limi = (Limi) limitlist.get(i);
				list2.add(limi.getMid());
			}
			//将list 返回到页面
			session.setAttribute("listlimit", list2);
			model.addAttribute("emp", emp);
			// 将登入信息保存到session中
			session.setAttribute("globalemp", emp);
			return "redirect:../log/tologin.do";
		}

	}

	@RequestMapping("add")
	public String add(Model model, Employee emp,
			@RequestParam(value = "ebirths") String ebirths,
			@RequestParam(value = "etimes") String etimes) {
		// 设置性别
		String esex = emp.getEsex();
		if (esex.equals("0")) {
			emp.setEsex("女");
		} else {
			emp.setEsex("男");
		}
		emp.setEbirth(DateUtil.strchangedate(ebirths));
		emp.setEtime(DateUtil.strchangedate(etimes));
		employeeService.add(emp);
		return "redirect:/employee/list.do";
	}

	@RequestMapping("upd")
	public String upd(Employee emp,
			@RequestParam(value = "ebirths") String ebirths,
			@RequestParam(value = "etimes") String etimes) {
		// 设置性别
		String esex = emp.getEsex();
		if (esex.equals("0")) {
			emp.setEsex("女");
		} else {
			emp.setEsex("男");
		}
		
		emp.setEbirth(DateUtil.strchangedate(ebirths));
		emp.setEtime(DateUtil.strchangedate(etimes));
		System.out.println(emp.getEid()+"---"+emp.getEsex());
		employeeService.upd(emp);
		return "redirect:/employee/list.do";
	}

	@RequestMapping("toadd")
	public String inserts(Model model) {
		List<Dept> deptlist = deptService.findall();
		model.addAttribute("dept", deptlist);
		return "WEB-INF/view/bk_empadd";
	}

	@RequestMapping("del")
	public String del(@RequestParam(value = "eid", required = false) Integer eid) {

		employeeService.del(eid);

		return "redirect:/employee/list.do";
	}

	@RequestMapping("toupd")
	public String toupd(
			@RequestParam(value = "eid", required = false) Integer eid,
			Model model) {
		// 查询结果
		Employee ee = employeeService.toupd(eid);
		model.addAttribute("ee", ee);
		// 查询部门
		List<Dept> deptlist = deptService.findall();
		model.addAttribute("dept", deptlist);
		return "WEB-INF/view/bk_empupd";
	}
	@RequestMapping("selectlike")
	public String selectlike(Model model,
			@RequestParam(value = "ename", required = false) String ename){
		
		List<Employee> emplist = employeeService.selectlike(ename);
		model.addAttribute("emp", emplist);
		
		// 查询部门
		List<Dept> deptlist = deptService.findall();
		model.addAttribute("depts", deptlist);
	
		return "/WEB-INF/view/bk_emplist";
	}
	
	//注册验证用户名已经存在
	@RequestMapping("findByName")
	@ResponseBody
	public int findByName(@RequestParam(value = "ename", required = false) String ename){
		Employee ee = employeeService.findByName(ename);
		if (ee==null) {
			//查询没结果
			return 2;
		}else{
			return 1;
		}
	}
	
	

}
