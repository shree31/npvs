/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Table(name = "stDistributor")

/**
 *
 * @author KSPL
 */
public class StDistributor {
	
	@Id
	@GeneratedValue
	@Column(name = "stDistributor_id")
	private int stDistributorId;

	public int getStDistributorId() {
		return stDistributorId;
	}

	public void setStDistributorId(int stDistributorId) {
		this.stDistributorId = stDistributorId;
	}

	@Column(name = "distCd")
	private String distCd;
    @Column(name = "distName")
	private String distName;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;

    public String getDistCd() {
        return distCd;
    }

    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    public String getDistName() {
        return distName;
    }

    public void setDistName(String distName) {
        this.distName = distName;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
}
