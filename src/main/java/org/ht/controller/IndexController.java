package org.ht.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.ht.pojo.InvestInfo;
import org.ht.service.InvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private InvestService investService;

    @RequestMapping("/index")
    public String recommendShow(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        PageHelper.startPage(pn, 8);
        List<InvestInfo> list = investService.getAll();
        PageInfo<InvestInfo> page = new PageInfo<>(list, 5);
        model.addAttribute("pageInfo", page);
        return "index";
    }
}
