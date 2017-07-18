package com.kryptos.npp.model;
@Entity
@Table(name = "mtArea")
public class MtArea {
	@Id
	@GeneratedValue
	@Column(name = "mtArea_id")
	private int mtAreaId;
	
	public int getMtAreaId() {
		return mtAreaId;
	}
	public void setMtAreaId(int mtAreaId) {
		this.mtAreaId = mtAreaId;
	}
	@Column(name = "areaCode")
	private String areaCode;
	@Column(name = "areaName")
	private String areaName;
	@Column(name = "areaMngr")
	private String areaMngr;
	@Column(name = "areaMgrtel")
	private String areaMgrtel;
	@Column(name = "areaMarName")
	private String areaMarName;
	@Column(name = "city")
  	private String city;
  	@Column(name = "creationDt")
  	private String creationDt;
  	@Column(name = "maker")
  	private String maker;
  	@Column(name = "makerDt")
  	private String makerDt;
  	@Column(name = "status")
  	private String status;
  	@Column(name = "oldCode")
  	private String oldCode;
  	@Column(name = "remarks")
  	private String remarks;
  	@Column(name = "areaAddPin")
  	private String areaAddPin;
  	@Column(name = "loginUsrVendorId")
  	private String loginUsrVendorId;
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getAreaMngr() {
		return areaMngr;
	}
	public void setAreaMngr(String areaMngr) {
		this.areaMngr = areaMngr;
	}
	public String getAreaMgrtel() {
		return areaMgrtel;
	}
	public void setAreaMgrtel(String areaMgrtel) {
		this.areaMgrtel = areaMgrtel;
	}
	public String getAreaMarName() {
		return areaMarName;
	}
	public void setAreaMarName(String areaMarName) {
		this.areaMarName = areaMarName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
	public String getOldCode() {
		return oldCode;
	}
	public void setOldCode(String oldCode) {
		this.oldCode = oldCode;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getAreaAddPin() {
		return areaAddPin;
	}
	public void setAreaAddPin(String areaAddPin) {
		this.areaAddPin = areaAddPin;
	}
	public String getLoginUsrVendorId() {
		return loginUsrVendorId;
	}
	public void setLoginUsrVendorId(String loginUsrVendorId) {
		this.loginUsrVendorId = loginUsrVendorId;
	}
  	
  	
}
