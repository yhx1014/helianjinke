package org.ht.controller;


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

    @RequestMapping("/login")
    public String toLogin(Model model, HttpSession session,
                          @RequestParam(value = "username", required = false) String username,
                          @RequestParam(value = "upassword", required = false) String upassword) {

        Users user = usersservice.byNameFindUsers(username, upassword);
        if (user == null) {
            model.addAttribute("status", "账号或密码有误");
            return "login";
        } else {
            model.addAttribute("users", user);
            session.setAttribute("uid", user.getUid());
            session.setAttribute("user", user);
            return "redirect:index";
        }
    }

    @RequestMapping("register")
    public String insert(Users users) {

        return "register";
    }
}
