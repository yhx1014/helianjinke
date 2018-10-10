package org.ht.controller;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.ht.pojo.Borrowmoney;
import org.ht.pojo.Certification;
import org.ht.pojo.Certifrecord;
import org.ht.pojo.Dope;
import org.ht.pojo.Poundage;
import org.ht.pojo.Users;
import org.ht.service.CertificationService;
import org.ht.service.DopeService;
import org.ht.service.InformationService;
import org.ht.service.PoundageService;
import org.ht.util.BeanUtils;
import org.ht.util.CreateRandom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InformationController {
	@Autowired
	private InformationService infor;
	@Autowired
	private PoundageService poun;
	@Autowired
	private CertificationService cer;
	@Autowired
	private DopeService dop;

	// 我的账户
	@RequestMapping("query")
	public String query(
			@RequestParam(value = "id", required = false) String id, Model model)
	{
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			Users user = infor.query(map);
			model.addAttribute("user", user);
			return "personalpage";
	}
	
	@RequestMapping("queryinfo")
	public String queryinfo(
			@RequestParam(value = "id", required = false) String id, Model model)
	{
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			List<Borrowmoney> borrow = infor.queryInfo(map);
			model.addAttribute("borrow", borrow);
			return "thirdparty";
	}

	//添加身份信息和认证信息
	@RequestMapping("insertUsercre")
	public String insert(@RequestParam(value = "uid", required = false) Integer uid,
			@RequestParam(value = "unickname", required = false) String unickname,
			@RequestParam(value = "aiid", required = false) Integer aiid,
			@RequestParam(value = "ainame", required = false) String ainame,
			@RequestParam(value = "realname", required = false) String realname,
			@RequestParam(value = "idnumbers", required = false) String IDnumber, Certifrecord cer) {
		System.out.println(
				"\t" + uid + "\t" + unickname + "\t" + aiid + "\t" + ainame + "\t" + realname + "\t" + IDnumber);
		Map<String, Object> map = new HashMap<>();
		map.put("uname", realname);
		map.put("ucardid", IDnumber);
		map.put("uid", uid);
		infor.addUsers(map);
		cer.setCruserid(uid);
		cer.setCrusername(unickname);
		cer.setCraiid(aiid);
		cer.setCrainame(ainame);
		infor.addcertifrecord(cer);
		return "redirect:/find.do?id=" + uid;
	}

	//模拟添加第三方身份信息
	@RequestMapping("insertucertnum")
	public String insertucertnumber(@RequestParam(value="id",required=false) String id,
									@RequestParam(value="uname",required=false) String uname,
									@RequestParam(value="ucardid",required=false) String ucardid,
									@RequestParam(value="umailbox",required=false) String umailbox,
									@RequestParam(value="uphonenumber",required=false) String uphonenumber,
									@RequestParam(value="upwd_zd",required=false) String upwd_zd){
		Map<String, Object> map=new HashMap<>();
		map.put("id", id);
		int ucertnumber = (int)((Math.random()*9+1)*100000);
		String s = String.valueOf(ucertnumber);
		map.put("ucertnumber", s);
		map.put("uname", uname);
		map.put("ucardid", ucardid);
		map.put("umailbox", umailbox);
		map.put("uphonenumber", uphonenumber);
		map.put("upwd_zd", upwd_zd);
		infor.upucertnum(map);
		return "redirect:/find.do?id="+id;
	}
	//获取金额，提现
	@RequestMapping("withdraw")
	public String withdraw(@RequestParam(value="id",required=false) Integer id,Model model) {
		model.addAttribute("cer", cer.select(id));
		return "Withdraw";
	}
	//获取金额，提现
		@RequestMapping("withdrawpay")
		public String withdrawpay(@RequestParam(value="id",required=false) String id,
				@RequestParam(value="actualMoney",required=false) String actualMoney) {
			Certification certi = cer.select(Integer.parseInt(id));
			String mnum = certi.getCbalance();
			String znum = certi.getCtotalmoney();
			float mf = Float.parseFloat(mnum);
			float af = Float.parseFloat(actualMoney);
			float afb = Float.parseFloat(znum);
			float amf = mf-af;
			float bmf = afb-af;
			Map<String, Object> map = new HashMap<>();
			map.put("uid", id);
			map.put("cbalance",String.valueOf(amf));
			map.put("ctotalmoney",String.valueOf(bmf));
			cer.upm(map);
			
			return "redirect:/withdraw.do?id="+Integer.parseInt(id);
		}


	// 修改用户密码
	@RequestMapping("updpassword")
	public String updpassword(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "updatePassForm:repassword", required = false) String password) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		infor.updPassword(map);
		return "redirect:/find.do?id=" + id;
	}	
	//修改手机号码
	@RequestMapping("updphone")
	public String updphone(@RequestParam(value="id",required=false)String id,
							@RequestParam(value="newPhone",required=false) String newPhone){
		System.out.println("用户id:"+id+"新手机号:"+newPhone);
		Map<String, Object> map=new HashMap<>();
		map.put("id", id);
		map.put("phone", newPhone);
		infor.updphone(map);
		return "redirect:/find.do?id="+id;
	}

	//获取验证码
	@RequestMapping("identifying")
	@ResponseBody
	public int  identifying(){
		int i= CreateRandom.random();
		try {  
		System.out.println("-------");
		System.out.println("随机数"+i);
		FileWriter fw;
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
				Date date=new Date();
				fw = new FileWriter ("E://test.txt");
				fw.write ("发送时间:"+format.format(date)+"验证码:"+i);
		        fw.flush();
		        fw.close ();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	//用户充值
		@RequestMapping("userpay")
		@ResponseBody
		@Transactional
		public String userpay(Poundage po){
			String code="200";
			Date date = new Date();
			Map<String, Object> usermap = new HashMap<>();
			Map<String, Object> map = new HashMap<>();
			usermap.put("id", po.getuID());
			Users user = infor.find(usermap);
			po.setUname(user.getUnickname());
			po.setZname(user.getUname());
			po.setWhat("充值");
			po.setSxtime(date);
			po.setBookaccount(user.getUid()+"");
			po.setPaytype("快捷支付");
			Certification certi = cer.select(po.getuID());
			//可用余额
			String cbal = certi.getCbalance();
			String xmoney = po.getSxmoney();
			Float fmoney = Float.valueOf(cbal)+Float.valueOf(xmoney);
			//总余额
			String moneyString = certi.getCtotalmoney();
			Float money = Float.valueOf(moneyString)+Float.valueOf(xmoney);
			map.put("id", po.getuID());
			map.put("cbalance", fmoney.toString());
			map.put("ctotalmoney", money.toString());
			Dope dope = new Dope();
			dope.setDprimkey(po.getuID());
			dope.setDtitle("充值成功");
			dope.setDetails("尊敬的"+user.getUnickname()+",您通过"+po.getPaytype()+"充值的"+po.getSxmoney()+"元已到账!");
			dope.setDtime(date);
			//增加充值明细表数据
			poun.insert(po);
			//增加账户金额数据
			cer.undate(map);
			//添加广播数据
			dop.insert(dope);
			return code;
		}
	//用户资金记录
	@RequestMapping("listpay")
	public String listpay(Model model, @RequestParam(value = "currpage", required = false) String currpage,@RequestParam(value = "id", required = false) String id) {
		int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		Poundage poundage = new Poundage();
		List<Poundage> list = poun.findList(BeanUtils.toMap(poundage));
		totalrow = list.size();// 获取总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		totalpage = (totalrow + pagerow - 1) / pagerow;
		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			if(totalpage<1){
				totalpage=1;
			}
			currpages = totalpage;
		}
		//Integer startPage = (currpages - 1) * pagerow;
		return null;
	}
	
}
