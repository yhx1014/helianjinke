package org.ht.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFileChooser;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.ht.pojo.Withdrawal;
import org.ht.service.WithdrawalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("wd")
public class WithdrawalController {
	String str = "WEB-INF/view/";
	@Autowired
	private WithdrawalService ws;

	@SuppressWarnings("unchecked")
	@RequestMapping("wlist")
	public String withdrawallist(
			Model m,
			@RequestParam(value = "currpage", required = false) String currpage,
			@RequestParam(value = "btn", required = false) String btn,
			HttpServletRequest req,
			@RequestParam(value = "wname", required = false) String wname,
			@RequestParam(value = "yyy", required = false) String yyy,
			@RequestParam(value = "yyyy", required = false) String yyyy,
			@RequestParam(value = "wstatu", required = false) String wstatu)
			throws UnsupportedEncodingException {
		HttpSession session = req.getSession();
		session.setAttribute("btn", btn);
		
		Map<String, Object> findmap = new HashMap<String, Object>();
		findmap.put("wname", wname);
		findmap.put("yyy", yyy);
		findmap.put("yyyy", yyyy);
		findmap.put("wstatu", wstatu);
		req.setCharacterEncoding("utf-8");
		
		session.setAttribute("wname", wname);
		session.setAttribute("yyy", yyy);
		session.setAttribute("yyyy", yyyy);
		session.setAttribute("wstatu", wstatu);

		Map<String, Object> wmap = ws.withdrawallist(currpage, btn, findmap);
		List<Withdrawal> llist = (List<Withdrawal>) wmap.get("llist");
		m.addAttribute("pagerow", wmap.get("pagerow"));
		m.addAttribute("currpages", wmap.get("currpages"));
		m.addAttribute("wdlist", llist);
		m.addAttribute("totalpage", wmap.get("totalpage"));
		m.addAttribute("totalrow", wmap.get("totalrow"));
		int suntxmoney =  ws.sumtxmoney();
		m.addAttribute("suntxmoney", suntxmoney);
		int sumdzmoney =  ws.sumdzmoney();
		m.addAttribute("sumdzmoney", sumdzmoney);
		int sumsxf =  ws.sumsxf();
		m.addAttribute("sumsxf", sumsxf);
		return str + "Withdrawallist";
	}
	
	//ajax
	@RequestMapping("ajax")
	@ResponseBody
	public Withdrawal ajax(@RequestParam(value = "id", required = false) int id){
		System.out.println(id);
		System.out.println(ws.selectone(id).getUname());
		return ws.selectone(id);
	}
	
	//转账成功或失败
	@RequestMapping("zhuans")
	public String zhuan(@RequestParam(value = "gg", required = false) int gg,
			@RequestParam(value = "wid", required = false) int wid){
		Withdrawal wone =  ws.selectone(wid);
		if(gg==0){
			//失败
			ws.updwith(0, wid);
			//退钱
			
			Integer txmoney = Integer.parseInt(wone.getTxmoney());//体检金额
			Integer uid = wone.getuID();//用户id
			ws.updmoney(txmoney, uid);
			int i=1;
			//添加失败的交易记录
			ws.intmoney(wone, i);
		}else if(gg==1){
			//成功
			ws.updwith(gg, wid);
			int i=2;
			//添加交易成功记录
			ws.intmoney(wone, i);
		}
		return "redirect:wlist.do";
	}
	
	/**
	 * 导出excel
	 * @throws IOException
	 */
	@RequestMapping("putexcel")
	public String putexcel(HttpServletResponse response) throws IOException {
		@SuppressWarnings("resource")
		HSSFWorkbook workBook = new HSSFWorkbook();
		HSSFSheet sheet = workBook.createSheet("提现管理");
		HSSFRow titleRow = sheet.createRow(0);
		//标题行
		HSSFCell cell1 = titleRow.createCell(0);
		cell1.setCellValue("用户ID");
		HSSFCell cell2 = titleRow.createCell(1);
		cell2.setCellValue("用户名");
		HSSFCell cell3 = titleRow.createCell(2);
		cell3.setCellValue("真实姓名");
		HSSFCell cell4 = titleRow.createCell(3);
		cell4.setCellValue("账户");
		HSSFCell cell5 = titleRow.createCell(4);
		cell5.setCellValue("提现银行");
		HSSFCell cell6 = titleRow.createCell(5);
		cell6.setCellValue("提现金额");
		HSSFCell cell7 = titleRow.createCell(6);
		cell7.setCellValue("到账金额");
		HSSFCell cell8 = titleRow.createCell(7);
		cell8.setCellValue("手续费");
		HSSFCell cell9 = titleRow.createCell(8);
		cell9.setCellValue("提现时间");
		HSSFCell cell10 = titleRow.createCell(9);
		cell10.setCellValue("转账时间");
		HSSFCell cell11 = titleRow.createCell(10);
		cell11.setCellValue("状态0失败，1已提现,2转账中，3审核中，）");
		HSSFCell cell12 = titleRow.createCell(11);
		cell12.setCellValue("审核人");
		HSSFCell cell13 = titleRow.createCell(12);
		cell13.setCellValue("备注");

		List<Withdrawal> lw = ws.selectallw();
		for (int i = 0; i < lw.size(); i++) {
			Withdrawal wi = lw.get(i);
			// 数据行
			HSSFRow dataRow = sheet.createRow(i + 1);
			HSSFCell uid = dataRow.createCell(0);
			uid.setCellValue(wi.getuID());
			HSSFCell uname = dataRow.createCell(1);
			uname.setCellValue(wi.getUname());
			HSSFCell zname = dataRow.createCell(2);
			zname.setCellValue(wi.getZname());
			HSSFCell txnum = dataRow.createCell(3);
			txnum.setCellValue(wi.getTxnum());
			HSSFCell txbank = dataRow.createCell(4);
			txbank.setCellValue(wi.getTxbank());
			HSSFCell txmoney = dataRow.createCell(5);
			txmoney.setCellValue(wi.getTxmoney());
			HSSFCell dzmoney = dataRow.createCell(6);
			dzmoney.setCellValue(wi.getDzmoney());
			HSSFCell sxf = dataRow.createCell(7);
			sxf.setCellValue(wi.getSxf());
			HSSFCell txtime = dataRow.createCell(8);

			HSSFCellStyle dateStyle = workBook.createCellStyle();
			HSSFDataFormat dateFormat = workBook.createDataFormat();
			dateStyle.setDataFormat(dateFormat.getFormat("yyyy-MM-dd HH:mm:ss"));
			txtime.setCellStyle(dateStyle);

			txtime.setCellValue(wi.getTxtime());
			HSSFCell zztime = dataRow.createCell(9);

			zztime.setCellStyle(dateStyle);

			zztime.setCellValue(wi.getZztime());
			HSSFCell statu = dataRow.createCell(10);
			statu.setCellValue(wi.getStatu());
			HSSFCell shwho = dataRow.createCell(11);
			shwho.setCellValue(wi.getShwho());
			HSSFCell nothing = dataRow.createCell(12);
			nothing.setCellValue(wi.getNothing());
		}
		
		JFileChooser chooser = new JFileChooser();
		chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		chooser.showOpenDialog(null);
		String path = chooser.getSelectedFile().getPath();	
		
		if(path!=null&&!path.equals("")){
			FileOutputStream fos = new FileOutputStream(
					path+"\\提现信息.xls");
			workBook.write(fos);
		}
		
		return "redirect:wlist.do";
	}
}
