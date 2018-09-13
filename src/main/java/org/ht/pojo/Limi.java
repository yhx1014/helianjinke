package org.ht.pojo;

public class Limi extends BaseDomain {
	
	private Integer lid;
	private Integer eid;
	private String mid;
	public Integer getLid() {
		return lid;
	}
	public void setLid(Integer lid) {
		this.lid = lid;
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Limi(Integer lid, Integer eid, String mid) {
		super();
		this.lid = lid;
		this.eid = eid;
		this.mid = mid;
	}
	public Limi() {
		super();
	}
	

}
