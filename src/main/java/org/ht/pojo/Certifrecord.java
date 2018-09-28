package org.ht.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description:认证申请记录的bean
 * @author michael
 * @Date: 2017-2-23 Time: 20:54
 */
@SuppressWarnings("serial")
public class Certifrecord implements Serializable {
	private Integer crid;//编号
	private Integer cruserid;//用户编号
	private String crusername;//用户姓名
	private Integer craiid;//认证项编号
	private String crainame;//认证项名称
	private String craitype;//认证项类型
	private String crispass;//认证项状态
	private Date crdate;//审核时间
	private String crauditor;//跟踪审核
	private Integer crintegral;//信用积分
	private String crviewpoint;//观点
	private String crimg;//证件图片
	private Date crupldate;//上传时间
	
	
	private Integer checkpend;//待审核
	
	public Certifrecord() {

	}

	
	
	public Certifrecord(Integer crid, Integer cruserid, String crusername, Integer craiid, String crainame,
			String craitype, String crispass, Date crdate, String crauditor, Integer crintegral, String crviewpoint,
			String crimg, Date crupldate) {
		
		this.crid = crid;
		this.cruserid = cruserid;
		this.crusername = crusername;
		this.craiid = craiid;
		this.crainame = crainame;
		this.craitype = craitype;
		this.crispass = crispass;
		this.crdate = crdate;
		this.crauditor = crauditor;
		this.crintegral = crintegral;
		this.crviewpoint = crviewpoint;
		this.crimg = crimg;
		this.crupldate = crupldate;
	}



	public Integer getCrid() {
		return crid;
	}

	public void setCrid(Integer crid) {
		this.crid = crid;
	}

	public Integer getCruserid() {
		return cruserid;
	}

	public void setCruserid(Integer cruserid) {
		this.cruserid = cruserid;
	}

	public String getCrusername() {
		return crusername;
	}

	public void setCrusername(String crusername) {
		this.crusername = crusername;
	}

	public Integer getCraiid() {
		return craiid;
	}

	public void setCraiid(Integer craiid) {
		this.craiid = craiid;
	}

	public String getCrainame() {
		return crainame;
	}

	public void setCrainame(String crainame) {
		this.crainame = crainame;
	}

	public String getCraitype() {
		return craitype;
	}

	public void setCraitype(String craitype) {
		this.craitype = craitype;
	}

	public String getCrispass() {
		return crispass;
	}

	public void setCrispass(String crispass) {
		this.crispass = crispass;
	}

	public Date getCrdate() {
		return crdate;
	}

	public void setCrdate(Date crdate) {
		this.crdate = crdate;
	}

	public String getCrauditor() {
		return crauditor;
	}

	public void setCrauditor(String crauditor) {
		this.crauditor = crauditor;
	}

	public Integer getCrintegral() {
		return crintegral;
	}

	public void setCrintegral(Integer crintegral) {
		this.crintegral = crintegral;
	}

	public String getCrviewpoint() {
		return crviewpoint;
	}

	public void setCrviewpoint(String crviewpoint) {
		this.crviewpoint = crviewpoint;
	}

	public String getCrimg() {
		return crimg;
	}

	public void setCrimg(String crimg) {
		this.crimg = crimg;
	}

	public Date getCrupldate() {
		return crupldate;
	}

	public void setCrupldate(Date crupldate) {
		this.crupldate = crupldate;
	}

	public Integer getCheckpend() {
		return checkpend;
	}

	public void setCheckpend(Integer checkpend) {
		this.checkpend = checkpend;
	}

}
