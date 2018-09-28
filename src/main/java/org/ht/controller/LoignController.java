package org.ht.controller;


import javax.annotation.Resource;
import org.ht.service.BidService;
import org.ht.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author michael 2017-2-23 10:19:37 网站消息通知控制层
 */

@Controller
@RequestMapping("log")
public class LoignController {
	@Resource
	private BidService bService;
	@Autowired
	private UsersService usersService;

	@RequestMapping("tologin")
	public String tologin(Model model) {
		Integer i = bService.tosize();
		Integer j = bService.tosizew();
		//查询所有新用户
		model.addAttribute("tos", i);
		model.addAttribute("tow", j);
		model.addAttribute("tou",  usersService.userList().size());
		model.addAttribute("tob",  bService.tosizeb());

		return "WEB-INF/view/bk_index";
	}

}
