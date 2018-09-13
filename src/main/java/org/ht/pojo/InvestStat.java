package org.ht.pojo;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class InvestStat extends BaseDomain {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	public int getIsid() {
		return isid;
	}

	public void setIsid(int isid) {
		this.isid = isid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getMarkcount() {
		return markcount;
	}

	public void setMarkcount(int markcount) {
		this.markcount = markcount;
	}

	public int getLmcount() {
		return lmcount;
	}

	public void setLmcount(int lmcount) {
		this.lmcount = lmcount;
	}

	public int getGmcount() {
		return gmcount;
	}

	public void setGmcount(int gmcount) {
		this.gmcount = gmcount;
	}

	public BigDecimal getMarkmoney() {
		return markmoney;
	}

	public void setMarkmoney(BigDecimal markmoney) {
		this.markmoney = markmoney;
	}

	public BigDecimal getMarkgain() {
		return markgain;
	}

	public void setMarkgain(BigDecimal markgain) {
		this.markgain = markgain;
	}

	public Timestamp getMarkbegindate() {
		return markbegindate;
	}

	public void setMarkbegindate(Timestamp markbegindate) {
		this.markbegindate = markbegindate;
	}

	public Timestamp getMarkenddate() {
		return markenddate;
	}

	public void setMarkenddate(Timestamp markenddate) {
		this.markenddate = markenddate;
	}

	private int isid;// '投资信息统计表主键',
	private int userid;// '投资用户主键',
	private int markcount;// '总投标数',
	private int lmcount;// '失标总数',
	private int gmcount;// '中标总数',
	private BigDecimal markmoney;// '投资总金额',
	private BigDecimal markgain;// '投资总收益',
	private Timestamp markbegindate;// '投资起始时间点',
	private Timestamp markenddate;// '投资结束时间点'

	@Override
	public String toString() {
		return "InvestStat [isid=" + isid + ", userid=" + userid + ", markcount=" + markcount + ", lmcount=" + lmcount
				+ ", gmcount=" + gmcount + ", markmoney=" + markmoney + ", markgain=" + markgain + ", markbegindate="
				+ markbegindate + ", markenddate=" + markenddate + "]";
	}

}
