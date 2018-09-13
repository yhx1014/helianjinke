package org.ht.pojo;

import java.io.Serializable;

/**
 * @Name: Approveitem
 * @Description:认证项的JavaBeans
 * @author chenqingshan
 * @Date: 2017-2-20 Time: 19:58
 */
public class Approveitem implements Serializable {

	private Integer aiid;// 认证项编号
	private String ainame;// 认证项名称
	private String aitype;// 认证项类型 1.基本认证项；2.可选认证项
	private String aistate;// 认证项状态 0.已弃用；1.未弃用

	public Approveitem() {

	}

	public Approveitem(Integer aiid, String ainame, String aitype, String aistate) {

		this.aiid = aiid;
		this.ainame = ainame;
		this.aitype = aitype;
		this.aistate = aistate;
	}

	public Integer getAiid() {
		return aiid;
	}

	public void setAiid(Integer aiid) {
		this.aiid = aiid;
	}

	public String getAiname() {
		return ainame;
	}

	public void setAiname(String ainame) {
		this.ainame = ainame;
	}

	public String getAitype() {
		return aitype;
	}

	public void setAitype(String aitype) {
		this.aitype = aitype;
	}

	public String getAistate() {
		return aistate;
	}

	public void setAistate(String aistate) {
		this.aistate = aistate;
	}

	/**
	 * 
	 * @return 该对象的所有值
	 */
	public String getApproveitemInfo() {

		return "Info aiid==" + this.getAiid() + "  ainame==" + this.getAiname() + "  aitype==" + this.getAitype()
				+ "  aistate==" + this.getAistate();
	}

}
