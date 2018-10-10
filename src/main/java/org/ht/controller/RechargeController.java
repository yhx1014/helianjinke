package org.ht.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.swing.JFileChooser;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.ht.pojo.Recharge;
import org.ht.service.RechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("rc")
public class RechargeController {
	String str = "WEB-INF/view/";
	@Autowired
	private RechargeService bs;
	@RequestMapping("putexcelr")
	public String putexcelr() throws IOException{
		
		@SuppressWarnings("resource")
		HSSFWorkbook workBook = new HSSFWorkbook();
		
		HSSFSheet sheet = workBook.createSheet("充值记录");
		HSSFRow titleRow = sheet.createRow(0);
		//标题行
		HSSFCell cell1 = titleRow.createCell(0);
		cell1.setCellValue("用户ID");
		HSSFCell cell2 = titleRow.createCell(1);
		cell2.setCellValue("用户名");
		HSSFCell cell3 = titleRow.createCell(2);
		cell3.setCellValue("真实名");
		HSSFCell cell4 = titleRow.createCell(3);
		cell4.setCellValue("充值类型");
		HSSFCell cell5 = titleRow.createCell(4);
		cell5.setCellValue("流水号");
		HSSFCell cell6 = titleRow.createCell(5);
		cell6.setCellValue("充值金额");
		HSSFCell cell7 = titleRow.createCell(6);
		cell7.setCellValue("费率");
		HSSFCell cell8 = titleRow.createCell(7);
		cell8.setCellValue("到账金额");
		HSSFCell cell9 = titleRow.createCell(8);
		cell9.setCellValue("转账时间");
		HSSFCell cell10= titleRow.createCell(9);
		cell10.setCellValue("状态");

		List<Recharge> lw = bs.selectall();
		for (int i = 0; i < lw.size(); i++) {
			Recharge wi = lw.get(i);
			// 数据行
			HSSFRow dataRow = sheet.createRow(i + 1);
			HSSFCell uid = dataRow.createCell(0);
			uid.setCellValue(wi.getuID());
			HSSFCell uname = dataRow.createCell(1);
			uname.setCellValue(wi.getUname());
			HSSFCell zname = dataRow.createCell(2);
			zname.setCellValue(wi.getZname());
			HSSFCell czlx = dataRow.createCell(3);
			czlx.setCellValue(wi.getCzlx());
			HSSFCell lsh = dataRow.createCell(4);
			lsh.setCellValue(wi.getLsh());
			HSSFCell czmoney = dataRow.createCell(5);
			czmoney.setCellValue(wi.getCzmoney());
			HSSFCell fl = dataRow.createCell(6);
			fl.setCellValue(wi.getFl());
			HSSFCell dzmoney = dataRow.createCell(7);
			dzmoney.setCellValue(wi.getDzmoney());
			HSSFCell cztime = dataRow.createCell(8);

			HSSFCellStyle dateStyle = workBook.createCellStyle();
			HSSFDataFormat dateFormat = workBook.createDataFormat();
			dateStyle
					.setDataFormat(dateFormat.getFormat("yyyy-MM-dd HH:mm:ss"));
			cztime.setCellStyle(dateStyle);

			cztime.setCellValue(wi.getCztime());
			HSSFCell statu = dataRow.createCell(9);
			statu.setCellValue(wi.getStatu());
			
		}
		
		JFileChooser chooser = new JFileChooser();
		chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		chooser.showOpenDialog(null);
		String path = chooser.getSelectedFile().getPath();	
		
		if(path!=null&&!path.equals("")){
		
			FileOutputStream fos = new FileOutputStream(
					path+"\\充值记录.xls");
			workBook.write(fos);
		}
		return "redirect:rech.do";
	}
}
