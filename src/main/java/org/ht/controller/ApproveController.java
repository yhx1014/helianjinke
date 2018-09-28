package org.ht.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.ht.pojo.Approveitem;
import org.ht.pojo.Certifrecord;
import org.ht.pojo.Clapplyfor;
import org.ht.pojo.Creditlimit;
import org.ht.pojo.Userauditor;
import org.ht.pojo.Users;
import org.ht.service.ApproveService;
import org.ht.service.CertifrecordService;
import org.ht.service.ClapplyforService;
import org.ht.service.InformationService;
import org.ht.service.UserauditorService;
import org.ht.service.UsersService;
import org.ht.util.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("approve")
public class ApproveController {
	String str = "WEB-INF/view/";
	
	@Autowired
	private ApproveService approveService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private CertifrecordService certifrecordService;
	@Autowired
	private UserauditorService userauditorService;
	@Autowired
	private InformationService informationService;
	@Autowired
	private ClapplyforService clapplyforService;
/*	@Autowired
	private CreditlimitService creditlimitService;*/
	@RequestMapping("traverseApproves")
	private String traverseApproves(Model model, Approveitem ai,
			@RequestParam(value = "currpage", required = false) String currpage) {

		int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("aiid", ai.getAiid());
		parameters.put("ainame", ai.getAiname());
		parameters.put("aitype", ai.getAitype());
		parameters.put("aistate", ai.getAistate());
		List<Approveitem> approvesall = approveService.queryApproves(parameters);

		totalrow = approvesall.size();// 获取总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		totalpage = (totalrow + pagerow - 1) / pagerow;

		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			currpages = totalpage;
		}
		
