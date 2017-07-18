/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "stTopMenu")

/**
 *
 * @author KSPL
 */
public class StTopMenu {
	
	@Id
	@GeneratedValue
	@Column(name = "stTopMenu_id")
	private int stTopMenuId;
	
 	public int getStTopMenuId() {
		return stTopMenuId;
	}

	public void setStTopMenuId(int stTopMenuId) {
		this.stTopMenuId = stTopMenuId;
	}

	@Column(name = "menuTopId")
	private int menuTopId;
    @Column(name = "menuTopName")
	private String menuTopName;
    @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;

    public int getMenuTopId() {
        return menuTopId;
    }

    public void setMenuTopId(int menuTopId) {
        this.menuTopId = menuTopId;
    }

    public String getMenuTopName() {
        return menuTopName;
    }

    public void setMenuTopName(String menuTopName) {
        this.menuTopName = menuTopName;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
   
    
    
}
