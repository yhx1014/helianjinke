package org.ht.pojo;

import java.util.Date;

public class Notice {
	// noticeid int(11) NOT NULL AUTO_INCREMENT COMMENT '公告表id',
	// noticetitle varchar(255) DEFAULT NULL COMMENT '公告表标题',
	// noticetype varchar(255) DEFAULT NULL COMMENT '公告类型',
	// noticepicture varchar(255) DEFAULT NULL COMMENT '公告图片',
	// noticecontent varchar(255) DEFAULT NULL COMMENT '公告内容',
	// noticelasttime datetime DEFAULT NULL COMMENT '公告最后修改时间,发布时间',
	// noticelastmodifier int(11) DEFAULT NULL COMMENT '公告最后发布人,操作人.',

	private int noticeid;
	private String noticetitle;
	private String noticetype;
	private String noticepicture;
	private String noticecontent;
	private Date noticelasttime;
	private int noticelastmodifier;

	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int noticeid, String noticetitle, String noticetype, String noticepicture, String noticecontent,
			Date noticelasttime, int noticelastmodifier) {
		super();
		this.noticeid = noticeid;
		this.noticetitle = noticetitle;
		this.noticetype = noticetype;
		this.noticepicture = noticepicture;
		this.noticecontent = noticecontent;
		this.noticelasttime = noticelasttime;
		this.noticelastmodifier = noticelastmodifier;
	}

	public int getNoticeid() {
		return noticeid;
	}

	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getNoticetype() {
		return noticetype;
	}

	public void setNoticetype(String noticetype) {
		this.noticetype = noticetype;
	}

	public String getNoticepicture() {
		return noticepicture;
	}

	public void setNoticepicture(String noticepicture) {
		this.noticepicture = noticepicture;
	}

	public String getNoticecontent() {
		return noticecontent;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	public Date getNoticelasttime() {
		return noticelasttime;
	}

	public void setNoticelasttime(Date noticelasttime) {
		this.noticelasttime = noticelasttime;
	}

	public int getNoticelastmodifier() {
		return noticelastmodifier;
	}

	public void setNoticelastmodifier(int noticelastmodifier) {
		this.noticelastmodifier = noticelastmodifier;
	}

}
