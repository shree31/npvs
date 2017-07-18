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
@Table(name = "trBillDetail")
public class TrBillDetail {
	
	@Id
	@GeneratedValue
	@Column(name = "trBillDetail_id")
	private int trBillDetailId;

	public int getTrBillDetailId() {
		return trBillDetailId;
	}

	public void setTrBillDetailId(int trBillDetailId) {
		this.trBillDetailId = trBillDetailId;
	}

	@Column(name = "agnCode")
    private String agnCode;
    @Column(name = "billNo")
    private String billNo;
    @Column(name = "billDate")
    private String billDate;
    @Column(name = "pubCode")
    private String pubCode;
    @Column(name = "totalSup")
    private int totalSup;
    @Column(name = "grossAmt")
    private double grossAmt;
    @Column(name = "commAmt")
    private double commAmt;
    @Column(name = "addComm")
    private double addComm;
    @Column(name = "incAmt")
    private double incAmt;
    @Column(name = "insAmt")
    private double insAmt;
    @Column(name = "totalAmt")
    private double totalAmt;
    @Column(name = "maker")
    private String maker;
    @Column(name = "makerDt")
    private String makerDt;
    @Column(name = "rate")
    private double rate;
    @Column(name = "pymtMode")
    private String pymtMode;
    @Column(name = "pendCoup")
    private int pendCoup;
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

    public String getBillDate() {
        return billDate;
    }

    public void setBillDate(String billDate) {
        this.billDate = billDate;
    }

    public String getPubCode() {
        return pubCode;
    }

    public void setPubCode(String pubCode) {
        this.pubCode = pubCode;
    }

    public int getTotalSup() {
        return totalSup;
    }

    public void setTotalSup(int totalSup) {
        this.totalSup = totalSup;
    }

    public double getGrossAmt() {
        return grossAmt;
    }

    public void setGrossAmt(double grossAmt) {
        this.grossAmt = grossAmt;
    }

    public double getCommAmt() {
        return commAmt;
    }

    public void setCommAmt(double commAmt) {
        this.commAmt = commAmt;
    }

    public double getAddComm() {
        return addComm;
    }

    public void setAddComm(double addComm) {
        this.addComm = addComm;
    }

    public double getIncAmt() {
        return incAmt;
    }

    public void setIncAmt(double incAmt) {
        this.incAmt = incAmt;
    }

    public double getInsAmt() {
        return insAmt;
    }

    public void setInsAmt(double insAmt) {
        this.insAmt = insAmt;
    }

    public double getTotalAmt() {
        return totalAmt;
    }

    public void setTotalAmt(double totalAmt) {
        this.totalAmt = totalAmt;
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

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public String getPymtMode() {
        return pymtMode;
    }

    public void setPymtMode(String pymtMode) {
        this.pymtMode = pymtMode;
    }

    public int getPendCoup() {
        return pendCoup;
    }

    public void setPendCoup(int pendCoup) {
        this.pendCoup = pendCoup;
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
