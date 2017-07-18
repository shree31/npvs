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
@Table(name = "trPayCoup")
public class TrPayCoup {
	
	@Id
	@GeneratedValue
	@Column(name = "trPayCoup_id")
	private int trPayCoupId;

 	public int getTrPayCoupId() {
		return trPayCoupId;
	}

	public void setTrPayCoupId(int trPayCoupId) {
		this.trPayCoupId = trPayCoupId;
	}

	@Column(name = "agnCode")
    private String agnCode;
    @Column(name = "pubCode")
    private String pubCode;
    @Column(name = "billDate")
    private String billDate;
    @Column(name = "recAmount")
    private double recAmount;
    @Column(name = "pymtMode")
    private String pymtMode;
    @Column(name = "rcdDate")
    private String rcdDate;
    @Column(name = "rcvr")
    private String rcvr;
    @Column(name = "narration")
    private String narration;
    @Column(name = "creationDt")
    private String creationDt;
    @Column(name = "maker")
    private String maker;
    @Column(name = "makerDt")
    private String makerDt;
    @Column(name = "status")
    private String status;
    @Column(name = "billProcDate")
    private String billProcDate;
    @Column(name = "loginUsrVendorId")
    private String loginUsrVendorId;

    public String getAgnCode() {
        return agnCode;
    }

    public void setAgnCode(String agnCode) {
        this.agnCode = agnCode;
    }

    public String getPubCode() {
        return pubCode;
    }

    public void setPubCode(String pubCode) {
        this.pubCode = pubCode;
    }

    public String getBillDate() {
        return billDate;
    }

    public void setBillDate(String billDate) {
        this.billDate = billDate;
    }

    public double getRecAmount() {
        return recAmount;
    }

    public void setRecAmount(double recAmount) {
        this.recAmount = recAmount;
    }

    public String getPymtMode() {
        return pymtMode;
    }

    public void setPymtMode(String pymtMode) {
        this.pymtMode = pymtMode;
    }

    public String getRcdDate() {
        return rcdDate;
    }

    public void setRcdDate(String rcdDate) {
        this.rcdDate = rcdDate;
    }

    public String getRcvr() {
        return rcvr;
    }

    public void setRcvr(String rcvr) {
        this.rcvr = rcvr;
    }

    public String getNarration() {
        return narration;
    }

    public void setNarration(String narration) {
        this.narration = narration;
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

    public String getBillProcDate() {
        return billProcDate;
    }

    public void setBillProcDate(String billProcDate) {
        this.billProcDate = billProcDate;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }

}
