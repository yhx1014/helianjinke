package org.ht.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loan")
public class LoanController {
    @RequestMapping("/getLoan")
    public String getLoan(Model model) {
        return "loan";
    }
}
