package org.ht.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.ht.pojo.Biao;
import org.ht.pojo.Borrowcord;
import org.ht.pojo.Borrowmoney;
import org.ht.service.BiaoService;
import org.ht.service.BorrowcordService;
import org.ht.service.BorrowmoneyService;
import org.ht.util.BeanUtils;
import org.ht.util.ZqUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("brower")
public class BorrowmoneyController {
	@Autowired
	public BiaoService biaoService;
	@Autowired
	private BorrowmoneyService service;
	@Autowired
	private BorrowcordService bService;
	static final String str = "WEB-INF/view/";

	@RequestMapping("qurey")
	public String allMoney(HttpServletRequest request, Borrowmoney borrowmoney, Model model,
			@RequestParam(value = "currpage", required = false) String currpage) {
		final int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		Borrowmoney borrowmoney1 = new Borrowmoney();
		borrowmoney1.setBtype(borrowmoney.getBtype());
		borrowmoney1.setBstate(borrowmoney.getBstate());
		borrowmoney1.setBusername(borrowmoney.getBusername());

		if (borrowmoney.getBtype() == null || borrowmoney.getBtype().equals("")
				|| borrowmoney.getBtype().equals("请选择")) {

			borrowmoney1.setBtype(null);
		}
		if (borrowmoney.getBstate() == null || borrowmoney.equals("") || borrowmoney.getBstate().equals("请选择")) {

			borrowmoney1.setBstate(null);
		}
		List<Borrowmoney> list = service.findList(BeanUtils.toMap(borrowmoney1));
		totalrow = list.size();// 获取总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		totalpage = (totalrow + pagerow - 1) / pagerow;
		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			if (totalpage < 1) {
				totalpage = 1;
			}
			currpages = totalpage;
		}
		Integer startPage = (currpages - 1) * pagerow;
		borrowmoney1.setStartPage(startPage);
		borrowmoney1.setPageSize(pagerow);
		List<Borrowmoney> list2 = service.findList(BeanUtils.toMap(borrowmoney1));
		model.addAttribute("list", list2);
		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);
		List<Biao> bList = biaoService.findList(BeanUtils.toMap(new Biao()));

		model.addAttribute("page", list2);
		model.addAttribute("bList", bList);

		return str + "bk_moneylist";
	}

	@RequestMapping("audit")
	public String audit(Model model, @RequestParam(value = "currpage", required = false) String currpage,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "status", required = true) String status) {
		Borrowmoney borrowmoney1 = new Borrowmoney();
		// 通过
		if (status.equals("1")) {
			borrowmoney1.setBstate("1");
		}
		// 不通过
		if (status.equals("0")) {
			borrowmoney1.setBstate("2");
		}
		borrowmoney1.setId(Integer.parseInt(id));
		service.update(borrowmoney1);

		final int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		borrowmoney1.setBstate("0");
		List<Borrowmoney> list = service.findList(BeanUtils.toMap(borrowmoney1));
		totalrow = list.size();// 获取总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		totalpage = (totalrow + pagerow - 1) / pagerow;
		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			if (totalpage < 1) {
				totalpage = 1;
			}
			currpages = totalpage;
		}
		Integer startPage = (currpages - 1) * pagerow;
		borrowmoney1.setStartPage(startPage);
		borrowmoney1.setPageSize(pagerow);
		List<Borrowmoney> list2 = service.findList(BeanUtils.toMap(borrowmoney1));
		model.addAttribute("page", list2);
		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);

		return str + "bk_money_check";
	}

	@RequestMapping(value = "check")
	public String check(Borrowmoney borrowmoney, Model model,
			@RequestParam(value = "currpage", required = false) String currpage) {
		final int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		Borrowmoney borrowmoney1 = new Borrowmoney();
		borrowmoney1.setBstate("0");
		List<Borrowmoney> list = service.findList(BeanUtils.toMap(borrowmoney1));
		totalrow = list.size();// 获取总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		totalpage = (totalrow + pagerow - 1) / pagerow;
		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			if (totalpage < 1) {
				totalpage = 1;
			}
			currpages = totalpage;
		}
		Integer startPage = (currpages - 1) * pagerow;
		borrowmoney1.setStartPage(startPage);
		borrowmoney1.setPageSize(pagerow);
		List<Borrowmoney> list2 = service.findList(BeanUtils.toMap(borrowmoney1));

		model.addAttribute("page", list2);
		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);

		return str + "bk_money_check";

	}

	@RequestMapping("find")
	public String find(Model model, @Param(value = "id") String id) {
		if (id == null || id.equals("")) {
			id = 1 + "";
		}
		Integer ia = Integer.parseInt(id);
		Borrowmoney mBorrowmoney = service.get(ia);
		model.addAttribute("domain", mBorrowmoney);
		return str + "bk_money_detail";
	}

	// 周旗 2017年3月3日10:44:13__________json添加还款(前台)
	@RequestMapping("toaddborr")
	@ResponseBody
	public String toadd(Borrowmoney borrowmoney) {
		service.toaddborr(borrowmoney);
		return "";
	}

	// 周旗 __________还款(查询所有需要还款的还款)
	@RequestMapping("tohk")
	public String updhuankuan(Model model) {
		System.out.println(service.updhuankuan().size() + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		model.addAttribute("list", service.updhuankuan());

		return str + "bk_huankuanlist";
	}

	// 周旗 __________去查看还款详情页面
	@RequestMapping("tohuankuanupd")
	public String tohuankuan(Model model, @RequestParam(value = "id") Integer ids) {
		Borrowmoney borr = service.get(ids);
		model.addAttribute("borr", borr);
		model.addAttribute("list", bService.selborr(ids));

		return str + "bk_huankuanupdeta";
	}

	// 周旗 __________修改还款状态
	@RequestMapping("tohuankuanupds")
	public String tohuankuanupd(Model model, @RequestParam(value = "ids") Integer ids,
			@RequestParam(value = "id") Integer id) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>修改还款状态");
		bService.updborr(ids);
		return "redirect:tohuankuanupd.do?id=" + id;
	}

	// 周旗 __________json
	@RequestMapping("tohuankuanupdison")
	@ResponseBody
	public List<Borrowcord> tohuankuanjson(@RequestParam(value = "id") Integer ids) {
		List<Borrowcord> list = bService.selborr(ids);
		return list;
	}

	// 周旗 点击同意时进入借款信息确认见面
	@RequestMapping("borqr")
	public String borqr(Model model, @RequestParam(value = "ids") Integer ids) {
		Borrowmoney borro = service.borrowget(ids);
		model.addAttribute("borr", borro);
		return str + "bk_huankuanget";
	}

	// 周旗 点击同意时进入借款信息确认见面 (去修改)
	@RequestMapping("borxg")
	public String borxg(Model model, Borrowmoney borrowmoney) {
		//修改状态
		borrowmoney.setBstate("1");
		service.update(borrowmoney);
		//处理还款记录表
		bService.borradd(borrowmoney.getBtimelimit(), borrowmoney.getId(), borrowmoney.getBserial());
		
		return "redirect:check.do";
	}

	// hjy
	@RequestMapping("hjyList")
	public String hjyList(Model m, @RequestParam(value = "currpage", required = false) String currpage) {
		Map<String, Object> wmap = service.selecthjy(currpage);
		List<Borrowmoney> llist = (List<Borrowmoney>) wmap.get("llist");
		m.addAttribute("pagerow", wmap.get("pagerow"));
		m.addAttribute("currpages", wmap.get("currpages"));
		m.addAttribute("wdlist", llist);
		m.addAttribute("totalpage", wmap.get("totalpage"));
		m.addAttribute("totalrow", wmap.get("totalrow"));
		return str + "Borrowmoneylist";
	}

	// hjy
	@RequestMapping("bajax")
	@ResponseBody
	public Borrowmoney ajax(@RequestParam(value = "id", required = false) int id) {
		System.out.println(id);
		System.out.println(service.get(id).getBrelname());
		return service.get(id);
	}

}
