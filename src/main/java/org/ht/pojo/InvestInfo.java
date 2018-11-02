package org.ht.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class InvestInfo {
    private Integer id;

    private Integer borrowerId;

    private Integer lenderId;

    private String collateralCount;

    private String collateralType;

    private String paytype;

    private String loanterm;

    private String borrowCount;

    private String borrowType;

    private String pledgeRatio;

    private String annualizedRate;

    private Date createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBorrowerId() {
        return borrowerId;
    }

    public void setBorrowerId(Integer borrowerId) {
        this.borrowerId = borrowerId;
    }

    public Integer getLenderId() {
        return lenderId;
    }

    public void setLenderId(Integer lenderId) {
        this.lenderId = lenderId;
    }

    public String getCollateralCount() {
        return String.format("%.4f", Double.parseDouble(collateralCount));
    }

    public void setCollateralCount(String collateralCount) {
        this.collateralCount = collateralCount;
    }

    public String getCollateralType() {
        return collateralType;
    }

    public void setCollateralType(String collateralType) {
        this.collateralType = collateralType == null ? null : collateralType.trim();
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype == null ? null : paytype.trim();
    }

    public String getLoanterm() {
        return loanterm;
    }

    public void setLoanterm(String loanterm) {
        this.loanterm = loanterm == null ? null : loanterm.trim();
    }

    public String getBorrowCount() {
        return String.format("%.4f", Double.parseDouble(borrowCount));
    }

    public void setBorrowCount(String borrowCount) {
        this.borrowCount = borrowCount;
    }

    public String getBorrowType() {
        return borrowType;
    }

    public void setBorrowType(String borrowType) {
        this.borrowType = borrowType == null ? null : borrowType.trim();
    }

    public String getPledgeRatio() {
        return pledgeRatio;
    }

    public void setPledgeRatio(String pledgeRatio) {
        this.pledgeRatio = pledgeRatio == null ? null : pledgeRatio.trim();
    }

    public String getAnnualizedRate() {
        return annualizedRate;
    }

    public void setAnnualizedRate(String annualizedRate) {
        this.annualizedRate = annualizedRate == null ? null : annualizedRate.trim();
    }

    public String getCreatetime() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        return formatter.format(createtime).replaceAll("-", ".");
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}