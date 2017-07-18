package com.kryptos.npp.model;
@Entity
@Table(name = "mtAgnPaperStop")
public class MtAgnPaperStop {
	@Id
	@GeneratedValue
	@Column(name = "mtAgnPaperStop_id")
	private int mtAgnPaperStopId;
	
	public int getMtAgnPaperStopId() {
		return mtAgnPaperStopId;
	}
	public void setMtAgnPaperStopId(int mtAgnPaperStopId) {
		this.mtAgnPaperStopId = mtAgnPaperStopId;
	}
	@Column(name = "recNo")
	private int recNo;
	@Column(name = "agnCode")
	private String agnCode;
	@Column(name = "startDt")
	private String startDt;
	@Column(name = "endDt")
	private String endDt;
	@Column(name = "pubFlg")
	private String pubFlg;
	@Column(name = "pubCode")
	private String pubCode;
	@Column(name = "paperCont")
	private String paperCont;
	@Column(name = "effectDt")
	private String effectDt;
	@Column(name = "maker")
	private String maker;
	@Column(name = "makerDt")
	private String makerDt;
	@Column(name = "creationDt")
	private String creationDt;
	@Column(name = "status")
	private String status;
	@Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;
	public int getRecNo() {
		return recNo;
	}
	public void setRecNo(int recNo) {
		this.recNo = recNo;
	}
	public String getAgnCode() {
		return agnCode;
	}
	public void setAgnCode(String agnCode) {
		this.agnCode = agnCode;
	}
	public String getStartDt() {
		return startDt;
	}
	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public String getPubFlg() {
		return pubFlg;
	}
	public void setPubFlg(String pubFlg) {
		this.pubFlg = pubFlg;
	}
	public String getPubCode() {
		return pubCode;
	}
	public void setPubCode(String pubCode) {
		this.pubCode = pubCode;
	}
	public String getPaperCont() {
		return paperCont;
	}
	public void setPaperCont(String paperCont) {
		this.paperCont = paperCont;
	}
	public String getEffectDt() {
		return effectDt;
	}
	public void setEffectDt(String effectDt) {
		this.effectDt = effectDt;
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
	public String getCreationDt() {
		return creationDt;
	}
	public void setCreationDt(String creationDt) {
		this.creationDt = creationDt;
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
