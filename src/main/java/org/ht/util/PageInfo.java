package org.ht.util;

public class PageInfo {
	/*
	 * if (currpage1==null||currpage1.equals("")) { currpage1=1+""; } Integer
	 * currpage = Integer.parseInt(currpage1); if(currpage<0){ currpage=1; }
	 * Borrowmoney borrowmoney = new Borrowmoney();
	 * 
	 * borrowmoney.setBusername(buname); borrowmoney.setBstate(bstate);
	 * borrowmoney.setBtype(bname); borrowmoney.setStartPage(currpage);
	 * borrowmoney.setEndPage(currpage+5); System.out.println("buname=" + buname
	 * + "  bname=" + bname + "  bstate=" + bstate); PageInfo<Borrowmoney> page
	 * = service.findList(borrowmoney, 2, 5); List<Borrowmoney> list =
	 * page.getList(); List<Borrowmoney> paList = new ArrayList<>(); for (int i
	 * = 0; i < list.size(); i++) { Borrowmoney borrowmoney2 = new
	 * Borrowmoney(); borrowmoney2.setBlimit(list.get(i).getBlimit());
	 * borrowmoney2.setBmoney((list.get(i).getBmoney()));
	 * borrowmoney2.setBpass((list.get(i).getBpass()));
	 * borrowmoney2.setBrate((list.get(i).getBrate()));
	 * borrowmoney2.setBrecommend(list.get(i).getBrecommend());
	 * borrowmoney2.setBrelname((list.get(i).getBrelname()));
	 * borrowmoney2.setBserial((list.get(i).getBserial()));
	 * borrowmoney2.setBstate((list.get(i).getBstate()));
	 * borrowmoney2.setBtitle(((list.get(i).getBtitle())));
	 * borrowmoney2.setBtype((list.get(i).getBtype()));
	 * borrowmoney2.setBusername(list.get(i).getBusername());
	 * paList.add(borrowmoney2); } Biao biao = new Biao(); PageInfo<Biao> blist
	 * = biaoService.findList(biao, 1, 5); List<Biao> list2 = blist.getList();
	 * 
	 * List<Biao> biaolist = new ArrayList<>(); for (int i = 0; i <
	 * list2.size(); i++) { Biao biao2 = new Biao();
	 * biao2.setBname(list2.get(i).getBname()); biaolist.add(biao2); } // 标种
	 * model.addAttribute("list", biaolist); // 分页 model.addAttribute("page",
	 * paList);
	 */
}
