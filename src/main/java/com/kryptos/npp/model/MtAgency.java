package com.kryptos.npp.model;
@Entity
@Table(name = "mtAgency")

public class MtAgency {
	
	@Id
	@GeneratedValue
	@Column(name = "mtAgency_id")
	private int mtAgencyId;
	
	public int getMtAgencyId() {
		return mtAgencyId;
	}
	public void setMtAgencyId(int mtAgencyId) {
		this.mtAgencyId = mtAgencyId;
	}
	@Column(name = "agnCode")
	private String agnCode;
	@Column(name = "agnOrderBy")
	private int agnOrderBy;
	@Column(name = "agnName")
	private String agnName;
	@Column(name = "agnOldCode")
	private String agnOldCode;
	@Column(name = "ctgCode")
	private String ctgCode;
	@Column(name = "agnMarName")
	private String agnMarName;
	@Column(name = "dlvCode")
	private String dlvCode;
	@Column(name = "buildNo")
	private String buildNo;
	@Column(name = "wingNo")
	private String wingNo;
	@Column(name = "flatNo")
	private String flatNo;
	@Column(name = "agnAdd1")
	private String agnAdd1;
	@Column(name = "agnAdd2")
	private String agnAdd2;
	@Column(name = "areaCode")
	private String areaCode;
	@Column(name = "city")
	private String city;
	@Column(name = "country")
	private String country;
	@Column(name = "state")
	private String state;
	@Column(name = "routeCode")
	private String routeCode;
	@Column(name = "agnAddPin")
	private String agnAddPin;
	@Column(name = "agnTel")
	private String agnTel;
	@Column(name = "agnMob")
	private String agnMob;
	@Column(name = "agnFax")
	private String agnFax;
	@Column(name = "susReopFlg")
	private String susReopFlg;
	@Column(name = "susDt")
	private String susDt;
	@Column(name = "reopenDt")
	private String reopenDt;
	@Column(name = "agnOsAmt")
	private double agnOsAmt;
	@Column(name = "billFreq")
	private String billFreq;
	@Column(name = "rateCode")
	private String rateCode;
	@Column(name = "commCode")
	private String commCode;
	@Column(name = "secDedFlg")
	private String secDedFlg;
	@Column(name = "secDedType")
	private String secDedType;
	@Column(name = "secDedVal")
	private double secDedVal;
	@Column(name = "creationDt")
	private String creationDt;
	@Column(name = "maker")
	private String maker;
	@Column(name = "makerDt")
	private String makerDt;
	@Column(name = "status")
	private String status;
	@Column(name = "totSdAmt")
	private double totSdAmt;
	@Column(name = "servChrg")
	private double servChrg;
	@Column(name = "lateChrg")
	private double lateChrg;
	@Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;
	@Column(name = "agnEmailId")
	private String agnEmailId;
	
