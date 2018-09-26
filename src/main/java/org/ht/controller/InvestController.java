package org.ht.controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ht.pojo.Biao;
import org.ht.pojo.Details;
import org.ht.pojo.InvestInfo;
import org.ht.pojo.Product;
import org.ht.pojo.Trade;
import org.ht.pojo.Users;
import org.ht.service.BiaoService;
import org.ht.service.CertificationService;
import org.ht.service.DetailsService;
import org.ht.service.InvestService;
import org.ht.service.ProductService;
import org.ht.service.TradeService;
import org.ht.util.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/invest")
public class InvestController {
	@Resource
	private InvestService investS;
	@Resource
	private ProductService proS;
	@Resource
	private DetailsService detS;
	@Resource
	private BiaoService biaoS;
	@Resource
	private CertificationService cs;
	@Resource
	private TradeService tradeS;
	HttpSession hs = null;
	ServletContext application = null;
	
	@RequestMapping("investSel")
	public String investSel(HttpServletRequest req, Model model, String item,String param, String currpage) {
		int pagerow = 5;//每页5行
		int currpages = 1;//当前页
		int totalpage = 0;//总页数
		int totalrow = 0;//总行数
		int outcount = 0;//不够一页的数据条数
		int count = 0;
		
		if (item != null && !item.equals("")) {
			Map<String, Object> map = new HashMap<String, Object>();
			if (hs == null) {
				hs = req.getSession();
			}
			if (item.equals("itemtype")) {
				// 项目类型
				if (param.equals("-1")) {
					// 不限
					if (hs.getAttribute("biaoId") != null) {
						hs.removeAttribute("biaoId");
					}
				} else{
					hs.setAttribute("biaoId", param);
				}
			}
			if (item.equals("rate")) {
				// 利率
				if (param.equals("-1")) {
					// 不限
					if (hs.getAttribute("pincome") != null) {
						hs.setAttribute("startR", "-1");
						hs.removeAttribute("pincome");
					}
				}
				if (param.equals("1")) {
					// 12%以下
					hs.setAttribute("startR", "0");
					hs.setAttribute("endR", "12");
					hs.setAttribute("pincome", "");
				}
				if (param.equals("2")) {
					// 12%-14%
					hs.setAttribute("startR", "12");
					hs.setAttribute("endR", "14");
					hs.setAttribute("pincome", "");
				}
				if (param.equals("3")) {
					//14%-16%
					hs.setAttribute("startR", "14");
					hs.setAttribute("endR", "16");
					hs.setAttribute("pincome", "");
				}
				if (param.equals("4")) {
					// 16%及以上
					hs.setAttribute("startR", "16");
					hs.setAttribute("pincome", "");
					hs.setAttribute("endR", "");
				}
			}
			if (item.equals("timelimit")) {
				// 期限 此处默认一个月为30天
				if (param.equals("-1")) {// 不限
					if (hs.getAttribute("pcount") != null) {
						hs.setAttribute("startT", "-1");
						hs.removeAttribute("pcount");
					}
				}
				if (param.equals("1")) {// 1月以下
					hs.setAttribute("startT", "0");
					hs.setAttribute("endT", "30");
					hs.setAttribute("pcount", "");
				}
				if (param.equals("2")) {// 1-3月
					hs.setAttribute("startT", "30");
					hs.setAttribute("endT", "90");
					hs.setAttribute("pcount", "");
				}
				if (param.equals("3")) {// 3-6月
					hs.setAttribute("startT", "90");
					hs.setAttribute("endT", "180");
					hs.setAttribute("pcount", "");
				}
				if (param.equals("4")) {// 6-12月
					hs.setAttribute("startT", "180");
					hs.setAttribute("endT", "360");
					hs.setAttribute("pcount", "");
				}
				if (param.equals("5")) {// 12月及以上
					hs.setAttribute("startT", "360");
					hs.setAttribute("endT", "");
					hs.setAttribute("pcount", "");
				}
			}
			
			if (hs != null) {
				map.put("pincome", hs.getAttribute("pincome"));
				map.put("pcount", hs.getAttribute("pcount"));
				map.put("biaoId", hs.getAttribute("biaoId"));
				map.put("startR", hs.getAttribute("startR"));
				map.put("endR", hs.getAttribute("endR"));
				map.put("startT", hs.getAttribute("startT"));
				map.put("endT", hs.getAttribute("endT"));
				map.put("pway", hs.getAttribute("pway"));
			}
			
			System.out.println("map中的标主键 " + map.get("biaoId") + "利率开始点 "
					+ map.get("startR") + "期限开始点 " + map.get("startT")
					+ "还款方式 " + map.get("pway"));

			List<Product> page = proS.selList(map);

			totalrow = page.size();
			// 获取总行数
			if (currpage != null && !"".equals(currpage)) {
				currpages = Integer.parseInt(currpage);
			}
			
			outcount = totalrow % pagerow;
			count = totalrow / pagerow;

			totalpage = count;

			if (outcount > 0) {
				totalpage = count + 1;
			}

			if (currpages < 1) {
				currpages = 1;
			}
			if (currpages > totalpage) {
				currpages = totalpage;
			}

			if (currpages == 0) {
				currpages = 1;
			}

			Integer candp = (currpages - 1) * pagerow;
			map.put("startPage", candp);
			map.put("pageSize", 5);

			List<Product> pages = proS.selList(map);
			model.addAttribute("totalrow", totalrow);
			model.addAttribute("currpages", currpages);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("list", pages);

		} else {

			Product pro = new Product();
			@SuppressWarnings("unchecked")
			List<Product> page = proS.findList(BeanUtils.toMap(pro));

			totalrow = page.size();
			// 获取总行数
			if (currpage != null && !"".equals(currpage)) {
				currpages = Integer.parseInt(currpage);
			}
			
			outcount = totalrow % pagerow;
			count = totalrow / pagerow;

			totalpage = count;

			if (outcount > 0) {
				totalpage = count + 1;
			}

			if (currpages < 1) {
				currpages = 1;
			}
			if (currpages > totalpage) {
				currpages = totalpage;
			}

			if (currpages == 0) {
				currpages = 1;
			}

			Integer candp = (currpages - 1) * pagerow;
			pro.setStartPage(candp);
			pro.setPageSize(5);

			@SuppressWarnings("unchecked")
			List<Product> list = proS.findList(BeanUtils.toMap(pro));
			model.addAttribute("totalrow", totalrow);
			model.addAttribute("currpages", currpages);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("list", list);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Biao> biao = biaoS.findList(map);
		model.addAttribute("biao", biao);
		return "list";
	}

	@RequestMapping("recommendShow")
	public String recommendShow(HttpServletRequest req,Model model) {
		//首页中显示推荐
		Map<String, Object> parameters = new HashMap<String, Object>();
	    if(application == null){
			List<Product> proList = new ArrayList<Product>();
			List<Biao> list = biaoS.findList(parameters);
			if (list != null && list.size() > 0) {
				parameters.put("pageSize", 2);
				parameters.put("startPage", 0);
				
				for (int i = 0; i < list.size(); i++) {
					Biao biao = list.get(i);
					parameters.put("biaoId", biao.getId());
					List<Product> tlist = proS.selList(parameters);
					//两条数据
					for (int j = 0; j < tlist.size(); j++) {
						proList.add(tlist.get(j));
						// 将每个类型的两条数据保存到一个list中
					}
				}
			}
			parameters.remove("biaoId");
			parameters.put("pcount", "");    //推荐项目期限一个月以下
			parameters.put("startT", "0");
			parameters.put("endT", "30");
			List<Product> tjl = proS.selList(parameters);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("rowName", "inmoney");    // 查出投资总额
			map.put("tableName", "investinfo");
			Double tm = investS.sumMoney(map);
			application = req.getSession().getServletContext();
			application.setAttribute("proList", proList);
			application.setAttribute("biaoList", list);
			application.setAttribute("tjlist", tjl);
			application.setAttribute("ztz", tm);
	    }
		return "index";
	}

	@RequestMapping("investInfo")
	public String investInfo(String bmid,String currpage,Model model, HttpServletRequest req) {
		
		System.out.println("bmid值为："+bmid.toString());
		int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		int outcount = 0;// 不够一页的数据条数
		int count = 0;//

		Map<String, Object> parameters = new HashMap<String, Object>();
		// 查询条件
		parameters.put("bid", bmid);

		List<InvestInfo> page = investS.investS(parameters);
		// 查出数据条数
		totalrow = page.size();
		// 获取总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}

		outcount = totalrow % pagerow;
		count = totalrow / pagerow;

		totalpage = count;

		if (outcount > 0) {
			totalpage = count + 1;
		}

		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			currpages = totalpage;
		}

		Integer candp = (currpages - 1) * pagerow;
		if(candp < 0){
			candp = 0;
		}
		
		parameters.put("pandc", 5);
		parameters.put("candp", candp);
		
		List<InvestInfo> lists = investS.investS(parameters);

		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("bmid", bmid);
		model.addAttribute("record", lists);

		//查出一些总额
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rowName", "inmoney");// 查出投资总额
		map.put("tableName", "investinfo");
		map.put("bid", bmid);//获得此标的所有投资记录
		
		Double tm = investS.sumMoney(map);
		model.addAttribute("tm", tm);
		System.out.println("tm" + tm);
		map.put("rowName", "profitmoney");// 查出收益总额

		Double gm = investS.sumMoney(map);
		model.addAttribute("gm", gm);
		System.out.println("gm" + gm);

		Map<String, Object> bmap = new HashMap<String, Object>();
		List<Biao> biao = biaoS.findList(bmap);
		model.addAttribute("biao", biao);
		
		
		Product pro = proS.get(Integer.parseInt(bmid));
		HttpSession bms = req.getSession();
		bms.setAttribute("Borrowmoney", pro);

		List<Details> list = detS.detailslist(pro.getId());
		
		System.out.println("标详情列表大小" + list.size());
		bms.setAttribute("Product", pro);
		bms.setAttribute("Details", list);

		System.out.println("pro.getPstate()获取到的值为   " + pro.getPstate());
		
		long days = (pro.getPcount().getTime() - pro.getPtime().getTime())
				/ (24 * 60 * 60 * 1000);
		
		bms.setAttribute("days", days);
		
		if (pro.getPstate().equals("1")) {
			Users us = (Users) req.getSession().getAttribute("globaluser");
			if(us != null){
				String kymoney = cs.selectM(us.getUid());
				System.out.println("进入到输入金额页面  用户余额" + kymoney);
				bms.setAttribute("kymoney", kymoney);
			}
			return "inforadd";
		} else {
			System.out.println("进入到显示页面");
			return "infor";
		}
	}

