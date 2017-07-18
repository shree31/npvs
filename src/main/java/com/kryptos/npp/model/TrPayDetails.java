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
public class TrPayDetails {
	
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
    @Column(name = "vouType")
    private String vouType;
    @Column(name = "rcdDate")
    private String rcdDate;
    @Column(name = "rcdNo")
    private String rcdNo;
    @Column(name = "pymtType")
    private String pymtType;
    @Column(name = "pymtMode")
    private String pymtMode;
    @Column(name = "recAmount")
    private double recAmount;
    @Column(name = "chqNo")
    private String chqNo;
    @Column(name = "chqDate")
    private String chqDate;
    @Column(name = "bankName")
    private String bankName;
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
    @Column(name = "entDate")
    private String entDate;
    @Column(name = "entNo")
    private String entNo;
    @Column(name = "billDate")
    private String billDate;
    @Column(name = "loginUserVendorId")
    private String loginUserVendorId;

    public String getAgnCode() {
        return agnCode;
    }

    public void setAgnCode(String agnCode) {
        this.agnCode = agnCode;
    }

    public String getVouType() {
        return vouType;
    }

    public void setVouType(String vouType) {
        this.vouType = vouType;
    }

    public String getRcdDate() {
        return rcdDate;
    }

    public void setRcdDate(String rcdDate) {
        this.rcdDate = rcdDate;
    }

    public String getRcdNo() {
        return rcdNo;
    }

    public void setRcdNo(String rcdNo) {
        this.rcdNo = rcdNo;
    }

    public String getPymtType() {
        return pymtType;
    }

    public void setPymtType(String pymtType) {
        this.pymtType = pymtType;
    }

    public String getPymtMode() {
        return pymtMode;
    }

    public void setPymtMode(String pymtMode) {
        this.pymtMode = pymtMode;
    }

    public double getRecAmount() {
        return recAmount;
    }

    public void setRecAmount(double recAmount) {
        this.recAmount = recAmount;
    }

    public String getChqNo() {
        return chqNo;
    }

    public void setChqNo(String chqNo) {
        this.chqNo = chqNo;
    }

    public String getChqDate() {
        return chqDate;
    }

    public void setChqDate(String chqDate) {
        this.chqDate = chqDate;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
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

    public String getEntDate() {
        return entDate;
    }

    public void setEntDate(String entDate) {
        this.entDate = entDate;
    }

    public String getEntNo() {
        return entNo;
    }

    public void setEntNo(String entNo) {
        this.entNo = entNo;
    }

    public String getBillDate() {
        return billDate;
    }

    public void setBillDate(String billDate) {
        this.billDate = billDate;
    }

    public String getLoginUserVendorId() {
        return loginUserVendorId;
    }

    public void setLoginUserVendorId(String loginUserVendorId) {
        this.loginUserVendorId = loginUserVendorId;
    }

}
