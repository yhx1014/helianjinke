package org.ht.controller;

import org.ht.pojo.InvestInfo;
import org.ht.service.InvestService;
import org.ht.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoanController {

    @Autowired
    InvestService investService;

    @RequestMapping("/loan")
    public String getLoan(Model model) {
        return "loan";
    }

    @RequestMapping(value = "/toloan", method = RequestMethod.POST)
    @ResponseBody
    public Msg addLoan(InvestInfo investInfo, Model model, HttpSession session) {
        investInfo.setBorrowerId((Integer) session.getAttribute("uid"));
        investService.createInvest(investInfo);
        return Msg.success();
    }
}
