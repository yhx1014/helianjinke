package org.ht.pojo;


public class Borrowmoney  extends BaseDomain {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer buserid;
	private Integer brelname;
	private Integer bpnumber;
	private String bmailbox;
	private String bmortgagetype;
	private String bmortgagecount;
	private String bpaytype;
	private String bcommission;
	private String btype;
	private String bcount;
	private String binterval;
	private String brate;
	private Biao biao;

	public Integer getBuserid() {
		return buserid;
	}
	public void setBuserid(Integer buserid) {
		this.buserid = buserid;
	}
	public Integer getBrelname() {
		return brelname;
	}
	public void setBrelname(Integer brelname) {
		this.brelname = brelname;
	}
	public Integer getBpnumber() {
		return bpnumber;
	}
	public void setBpnumber(Integer bpnumber) {
		this.bpnumber = bpnumber;
	}
	public String getBmailbox() {
		return bmailbox;
	}
	public void setBmailbox(String bmailbox) {
		this.bmailbox = bmailbox;
	}
	public String getBmortgagetype() {
		return bmortgagetype;
	}
	public void setBmortgagetype(String bmortgagetype) {
		this.bmortgagetype = bmortgagetype;
	}
	public String getBmortgagecount() {
		return bmortgagecount;
	}
	public void setBmortgagecount(String bmortgagecount) {
		this.bmortgagecount = bmortgagecount;
	}
	public String getBpaytype() {
		return bpaytype;
	}
	public void setBpaytype(String bpaytype) {
		this.bpaytype = bpaytype;
	}
	public String getBcommission() {
		return bcommission;
	}
	public void setBcommission(String bcommission) {
		this.bcommission = bcommission;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public String getBcount() {
		return bcount;
	}
	public void setBcount(String bcount) {
		this.bcount = bcount;
	}
	public String getBinterval() {
		return binterval;
	}
	public void setBinterval(String binterval) {
		this.binterval = binterval;
	}
	public String getBrate() {
		return brate;
	}
	public void setBrate(String brate) {
		this.brate = brate;
	}
	public Biao getBiao() {
		return biao;
	}
	public void setBiao(Biao biao) {
		this.biao = biao;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Borrowmoney [id=");
		builder.append(id);
		builder.append(", buserid=");
		builder.append(buserid);
		builder.append(", brelname=");
		builder.append(brelname);
		builder.append(", bpnumber=");
		builder.append(bpnumber);
		builder.append(", bmailbox=");
		builder.append(bmailbox);
		builder.append(", bmortgagetype=");
		builder.append(bmortgagetype);
		builder.append(", bmortgagecount=");
		builder.append(bmortgagecount);
		builder.append(", bpaytype=");
		builder.append(bpaytype);
		builder.append(", bcommission=");
		builder.append(bcommission);
		builder.append(", btype=");
		builder.append(btype);
		builder.append(", bcount=");
		builder.append(bcount);
		builder.append(", binterval=");
		builder.append(binterval);
		builder.append(", brate=");
		builder.append(brate);
		builder.append(", biao=");
		builder.append(biao);
		builder.append("]");
		return builder.toString();
	}
}