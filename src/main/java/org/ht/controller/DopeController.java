package org.ht.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ht.pojo.Dope;
import org.ht.service.DopeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DopeController {
	@Autowired
	private DopeService service;
	//分页查询
	@RequestMapping("queryDope")
	public String queryDope(Model model,@RequestParam(value="currpage",required=false)String conent){
		int pagecount = 10;//每页显示行数
		int currpage = 1;//当前行数
		int totalPage = 0;//总页数
		int totalRow = 0;//总行数
		//获取总行数
		totalRow=service.total().size();
		//分页
		totalPage = (totalRow + pagecount - 1) / pagecount;
		if(conent!=null&&!"".equals(conent)){
			currpage=Integer.parseInt(conent);
		}
		if(currpage<1){
			currpage=1;
		}
		if(currpage>totalPage){
			currpage=totalPage;
		}
		Integer candp = (currpage - 1) * pagecount;
		Map<String, Object> map=new HashMap<>();
		map.put("pagecount", pagecount);
		map.put("currpage", candp);
		List<Dope> list=service.findDope(map);
		model.addAttribute("list", list);
		model.addAttribute("pagecount",pagecount);
		model.addAttribute("currpage",currpage);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("totalRow",totalRow);
		return "messages";
	}
	
	//批量删除
	@RequestMapping(value = "/batchDeletes", method = RequestMethod.POST)
	public String batchDeletes(@RequestParam(value="delitems",required=false)String items){
		System.out.println("传来的id:"+items);
		String[] item=items.split(",");
		List<Object> list=new ArrayList<>();
		for (int i = 0; i < item.length; i++) {
			list.add(item[i]);
		}
		for (int i = 0; i < list.size(); i++) {
			
			service.batchDeletes(Integer.parseInt((String) list.get(i)));
		}	
		return "redirect:/queryDope.do";
	}
}