	@RequestMapping("investAdd")
	public String investAdd(
			@RequestParam(value = "money", required = false) String money,
			HttpServletRequest req,Model model) {
		// 投标
		// @RequestParam(value="",requested=false)
		// InvestInfo ii
		HttpSession hs = req.getSession();
		// Borrowmoney bm = (Borrowmoney) hs.getAttribute("Borrowmoney");
		// System.out.println(bm.getBlimit());
		Product pro = (Product) hs.getAttribute("Product");
		InvestInfo ii = new InvestInfo();
		Users user = (Users) hs.getAttribute("globaluser");
		// inid; //'投资信息表主键',
		// ii.setInid(2);
		if(user != null){
			ii.setUserid(user.getUid()); // '投资用户主键',
			// ii.setBrrowid(bm.getId()); //'投标的主键',
			ii.setBrrowid(pro.getId());//
			ii.setInmoney(new BigDecimal(money)); // '投资金额',
			ii.setInstatus("不用"); // '投资状态 0 收益中的投资 1已完成的投资',
			ii.setInstyle("不用"); // '投资类型',
			// brrowstatus;// '借贷状态是否凑资完',
			ii.setBrrowstatus("不用");
			ii.setInterest(pro.getPincome()); // '投资利率',
			ii.setProfitmodel(pro.getPway()); // '盈利方式 如等额本金',
			ii.setProfitmoney(new BigDecimal("0.00")); // '盈利金额',
			Date date = new Date();
			// @SuppressWarnings("deprecation")
			// String d = date.toLocaleString();
			@SuppressWarnings("deprecation")
			Timestamp ts = new Timestamp(date.getYear(), date.getMonth(),
					date.getDay(), date.getHours(), date.getMinutes(),
					date.getSeconds(), 0);
			ii.setIndate(ts); // '投资时间，可为空'

			// ii.setReplaydate(Integer.parseInt(bm.getBlimit())); //
			long days = (pro.getPcount().getTime() - pro.getPtime().getTime())
					/ (24 * 60 * 60 * 1000);// 相差几天
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String ds = sdf.format(pro.getPcount());

			ii.setReplaydate(ds + "(共" + days + "天)");
			ii.setMarkstatus(0); // '投标状态 0默认投标中 1 投标通过（中标） 2投标未通过（失标）';

			System.out.println(ii.toString());
			hs.removeAttribute("Product");
			hs.removeAttribute("Details");
			investS.investA(ii);//添加投资记录

			//从用户可用余额中扣除金额
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("uid", user.getUid());
			String kym = (String) req.getSession().getAttribute("kymoney");//可用总金额
			String nkym = (Double.parseDouble(kym) - Double.parseDouble(money))+"";//扣除投资后剩余的可用金额
			map.put("money",nkym);
			cs.updateM(map);
			hs.removeAttribute("kymoney");
			//写入用户账户金额记录表
			Trade td = new Trade();
			td.setuID(user.getUid());
			td.setUname(user.getUnickname());
			td.setZname(user.getUname());
			td.setJymoney(money);
			td.setOther("要投资就要舍得花钱");
			tradeS.addDate(td);
			//修改项目凑集资金
//			Product product = proS.get(pro.getId());
			Double updMoney = Double.parseDouble(pro.getPmoney()+"") + Double.parseDouble(money);
			System.out.println("修改完后的金额"+updMoney);
			pro.setPmoney(updMoney.intValue());
			proS.update(pro);
			//判断项目是否满标
			DecimalFormat df = new DecimalFormat( "0.00");
			String udm = df.format(updMoney).toString();
			String odm = df.format(pro.getPtotalmoney()).toString();
			if(udm.equals(odm)){//刚好凑集完
				pro.setPstate("2");//修改为凑资完
				proS.update(pro);
			}
			hs.setAttribute("end", "end");
		}
		return "redirect:investInfo.do?bmid="+pro.getId();
	}

