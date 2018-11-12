//package org.ht.util;
//
//import java.text.DecimalFormat;
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.ht.pojo.Product;
//import org.ht.service.ProductService;
//
///**
// * 计算类
// * @author Administrator
// *
// */
//public class Compute {
//
//	@Resource
//	ProductService service;
//
//	//计算投资进度
//	public  double  CountTwo(int a,int b ){
//
//		return (double)a/b;
//	}
//
//
//	//更新投资进度
//	public void  updProgres(List<Product> product){
//
//
//		for (Product product2 : product) {
//			double money=(product2.getPmoney());//已募集总金额
//			double count=product2.getPtotalmoney(); //总投标数
//				if (money>=count) {
//					product2.setProgress(100+"");
//				}else {
//					double sum=(money/count)*100;
//					DecimalFormat df = new DecimalFormat("#.00");
//					String result=  df.format(sum);
//					System.out.println("money    "+money);
//					System.out.println("count   "+count);
//					System.out.println("sum   "+sum);
//					product2.setProgress(result+"");
//					System.out.println("result===   "+result);
//				}
//				System.out.println("id   -----  "+product2.getId());
//				System.out.println("Progress  -----  "+product2.getProgress());
//			}
//	}
//}
