package org.ht.pojo;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class InvestInfo extends BaseDomain {

	private static final long serialVersionUID = 1L;

	public int getInid() {
		return inid;
	}

	public void setInid(int inid) {
		this.inid = inid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getBrrowid() {
		return brrowid;
	}

	public void setBrrowid(int brrowid) {
		this.brrowid = brrowid;
	}

	public BigDecimal getInmoney() {
		return inmoney;
	}

	public void setInmoney(BigDecimal inmoney) {
		this.inmoney = inmoney;
	}

	public String getInstatus() {
		return instatus;
	}

	public void setInstatus(String instatus) {
		this.instatus = instatus;
	}

	public String getInstyle() {
		return instyle;
	}

	public void setInstyle(String instyle) {
		this.instyle = instyle;
	}

	public String getBrrowstatus() {
		return brrowstatus;
	}

	public void setBrrowstatus(String brrowstatus) {
		this.brrowstatus = brrowstatus;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getProfitmodel() {
		return profitmodel;
	}

	public void setProfitmodel(String profitmodel) {
		this.profitmodel = profitmodel;
	}

	public BigDecimal getProfitmoney() {
		return profitmoney;
	}

	public void setProfitmoney(BigDecimal profitmoney) {
		this.profitmoney = profitmoney;
	}

	public Timestamp getIndate() {
		return indate;
	}

	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}

	public String getReplaydate() {
		return replaydate;
	}

	public void setReplaydate(String replaydate) {
		this.replaydate = replaydate;
	}

	public int getMarkstatus() {
		return markstatus;
	}

	public void setMarkstatus(int markstatus) {
		this.markstatus = markstatus;
	}

	public String toString() {
		return "InvestInfo [inid=" + inid + ", userid=" + userid + ", brrowid=" + brrowid + ", inmoney=" + inmoney
				+ ", instatus=" + instatus + ", instyle=" + instyle + ", brrowstatus=" + brrowstatus + ", interest="
				+ interest + ", profitmodel=" + profitmodel + ", profitmoney=" + profitmoney + ", indate=" + indate
				+ ", replaydate=" + replaydate + ", markstatus=" + markstatus + "]";
	}

	private int inid; // '投资信息表主键',
	private int userid; // '投资用户主键',
	private int brrowid; // '投标的主键',
	private BigDecimal inmoney; // '投资金额',
	private String instatus; // '投资状态 0 收益中的投资 1已完成的投资',
	private String instyle; // '投资类型',
	private String brrowstatus;// '借贷状态是否凑资完',
	private String interest; // '投资利率',
	private String profitmodel; // '盈利方式 如等额本金',
	private BigDecimal profitmoney; // '盈利金额',
	private Timestamp indate; // '投资时间，可为空'

	private String replaydate; //
	private int markstatus; // '投标状态 0默认投标中 1 投标通过（中标） 2投标未通过（失标）';
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private String title;
	private String type;
	private String uname;
	
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	private Integer startPage;
	private Integer pageSize;

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
}