	@RequestMapping("investRecord")
	public String investRecord(Model model,
			@RequestParam(value = "currpage", required = false) String currpage,HttpServletRequest req) {// 查出投资记录
		Users u = (Users) req.getSession().getAttribute("globaluser");
		
		int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数

		int outcount = 0;// 不够一页的数据条数
		int count = 0;//

		Map<String, Object> parameters = new HashMap<String, Object>();// 查询条件
		if(u != null){//用户已登录就查出此用户的数据否则所有数据
			parameters.put("uid", u.getUid());
		}
		List<InvestInfo> page = investS.investS(parameters);// 查出数据条数
		totalrow = page.size();// 获取总行数
		System.out.println("此标的投资信息记录条数"+totalrow);
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		// totalpage = (totalrow + pagerow - 1) / pagerow;

		outcount = totalrow % pagerow;
		count = totalrow / pagerow;

		totalpage = count;

		if (outcount > 0) {
			totalpage = count + 1;
		}

		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			currpages = totalpage;
		}
		// Integer pandc = pagerow * currpages;
		Integer candp = (currpages - 1) * pagerow;
		if(candp < 0){
			candp = 0;
		}
		parameters.put("pandc", 5);
		parameters.put("candp", candp);
		List<InvestInfo> list = investS.investS(parameters);

		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("record", list);

