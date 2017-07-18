/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "StSideMenu")

/**
 *
 * @author KSPL
 */
public class StSideMenu {
	
	@Id
	@GeneratedValue
	@Column(name = "StSideMenu_id")
	private int StSideMenuId;
	
	public int getStSideMenuId() {
		return StSideMenuId;
	}

	public void setStSideMenuId(int stSideMenuId) {
		StSideMenuId = stSideMenuId;
	}

	@Column(name = "menuTopId")
	private int menuTopId;
    @Column(name = "menuSideId")
	private int menuSideId;
    @Column(name = "menuSideName")
	private String menuSideName;
    @Column(name = "menuSideLnk")
	private String menuSideLnk;
    @Column(name = "enable")
	private String enable;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;   

    public int getMenuTopId() {
        return menuTopId;
    }

    public void setMenuTopId(int menuTopId) {
        this.menuTopId = menuTopId;
    }

    public int getMenuSideId() {
        return menuSideId;
    }

    public void setMenuSideId(int menuSideId) {
        this.menuSideId = menuSideId;
    }

    public String getMenuSideName() {
        return menuSideName;
    }

    public void setMenuSideName(String menuSideName) {
        this.menuSideName = menuSideName;
    }

    public String getMenuSideLnk() {
        return menuSideLnk;
    }

    public void setMenuSideLnk(String menuSideLnk) {
        this.menuSideLnk = menuSideLnk;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
    
}
