/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "stSystemInfo")

/**
 *
 * @author KSPL
 */
public class StSystemInfo {
	
	@Id
	@GeneratedValue
	@Column(name = "stSystemInfo_id")
	private int stSystemInfoId;
	
 	public int getStSystemInfoId() {
		return stSystemInfoId;
	}

	public void setStSystemInfoId(int stSystemInfoId) {
		this.stSystemInfoId = stSystemInfoId;
	}

	@Column(name = "dbConn")
	private String dbConn;
    @Column(name = "folders")
	private String folders;
    @Column(name = "reportCss")
	private String reportCss;
    @Column(name = "installedAt")
	private String installedAt;
    @Column(name = "ditappFlg")
	private String ditappFlg;
    @Column(name = "subappFlg")
	private String subappFlg;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;

    public String getDbConn() {
        return dbConn;
    }

    public void setDbConn(String dbConn) {
        this.dbConn = dbConn;
    }

    public String getFolders() {
        return folders;
    }

    public void setFolders(String folders) {
        this.folders = folders;
    }

    public String getReportCss() {
        return reportCss;
    }

    public void setReportCss(String reportCss) {
        this.reportCss = reportCss;
    }

    public String getInstalledAt() {
        return installedAt;
    }

    public void setInstalledAt(String installedAt) {
        this.installedAt = installedAt;
    }

    public String getDitappFlg() {
        return ditappFlg;
    }

    public void setDitappFlg(String ditappFlg) {
        this.ditappFlg = ditappFlg;
    }

    public String getSubappFlg() {
        return subappFlg;
    }

    public void setSubappFlg(String subappFlg) {
        this.subappFlg = subappFlg;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
    
    
}
