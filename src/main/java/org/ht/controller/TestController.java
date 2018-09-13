package org.ht.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ht.pojo.Notice;
import org.ht.service.BidService;
import org.ht.service.NoticeService;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @author 周旗 2017年3月13日08:53:48 测试类
 */
@Controller
@RequestMapping("")
public class TestController {
	@Resource
	private BidService service;

	@RequestMapping("chuli")
	public String chuli(Model model) {
		service.chuli2();
		model.addAttribute("keyt", "标到期,处理成功!");
		return "test";
	}

	@RequestMapping("chuli2")
	public String chuli2(Model model) {
		service.chuli2();
		model.addAttribute("keyt", "未满标,处理成功!");

		return "test";
	}

}