		Integer candp = (currpages - 1) * pagerow;
		parameters.put("pandc", pagerow);
		parameters.put("candp", candp);
		List<Approveitem> approves = approveService.queryApproves(parameters);
		model.addAttribute("approveitems", approves);
		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);

		return str + "approvelist";
	}

	@RequestMapping("toaddApprove")
	private String toaddApprove() {

		return str + "approveadd";
	}

	@RequestMapping("addApprove")
	private ModelAndView addApprove(Approveitem ai) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("ainame", ai.getAiname());
		parameters.put("aitype", ai.getAitype());
		parameters.put("aistate", "1");
		approveService.addApproves(parameters);
		return new ModelAndView("redirect:traverseApproves.do");
	}

	@RequestMapping("toupdateApprove")
	private String toupdateApprove(Approveitem ai, Model model) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("aiid", ai.getAiid());
		parameters.put("ainame", ai.getAiname());
		parameters.put("aitype", ai.getAitype());
		parameters.put("aistate", ai.getAistate());
		List<Approveitem> approvesall = approveService.queryApproves(parameters);
		Approveitem approve = null;
		if (!approvesall.isEmpty()) {
			approve = approvesall.get(0);
			model.addAttribute("approve", approve);
		}

		return str + "approveupdate";
	}

	@RequestMapping("updateApprove")
	private ModelAndView updateApprove(Approveitem ai) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("aiid", ai.getAiid());
		parameters.put("ainame", ai.getAiname());
		parameters.put("aitype", ai.getAitype());
		parameters.put("aistate", ai.getAistate());
		approveService.updateApproves(parameters);
		return new ModelAndView("redirect:traverseApproves.do");
	}
	
	@RequestMapping("affirmCrauditor")
	@ResponseBody
	public String affirmCrauditor(Userauditor ua){
		String code="200";
		Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("userid",ua.getUserid());
			parameters.put("username",ua.getUsername());
			parameters.put("uauditorid",ua.getUauditorid());
			parameters.put("uauditor",ua.getUauditor());
			int addcode = userauditorService.addUserauditor(parameters);
			if(addcode<=0){
				code="400";
			}else{
				Map<String, Object> parameters1 = new HashMap<String, Object>();
				parameters1.put("crauditor",ua.getUauditor());
				parameters1.put("cruserid",ua.getUserid());
				// int updatecode = certifrecordService.updateCertifrecord(parameters1);
			}

		
		
		return code;
	}
	//资料认证
	@RequestMapping("basicInfoApprove")
	private String basicInfoaudit(Model model,@RequestParam(value = "currpage", required = false) String currpage){
		int pagerow = 10;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		List<Users> user1 = usersService.userList();
		Map<String, Object> parameters = new HashMap<String, Object>();
		List<Userauditor> userauditors = userauditorService.queryUseraubitor(parameters);
		totalrow = user1.size();// 获取总行数
		
		totalpage = (totalrow + pagerow - 1) / pagerow;

		if (currpages < 1) {
			currpages = 1;
		}
		
			if (currpages > totalpage) {
				if(totalpage!=0){
				currpages = totalpage;
				}else{
					currpages =1;
				}
			}
		Integer candp = (currpages - 1) * pagerow;
		Integer pandc = pagerow;
		parameters.put("candp",candp);
		parameters.put("pandc",pandc);
		List<Users> users = usersService.queryUser(parameters);
		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("users", users);
		model.addAttribute("ua", userauditors);
		return str+"basicinfoList";
	}
	
	@RequestMapping("infoAuditByuser")
	private String infoAuditByuser(Model model,Certifrecord cr){
		Map<String, Object> parameters = new HashMap<String, Object>();
		List<Userauditor> userauditors = userauditorService.queryUseraubitor(parameters);
		parameters.put("cruserid",cr.getCruserid());
		parameters.put("id",cr.getCruserid());
		List<Certifrecord> certifrecords = certifrecordService.queryCertifrecord(parameters);
		Users user =  informationService.query(parameters);
		
		List<Approveitem> approvesall = approveService.queryApproves(parameters);
		model.addAttribute("certrecod",certifrecords);
		model.addAttribute("user",user);
		model.addAttribute("approve",approvesall);
		model.addAttribute("code",approvesall.size());
		model.addAttribute("useraud",userauditors);
		model.addAttribute("craiid",cr.getCraiid());
		return str+"basicuserapprove";
	}
	@RequestMapping("updateInfoAudit")
	@ResponseBody
	private String updateInfoAudit(Certifrecord cr){
		String code="200";
		Map<String, Object> parameters = new HashMap<String, Object>();
		Date date = new Date();
		parameters.put("cruserid",cr.getCruserid());
		parameters.put("craiid",cr.getCraiid());
		parameters.put("crviewpoint",cr.getCrviewpoint());
		parameters.put("crintegral",cr.getCrintegral());
		parameters.put("crispass",cr.getCrispass());
		parameters.put("crauditor",cr.getCrauditor());
		parameters.put("crdate",date);
		int updateCode = certifrecordService.updateCertifrecord(parameters);
		if(updateCode <=0){
			code = "400";
		}
		return code;
	}
	
	@RequestMapping("approveStatistics")
	private String approveStatistics(Model model, Certifrecord cr,@RequestParam(value = "currpage", required = false) String currpage){
		int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		List<Users> users = usersService.userList();
		Map<String, Object> parameters = new HashMap<String, Object>();
		List<Approveitem> approvesall = approveService.queryApproves(parameters);
		
		parameters.put("crusername",cr.getCrusername());
		parameters.put("craiid",cr.getCraiid());
		List<Certifrecord> crsize = certifrecordService.queryCertifrecord(parameters);
		totalrow = crsize.size();// 获取总行数
		
		totalpage = (totalrow + pagerow - 1) / pagerow;

		if (currpages < 1) {
			currpages = 1;
		}
		
			if (currpages > totalpage) {
				if(totalpage!=0){
				currpages = totalpage;
				}else{
					currpages =1;
				}
			}
			
		Integer candp = (currpages - 1) * pagerow;
		parameters.put("pandc", pagerow);
		parameters.put("candp", candp);
		
		List<Certifrecord> certifrecords = certifrecordService.queryCertifrecord(parameters);
		model.addAttribute("users",users);
		model.addAttribute("approves",approvesall);
		model.addAttribute("cr",certifrecords);
		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("username",cr.getCrusername());
		model.addAttribute("apid", cr.getCraiid());
		return str+"approvestatistics";
	}
	
	//资料认证 end
	//信用额度申请
	@RequestMapping("limitApplyfor")
	private String limitApplyfor(Model model,
			@RequestParam(value = "currpage", required = false) String currpage,
			@RequestParam(value = "mindate", required = false) String mindate,
			@RequestParam(value = "clpuname", required = false) String clpuname,
			@RequestParam(value = "maxdate", required = false) String maxdate,
			@RequestParam(value = "clpstate", required = false) String clpstate){
		int pagerow = 10;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		   Date date1 = null;
		   Date date2 = null;
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		try {
			if(mindate != null && !mindate.equals("")){
				 date1 = format.parse(mindate);
			}
			if(maxdate != null && !maxdate.equals("")){
				 date2 = format.parse(maxdate);
			}
		   } catch (ParseException e) {
		    e.printStackTrace();
		   }
		
		Map<String, Object> pm = new HashMap<String, Object>();
		List<Certifrecord> certifrecords = certifrecordService.queryCertifrecord(pm);
		pm.put("clpuname",clpuname);
		pm.put("maxdate",date2);
		pm.put("mindate",date1);
		pm.put("clpstate",clpstate);
		List<Clapplyfor> sizes =  clapplyforService.queryClapplyfors(pm);
		
		totalrow = sizes.size();// 获取总行数
		
		totalpage = (totalrow + pagerow - 1) / pagerow;

		if (currpages < 1) {
			currpages = 1;
		}
		
			if (currpages > totalpage) {
				if(totalpage!=0){
				currpages = totalpage;
				}else{
					currpages =1;
				}
			}
			
		Integer candp = (currpages - 1) * pagerow;
		pm.put("pandc", pagerow);
		pm.put("candp", candp);
		List<Clapplyfor> clapplyfors =  clapplyforService.queryClapplyfors(pm);
		model.addAttribute("cr",certifrecords);
		model.addAttribute("cps", clapplyfors);
		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("maxdate", maxdate);
		model.addAttribute("clpuname", clpuname);
		model.addAttribute("mindate", mindate);
		model.addAttribute("clpstate", clpstate);
		return str+"limitapplyforlist";
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("applyforApprove")
	@ResponseBody
	private String applyforApprove(Clapplyfor ca){
		String code="200";
		int updateCode =0;
		updateCode = clapplyforService.updateClapplyforState(BeanUtils.toMap(ca));
		if(ca.getClpstate().equals("1")){//审核通过，修改申请表状态，增加信用额度
			Creditlimit creditlimit = new Creditlimit();
			creditlimit.setCllimit(ca.getClpporiginal()+ca.getClpf());
			creditlimit.setCrbankcard(ca.getClpubcid());
		}
		if(updateCode <=0){
			code = "400";
		}
		return code;
	}
}
