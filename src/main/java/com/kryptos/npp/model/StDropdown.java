/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;
@Entity
@Table(name = "stDropdown")

/**
 *
 * @author KSPL
 */
public class StDropdown {
	
	@Id
	@GeneratedValue
	@Column(name = "stDropdown_id")
	private int stDropdownId;
	
	public int getStDropdownId() {
		return stDropdownId;
	}

	public void setStDropdownId(int stDropdownId) {
		this.stDropdownId = stDropdownId;
	}

	@Column(name = "picklistName")
	private String picklistName;
    @Column(name = "picklistQuery")
	private String picklistQuery;
    @Column(name = "headerCol")
	private String headerCol;
    @Column(name = "searchParamName")
	private String searchParamName;
    @Column(name = "crnAppObj")
    private String crnAppObj;
    @Column(name = "whereClause")
    private String whereClause;
     @Column(name = "fldExist")
    private String fldExist;
       @Column(name = "loginUsrVendorId")
    private String loginUsrVendorId;

    public String getPicklistName() {
        return picklistName;
    }

    public void setPicklistName(String picklistName) {
        this.picklistName = picklistName;
    }

    public String getPicklistQuery() {
        return picklistQuery;
    }

    public void setPicklistQuery(String picklistQuery) {
        this.picklistQuery = picklistQuery;
    }

    public String getHeaderCol() {
        return headerCol;
    }

    public void setHeaderCol(String headerCol) {
        this.headerCol = headerCol;
    }

    public String getSearchParamName() {
        return searchParamName;
    }

    public void setSearchParamName(String searchParamName) {
        this.searchParamName = searchParamName;
    }

    public String getCrnAppObj() {
        return crnAppObj;
    }

    public void setCrnAppObj(String crnAppObj) {
        this.crnAppObj = crnAppObj;
    }

    public String getWhereClause() {
        return whereClause;
    }

    public void setWhereClause(String whereClause) {
        this.whereClause = whereClause;
    }

    public String getFldExist() {
        return fldExist;
    }

    public void setFldExist(String fldExist) {
        this.fldExist = fldExist;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }
    
    
}
