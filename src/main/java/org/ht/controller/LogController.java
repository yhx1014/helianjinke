package org.ht.controller;

import java.util.List;

import org.ht.pojo.Log;
import org.ht.service.LoggerService;
import org.ht.util.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/log")
public class LogController {

	
	@Autowired
	private LoggerService service;

	@RequestMapping("/list")
	public String list() {
		Log log = new Log();
		List<Log> page = service.findList(BeanUtils.toMap(log));
		System.out.println(" 222222222222      " + page);
		return "/back/test";
	}
}
