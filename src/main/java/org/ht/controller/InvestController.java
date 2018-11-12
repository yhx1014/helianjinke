package org.ht.controller;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.ht.pojo.InvestInfo;
import org.ht.service.InvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InvestController {
    @Autowired
    private InvestService investService;

    @RequestMapping("/invest")
    public String investSelect(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Map<String, Object> map) {
        PageHelper.startPage(pn, 10);
        List<InvestInfo> list = investService.getAll();
        PageInfo<InvestInfo> page = new PageInfo<>(list, 5);
        map.put("pageInfo", page);
        return "investinfo";
    }

    @ResponseBody
    @RequestMapping("/getInvest")
    public PageInfo getInvest(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, Map<String, Object> map) {
        PageHelper.startPage(pn, 5);
        List<InvestInfo> list = investService.getAll();
        PageInfo<InvestInfo> pageInfo = new PageInfo<>(list, 5);
        map.put("pageInfo", pageInfo);
        return pageInfo;
    }

    @RequestMapping("/investDetail")
    public String investDetail(@RequestParam(value = "bid", defaultValue = "1") Integer bid) {
        return "infor";
    }
}
