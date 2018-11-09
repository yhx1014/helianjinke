package org.ht.controller;

import java.util.Enumeration;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.ht.pojo.Users;
import org.ht.service.CertificationService;
import org.ht.service.UsersService;
import org.ht.util.Msg;
import org.ht.wallet.AccountTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/users")
public class UsersController {
    @Autowired
    private UsersService usersservice;
    @Autowired
    @Resource
    private CertificationService Certificat;

    @RequestMapping(value = "updateuphone/{uid}", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateUserPhoneNumber(Users user, HttpSession session) {
        usersservice.updateByPrimaryKey(user);
        return Msg.success();
    }

    @RequestMapping(value = "umailbox/{uid}", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateUserEmail(Users user) {
        usersservice.updateByPrimaryKey(user);
        return Msg.success();
    }

    @RequestMapping("insert")
    public String insert(Users users, Model model,
                         @RequestParam(value = "unickname") String unickname,
                         @RequestParam(value = "upassword") String upassword,
                         @RequestParam(value = "uphonenumber") String uphonenumber) {
        AccountTest at = new AccountTest();
        at.createAccount();
        String accountId = "0x000";
        users.setUnickname(unickname);
        users.setUpassword(upassword);
        users.setUphonenumber(uphonenumber);
        users.setEthaddress(accountId);
        // 将数据添加到数据库
        usersservice.insert(users);
        model.addAttribute("unickname", unickname);
        return "index";
    }

    //退出start
    @RequestMapping("exit")
    public String exit(HttpSession session) {
        Enumeration<?> em = session.getAttributeNames();
        while (em.hasMoreElements()) {
            session.removeAttribute(em.nextElement().toString());
        }
        return "redirect:index";
    }

    @RequestMapping("findByName")
    @ResponseBody
    public int findByName(@RequestParam(value = "unickname", required = false) String unickname) {
        List<Users> ulist = usersservice.queryUserslimits(unickname);
        if (ulist.size() > 0) {
            return 2;
        } else {
            return 1;
        }
    }
}
