package org.ht.controller;

import org.ht.pojo.Users;
import org.ht.pojo.Wallet;
import org.ht.service.WalletService;
import org.ht.util.Msg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/assets")
@Controller
public class WalletController {
    Logger logger = LoggerFactory.getLogger(WalletController.class);
    @Autowired
    WalletService walletService;

    @RequestMapping("/wallet")
    public String getWallet(HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("globaluser");
        logger.info("---------------用户的UID为：" +user.getUid().toString());
        List<Wallet> list = walletService.querywallets(user.getUid());
        model.addAttribute("walletlist", list);
        return "wallet";
    }
}
