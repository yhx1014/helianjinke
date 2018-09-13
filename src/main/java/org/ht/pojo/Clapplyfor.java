package org.ht.pojo;

import java.io.Serializable;
import java.util.Date;

public class Clapplyfor implements Serializable{
//	 `clpid`   '申请编号',
//	  `clpubcid`   '用户账号',
//	  `clpuname`   '用户姓名',
//	  `clpporiginal`  '原信用额',
//	  `clpidpaper`  '身份证明照片',
//	  `clphpoc`   '房产证明照片',
//	  `clpf`  '申请信用额',
//	  `clpdate`  '申请时间',
//	  `clpauditor`  '跟踪审核',
//	  `clpstate`  '状态',
	private Integer clpid;
	private String clpubcid;
	private String clpuname;
	private Double clpporiginal;
	private String clpidpaper;
	private String clphpoc;
	private Double clpf;
	private Date clpdate;
	private String clpauditor;
	private String clpstate;
	
	
	
	
	public Clapplyfor() {
		
	}
	public Clapplyfor(Integer clpid, String clpubcid, String clpuname, Double clpporiginal, String clpidpaper,
			String clphpoc, Double clpf, Date clpdate, String clpauditor, String clpstate) {
		
		this.clpid = clpid;
		this.clpubcid = clpubcid;
		this.clpuname = clpuname;
		this.clpporiginal = clpporiginal;
		this.clpidpaper = clpidpaper;
		this.clphpoc = clphpoc;
		this.clpf = clpf;
		this.clpdate = clpdate;
		this.clpauditor = clpauditor;
		this.clpstate = clpstate;
	}
	public Integer getClpid() {
		return clpid;
	}
	public void setClpid(Integer clpid) {
		this.clpid = clpid;
	}
	public String getClpubcid() {
		return clpubcid;
	}
	public void setClpubcid(String clpubcid) {
		this.clpubcid = clpubcid;
	}
	public String getClpuname() {
		return clpuname;
	}
	public void setClpuname(String clpuname) {
		this.clpuname = clpuname;
	}
	public Double getClpporiginal() {
		return clpporiginal;
	}
	public void setClpporiginal(Double clpporiginal) {
		this.clpporiginal = clpporiginal;
	}
	public String getClpidpaper() {
		return clpidpaper;
	}
	public void setClpidpaper(String clpidpaper) {
		this.clpidpaper = clpidpaper;
	}
	public String getClphpoc() {
		return clphpoc;
	}
	public void setClphpoc(String clphpoc) {
		this.clphpoc = clphpoc;
	}
	public Double getClpf() {
		return clpf;
	}
	public void setClpf(Double clpf) {
		this.clpf = clpf;
	}
	public Date getClpdate() {
		return clpdate;
	}
	public void setClpdate(Date clpdate) {
		this.clpdate = clpdate;
	}
	public String getClpauditor() {
		return clpauditor;
	}
	public void setClpauditor(String clpauditor) {
		this.clpauditor = clpauditor;
	}
	public String getClpstate() {
		return clpstate;
	}
	public void setClpstate(String clpstate) {
		this.clpstate = clpstate;
	}
	
	

}
