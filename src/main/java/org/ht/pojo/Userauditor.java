package org.ht.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Userauditor implements Serializable{
	private Integer uaid;//'编号',
	private Integer userid;//'用户ID',
	private String username;//'用户名',
	private Integer uauditorid;//'审核人ID',
	private String uauditor;//'审核人姓名'

	public Userauditor() {
		
	}
	public Userauditor(Integer uaid, Integer userid, String username, Integer uauditorid, String uauditor) {
		
		this.uaid = uaid;
		this.userid = userid;
		this.username = username;
		this.uauditorid = uauditorid;
		this.uauditor = uauditor;
	}
	public Integer getuaid() {
		return uaid;
	}
	public void setuaid(Integer uaid) {
		this.uaid = uaid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getUauditorid() {
		return uauditorid;
	}
	public void setUauditorid(Integer uauditorid) {
		this.uauditorid = uauditorid;
	}
	public String getUauditor() {
		return uauditor;
	}
	public void setUauditor(String uauditor) {
		this.uauditor = uauditor;
	}
}
