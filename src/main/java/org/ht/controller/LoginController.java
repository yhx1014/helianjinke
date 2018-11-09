package org.ht.controller;


import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.ht.pojo.InvestInfo;
import org.ht.pojo.Users;
import org.ht.service.InvestService;
import org.ht.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private UsersService usersservice;
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

    @RequestMapping("/login")
    public String toLogin(Model model, HttpSession session,
                          @RequestParam(value = "unickname", required = false) String unickname,
                          @RequestParam(value = "upassword", required = false) String upassword) {

        Users user = usersservice.byNameFindUsers(unickname, upassword);
        if (user == null) {
            model.addAttribute("status", "账号或密码有误");
            return "login";
        } else {
            model.addAttribute("users", user);
            session.setAttribute("uid",user.getUid());
            session.setAttribute("user", user);
            return "redirect:index";
        }
    }
}
