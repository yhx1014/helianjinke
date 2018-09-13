package org.ht.pojo;

public class Certification {
    private Integer id;

    private String cserial;

    private String cusername;

    private String crealname;

    private String cbalance;

    private String cfreeze;

    private String cdue;

    private String cpaid;

    private String ctotalmoney;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCserial() {
        return cserial;
    }

    public void setCserial(String cserial) {
        this.cserial = cserial == null ? null : cserial.trim();
    }

    public String getCusername() {
        return cusername;
    }

    public void setCusername(String cusername) {
        this.cusername = cusername == null ? null : cusername.trim();
    }

    public String getCrealname() {
        return crealname;
    }

    public void setCrealname(String crealname) {
        this.crealname = crealname == null ? null : crealname.trim();
    }

    public String getCbalance() {
        return cbalance;
    }

    public void setCbalance(String cbalance) {
        this.cbalance = cbalance == null ? null : cbalance.trim();
    }

    public String getCfreeze() {
        return cfreeze;
    }

    public void setCfreeze(String cfreeze) {
        this.cfreeze = cfreeze == null ? null : cfreeze.trim();
    }

    public String getCdue() {
        return cdue;
    }

    public void setCdue(String cdue) {
        this.cdue = cdue == null ? null : cdue.trim();
    }

    public String getCpaid() {
        return cpaid;
    }

    public void setCpaid(String cpaid) {
        this.cpaid = cpaid == null ? null : cpaid.trim();
    }

    public String getCtotalmoney() {
        return ctotalmoney;
    }

    public void setCtotalmoney(String ctotalmoney) {
        this.ctotalmoney = ctotalmoney == null ? null : ctotalmoney.trim();
    }
}