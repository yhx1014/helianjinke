package org.ht.pojo;

import java.io.Serializable;

public class Borrowmoney  extends BaseDomain {
	private Integer id;
	private Integer startPage;
	private Integer pageSize;
	private Integer bleixing;

	private String bserial;

	private String busername;

	private String brelname;

	private String bpass;

	private String btype;

	private String btitle;

	private String bmoney;

	private String brate;

	private String btimelimit;

	private String blimit;

	private String bstate;

	private String brecommend;

	private String beizhu1;
	
	private String beizhu2;
	
	
	
	private Biao biao;
	
	
	
	public Biao getBiao() {
		return biao;
	}

	public void setBiao(Biao biao) {
		this.biao = biao;
	}

	public Borrowmoney() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStartPage() {
		return startPage;
	}

	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getBleixing() {
		return bleixing;
	}

	public void setBleixing(Integer bleixing) {
		this.bleixing = bleixing;
	}

	public String getBserial() {
		return bserial;
	}

	public void setBserial(String bserial) {
		this.bserial = bserial;
	}

	public String getBusername() {
		return busername;
	}

	public void setBusername(String busername) {
		this.busername = busername;
	}

	public String getBrelname() {
		return brelname;
	}

	public void setBrelname(String brelname) {
		this.brelname = brelname;
	}

	public String getBpass() {
		return bpass;
	}

	public void setBpass(String bpass) {
		this.bpass = bpass;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBmoney() {
		return bmoney;
	}

	public void setBmoney(String bmoney) {
		this.bmoney = bmoney;
	}

	public String getBrate() {
		return brate;
	}

	public void setBrate(String brate) {
		this.brate = brate;
	}

	public String getBtimelimit() {
		return btimelimit;
	}

	public void setBtimelimit(String btimelimit) {
		this.btimelimit = btimelimit;
	}

	public String getBlimit() {
		return blimit;
	}

	public void setBlimit(String blimit) {
		this.blimit = blimit;
	}

	public String getBstate() {
		return bstate;
	}

	public void setBstate(String bstate) {
		this.bstate = bstate;
	}

	public String getBrecommend() {
		return brecommend;
	}

	public void setBrecommend(String brecommend) {
		this.brecommend = brecommend;
	}

	public String getBeizhu1() {
		return beizhu1;
	}

	public void setBeizhu1(String beizhu1) {
		this.beizhu1 = beizhu1;
	}

	public String getBeizhu2() {
		return beizhu2;
	}

	public void setBeizhu2(String beizhu2) {
		this.beizhu2 = beizhu2;
	}
	@Override
	public String toString() {
		return "Borrowmoney [id=" + id + ", startPage=" + startPage + ", pageSize=" + pageSize + ", bleixing="
				+ bleixing + ", bserial=" + bserial + ", busername=" + busername + ", brelname=" + brelname + ", bpass="
				+ bpass + ", btype=" + btype + ", btitle=" + btitle + ", bmoney=" + bmoney + ", brate=" + brate
				+ ", btimelimit=" + btimelimit + ", blimit=" + blimit + ", bstate=" + bstate + ", brecommend="
				+ brecommend + ", beizhu1=" + beizhu1 + ", beizhu2=" + beizhu2 + "]";
	}

}