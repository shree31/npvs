/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "stUser")
/**
 *
 * @author KSPL
 */
public class StUser {
	
	@Id
	@GeneratedValue
	@Column(name = "stUser_id")
	private int stUserId;
	
	public int getStUserId() {
		return stUserId;
	}

	public void setStUserId(int stUserId) {
		this.stUserId = stUserId;
	}

	@Column(name = "usrId")
	private String usrId;
    @Column(name = "usrName")
	private String usrName;
    @Column(name = "creationDt")
	private String creationDt;
    @Column(name = "maker")
	private String maker;
    @Column(name = "makerDt")
	private String makerDt;
    @Column(name = "status")
	private String status;
    @Column(name = "topMenuList")
	private String topMenuList;
    @Column(name = "cntCodeLst")
	private String cntCodeLst;
    @Column(name = "enc")
	private String enc;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;

    public String getUsrId() {
        return usrId;
    }

    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    public String getUsrName() {
        return usrName;
    }

    public void setUsrName(String usrName) {
        this.usrName = usrName;
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

    public String getTopMenuList() {
        return topMenuList;
    }

    public void setTopMenuList(String topMenuList) {
        this.topMenuList = topMenuList;
    }

    public String getCntCodeLst() {
        return cntCodeLst;
    }

    public void setCntCodeLst(String cntCodeLst) {
        this.cntCodeLst = cntCodeLst;
    }

    public String getEnc() {
        return enc;
    }

    public void setEnc(String enc) {
        this.enc = enc;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
   
    
   
 
    
    
}
