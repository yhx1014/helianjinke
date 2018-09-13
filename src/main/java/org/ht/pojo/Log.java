package org.ht.pojo;

import java.util.Date;

public class Log extends BaseDomain {

	private Integer id;
	private String laccount;
	private String logtype;
	private String lremark;
	private Date lprocesstime;

	public Date getLprocesstime() {
		return lprocesstime;
	}

	public void setLprocesstime(Date lprocesstime) {
		this.lprocesstime = lprocesstime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLaccount() {
		return laccount;
	}

	public void setLaccount(String laccount) {
		this.laccount = laccount;
	}

	public String getLogtype() {
		return logtype;
	}

	public void setLogtype(String logtype) {
		this.logtype = logtype;
	}

	public String getLremark() {
		return lremark;
	}

	public void setLremark(String lremark) {
		this.lremark = lremark;
	}

	public Date getLprocestime() {
		return lprocestime;
	}

	public void setLprocestime(Date lprocestime) {
		this.lprocestime = lprocestime;
	}

	private Date lprocestime;

}
