package org.ht.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.ht.pojo.Transaction;
import org.ht.pojo.Users;
import org.ht.pojo.Wallet;
import org.ht.service.TransactionService;
import org.ht.service.UsersService;
import org.ht.service.WalletService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class WalletController {
    Logger logger = LoggerFactory.getLogger(WalletController.class);
    @Autowired
    WalletService walletService;
    @Autowired
    TransactionService transactionService;
    @Autowired
    UsersService usersService;

    @RequestMapping(value = "/getWallet", method = RequestMethod.GET)
    @ResponseBody
    public List getWallet(HttpSession session) {
        Integer userid = (Integer) session.getAttribute("uid");
        List<Wallet> list = walletService.querywallets(userid);
        return list;
    }

    @RequestMapping("/assets")
    public String getTransactions(@RequestParam(defaultValue = "1", value = "pn") Integer pn, HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            logger.info("---------------请登录！");
            return "login";
        } else {
            logger.info("---------------用户的UID为：" + user.getUid().toString());
            PageHelper.startPage(pn, 5);
            List<Transaction> list = transactionService.getAll(user.getUid());
            PageInfo<Transaction> pageInfo = new PageInfo<>(list, 5);
            model.addAttribute("txPageInfo", pageInfo);
            return "wallet";
        }
    }
}
