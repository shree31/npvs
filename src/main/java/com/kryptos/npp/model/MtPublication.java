package com.kryptos.npp.model;
@Entity
@Table(name = "mtPublication")
public class MtPublication {
	
	@Id
	@GeneratedValue
	@Column(name = "mtPublication_id")
	private int mtPublicationId;

	public int getMtPublicationId() {
		return mtPublicationId;
	}
	public void setMtPublicationId(int mtPublicationId) {
		this.mtPublicationId = mtPublicationId;
	}
	@Column(name = "pubCode")
	private String pubCode;
	@Column(name = "pubName")
	private String pubName;
	@Column(name = "distCd")
	private String distCd;
	@Column(name = "pubOldCode")
	private String pubOldCode;
	@Column(name = "cmpCode")
	private String cmpCode;
	@Column(name = "pubAdd1")
	private String pubAdd1;
	@Column(name = "pubAdd2")
	private String pubAdd2;
	@Column(name = "state")
	private String state;
	@Column(name = "city")
	private String city;
	@Column(name = "country")
	private String country;
	@Column(name = "pubAddPin")
	private String pubAddPin;
	@Column(name = "pubTel")
	private String pubTel;
	@Column(name = "pubFax")
	private String pubFax;
	@Column(name = "pub_webadd")
	private String pub_webadd;
	@Column(name = "pubConemail")
	private String pubConemail;
	@Column(name = "pubType")
	private String pubType;
	@Column(name = "pubRun")
	private String pubRun;
	@Column(name = "pubLang")
	private String pubLang;
	@Column(name = "pubDays")
	private String pubDays;
	@Column(name = "pubDays1")
	private String pubDays1;
	@Column(name = "pubDays2")
	private String pubDays2;
	@Column(name = "creationDt")
	private String creationDt;
	@Column(name = "maker")
	private String maker;
	@Column(name = "makerDt")
	private String makerDt;
	@Column(name = "status")
	private String status;
	@Column(name = "pubDt")
	private String pubDt;
	@Column(name = "pubDtAllFlg")
	private String pubDtAllFlg;
	@Column(name = "couponCopyFlag")
	private String couponCopyFlag;
	@Column(name = "pubBase_sup")
	private String pubBase_sup;
	@Column(name = "login_usr_vendor_id")
	private String login_usr_vendor_id;
	
	public String getPubCode() {
		return pubCode;
	}
	public void setPubCode(String pubCode) {
		this.pubCode = pubCode;
	}
	public String getPubName() {
		return pubName;
	}
	public void setPubName(String pubName) {
		this.pubName = pubName;
	}
	public String getDistCd() {
		return distCd;
	}
	public void setDistCd(String distCd) {
		this.distCd = distCd;
	}
	public String getPubOldCode() {
		return pubOldCode;
	}
	public void setPubOldCode(String pubOldCode) {
		this.pubOldCode = pubOldCode;
	}
	public String getCmpCode() {
		return cmpCode;
	}
	public void setCmpCode(String cmpCode) {
		this.cmpCode = cmpCode;
	}
	public String getPubAdd1() {
		return pubAdd1;
	}
	public void setPubAdd1(String pubAdd1) {
		this.pubAdd1 = pubAdd1;
	}
	public String getPubAdd2() {
		return pubAdd2;
	}
	public void setPubAdd2(String pubAdd2) {
		this.pubAdd2 = pubAdd2;
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
	public String getPubAddPin() {
		return pubAddPin;
	}
	public void setPubAddPin(String pubAddPin) {
		this.pubAddPin = pubAddPin;
	}
	public String getPubTel() {
		return pubTel;
	}
	public void setPubTel(String pubTel) {
		this.pubTel = pubTel;
	}
	public String getPubFax() {
		return pubFax;
	}
	public void setPubFax(String pubFax) {
		this.pubFax = pubFax;
	}
	public String getPub_webadd() {
		return pub_webadd;
	}
	public void setPub_webadd(String pub_webadd) {
		this.pub_webadd = pub_webadd;
	}
	public String getPubConemail() {
		return pubConemail;
	}
	public void setPubConemail(String pubConemail) {
		this.pubConemail = pubConemail;
	}
	public String getPubType() {
		return pubType;
	}
	public void setPubType(String pubType) {
		this.pubType = pubType;
	}
	public String getPubRun() {
		return pubRun;
	}
	public void setPubRun(String pubRun) {
		this.pubRun = pubRun;
	}
	public String getPubLang() {
		return pubLang;
	}
	public void setPubLang(String pubLang) {
		this.pubLang = pubLang;
	}
	public String getPubDays() {
		return pubDays;
	}
	public void setPubDays(String pubDays) {
		this.pubDays = pubDays;
	}
	public String getPubDays1() {
		return pubDays1;
	}
	public void setPubDays1(String pubDays1) {
		this.pubDays1 = pubDays1;
	}
	public String getPubDays2() {
		return pubDays2;
	}
	public void setPubDays2(String pubDays2) {
		this.pubDays2 = pubDays2;
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
	public String getPubDt() {
		return pubDt;
	}
	public void setPubDt(String pubDt) {
		this.pubDt = pubDt;
	}
	public String getPubDtAllFlg() {
		return pubDtAllFlg;
	}
	public void setPubDtAllFlg(String pubDtAllFlg) {
		this.pubDtAllFlg = pubDtAllFlg;
	}
	public String getCouponCopyFlag() {
		return couponCopyFlag;
	}
	public void setCouponCopyFlag(String couponCopyFlag) {
		this.couponCopyFlag = couponCopyFlag;
	}
	public String getPubBase_sup() {
		return pubBase_sup;
	}
	public void setPubBase_sup(String pubBase_sup) {
		this.pubBase_sup = pubBase_sup;
	}
	public String getLogin_usr_vendor_id() {
		return login_usr_vendor_id;
	}
	public void setLogin_usr_vendor_id(String login_usr_vendor_id) {
		this.login_usr_vendor_id = login_usr_vendor_id;
	}

}
