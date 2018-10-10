package org.ht.controller;

import java.util.List;
import org.ht.pojo.Borrowcord;
import org.ht.pojo.Borrowmoney;
import org.ht.service.BiaoService;
import org.ht.service.BorrowcordService;
import org.ht.service.BorrowmoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/brower")
public class BorrowmoneyController {
	@Autowired
	public BiaoService biaoService;
	@Autowired
	private BorrowmoneyService service;
	@Autowired
	private BorrowcordService bService;

	@RequestMapping("toaddborr")
	@ResponseBody
	public String toadd(Borrowmoney borrowmoney) {
		service.toaddborr(borrowmoney);
		return "";
	}
	
	@RequestMapping("tohuankuanupdison")
	@ResponseBody
	public List<Borrowcord> tohuankuanjson(@RequestParam(value = "id") Integer ids) {
		List<Borrowcord> list = bService.selborr(ids);
		return list;
	}

	@RequestMapping("bajax")
	@ResponseBody
	public Borrowmoney ajax(@RequestParam(value = "id", required = false) int id) {
		System.out.println(id);
		System.out.println(service.get(id).getBrelname());
		return service.get(id);
	}
	
	@RequestMapping("insert")
	public String insert(Borrowmoney bm, Model model,
		@RequestParam(value = "bmortgagetype", required = false) String bmortgagetype,
		@RequestParam(value = "bmortgagecount", required = false) String bmortgagecount,
		@RequestParam(value = "bpaytype", required = false) String bpaytype,
		@RequestParam(value = "bcommission", required = false) String bcommission,
		@RequestParam(value = "btype", required = false) String btype,
		@RequestParam(value = "bcount", required = false) String bcount,
		@RequestParam(value = "binterval", required = false) String binterval,
		@RequestParam(value = "brate", required = false) String brate)
	{
		bm.setBmortgagetype(bmortgagetype);
		bm.setBmortgagecount(bmortgagecount);
		bm.setBpaytype(bpaytype);
		bm.setBcommission(bcommission);
		bm.setBtype(btype);
		bm.setBcount(bcount);
		bm.setBinterval(binterval);
		bm.setBrate(brate);
		service.create(bm);
		//model.addAttribute("bmortgagetype", bmortgagetype);
		return "index";
	}

}
