package org.ht.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ht.pojo.Notice;
import org.ht.service.NoticeService;
import org.ht.service.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("notice")
public class NoticeController {
    @Resource
    private NoticeService noticeService;
    @Resource
    private UsersService uService;

    @RequestMapping("banner")
    public String noticetop5(HttpServletRequest request) {
        jiazai(request);
        return "redirect:/invest/recommendShow.do";
    }

    // 重新加载top5
    private void jiazai(HttpServletRequest request) {

        List<Notice> list = noticeService.noticetop5();
        List<Notice> listss = noticeService.noticetop5sy();
        ServletContext context = request.getSession().getServletContext();
        context.setAttribute("listss", list);
        context.setAttribute("sy", listss);
        context.setAttribute("size", uService.userList().size());
    }

    @RequestMapping("nottop")
    public String nottop(HttpServletRequest request, @RequestParam(value = "ids") Integer ids, @RequestParam(value = "isd") Integer isd) {
        noticeService.noticshiji(ids);
        jiazai(request);

        if (6 == isd) {
            return "redirect:toaddlisttupian.do?ids=6";
        }
        return "redirect:notlists.do?ids=" + isd;
    }

    // 前台(list页面)
    @RequestMapping("notlist")
    public String notlist(Model model,
                          @RequestParam(value = "ids", required = false) String ids) {
        model.addAttribute("list", noticeService.noticelist(ids));
        model.addAttribute("idss", ids + "");
        if ("3".equals(ids)) {
            return "informgltd";
        } else if ("4".equals(ids)) {
            return "informhzhb";
        } else if ("5".equals(ids)) {
            return "informtdfc";
        }
        return "inform";
    }

    // 查询单条详情
    @RequestMapping("notget")
    public String notget(Model model, @RequestParam(value = "ids") Integer ids) {
        model.addAttribute("notice", noticeService.noticeget(ids));
        return "informsel";
    }

    @RequestMapping("notdel")
    public String notdel(HttpServletRequest request, @RequestParam(value = "ids") Integer ids, @RequestParam(value = "isd") Integer isd) {
        noticeService.noticedel(ids);
        jiazai(request);

        if (6 == isd) {
            return "redirect:toaddlisttupian.do?ids=6";
        }
        return "redirect:notlists.do?ids=" + isd;
    }

    @RequestMapping("noticeupds")
    public String noticeupds(@RequestParam(value = "ids") Integer ids,
                             Model model) {
        Notice notice = noticeService.noticeget(ids);
        model.addAttribute("not", notice);
        return "WEB-INF/view/noticeupdate";
    }

    @RequestMapping("notupd")
    public String notupd(HttpServletRequest request,
                         HttpServletResponse response,
                         @RequestParam(value = "ufile", required = true) MultipartFile file,
                         Model model, Notice notice) {

        if (file.getSize() != 0) {
            String path = request.getSession().getServletContext().getRealPath("file");// 获得上传的路径
            String fileName = file.getOriginalFilename();// 获得上传的文件名
            File targetFile = new File(path, fileName);// 创建上传到服务器的文件对象
            try {
                file.transferTo(targetFile);// 文件转储
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            String imgUrl = request.getContextPath() + "/file/" + fileName;
            notice.setNoticepicture(imgUrl);

        }
        noticeService.noticeupds(notice);
        jiazai(request);

        if ("6".equals(notice.getNoticetype())) {
            return "redirect:toaddlisttupian.do?ids=" + notice.getNoticetype();
        }
        return "redirect:notlists.do?ids=" + notice.getNoticetype();
    }

    // 去修改
    @RequestMapping("sgetno")
    public String getno(Model model, Integer ids) {
        Notice notice = noticeService.noticeget(ids);
        model.addAttribute("nots", notice);
        return "WEB-INF/view/noticeupdate";
    }

    @SuppressWarnings("unused")
    private void notgets(Model model, Integer ids) {
        Notice notice = noticeService.noticeget(ids);
        model.addAttribute("nots", notice);
    }

}
