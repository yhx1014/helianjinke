package org.ht.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Product  extends BaseDomain {
	private Integer pmoney;
	private Integer  startPage;
	private Integer pageSize;
	private Integer id;
    private String pincome;
    @DateTimeFormat(pattern="yyyy-MM-dd")  
    private Date ptime;
    private Integer ptype;
    private String pway;
    @DateTimeFormat(pattern="yyyy-MM-dd")  
    private Date pcount;
    private String progress;
    private String psaveway;
    private String prateben;
    @DateTimeFormat(pattern="yyyy-MM-dd")  
    private Date ppublishtime;
    private String pname;
    private Integer ptotalmoney;
    private String prange;
    private String puse;
    private String pstate;
    private String picture;
    private Integer pproduce;
    private String pdesc;
    private String psafe;

    private Biao biao;
    
    private Details details;
    
    
    public Details getDetails() {
		return details;
	}


	public void setDetails(Details details) {
		this.details = details;
	}


	public Biao getBiao() {
		return biao;
	}


	public void setBiao(Biao biao) {
		this.biao = biao;
	}

	private Users users;
    
    public Users getUsers() {
		return users;
	}


	public void setUsers(Users users) {
		this.users = users;
	}


	public Product (){
    	this.pmoney=0;
    	this.pproduce=0;
    	this.ptotalmoney=0;
    	this.pcount=new Date();
    	this.ppublishtime=new Date();
    	this.ptime=new Date();
    }
    
    
    public Integer getPmoney() {
		return pmoney;
	}

	public void setPmoney(Integer pmoney) {
		this.pmoney = pmoney;
	}
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

    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPincome() {
        return pincome;
    }

    public void setPincome(String pincome) {
        this.pincome = pincome == null ? null : pincome.trim();
    }

    public Date getPtime() {
    	
        return ptime;
    }

    public void setPtime(Date ptime) {
        this.ptime = ptime;
    }

    public Integer getPtype() {
        return ptype;
    }

    public void setPtype(Integer ptype) {
        this.ptype = ptype;
    }

    public String getPway() {
        return pway;
    }

    public void setPway(String pway) {
        this.pway = pway == null ? null : pway.trim();
    }

    public Date getPcount() {
        return pcount;
    }

    public void setPcount(Date pcount) {
        this.pcount = pcount;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress == null ? null : progress.trim();
    }

    public String getPsaveway() {
        return psaveway;
    }

    public void setPsaveway(String psaveway) {
        this.psaveway = psaveway == null ? null : psaveway.trim();
    }

    public String getPrateben() {
        return prateben;
    }

    public void setPrateben(String prateben) {
        this.prateben = prateben == null ? null : prateben.trim();
    }

    public Date getPpublishtime() {
        return ppublishtime;
    }

    public void setPpublishtime(Date ppublishtime) {
        this.ppublishtime = ppublishtime;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }


    public String getPrange() {
        return prange;
    }

    public Integer getPtotalmoney() {
		return ptotalmoney;
	}

	public void setPtotalmoney(Integer ptotalmoney) {
		this.ptotalmoney = ptotalmoney;
	}

	public void setPrange(String prange) {
        this.prange = prange == null ? null : prange.trim();
    }

    public String getPuse() {
        return puse;
    }

    public void setPuse(String puse) {
        this.puse = puse == null ? null : puse.trim();
    }

    public String getPstate() {
        return pstate;
    }

    public void setPstate(String pstate) {
        this.pstate = pstate == null ? null : pstate.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Integer getPproduce() {
        return pproduce;
    }

    public void setPproduce(Integer pproduce) {
        this.pproduce = pproduce;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc == null ? null : pdesc.trim();
    }

    public String getPsafe() {
        return psafe;
    }

    public void setPsafe(String psafe) {
        this.psafe = psafe == null ? null : psafe.trim();
    }
}