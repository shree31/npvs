package com.kryptos.npp.model;
@Entity
@Table(name = "mtCategory")
public class MtCategory {
	
	@Id
	@GeneratedValue
	@Column(name = "mtCategory_id")
	private int mtCategoryId;
	
	public int getMtCategoryId() {
		return mtCategoryId;
	}
	public void setMtCategoryId(int mtCategoryId) {
		this.mtCategoryId = mtCategoryId;
	}
	@Column(name = "ctgCode")
	private String ctgCode;
	@Column(name = "ctgName")
	private String ctgName;
	@Column(name = "ctgType")
	private String ctgType;
	@Column(name = "ctgPaidFlg")
	private String ctgPaidFlg;
	@Column(name = "creationDt")
	private String creationDt;
	@Column(name = "maker")
	private String maker;
	@Column(name = "makerDt")
	private String makerDt;
	@Column(name = "status")
	private String status;
	@Column(name = "servChrg")
	private double servChrg;
	@Column(name = "commPer")
	private Double commPer;
	@Column(name = "lateChrg")
	private double lateChrg;
	@Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;
	public String getCtgCode() {
		return ctgCode;
	}
	public void setCtgCode(String ctgCode) {
		this.ctgCode = ctgCode;
	}
	public String getCtgName() {
		return ctgName;
	}
	public void setCtgName(String ctgName) {
		this.ctgName = ctgName;
	}
	public String getCtgType() {
		return ctgType;
	}
	public void setCtgType(String ctgType) {
		this.ctgType = ctgType;
	}
	public String getCtgPaidFlg() {
		return ctgPaidFlg;
	}
	public void setCtgPaidFlg(String ctgPaidFlg) {
		this.ctgPaidFlg = ctgPaidFlg;
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
	public double getServChrg() {
		return servChrg;
	}
	public void setServChrg(double servChrg) {
		this.servChrg = servChrg;
	}
	public Double getCommPer() {
		return commPer;
	}
	public void setCommPer(Double commPer) {
		this.commPer = commPer;
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
	
	
}
