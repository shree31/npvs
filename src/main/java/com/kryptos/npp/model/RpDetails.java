/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.model;

/**
 *
 * @author Window 8
 */
@Entity
@Table(name = "rpDetails")
public class RpDetails {
	
	@Id
	@GeneratedValue
	@Column(name = "rpDetails_id")
	private int rpDetailsId;

	public int getRpDetailsId() {
		return rpDetailsId;
	}

	public void setRpDetailsId(int rpDetailsId) {
		this.rpDetailsId = rpDetailsId;
	}

	@Column(name = "rpId")
    private String rpId;
    @Column(name = "noOfRecperPg")
    private int noOfRecperPg;
    @Column(name = "rpHdrQry")
    private String rpHdrQry;
    @Column(name = "rpHdrHtml")
    private String rpHdrHtml;
    @Column(name = "rpColhdrQry")
    private String rpColhdrQry;
    @Column(name = "rpColhdrHtml")
    private String rpColhdrHtml;
    @Column(name = "rpColNames")
    private String rpColNames;
    @Column(name = "rpTabdetQry")
    private String rpTabdetQry;
    @Column(name = "rpCompQry")
    private String rpCompQry;
    @Column(name = "rpCompHtml")
    private String rpCompHtml;
    @Column(name = "rpTabfootQry")
    private String rpTabfootQry;
    @Column(name = "rpTabfootHtml")
    private String rpTabfootHtml;
    @Column(name = "rpPagefootQry")
    private String rpPagefootQry;
    @Column(name = "rpPagefootHtml")
    private String rpPagefootHtml;
    @Column(name = "rpGroupQry")
    private String rpGroupQry;
    @Column(name = "rpTabdetHtml")
    private String rpTabdetHtml;
    @Column(name = "rpGroupCol")
    private String rpGroupCol;
    @Column(name = "rpName")
    private String rpName;
    @Column(name = "rpColCount")
    private int rpColCount;
    @Column(name = "loginUsrVendorId")
    private String loginUsrVendorId;

    public String getRpId() {
        return rpId;
    }

    public void setRpId(String rpId) {
        this.rpId = rpId;
    }

    public int getNoOfRecperPg() {
        return noOfRecperPg;
    }

    public void setNoOfRecperPg(int noOfRecperPg) {
        this.noOfRecperPg = noOfRecperPg;
    }

    public String getRpHdrQry() {
        return rpHdrQry;
    }

    public void setRpHdrQry(String rpHdrQry) {
        this.rpHdrQry = rpHdrQry;
    }

    public String getRpHdrHtml() {
        return rpHdrHtml;
    }

    public void setRpHdrHtml(String rpHdrHtml) {
        this.rpHdrHtml = rpHdrHtml;
    }

    public String getRpColhdrQry() {
        return rpColhdrQry;
    }

    public void setRpColhdrQry(String rpColhdrQry) {
        this.rpColhdrQry = rpColhdrQry;
    }

    public String getRpColhdrHtml() {
        return rpColhdrHtml;
    }

    public void setRpColhdrHtml(String rpColhdrHtml) {
        this.rpColhdrHtml = rpColhdrHtml;
    }

    public String getRpColNames() {
        return rpColNames;
    }

    public void setRpColNames(String rpColNames) {
        this.rpColNames = rpColNames;
    }

    public String getRpTabdetQry() {
        return rpTabdetQry;
    }

    public void setRpTabdetQry(String rpTabdetQry) {
        this.rpTabdetQry = rpTabdetQry;
    }

    public String getRpCompQry() {
        return rpCompQry;
    }

    public void setRpCompQry(String rpCompQry) {
        this.rpCompQry = rpCompQry;
    }

    public String getRpCompHtml() {
        return rpCompHtml;
    }

    public void setRpCompHtml(String rpCompHtml) {
        this.rpCompHtml = rpCompHtml;
    }

    public String getRpTabfootQry() {
        return rpTabfootQry;
    }

    public void setRpTabfootQry(String rpTabfootQry) {
        this.rpTabfootQry = rpTabfootQry;
    }

    public String getRpTabfootHtml() {
        return rpTabfootHtml;
    }

    public void setRpTabfootHtml(String rpTabfootHtml) {
        this.rpTabfootHtml = rpTabfootHtml;
    }

    public String getRpPagefootQry() {
        return rpPagefootQry;
    }

    public void setRpPagefootQry(String rpPagefootQry) {
        this.rpPagefootQry = rpPagefootQry;
    }

    public String getRpPagefootHtml() {
        return rpPagefootHtml;
    }

    public void setRpPagefootHtml(String rpPagefootHtml) {
        this.rpPagefootHtml = rpPagefootHtml;
    }

    public String getRpGroupQry() {
        return rpGroupQry;
    }

    public void setRpGroupQry(String rpGroupQry) {
        this.rpGroupQry = rpGroupQry;
    }

    public String getRpTabdetHtml() {
        return rpTabdetHtml;
    }

    public void setRpTabdetHtml(String rpTabdetHtml) {
        this.rpTabdetHtml = rpTabdetHtml;
    }

    public String getRpGroupCol() {
        return rpGroupCol;
    }

    public void setRpGroupCol(String rpGroupCol) {
        this.rpGroupCol = rpGroupCol;
    }

    public String getRpName() {
        return rpName;
    }

    public void setRpName(String rpName) {
        this.rpName = rpName;
    }

    public int getRpColCount() {
        return rpColCount;
    }

    public void setRpColCount(int rpColCount) {
        this.rpColCount = rpColCount;
    }

    public String getLoginUsrVendorId() {
        return loginUsrVendorId;
    }

    public void setLoginUsrVendorId(String loginUsrVendorId) {
        this.loginUsrVendorId = loginUsrVendorId;
    }

}