	public String getAgnCode() {
		return agnCode;
	}
	public void setAgnCode(String agnCode) {
		this.agnCode = agnCode;
	}
	public int getAgnOrderBy() {
		return agnOrderBy;
	}
	public void setAgnOrderBy(int agnOrderBy) {
		this.agnOrderBy = agnOrderBy;
	}
	public String getAgnName() {
		return agnName;
	}
	public void setAgnName(String agnName) {
		this.agnName = agnName;
	}
	public String getAgnOldCode() {
		return agnOldCode;
	}
	public void setAgnOldCode(String agnOldCode) {
		this.agnOldCode = agnOldCode;
	}
	public String getCtgCode() {
		return ctgCode;
	}
	public void setCtgCode(String ctgCode) {
		this.ctgCode = ctgCode;
	}
	public String getAgnMarName() {
		return agnMarName;
	}
	public void setAgnMarName(String agnMarName) {
		this.agnMarName = agnMarName;
	}
	public String getDlvCode() {
		return dlvCode;
	}
	public void setDlvCode(String dlvCode) {
		this.dlvCode = dlvCode;
	}
	public String getBuildNo() {
		return buildNo;
	}
	public void setBuildNo(String buildNo) {
		this.buildNo = buildNo;
	}
	public String getWingNo() {
		return wingNo;
	}
	public void setWingNo(String wingNo) {
		this.wingNo = wingNo;
	}
	public String getFlatNo() {
		return flatNo;
	}
	public void setFlatNo(String flatNo) {
		this.flatNo = flatNo;
	}
	public String getAgnAdd1() {
		return agnAdd1;
	}
	public void setAgnAdd1(String agnAdd1) {
		this.agnAdd1 = agnAdd1;
	}
	public String getAgnAdd2() {
		return agnAdd2;
	}
	public void setAgnAdd2(String agnAdd2) {
		this.agnAdd2 = agnAdd2;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRouteCode() {
		return routeCode;
	}
	public void setRouteCode(String routeCode) {
		this.routeCode = routeCode;
	}
	public String getAgnAddPin() {
		return agnAddPin;
	}
	public void setAgnAddPin(String agnAddPin) {
		this.agnAddPin = agnAddPin;
	}
	public String getAgnTel() {
		return agnTel;
	}
	public void setAgnTel(String agnTel) {
		this.agnTel = agnTel;
	}
	public String getAgnMob() {
		return agnMob;
	}
	public void setAgnMob(String agnMob) {
		this.agnMob = agnMob;
	}
	public String getAgnFax() {
		return agnFax;
	}
	public void setAgnFax(String agnFax) {
		this.agnFax = agnFax;
	}
	public String getSusReopFlg() {
		return susReopFlg;
	}
	public void setSusReopFlg(String susReopFlg) {
		this.susReopFlg = susReopFlg;
	}
	public String getSusDt() {
		return susDt;
	}
	public void setSusDt(String susDt) {
		this.susDt = susDt;
	}
	public String getReopenDt() {
		return reopenDt;
	}
	public void setReopenDt(String reopenDt) {
		this.reopenDt = reopenDt;
	}
	public double getAgnOsAmt() {
		return agnOsAmt;
	}
	public void setAgnOsAmt(double agnOsAmt) {
		this.agnOsAmt = agnOsAmt;
	}
	public String getBillFreq() {
		return billFreq;
	}
	public void setBillFreq(String billFreq) {
		this.billFreq = billFreq;
	}
	public String getRateCode() {
		return rateCode;
	}
	public void setRateCode(String rateCode) {
		this.rateCode = rateCode;
	}
	public String getCommCode() {
		return commCode;
	}
	public void setCommCode(String commCode) {
		this.commCode = commCode;
	}
	public String getSecDedFlg() {
		return secDedFlg;
	}
	public void setSecDedFlg(String secDedFlg) {
		this.secDedFlg = secDedFlg;
	}
	public String getSecDedType() {
		return secDedType;
	}
	public void setSecDedType(String secDedType) {
		this.secDedType = secDedType;
	}
	public double getSecDedVal() {
		return secDedVal;
	}
	public void setSecDedVal(double secDedVal) {
		this.secDedVal = secDedVal;
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
	public double getTotSdAmt() {
		return totSdAmt;
	}
	public void setTotSdAmt(double totSdAmt) {
		this.totSdAmt = totSdAmt;
	}
	public double getServChrg() {
		return servChrg;
	}
	public void setServChrg(double servChrg) {
		this.servChrg = servChrg;
	}
	public double getLateChrg() {
		return lateChrg;
	}
	public void setLateChrg(double lateChrg) {
		this.lateChrg = lateChrg;
	}
	public String getLoginUsrVendorId() {
		return loginUsrVendorId;
	}
	public void setLoginUsrVendorId(String loginUsrVendorId) {
		this.loginUsrVendorId = loginUsrVendorId;
	}
	public String getAgnEmailId() {
		return agnEmailId;
	}
	public void setAgnEmailId(String agnEmailId) {
		this.agnEmailId = agnEmailId;
	}
	
}
