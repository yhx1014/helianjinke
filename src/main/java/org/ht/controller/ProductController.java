package org.ht.controller;

import javax.annotation.Resource;
import org.ht.service.DetailsService;
import org.ht.service.InvestService;
import org.ht.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("product")
public class ProductController {

	@Resource
	private DetailsService detailsService;
	@Resource
	InvestService InvestService;

	@Resource
	private ProductService service;

	@RequestMapping("delete")
	public String delete(@RequestParam("pid") String pid) {
		Integer id = Integer.parseInt(pid.toString());
		service.delete(id);
		return "redirect:/product/list.do";
	}

}
