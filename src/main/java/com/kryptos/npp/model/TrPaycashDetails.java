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
@Table(name = "trPaycashDetails")
public class TrPaycashDetails {
	
	@Id
	@GeneratedValue
	@Column(name = "trPaycashDetails_id")
	private int trPaycashDetailsId;

	public int getTrPaycashDetailsId() {
		return trPaycashDetailsId;
	}

	public void setTrPaycashDetailsId(int trPaycashDetailsId) {
		this.trPaycashDetailsId = trPaycashDetailsId;
	}

	@Column(name = "agnCode")
    private String agnCode;
    @Column(name = "billGenDt")
    private String billGenDt;
    @Column(name = "billAmt")
    private double billAmt;
    @Column(name = "payRecDt")
    private String payRecDt;
    @Column(name = "recAmount")
    private double recAmount;
    @Column(name = "pendAmount")
    private double pendAmount;
    @Column(name = "pymtMode")
    private String pymtMode;
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
    @Column(name = "billDate")
    private String billDate;
    @Column(name = "remarks")
    private String remarks;
    @Column(name = "adjustAmt")
    private double adjustAmt;
    @Column(name = "loginUsrVendorId")
    private String loginUsrVendorId;

    public String getAgnCode() {
        return agnCode;
    }

    public void setAgnCode(String agnCode) {
        this.agnCode = agnCode;
    }

    public String getBillGenDt() {
        return billGenDt;
    }

    public void setBillGenDt(String billGenDt) {
        this.billGenDt = billGenDt;
    }

    public double getBillAmt() {
        return billAmt;
    }

    public void setBillAmt(double billAmt) {
        this.billAmt = billAmt;
    }

    public String getPayRecDt() {
        return payRecDt;
    }

    public void setPayRecDt(String payRecDt) {
        this.payRecDt = payRecDt;
    }

    public double getRecAmount() {
        return recAmount;
    }

    public void setRecAmount(double recAmount) {
        this.recAmount = recAmount;
    }

    public double getPendAmount() {
        return pendAmount;
    }

    public void setPendAmount(double pendAmount) {
        this.pendAmount = pendAmount;
    }

    public String getPymtMode() {
        return pymtMode;
    }

    public void setPymtMode(String pymtMode) {
        this.pymtMode = pymtMode;
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

    public String getBillDate() {
        return billDate;
    }

    public void setBillDate(String billDate) {
        this.billDate = billDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public double getAdjustAmt() {
        return adjustAmt;
    }

    public void setAdjustAmt(double adjustAmt) {
        this.adjustAmt = adjustAmt;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }

}
