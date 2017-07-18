/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "stFormdetails")
/**
 *
 * @author KSPL
 */
public class StFormdetails {
	
	@Id
	@GeneratedValue
	@Column(name = "stFormdetails_id")
	private int stFormdetailsId;

	public int getStFormdetailsId() {
		return stFormdetailsId;
	}

	public void setStFormdetailsId(int stFormdetailsId) {
		this.stFormdetailsId = stFormdetailsId;
	}

	@Column(name = "formName")
	private String formName;
     @Column(name = "query")
	private String query;
     @Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;

    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
}
