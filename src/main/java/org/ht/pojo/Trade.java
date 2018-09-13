package org.ht.pojo;

import java.io.Serializable;
import java.util.Date;

public class Trade implements Serializable{
	private Integer tID ;
	private Integer uID ;
	private String uname ;
	private String zname ;
	private String jymoney;
	private String what;
	private Date jytime;
	private String other;
	
	public Trade() {
	}

	public Trade( Integer uID, String uname, String zname,
			String jymoney, String what, Date jytime, String other) {
		this.uID = uID;
		this.uname = uname;
		this.zname = zname;
		this.jymoney = jymoney;
		this.what = what;
		this.jytime = jytime;
		this.other = other;
	}

	public Integer gettID() {
		return tID;
	}

	public void settID(Integer tID) {
		this.tID = tID;
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

	public String getJymoney() {
		return jymoney;
	}

	public void setJymoney(String jymoney) {
		this.jymoney = jymoney;
	}

	public String getWhat() {
		return what;
	}

	public void setWhat(String what) {
		this.what = what;
	}

	public Date getJytime() {
		return jytime;
	}

	public void setJytime(Date jytime) {
		this.jytime = jytime;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	
	
}
