package org.ht.pojo;

import java.io.Serializable;
import java.util.Date;

public class Recharge implements Serializable{
	private Integer rID ;
	private Integer uID ;
	private String uname ;
	private String czlx ;
	private String lsh ;
	private String czmoney ;
	private String fl ;
	private String dzmoney ;
	private Date cztime ;
	private String statu ;
	private String zname;
	
	public Recharge() {
	}


	public Recharge(Integer rID, Integer uID, String uname, String czlx,
			String lsh, String czmoney, String fl, String dzmoney,
			Date cztime, String statu,String zname) {
		this.rID = rID;
		this.uID = uID;
		this.uname = uname;
		this.czlx = czlx;
		this.lsh = lsh;
		this.czmoney = czmoney;
		this.fl = fl;
		this.dzmoney = dzmoney;
		this.cztime = cztime;
		this.statu = statu;
		this.zname = zname;
	}


	public String getZname() {
		return zname;
	}


	public void setZname(String zname) {
		this.zname = zname;
	}


	public Integer getrID() {
		return rID;
	}


	public void setrID(Integer rID) {
		this.rID = rID;
	}


	public Integer getuID() {
		return uID;
	}


	public void setuID(Integer uID) {
		this.uID = uID;
	}


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}


	public String getCzlx() {
		return czlx;
	}


	public void setCzlx(String czlx) {
		this.czlx = czlx;
	}


	public String getLsh() {
		return lsh;
	}


	public void setLsh(String lsh) {
		this.lsh = lsh;
	}


	public String getCzmoney() {
		return czmoney;
	}


	public void setCzmoney(String czmoney) {
		this.czmoney = czmoney;
	}


	public String getFl() {
		return fl;
	}


	public void setFl(String fl) {
		this.fl = fl;
	}


	public String getDzmoney() {
		return dzmoney;
	}


	public void setDzmoney(String dzmoney) {
		this.dzmoney = dzmoney;
	}


	public Date getCztime() {
		return cztime;
	}


	public void setCztime(Date cztime) {
		this.cztime = cztime;
	}


	public String getStatu() {
		return statu;
	}


	public void setStatu(String statu) {
		this.statu = statu;
	}
	
}
