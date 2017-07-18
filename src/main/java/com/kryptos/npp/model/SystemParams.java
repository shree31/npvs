/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;


/**
 *
 * @author KSPL
 */
@Entity
@Table(name = "systemParams")
public class SystemParams {
	
	@Id
	@GeneratedValue
	
	@Column(name = "systemParams_id")
	private int systemParamsId;
	@Column(name = "cond")
	private String cond;
    @Column(name = "installedAt")
	private String installedAt;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;
    
    public int getSystemParamsId() {
		return systemParamsId;
	}
	public void setSystemParamsId(int systemParamsId) {
		this.systemParamsId = systemParamsId;
	}
	public String getCond() {
		return cond;
	}
	public void setCond(String cond) {
		this.cond = cond;
	}
	public String getInstalledAt() {
		return installedAt;
	}
	public void setInstalledAt(String installedAt) {
		this.installedAt = installedAt;
	}
	public String getLoginUsrVendorId() {
		return loginUsrVendorId;
	}
	public void setLoginUsrVendorId(String loginUsrVendorId) {
		this.loginUsrVendorId = loginUsrVendorId;
	}

    
}
