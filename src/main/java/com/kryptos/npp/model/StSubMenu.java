/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "stSubMenu")

/**
 *
 * @author KSPL
 */
public class StSubMenu {
	
	@Id
	@GeneratedValue
	@Column(name = "stSubMenu_id")
	private int stSubMenuId;
	

	public int getStSubMenuId() {
		return stSubMenuId;
	}

	public void setStSubMenuId(int stSubMenuId) {
		this.stSubMenuId = stSubMenuId;
	}

	@Column(name = "menuSideId")
	private int menuSideId;
    @Column(name = "menuSubId")
	private int menuSubId;
    @Column(name = "menuSubName")
	private String menuSubName;
    @Column(name = "menuSubLink")
	private String menuSubLink;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;

    public int getMenuSideId() {
        return menuSideId;
    }

    public void setMenuSideId(int menuSideId) {
        this.menuSideId = menuSideId;
    }

    public int getMenuSubId() {
        return menuSubId;
    }

    public void setMenuSubId(int menuSubId) {
        this.menuSubId = menuSubId;
    }

    public String getMenuSubName() {
        return menuSubName;
    }

    public void setMenuSubName(String menuSubName) {
        this.menuSubName = menuSubName;
    }

    public String getMenuSubLink() {
        return menuSubLink;
    }

    public void setMenuSubLink(String menuSubLink) {
        this.menuSubLink = menuSubLink;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
	    
}
