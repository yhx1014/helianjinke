package org.ht.controller;

import org.apache.http.HttpResponse;
import org.ht.pojo.Users;
import org.ht.pojo.Wallet;
import org.ht.service.UsersService;
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
    @Autowired
    UsersService usersService;

    @RequestMapping("/wallet")
    public String getWallet( HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("globaluser");
        logger.info("---------------用户的UID为：" + user.getUid().toString());
        List<Wallet> list = walletService.querywallets(user.getUid());
        String ethAddress = user.getEthaddress();
        for (Wallet w :
                list) {
            System.out.println(w);
        }
        model.addAttribute("ethAddress", ethAddress);
        model.addAttribute("walletlist", list);
        return "wallet";
    }
}
