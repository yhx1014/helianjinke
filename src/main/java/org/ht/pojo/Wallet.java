package org.ht.pojo;

import java.sql.Timestamp;
import java.util.Date;


public class Wallet extends BaseDomain {

    private static final long serialVersionUID = 1L;
    private Integer userid;
    private String type;
    private String address;
    private String totalcount;
    private Double balance;
    private Double invest;
    private Double borrow;
    //	private Timestamp type;
    private String date;
//	private Timestamp update;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTotalcount() {
        return totalcount;
    }

    public void setTotalcount(String totalcount) {
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

    //	public Date getType() {
//		return type;
//	}
//	public void setType(Timestamp type) {
//		this.type = type;
//	}
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    //	public Date getUpdate() {
//		return update;
//	}
//	public void setUpdate(Timestamp update) {
//		this.update = update;
//	}
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
        builder.append(", address=");
        builder.append(address);
        builder.append(", date=");
        builder.append(date);
        builder.append(", update=");
//		builder.append(update);
        builder.append("]");
        return builder.toString();
    }
}
