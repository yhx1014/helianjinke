package org.ht.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author Hjy 提现管理表
 */

public class Withdrawal  implements Serializable{
	
	private Integer wID ;
	private Integer uID ;
	private String  uname ;
	private String zname ;
	private String txnum ;
	private String txbank ;
	private String txmoney ;
	private String dzmoney ;
	private String sxf ;
	private Date txtime ;
	private Date zztime ;
	private String statu ;
	private String shwho ;
	private Date shtime ;
	private String nothing ;
	
	public Withdrawal() {
	}

	public Withdrawal(Integer wID, Integer uID, String uname, String zname, String txnum, String txbank, String txmoney,
			String dzmoney, String sxf, Date txtime, Date zztime, String statu, String shwho, Date shtime,
			String nothing) {
		this.wID = wID;
		this.uID = uID;
		this.uname = uname;
		this.zname = zname;
		this.txnum = txnum;
		this.txbank = txbank;
		this.txmoney = txmoney;
		this.dzmoney = dzmoney;
		this.sxf = sxf;
		this.txtime = txtime;
		this.zztime = zztime;
		this.statu = statu;
		this.shwho = shwho;
		this.shtime = shtime;
		this.nothing = nothing;
	}

	@Override
	public String toString() {
		return "Withdrawal [wID=" + wID + ", uID=" + uID + ", uname=" + uname + ", zname=" + zname + ", txnum=" + txnum
				+ ", txbank=" + txbank + ", txmoney=" + txmoney + ", dzmoney=" + dzmoney + ", sxf=" + sxf + ", txtime="
				+ txtime + ", zztime=" + zztime + ", statu=" + statu + ", shwho=" + shwho + ", shtime=" + shtime
				+ ", nothing=" + nothing + "]";
	}

	public Integer getwID() {
		return wID;
	}

	public void setwID(Integer wID) {
		this.wID = wID;
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

	public String getZname() {
		return zname;
	}

	public void setZname(String zname) {
		this.zname = zname;
	}

	public String getTxnum() {
		return txnum;
	}

	public void setTxnum(String txnum) {
		this.txnum = txnum;
	}

	public String getTxbank() {
		return txbank;
	}

	public void setTxbank(String txbank) {
		this.txbank = txbank;
	}

	public String getTxmoney() {
		return txmoney;
	}

	public void setTxmoney(String txmoney) {
		this.txmoney = txmoney;
	}

	public String getDzmoney() {
		return dzmoney;
	}

	public void setDzmoney(String dzmoney) {
		this.dzmoney = dzmoney;
	}

	public String getSxf() {
		return sxf;
	}

	public void setSxf(String sxf) {
		this.sxf = sxf;
	}

	public Date getTxtime() {
		return txtime;
	}

	public void setTxtime(Date txtime) {
		this.txtime = txtime;
	}

	public Date getZztime() {
		return zztime;
	}

	public void setZztime(Date zztime) {
		this.zztime = zztime;
	}

	public String getStatu() {
		return statu;
	}

	public void setStatu(String statu) {
		this.statu = statu;
	}

	public String getShwho() {
		return shwho;
	}

	public void setShwho(String shwho) {
		this.shwho = shwho;
	}

	public Date getShtime() {
		return shtime;
	}

	public void setShtime(Date shtime) {
		this.shtime = shtime;
	}

	public String getNothing() {
		return nothing;
	}

	public void setNothing(String nothing) {
		this.nothing = nothing;
	}



}
