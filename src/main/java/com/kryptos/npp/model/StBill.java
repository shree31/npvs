/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "stBill")

/**
 *
 * @author KSPL
 */
public class StBill {
	
	@Id
	@GeneratedValue
	@Column(name = "stBill_id")
	private int stBillId;

	public int getStBillId() {
		return stBillId;
	}

	public void setStBillId(int stBillId) {
		this.stBillId = stBillId;
	}

	@Column(name = "processId")
	private String billFreq;
    @Column(name = "cutoverBillDt")
	private String cutoverBillDt;
    @Column(name = "resetInd")
	private String resetInd;
    @Column(name = "lastBillDt")
	private String lastBillDt;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;

    public String getBillFreq() {
        return billFreq;
    }

    public void setBillFreq(String billFreq) {
        this.billFreq = billFreq;
    }

    public String getCutoverBillDt() {
        return cutoverBillDt;
    }

    public void setCutoverBillDt(String cutoverBillDt) {
        this.cutoverBillDt = cutoverBillDt;
    }

    public String getResetInd() {
        return resetInd;
    }

    public void setResetInd(String resetInd) {
        this.resetInd = resetInd;
    }

    public String getLastBillDt() {
        return lastBillDt;
    }

    public void setLastBillDt(String lastBillDt) {
        this.lastBillDt = lastBillDt;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
    
}
