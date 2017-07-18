package com.kryptos.npp.model;
@Entity
@Table(name = "mtRoute")
public class MtRoute {
	
	@Id
	@GeneratedValue
	@Column(name = "mtRoute_id")
	private int mtRouteId;

	public int getMtRouteId() {
		return mtRouteId;
	}
	public void setMtRouteId(int mtRouteId) {
		this.mtRouteId = mtRouteId;
	}
	@Column(name = "rateCode")
	private String rateCode;
	@Column(name = "name")
	private String name;
	@Column(name = "marName")
	private String marName;
	@Column(name = "stPnt")
	private String stPnt;
	@Column(name = "edPnt")
	private String edPnt;
	@Column(name = "tranMode")
	private String tranMode;
	@Column(name = "vanNo")
	private String vanNo;
	@Column(name = "rptTime")
	private String rptTime;
	@Column(name = "arvTime")
	private String arvTime;
	@Column(name = "distance")
	private String distance;
	@Column(name = "ratePerKm")
	private String ratePerKm;
	@Column(name = "rateMonthly")
	private String rateMonthly;
	@Column(name = "time")
	private String time;
	@Column(name = "validFlg")
	private String validFlg;
	@Column(name = "creationDt")
	private String creationDt;
	@Column(name = "maker")
	private String maker;
	@Column(name = "makerDt")
	private String makerDt;
	@Column(name = "status")
	private String status;
	@Column(name = "srNo")
	private String srNo;
	@Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;
	
	public String getRateCode() {
		return rateCode;
	}
	public void setRateCode(String rateCode) {
		this.rateCode = rateCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMarName() {
		return marName;
	}
	public void setMarName(String marName) {
		this.marName = marName;
	}
	public String getStPnt() {
		return stPnt;
	}
	public void setStPnt(String stPnt) {
		this.stPnt = stPnt;
	}
	public String getEdPnt() {
		return edPnt;
	}
	public void setEdPnt(String edPnt) {
		this.edPnt = edPnt;
	}
	public String getTranMode() {
		return tranMode;
	}
	public void setTranMode(String tranMode) {
		this.tranMode = tranMode;
	}
	public String getVanNo() {
		return vanNo;
	}
	public void setVanNo(String vanNo) {
		this.vanNo = vanNo;
	}
	public String getRptTime() {
		return rptTime;
	}
	public void setRptTime(String rptTime) {
		this.rptTime = rptTime;
	}
	public String getArvTime() {
		return arvTime;
	}
	public void setArvTime(String arvTime) {
		this.arvTime = arvTime;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getRatePerKm() {
		return ratePerKm;
	}
	public void setRatePerKm(String ratePerKm) {
		this.ratePerKm = ratePerKm;
	}
	public String getRateMonthly() {
		return rateMonthly;
	}
	public void setRateMonthly(String rateMonthly) {
		this.rateMonthly = rateMonthly;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getValidFlg() {
		return validFlg;
	}
	public void setValidFlg(String validFlg) {
		this.validFlg = validFlg;
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
	public String getSrNo() {
		return srNo;
	}
	public void setSrNo(String srNo) {
		this.srNo = srNo;
	}
	public String getLoginUsrVendorId() {
		return loginUsrVendorId;
	}
	public void setLoginUsrVendorId(String loginUsrVendorId) {
		this.loginUsrVendorId = loginUsrVendorId;
	}
	
}
