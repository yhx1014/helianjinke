package org.ht.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.ht.pojo.Biao;
import org.ht.pojo.Borrowmoney;
import org.ht.pojo.InvestInfo;
import org.ht.pojo.Product;
import org.ht.service.BiaoService;
import org.ht.service.InvestService;
import org.ht.service.ProductService;
import org.ht.util.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InvestController {
    @Autowired
    private InvestService investService;
    @Resource
    private ProductService proS;
    @Resource
    private BiaoService biaoS;
    HttpSession hs = null;

    @RequestMapping("/invest")
    public String investSelect(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Map<String, Object> map) {
        PageHelper.startPage(pn, 10);
        List<InvestInfo> list = investService.getAll();
        PageInfo<InvestInfo> page = new PageInfo<>(list, 5);
        map.put("pageInfo", page);
        return "investinfo";
    }

    @ResponseBody
    @RequestMapping("/getInvest")
    public PageInfo getInvest(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, Map<String, Object> map) {
        PageHelper.startPage(pn, 5);
        List<InvestInfo> list = investService.getAll();
        PageInfo<InvestInfo> pageInfo = new PageInfo<>(list, 5);
        map.put("pageInfo", pageInfo);
        return pageInfo;
    }

    @RequestMapping("/investDetail")
    public String investDetail(@RequestParam(value = "bid", defaultValue = "1") Integer bid) {
        return "infor";
    }

//    @RequestMapping("investSel")
//    public String investSel(HttpServletRequest req, Model model, String item, String param, String currpage) {
//        int pagerow = 5;
//        //每页5行
//        int currpages = 1;
//        //当前页
//        int totalpage = 0;
//        //总页数
//        int totalrow = 0;
//        //总行数
//        int outcount = 0;
//        //不够一页的数据条数
//        int count = 0;
//        if (item != null && !item.equals("")) {
//            Map<String, Object> map = new HashMap<String, Object>();
//            if (hs == null) {
//                hs = req.getSession();
//            }
//            if (item.equals("itemtype")) {
//                // 项目类型
//                if (param.equals("-1")) {
//                    // 不限
//                    if (hs.getAttribute("biaoId") != null) {
//                        hs.removeAttribute("biaoId");
//                    }
//                } else {
//                    hs.setAttribute("biaoId", param);
//                }
//            }
//
//            if (item.equals("rate")) {
//                // 利率
//                if (param.equals("-1")) {
//                    // 不限
//                    if (hs.getAttribute("pincome") != null) {
//                        hs.setAttribute("startR", "-1");
//                        hs.removeAttribute("pincome");
//                    }
//                }
//                if (param.equals("1")) {
//                    // 12%以下
//                    hs.setAttribute("startR", "0");
//                    hs.setAttribute("endR", "12");
//                    hs.setAttribute("pincome", "");
//                }
//                if (param.equals("2")) {
//                    // 12%-14%
//                    hs.setAttribute("startR", "12");
//                    hs.setAttribute("endR", "14");
//                    hs.setAttribute("pincome", "");
//                }
//                if (param.equals("3")) {
//                    //14%-16%
//                    hs.setAttribute("startR", "14");
//                    hs.setAttribute("endR", "16");
//                    hs.setAttribute("pincome", "");
//                }
//                if (param.equals("4")) {
//                    // 16%及以上
//                    hs.setAttribute("startR", "16");
//                    hs.setAttribute("pincome", "");
//                    hs.setAttribute("endR", "");
//                }
//            }
//
//            if (item.equals("timelimit")) {
//                // 期限 此处默认一个月为30天
//                if (param.equals("-1")) {// 不限
//                    if (hs.getAttribute("pcount") != null) {
//                        hs.setAttribute("startT", "-1");
//                        hs.removeAttribute("pcount");
//                    }
//                }
//
//                if (param.equals("1")) {// 1月以下
//                    hs.setAttribute("startT", "0");
//                    hs.setAttribute("endT", "30");
//                    hs.setAttribute("pcount", "");
//                }
//                if (param.equals("2")) {// 1-3月
//                    hs.setAttribute("startT", "30");
//                    hs.setAttribute("endT", "90");
//                    hs.setAttribute("pcount", "");
//                }
//                if (param.equals("3")) {// 3-6月
//                    hs.setAttribute("startT", "90");
//                    hs.setAttribute("endT", "180");
//                    hs.setAttribute("pcount", "");
//                }
//                if (param.equals("4")) {// 6-12月
//                    hs.setAttribute("startT", "180");
//                    hs.setAttribute("endT", "360");
//                    hs.setAttribute("pcount", "");
//                }
//                if (param.equals("5")) {// 12月及以上
//                    hs.setAttribute("startT", "360");
//                    hs.setAttribute("endT", "");
//                    hs.setAttribute("pcount", "");
//                }
//            }
//
//            List<Borrowmoney> page = proS.selList(map);
//            totalrow = page.size();
//            // 获取总行数
//            if (currpage != null && !"".equals(currpage)) {
//                currpages = Integer.parseInt(currpage);
//            }
//
//            outcount = totalrow % pagerow;
//            count = totalrow / pagerow;
//
//            totalpage = count;
//
//            if (outcount > 0) {
//                totalpage = count + 1;
//            }
//
//            if (currpages < 1) {
//                currpages = 1;
//            }
//            if (currpages > totalpage) {
//                currpages = totalpage;
//            }
//
//            if (currpages == 0) {
//                currpages = 1;
//            }
//
//            Integer candp = (currpages - 1) * pagerow;
//            map.put("startPage", candp);
//            map.put("pageSize", 5);
//            List<Borrowmoney> pages = proS.selList(map);
//            model.addAttribute("totalrow", totalrow);
//            model.addAttribute("currpages", currpages);
//            model.addAttribute("totalpage", totalpage);
//            model.addAttribute("list", pages);
//        } else {
//            Product pro = new Product();
//            List<Product> page = proS.findList(BeanUtils.toMap(pro));
//            totalrow = page.size();
//            // 获取总行数
//            if (currpage != null && !"".equals(currpage)) {
//                currpages = Integer.parseInt(currpage);
//            }
//            outcount = totalrow % pagerow;
//            count = totalrow / pagerow;
//            totalpage = count;
//            if (outcount > 0) {
//                totalpage = count + 1;
//            }
//            if (currpages < 1) {
//                currpages = 1;
//            }
//            if (currpages > totalpage) {
//                currpages = totalpage;
//            }
//            if (currpages == 0) {
//                currpages = 1;
//            }
//            Integer candp = (currpages - 1) * pagerow;
//            pro.setStartPage(candp);
//            pro.setPageSize(5);
//            List<Product> list = proS.findList(BeanUtils.toMap(pro));
//            model.addAttribute("totalrow", totalrow);
//            model.addAttribute("currpages", currpages);
//            model.addAttribute("totalpage", totalpage);
//            model.addAttribute("list", list);
//        }
//        Map<String, Object> map = new HashMap<String, Object>();
//        List<Biao> biao = biaoS.findList(map);
//        model.addAttribute("biao", biao);
//        return "investinfo";
//    }

//    public static void main(String s[]) {
//        Date date = new Date();
//        long dl = date.getTime();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date d = new Date();
//        try {
//            d = sdf.parse("2017-03-05 20:27:00");
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        long dt = d.getTime();
//        long day = (dt - dl) / (24 * 60 * 60 * 1000);
//        System.out.println(day + "天");
//    }
}
