package com.kryptos.npp.model;
@Entity
@Table(name = "mtDistentry")
public class MtDistentry {
	
	@Id
	@GeneratedValue
	@Column(name = "mtDistentry_id")
	private int mtDistentryId;

	public int getMtDistentryId() {
		return mtDistentryId;
	}
	public void setMtDistentryId(int mtDistentryId) {
		this.mtDistentryId = mtDistentryId;
	}
	@Column(name = "distCd")
	private String distCd;
	@Column(name = "pubCode")
	private String pubCode;
	@Column(name = "supDt")
	private String supDt;
	@Column(name = "lineCopy")
	private String lineCopy;
	@Column(name = "stallCopy")
	private String stallCopy;
	@Column(name = "freeCopy")
	private String freeCopy;
	@Column(name = "total")
	private String total;
	@Column(name = "purRt")
	private String purRt;
	@Column(name = "totAmt")
	private String totAmt;
	@Column(name = "retRate")
	private String retRate;
	@Column(name = "retCopy")
	private String retCopy;
	@Column(name = "totRetAmt")
	private String totRetAmt;
	@Column(name = "payAmt")
	private String payAmt;
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
	@Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;
	
	public String getDistCd() {
		return distCd;
	}
	public void setDistCd(String distCd) {
		this.distCd = distCd;
	}
	public String getPubCode() {
		return pubCode;
	}
	public void setPubCode(String pubCode) {
		this.pubCode = pubCode;
	}
	public String getSupDt() {
		return supDt;
	}
	public void setSupDt(String supDt) {
		this.supDt = supDt;
	}
	public String getLineCopy() {
		return lineCopy;
	}
	public void setLineCopy(String lineCopy) {
		this.lineCopy = lineCopy;
	}
	public String getStallCopy() {
		return stallCopy;
	}
	public void setStallCopy(String stallCopy) {
		this.stallCopy = stallCopy;
	}
	public String getFreeCopy() {
		return freeCopy;
	}
	public void setFreeCopy(String freeCopy) {
		this.freeCopy = freeCopy;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getPurRt() {
		return purRt;
	}
	public void setPurRt(String purRt) {
		this.purRt = purRt;
	}
	public String getTotAmt() {
		return totAmt;
	}
	public void setTotAmt(String totAmt) {
		this.totAmt = totAmt;
	}
	public String getRetRate() {
		return retRate;
	}
	public void setRetRate(String retRate) {
		this.retRate = retRate;
	}
	public String getRetCopy() {
		return retCopy;
	}
	public void setRetCopy(String retCopy) {
		this.retCopy = retCopy;
	}
	public String getTotRetAmt() {
		return totRetAmt;
	}
	public void setTotRetAmt(String totRetAmt) {
		this.totRetAmt = totRetAmt;
	}
	public String getPayAmt() {
		return payAmt;
	}
	public void setPayAmt(String payAmt) {
		this.payAmt = payAmt;
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
	public String getLoginUsrVendorId() {
		return loginUsrVendorId;
	}
	public void setLoginUsrVendorId(String loginUsrVendorId) {
		this.loginUsrVendorId = loginUsrVendorId;
	}

}
