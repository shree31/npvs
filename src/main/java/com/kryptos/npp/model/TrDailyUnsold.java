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
@Table(name = "trDailyUnsold")
public class TrDailyUnsold {
	
	@Id
	@GeneratedValue
	@Column(name = "trDailyUnsold_id")
	private int trDailyUnsoldId;


	public int getTrDailyUnsoldId() {
		return trDailyUnsoldId;
	}

	public void setTrDailyUnsoldId(int trDailyUnsoldId) {
		this.trDailyUnsoldId = trDailyUnsoldId;
	}

	@Column(name = "pubCode")
    private String pubCode;
    @Column(name = "agnCode")
    private String agnCode;
    @Column(name = "supDt")
    private String supDt;
    @Column(name = "totalSup")
    private int totalSup;
    @Column(name = "returnCopy")
    private int returnCopy;
    @Column(name = "returnReason")
    private String returnReason;
    @Column(name = "rate")
    private double rate;
    @Column(name = "retTotalAmt")
    private double retTotalAmt;
    @Column(name = "comm")
    private int comm;
    @Column(name = "netAmt")
    private double netAmt;
    @Column(name = "creationDt")
    private String creationDt;
    @Column(name = "maker")
    private String maker;
    @Column(name = "makerDt")
    private String makerDt;
    @Column(name = "status")
    private String status;
    @Column(name = "ucnCnno")
    private String ucnCnno;
    @Column(name = "ucnCreationDt")
    private String ucnCreationDt;
    @Column(name = "supDay")
    private String supDay;
    @Column(name = "retComm")
    private double retComm;
    @Column(name = "billDate")
    private String billDate;
    @Column(name = "loginUsrVendorId")
    private String loginUsrVendorId;

    public String getPubCode() {
        return pubCode;
    }

    public void setPubCode(String pubCode) {
        this.pubCode = pubCode;
    }

    public String getAgnCode() {
        return agnCode;
    }

    public void setAgnCode(String agnCode) {
        this.agnCode = agnCode;
    }

    public String getSupDt() {
        return supDt;
    }

    public void setSupDt(String supDt) {
        this.supDt = supDt;
    }

    public int getTotalSup() {
        return totalSup;
    }

    public void setTotalSup(int totalSup) {
        this.totalSup = totalSup;
    }

    public int getReturnCopy() {
        return returnCopy;
    }

    public void setReturnCopy(int returnCopy) {
        this.returnCopy = returnCopy;
    }

    public String getReturnReason() {
        return returnReason;
    }

    public void setReturnReason(String returnReason) {
        this.returnReason = returnReason;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public double getRetTotalAmt() {
        return retTotalAmt;
    }

    public void setRetTotalAmt(double retTotalAmt) {
        this.retTotalAmt = retTotalAmt;
    }

    public int getComm() {
        return comm;
    }

    public void setComm(int comm) {
        this.comm = comm;
    }

    public double getNetAmt() {
        return netAmt;
    }

    public void setNetAmt(double netAmt) {
        this.netAmt = netAmt;
    }

    public String getCreationDt() {
        return creationDt;
    }

    public void setCreationDt(String creationDt) {
        this.creationDt = creationDt;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUcnCnno() {
        return ucnCnno;
    }

    public void setUcnCnno(String ucnCnno) {
        this.ucnCnno = ucnCnno;
    }

    public String getUcnCreationDt() {
        return ucnCreationDt;
    }

    public void setUcnCreationDt(String ucnCreationDt) {
        this.ucnCreationDt = ucnCreationDt;
    }

    public String getSupDay() {
        return supDay;
    }

    public void setSupDay(String supDay) {
        this.supDay = supDay;
    }

    public double getRetComm() {
        return retComm;
    }

    public void setRetComm(double retComm) {
        this.retComm = retComm;
    }

    public String getBillDate() {
        return billDate;
    }

    public void setBillDate(String billDate) {
        this.billDate = billDate;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }

}
