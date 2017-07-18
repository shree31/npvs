package com.kryptos.npp.model;
@Entity
@Table(name="mtCenter")
public class MtCenter {
	
	@Id
	@GeneratedValue
	@Column(name = "mtCenter_id")
	private int mtCenterId;
	
	public int getMtCenterId() {
		return mtCenterId;
	}
	public void setMtCenterId(int mtCenterId) {
		this.mtCenterId = mtCenterId;
	}
	@Column(name = "cntCode")
	private String cntCode;
	@Column(name = "cntName")
	private String cntName;
	@Column(name = "cntOldCode")
	private String cntOldCode;
	@Column(name = "cmpCode")
	private String cmpCode;
	@Column(name = "cntAdd1")
	private String cntAdd1;
	@Column(name = "cntAdd2")
	private String cntAdd2;
	@Column(name = "city")
	private String city;
	@Column(name = "state")
	private String state;
	@Column(name = "country")
	private String country;
	@Column(name = "cntAddPin")
	private String cntAddPin;
	@Column(name = "cntTel")
	private String cntTel;
	@Column(name = "cntFax")
	private String cntFax;
	@Column(name = "cntalidFlg")
	private String cntalidFlg;
	@Column(name = "cntDistrFlg")
	private String cntDistrFlg;
	@Column(name = "cntEditnFlg")
	private String cntEditnFlg;
	@Column(name = "cntRemarks")
	private String cntRemarks;
	@Column(name = "creationDt")
	private String creationDt;
	@Column(name = "maker")
	private String maker;
	@Column(name = "makerDt")
	private String makerDt;
	@Column(name = "status")
	private String status;
	@Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;
	public String getCntCode() {
		return cntCode;
	}
	public void setCntCode(String cntCode) {
		this.cntCode = cntCode;
	}
	public String getCntName() {
		return cntName;
	}
	public void setCntName(String cntName) {
		this.cntName = cntName;
	}
	public String getCntOldCode() {
		return cntOldCode;
	}
	public void setCntOldCode(String cntOldCode) {
		this.cntOldCode = cntOldCode;
	}
	public String getCmpCode() {
		return cmpCode;
	}
	public void setCmpCode(String cmpCode) {
		this.cmpCode = cmpCode;
	}
	public String getCntAdd1() {
		return cntAdd1;
	}
	public void setCntAdd1(String cntAdd1) {
		this.cntAdd1 = cntAdd1;
	}
	public String getCntAdd2() {
		return cntAdd2;
	}
	public void setCntAdd2(String cntAdd2) {
		this.cntAdd2 = cntAdd2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCntAddPin() {
		return cntAddPin;
	}
	public void setCntAddPin(String cntAddPin) {
		this.cntAddPin = cntAddPin;
	}
	public String getCntTel() {
		return cntTel;
	}
	public void setCntTel(String cntTel) {
		this.cntTel = cntTel;
	}
	public String getCntFax() {
		return cntFax;
	}
	public void setCntFax(String cntFax) {
		this.cntFax = cntFax;
	}
	public String getCntalidFlg() {
		return cntalidFlg;
	}
	public void setCntalidFlg(String cntalidFlg) {
		this.cntalidFlg = cntalidFlg;
	}
	public String getCntDistrFlg() {
		return cntDistrFlg;
	}
	public void setCntDistrFlg(String cntDistrFlg) {
		this.cntDistrFlg = cntDistrFlg;
	}
	public String getCntEditnFlg() {
		return cntEditnFlg;
	}
	public void setCntEditnFlg(String cntEditnFlg) {
		this.cntEditnFlg = cntEditnFlg;
	}
	public String getCntRemarks() {
		return cntRemarks;
	}
	public void setCntRemarks(String cntRemarks) {
		this.cntRemarks = cntRemarks;
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
	public String getLoginUsrVendorId() {
		return loginUsrVendorId;
	}
	public void setLoginUsrVendorId(String loginUsrVendorId) {
		this.loginUsrVendorId = loginUsrVendorId;
	}
	
}
