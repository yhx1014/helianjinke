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

    private String formatTime;

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
        return collateralCount;
    }

    public void setCollateralCount(String collateralCount) {
        this.collateralCount = collateralCount;
    }

    public String getCollateralType() {
        return collateralType;
    }

    public void setCollateralType(String collateralType) {
        this.collateralType = collateralType;
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype;
    }

    public String getLoanterm() {
        return loanterm;
    }

    public void setLoanterm(String loanterm) {
        this.loanterm = loanterm;
    }

    public String getBorrowCount() {
        return borrowCount;
    }

    public void setBorrowCount(String borrowCount) {
        this.borrowCount = borrowCount;
    }

    public String getBorrowType() {
        return borrowType;
    }

    public void setBorrowType(String borrowType) {
        this.borrowType = borrowType;
    }

    public String getPledgeRatio() {
        return pledgeRatio;
    }

    public void setPledgeRatio(String pledgeRatio) {
        this.pledgeRatio = pledgeRatio;
    }

    public String getAnnualizedRate() {
        return annualizedRate;
    }

    public void setAnnualizedRate(String annualizedRate) {
        this.annualizedRate = annualizedRate;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getFormatTime() {
        return formatTime;
    }

    public void setFormatTime(String formatTime) {
        this.formatTime = formatTime;
    }
}