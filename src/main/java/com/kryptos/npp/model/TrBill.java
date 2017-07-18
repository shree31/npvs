/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;

/**
 *
 * @author Window 8
 */
@Entity
@Table(name = "trPayDetails")
public class TrBill {
	
	@Id
	@GeneratedValue
	@Column(name = "trPayDetails_id")
	private int trPayDetailsId;

	public int getTrPayDetailsId() {
		return trPayDetailsId;
	}

	public void setTrPayDetailsId(int trPayDetailsId) {
		this.trPayDetailsId = trPayDetailsId;
	}

	@Column(name = "agnCode")
    private String agnCode;
    @Column(name = "billNo")
    private String billNo;
    @Column(name = "billFrom")
    private String billFrom;
    @Column(name = "billDate")
    private String billDate;
    @Column(name = "billFreq")
    private String billFreq;
    @Column(name = "totalSup")
    private int totalSup;
    @Column(name = "rateCode")
    private String rateCode;
    @Column(name = "grossAmt")
    private double grossAmt;
    @Column(name = "commCode")
    private String commCode;
    @Column(name = "commAmt")
    private double commAmt;
    @Column(name = "totalAmt")
    private double totalAmt;
    @Column(name = "lastOsAmt")
    private double lastOsAmt;
    @Column(name = "osAmt")
    private double osAmt;
    @Column(name = "maker")
    private String maker;
    @Column(name = "makerDt")
    private String makerDt;
    @Column(name = "rtAmt")
    private double rtAmt;
    @Column(name = "cnAmt")
    private double cnAmt;
    @Column(name = "dnAmt")
    private double dnAmt;
    @Column(name = "pymtAmt")
    private double pymtAmt;
    @Column(name = "lastSdAmt")
    private double lastSdAmt;
    @Column(name = "sdAmt")
    private double sdAmt;
    @Column(name = "servChrg")
    private double servChrg;
    @Column(name = "loginUsrVendorId")
    private String loginUsrVendorId;

    public String getAgnCode() {
        return agnCode;
    }

    public void setAgnCode(String agnCode) {
        this.agnCode = agnCode;
    }

    public String getBillNo() {
        return billNo;
    }

    public void setBillNo(String billNo) {
        this.billNo = billNo;
    }

    public String getBillFrom() {
        return billFrom;
    }

    public void setBillFrom(String billFrom) {
        this.billFrom = billFrom;
    }

    public String getBillDate() {
        return billDate;
    }

    public void setBillDate(String billDate) {
        this.billDate = billDate;
    }

    public String getBillFreq() {
        return billFreq;
    }

    public void setBillFreq(String billFreq) {
        this.billFreq = billFreq;
    }

    public int getTotalSup() {
        return totalSup;
    }

    public void setTotalSup(int totalSup) {
        this.totalSup = totalSup;
    }

    public String getRateCode() {
        return rateCode;
    }

    public void setRateCode(String rateCode) {
        this.rateCode = rateCode;
    }

    public double getGrossAmt() {
        return grossAmt;
    }

    public void setGrossAmt(double grossAmt) {
        this.grossAmt = grossAmt;
    }

    public String getCommCode() {
        return commCode;
    }

    public void setCommCode(String commCode) {
        this.commCode = commCode;
    }

    public double getCommAmt() {
        return commAmt;
    }

    public void setCommAmt(double commAmt) {
        this.commAmt = commAmt;
    }

    public double getTotalAmt() {
        return totalAmt;
    }

    public void setTotalAmt(double totalAmt) {
        this.totalAmt = totalAmt;
    }

    public double getLastOsAmt() {
        return lastOsAmt;
    }

    public void setLastOsAmt(double lastOsAmt) {
        this.lastOsAmt = lastOsAmt;
    }

    public double getOsAmt() {
        return osAmt;
    }

    public void setOsAmt(double osAmt) {
        this.osAmt = osAmt;
    }

    public String getMaker() {
        return maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }

    public String getMakerDt() {
        return makerDt;
    }

    public void setMakerDt(String makerDt) {
        this.makerDt = makerDt;
    }

    public double getRtAmt() {
        return rtAmt;
    }

    public void setRtAmt(double rtAmt) {
        this.rtAmt = rtAmt;
    }

    public double getCnAmt() {
        return cnAmt;
    }

    public void setCnAmt(double cnAmt) {
        this.cnAmt = cnAmt;
    }

    public double getDnAmt() {
        return dnAmt;
    }

    public void setDnAmt(double dnAmt) {
        this.dnAmt = dnAmt;
    }

    public double getPymtAmt() {
        return pymtAmt;
    }

    public void setPymtAmt(double pymtAmt) {
        this.pymtAmt = pymtAmt;
    }

    public double getLastSdAmt() {
        return lastSdAmt;
    }

    public void setLastSdAmt(double lastSdAmt) {
        this.lastSdAmt = lastSdAmt;
    }

    public double getSdAmt() {
        return sdAmt;
    }

    public void setSdAmt(double sdAmt) {
        this.sdAmt = sdAmt;
    }

    public double getServChrg() {
        return servChrg;
    }

    public void setServChrg(double servChrg) {
        this.servChrg = servChrg;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }

}
