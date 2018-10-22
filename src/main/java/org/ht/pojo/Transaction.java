package org.ht.pojo;

public class Transaction extends BaseDomain{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8708035058942996717L;
	private String userid;
	private String cointype;
	private String fromaddress;
	private String toaddress;
	private String type;
	private String count;
	private String date;
	private String update;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCointype() {
		return cointype;
	}
	public void setCointype(String cointype) {
		this.cointype = cointype;
	}
	public String getFromaddress() {
		return fromaddress;
	}
	public void setFromaddress(String fromaddress) {
		this.fromaddress = fromaddress;
	}
	public String getToaddress() {
		return toaddress;
	}
	public void setToaddress(String toaddress) {
		this.toaddress = toaddress;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUpdate() {
		return update;
	}
	public void setUpdate(String update) {
		this.update = update;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Transaction [userid=");
		builder.append(userid);
		builder.append(", cointype=");
		builder.append(cointype);
		builder.append(", fromaddress=");
		builder.append(fromaddress);
		builder.append(", toaddress=");
		builder.append(toaddress);
		builder.append(", type=");
		builder.append(type);
		builder.append(", count=");
		builder.append(count);
		builder.append(", date=");
		builder.append(date);
		builder.append(", update=");
		builder.append(update);
		builder.append("]");
		return builder.toString();
	}
}
