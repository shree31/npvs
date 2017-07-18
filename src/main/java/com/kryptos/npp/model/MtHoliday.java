package com.kryptos.npp.model;
@Entity
@Table(name = "mtHoliday")
public class MtHoliday {
	
	@Id
	@GeneratedValue
	@Column(name = "mtHoliday_id")
	private int mtHolidayId;

	public int getMtHolidayId() {
		return mtHolidayId;
	}
	public void setMtHolidayId(int mtHolidayId) {
		this.mtHolidayId = mtHolidayId;
	}
	@Column(name = "hldDATE")
	private String hldDATE;
	@Column(name = "hldDesc")
	private String hldDesc;
	@Column(name = "hldValidAllyr")
	private String hldValidAllyr;
	@Column(name = "hldType")
	private String hldType;
	@Column(name = "pubCode")
	private String pubCode;
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
	
	public String getHldDATE() {
		return hldDATE;
	}
	public void setHldDATE(String hldDATE) {
		this.hldDATE = hldDATE;
	}
	public String getHldDesc() {
		return hldDesc;
	}
	public void setHldDesc(String hldDesc) {
		this.hldDesc = hldDesc;
	}
	public String getHldValidAllyr() {
		return hldValidAllyr;
	}
	public void setHldValidAllyr(String hldValidAllyr) {
		this.hldValidAllyr = hldValidAllyr;
	}
	public String getHldType() {
		return hldType;
	}
	public void setHldType(String hldType) {
		this.hldType = hldType;
	}
	public String getPubCode() {
		return pubCode;
	}
	public void setPubCode(String pubCode) {
		this.pubCode = pubCode;
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
