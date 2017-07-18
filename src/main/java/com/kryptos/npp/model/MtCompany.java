package com.kryptos.npp.model;
@Entity
@Table(name = "mtCompany")

public class MtCompany {
	
	@Id
	@GeneratedValue
	@Column(name = "mtCompany_id")
	private int mtCompanyId;
	
    public int getMtCompanyId() {
		return mtCompanyId;
	}
	public void setMtCompanyId(int mtCompanyId) {
		this.mtCompanyId = mtCompanyId;
	}
	@Column(name = "cmpCode")
	private String cmpCode;
	@Column(name = "cmpName")
	private String cmpName;
	@Column(name = "cmpShortnm")
	private String cmpShortnm;
	@Column(name = "cmpAdd1")
	private String cmpAdd1;
	@Column(name = "cmpAdd2")
	private String cmpAdd2;
	@Column(name = "state")
	private String state;
	@Column(name = "city")
	private String city;
	@Column(name = "country")
	private String country;
	@Column(name = "cmpAddPin")
	private String cmpAddPin;
	@Column(name = "cmpTel")
	private String cmpTel;
	@Column(name = "cmpFax")
	private String cmpFax;
	@Column(name = "cmpWebadd")
	private String cmpWebadd;
	@Column(name = "cmpBhnm")
	private String cmpBhnm;
	@Column(name = "cmpConnm")
	private String cmpConnm;
	@Column(name = "cmpContel")
	private String cmpContel;
	@Column(name = "cmpConemail")
	private String cmpConemail;
	@Column(name = "cmpRemarks")
	private String cmpRemarks;
	@Column(name = "cmpRemarks2")
	private String cmpRemarks2;
	@Column(name = "cmpRemarks3")
	private String cmpRemarks3;
	@Column(name = "cmpRemarks4")
	private String cmpRemarks4;
	@Column(name = "billHeader")
	private String billHeader;
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
	

	public String getCmpCode() {
		return cmpCode;
	}
	public void setCmpCode(String cmpCode) {
		this.cmpCode = cmpCode;
	}
	public String getCmpName() {
		return cmpName;
	}
	public void setCmpName(String cmpName) {
		this.cmpName = cmpName;
	}
	public String getCmpShortnm() {
		return cmpShortnm;
	}
	public void setCmpShortnm(String cmpShortnm) {
		this.cmpShortnm = cmpShortnm;
	}
	public String getCmpAdd1() {
		return cmpAdd1;
	}
	public void setCmpAdd1(String cmpAdd1) {
		this.cmpAdd1 = cmpAdd1;
	}
	public String getCmpAdd2() {
		return cmpAdd2;
	}
	public void setCmpAdd2(String cmpAdd2) {
		this.cmpAdd2 = cmpAdd2;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCmpAddPin() {
		return cmpAddPin;
	}
	public void setCmpAddPin(String cmpAddPin) {
		this.cmpAddPin = cmpAddPin;
	}
	public String getCmpTel() {
		return cmpTel;
	}
	public void setCmpTel(String cmpTel) {
		this.cmpTel = cmpTel;
	}
	public String getCmpFax() {
		return cmpFax;
	}
	public void setCmpFax(String cmpFax) {
		this.cmpFax = cmpFax;
	}
	public String getCmpWebadd() {
		return cmpWebadd;
	}
	public void setCmpWebadd(String cmpWebadd) {
		this.cmpWebadd = cmpWebadd;
	}
	public String getCmpBhnm() {
		return cmpBhnm;
	}
	public void setCmpBhnm(String cmpBhnm) {
		this.cmpBhnm = cmpBhnm;
	}
	public String getCmpConnm() {
		return cmpConnm;
	}
	public void setCmpConnm(String cmpConnm) {
		this.cmpConnm = cmpConnm;
	}
	public String getCmpContel() {
		return cmpContel;
	}
	public void setCmpContel(String cmpContel) {
		this.cmpContel = cmpContel;
	}
	public String getCmpConemail() {
		return cmpConemail;
	}
	public void setCmpConemail(String cmpConemail) {
		this.cmpConemail = cmpConemail;
	}
	public String getCmpRemarks() {
		return cmpRemarks;
	}
	public void setCmpRemarks(String cmpRemarks) {
		this.cmpRemarks = cmpRemarks;
	}
	public String getCmpRemarks2() {
		return cmpRemarks2;
	}
	public void setCmpRemarks2(String cmpRemarks2) {
		this.cmpRemarks2 = cmpRemarks2;
	}
	public String getCmpRemarks3() {
		return cmpRemarks3;
	}
	public void setCmpRemarks3(String cmpRemarks3) {
		this.cmpRemarks3 = cmpRemarks3;
	}
	public String getCmpRemarks4() {
		return cmpRemarks4;
	}
	public void setCmpRemarks4(String cmpRemarks4) {
		this.cmpRemarks4 = cmpRemarks4;
	}
	public String getBillHeader() {
		return billHeader;
	}
	public void setBillHeader(String billHeader) {
		this.billHeader = billHeader;
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
