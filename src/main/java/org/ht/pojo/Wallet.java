package org.ht.pojo;

import java.util.Date;

public class Wallet extends BaseDomain{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userid;
	private Double totalcount;
	private Double balance;
	private Double invest;
	private Double borrow;
	private Date type;
	private String date;
	private Date update;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Double getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(Double totalcount) {
		this.totalcount = totalcount;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public Double getInvest() {
		return invest;
	}
	public void setInvest(Double invest) {
		this.invest = invest;
	}
	public Double getBorrow() {
		return borrow;
	}
	public void setBorrow(Double borrow) {
		this.borrow = borrow;
	}
	public Date getType() {
		return type;
	}
	public void setType(Date type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Date getUpdate() {
		return update;
	}
	public void setUpdate(Date update) {
		this.update = update;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Wallet [userid=");
		builder.append(userid);
		builder.append(", totalcount=");
		builder.append(totalcount);
		builder.append(", balance=");
		builder.append(balance);
		builder.append(", invest=");
		builder.append(invest);
		builder.append(", borrow=");
		builder.append(borrow);
		builder.append(", type=");
		builder.append(type);
		builder.append(", date=");
		builder.append(date);
		builder.append(", update=");
		builder.append(update);
		builder.append("]");
		return builder.toString();
	}
}
