package org.ht.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/assets")
@Controller
public class WalletController {
	@RequestMapping("/wallet")
	public String getWallet(Model model){
		return "wallet";
	}
}
