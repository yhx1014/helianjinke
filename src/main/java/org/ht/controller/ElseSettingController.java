package org.ht.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ht.pojo.Biao;
import org.ht.pojo.Product;
import org.ht.pojo.Users;
import org.ht.service.BiaoService;
import org.ht.service.ProductService;
import org.ht.service.UsersService;
import org.ht.util.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("elseset")
public class ElseSettingController {
	private String str = "WEB-INF/view/";
	
	@Autowired
	private ProductService productService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private BiaoService biaoService;
	@RequestMapping("productAll")
	public String productAll(Model model, @RequestParam(value = "currpage", required = false) String currpage) {
	
		int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数

		Product product = new Product();
		Biao biao = new Biao();
		List<Product> list = productService.findList(BeanUtils.toMap(product));

		totalrow = list.size();// 获取总行数
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
		Integer startPage = (currpages - 1) * pagerow;
		product.setStartPage(startPage);
		product.setPageSize(5);
		List<Product> list2 = productService.findList(BeanUtils.toMap(product));
		List<Biao> biaos = biaoService.findList(BeanUtils.toMap(biao));
		productService.updateProgres(list2);
		List<Users> users = usersService.userList();
		model.addAttribute("users", users);
		model.addAttribute("biaos", biaos);
		model.addAttribute("list", list2);
		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);
		
		return str + "updatedeadlines";
	}
	@RequestMapping("updateProduct")
	@ResponseBody
	public String updateProduct(Integer id,String pincome, String ptime,String pcount){
		String code = "200";
		//System.out.println("项目id=="+id+">>>> 利率pincome=="+pincome+">>>> 筹款结束时间ptime=="+ptime+">>>> 还款时间pcount=="+pcount);
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		   Date date1 = null;
		   Date date2 = null;
		   try {
		    date1 = format.parse(ptime);
		    date2 = format.parse(pcount);
		   } catch (ParseException e) {
		    e.printStackTrace();
		   }
		   Product p = new Product();
		   p.setId(id);
		   p.setPincome(pincome);
		   p.setPtime(date1);
		   p.setPcount(date2);
		  int updatecode =  productService.setRateAndDeadline(p);
		  if(updatecode<=0){
			  code="400";
		  }
		return code;
	}
	
}
