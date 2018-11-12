package org.ht.controller;

import javax.servlet.http.HttpSession;

import org.ht.pojo.User;
import org.ht.service.UserService;
import org.ht.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UsersController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "updateuphone/{uid}", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateUserPhoneNumber(User user, HttpSession session) {
//        userService.updateByPrimaryKey(user);
        return Msg.success();
    }

    @RequestMapping(value = "umailbox/{uid}", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateUserEmail(User user) {
//        usersservice.updateByPrimaryKey(user);
        return Msg.success();
    }

    @RequestMapping("toRegister")
    public String registerNewUser(User user) {
        userService.registerUser(user);
        return "login";
    }

    @RequestMapping("logout")
    public String userLogOut(HttpSession session) {
        session.removeAttribute("user");
        return "index";
    }
}