		// 查出一些总额
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rowName", "inmoney");// 查出投资总额
		map.put("tableName", "investinfo");
		if(u != null){//用户已登录就查出此用户的数据否则所有数据
			map.put("uid", u.getUid());
		}
		
		Double tm = investS.sumMoney(map);//查出投资总额
		model.addAttribute("tm", tm);
		System.out.println("tm" + tm);
		map.put("rowName", "profitmoney");

		Double gm = investS.sumMoney(map);// 查出收益总额
		model.addAttribute("gm", gm);
		System.out.println("gm" + gm);

		//查出退还的本金
		List<Trade> tmonery = tradeS.selectMoney(u.getUid());
		Integer allM = 0;
		for(Trade tr : tmonery){
			String money = tr.getJymoney().replace("+", "");
			allM += Integer.parseInt(money);
		}
		System.out.println("退还本金总额"+allM);
		
		//查出总收益
		Integer gtm = investS.getMoney(u.getUid());
		model.addAttribute("gtm", gtm);
		
		Map<String, Object> bmap = new HashMap<String, Object>();
		List<Biao> biao = biaoS.findList(bmap);
		model.addAttribute("biao", biao);
		model.addAttribute("thm", allM);
		return "investrecord";
	}

	public static void main(String s[]) {
		Date date = new Date();
		long dl = date.getTime();
		// 将日期转换成毫秒数
		System.out.println(dl + "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = new Date();
		try {
			d = sdf.parse("2017-03-05 20:27:00");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long dt = d.getTime();
		long day = (dt - dl) / (24 * 60 * 60 * 1000);
		System.out.println(day + "天");
	}
}
