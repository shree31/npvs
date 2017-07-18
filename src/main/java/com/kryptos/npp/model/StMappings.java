/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "stMappings")

/**
 *
 * @author KSPL
 */
public class StMappings {
	
	@Id
	@GeneratedValue
	@Column(name = "stMappings_id")
	private int stMappingsId;
	
 	public int getStMappingsId() {
		return stMappingsId;
	}

	public void setStMappingsId(int stMappingsId) {
		this.stMappingsId = stMappingsId;
	}

	@Column(name = "keyType")
	private String keyType;
    @Column(name = "keyCode")
	private String keyCode;
    @Column(name = "keyName")
	private String keyName;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;

    public String getKeyType() {
        return keyType;
    }

    public void setKeyType(String keyType) {
        this.keyType = keyType;
    }

    public String getKeyCode() {
        return keyCode;
    }

    public void setKeyCode(String keyCode) {
        this.keyCode = keyCode;
    }

    public String getKeyName() {
        return keyName;
    }

    public void setKeyName(String keyName) {
        this.keyName = keyName;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
  
}
