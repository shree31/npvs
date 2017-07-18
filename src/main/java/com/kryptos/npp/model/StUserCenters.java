/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "stUserCenters")
/**
 *
 * @author KSPL
 */
public class StUserCenters {
	
	@Id
	@GeneratedValue
	@Column(name = "stUserCenters_id")
	private int stUserCentersId;
	

	public int getStUserCentersId() {
		return stUserCentersId;
	}

	public void setStUserCentersId(int stUserCentersId) {
		this.stUserCentersId = stUserCentersId;
	}

	@Column(name = "userId")
	private String userId;
    @Column(name = "cntCode")
	private String cntCode;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCntCode() {
        return cntCode;
    }

    public void setCntCode(String cntCode) {
        this.cntCode = cntCode;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
 
    
}
