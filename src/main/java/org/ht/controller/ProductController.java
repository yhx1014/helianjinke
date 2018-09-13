package org.ht.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ht.pojo.Biao;
import org.ht.pojo.Details;
import org.ht.pojo.InvestInfo;
import org.ht.pojo.Product;
import org.ht.pojo.Users;
import org.ht.service.BiaoService;
import org.ht.service.DetailsService;
import org.ht.service.InvestService;
import org.ht.service.ProductService;
import org.ht.service.UsersService;
import org.ht.util.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("product")
public class ProductController {

	static final String str = "WEB-INF/view/";
	@Autowired
	private UsersService usersservice;
	@Autowired
	private BiaoService biaoService;

	@Resource
	private DetailsService detailsService;
	@Resource
	InvestService InvestService;

	@Resource
	private ProductService service;

	@RequestMapping("input")
	public String addpro(Model model, Product params) {
		Product product;
		if (params.getId() == null) {
			product = new Product();
		} else {
			product = service.get(params.getId());
		}
		model.addAttribute("domain", product);
		List<Biao> list3 = biaoService.findList(BeanUtils.toMap(new Biao()));
		model.addAttribute("blist", list3);
		return str + "bk_input_pro";
	}

	@RequestMapping("list")
	public String list(Model model, @RequestParam(value = "currpage", required = false) String currpage,
			@RequestParam(value = "status", required = false) String status) {
		int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		Product product = new Product();
		List<Product> list = service.findList(BeanUtils.toMap(product));
		totalrow = list.size();// 获取总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		totalpage = (totalrow + pagerow - 1) / pagerow;
		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			if (totalpage < 1) {
				totalpage = 1;
			}
			currpages = totalpage;
		}
		Integer startPage = (currpages - 1) * pagerow;
		product.setStartPage(startPage);
		product.setPageSize(pagerow);
		if (status != null && status.equals("ing")) {
			product.setPstate("1");
		}
		if (status != null && status.equals("over")) {
			product.setPstate("2");
		}

		List<Product> list2 = service.findList(BeanUtils.toMap(product));
		// 更新进度
		service.updateProgres(list2);
		// 更新状态
		service.updateStatus(list2);
		model.addAttribute("list", list2);

		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);

		return str + "bk_list_pro";
	}

	@RequestMapping("biaolist")
	public String biaolist(Model model, @RequestParam(value = "currpage", required = false) String currpage,
			@RequestParam(value = "bid", required = true) String bid) {
		int pagerow = 5;// 每页5行
		int currpages = 1;// 当前页
		int totalpage = 0;// 总页数
		int totalrow = 0;// 总行数
		InvestInfo ii = new InvestInfo();
		ii.setBrrowid(Integer.parseInt(bid));
		List<InvestInfo> list = InvestService.getDtail(BeanUtils.toMap(ii));
		List<Users> ulist = usersservice.userList();
		totalrow = list.size();// 获取总行数
		if (currpage != null && !"".equals(currpage)) {
			currpages = Integer.parseInt(currpage);
		}
		totalpage = (totalrow + pagerow - 1) / pagerow;
		if (currpages < 1) {
			currpages = 1;
		}
		if (currpages > totalpage) {
			if (totalpage < 1) {
				totalpage = 1;
			}
			currpages = totalpage;
		}
		Integer startPage = (currpages - 1) * pagerow;
		ii.setStartPage(startPage);
		ii.setPageSize(pagerow);

		List<InvestInfo> list2 = InvestService.getDtail(BeanUtils.toMap(ii));
		System.out.println(list2.size());
		// 更新进度
		// service.updateProgres(list2);
		// 更新状态
		// service.updateStatus(list2);
		model.addAttribute("us", ulist);
		model.addAttribute("bid", bid);
		model.addAttribute("list", list2);
		model.addAttribute("totalrow", totalrow);
		model.addAttribute("currpages", currpages);
		model.addAttribute("totalpage", totalpage);

		return str + "bk_list_biaos";
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Product product,
			@RequestParam(value = "pictures", required = false) MultipartFile multipartFile, Model model) {
		if (product.getPpublishtime() == null || product.getPpublishtime().equals("")) {
			product.setPpublishtime(new Date());
		}
		if (product.getPcount() == null || product.getPcount().equals("")) {
			product.setPcount(new Date());
		}
		if (product.getPtime() == null || product.getPtime().equals("")) {
			product.setPtime(new Date());
		}
		String fileName = multipartFile.getOriginalFilename();
		// 获取文件夹路径
		String Path = request.getSession().getServletContext().getRealPath("cover");// 获得上传的路径
		File file = new File(Path, fileName);

		try {
			multipartFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 设置文件保存路径
		String imgUrl = request.getContextPath() + "/cover/" + fileName;
		product.setPicture(imgUrl);
		if (product.getId() == null) {
			service.create(product);
			int id = product.getId();

			System.out.println("id==   " + id);
			request.setAttribute("id", id);
		} else {
			service.update(product);
		}
		model.addAttribute("domain", product);

		return str + "bk_input_detail";
	}
	// 添加详情
	@RequestMapping("todetail")
	public String todetail(Model model, HttpSession session, Product product) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		
		if (product.getPtype() == null || product.getPtype().equals("")
				|| product.getPtype().equals("请选择")) {

			product.setPtype(null);
		}
		Details details = product.getDetails();
		details.setPid(product.getId());
		Details details2=new Details();
		
		//把对象拷贝到新的对象
		org.springframework.beans.BeanUtils.copyProperties(details, details2);
		detailsService.create(details2);
		model.addAttribute("domain", product);
		return str + "bk_input_detail";
	}

	@RequestMapping("delete")
	public String delete(@RequestParam("pid") String pid) {
		Integer id = Integer.parseInt(pid.toString());
		service.delete(id);
		return "redirect:/product/list.do";
	}

	@RequestMapping("detail")
	public String detail(Model model, @RequestParam(value = "pid", required = true) String id) {
		InvestInfo info = new InvestInfo();
		info.setBrrowid(Integer.parseInt(id));
		List<InvestInfo> list = InvestService.getDtail(BeanUtils.toMap(info));
		model.addAttribute("list", list);
		return str + "bk_pro_detail";
	}

}
