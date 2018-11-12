package org.ht.controller;


import javax.servlet.http.HttpSession;

import org.ht.pojo.User;
import org.ht.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String toLogin(Model model, HttpSession session,
                          @RequestParam(value = "username", required = false) String username,
                          @RequestParam(value = "upassword", required = false) String upassword) {
        User user = userService.userLogin(username, upassword);
        if (user == null) {
            model.addAttribute("status", "账号或密码有误");
            return "login";
        } else {
            model.addAttribute("users", user);
            session.setAttribute("uid", user.getUsername());
            session.setAttribute("user", user);
            return "redirect:index";
        }
    }

    @RequestMapping("register")
    public String insert(User users) {

        return "register";
    }
}
