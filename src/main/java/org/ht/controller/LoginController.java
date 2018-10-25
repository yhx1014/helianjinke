package org.ht.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ht.pojo.Users;
import org.ht.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @Autowired
    private UsersService usersservice;
    @RequestMapping("/index")
    public String toindex(HttpServletRequest request, HttpServletResponse response, Model model) {
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
            session.setAttribute("globaluser", user);
            return "index";
        }
    }
}
