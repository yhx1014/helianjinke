package org.ht.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrdersController {

    @RequestMapping("/orders")
    public String myOrders(@RequestParam(defaultValue = "1", value = "pn") Integer pn, Model model) {
        PageHelper.startPage(pn, 5);
        PageInfo pageInfo = new PageInfo();
        model.addAttribute("pageInfo", pageInfo);
        return "investdetail";
    }
}
