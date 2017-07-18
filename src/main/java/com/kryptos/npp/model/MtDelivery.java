package com.kryptos.npp.model;
@Entity
@Table(name = "mtDelivery")

public class MtDelivery {
	
	@Id
	@GeneratedValue
	@Column(name = "mtDelivery_id")
	private int mtDeliveryId;


	public int getMtDeliveryId() {
		return mtDeliveryId;
	}
	public void setMtDeliveryId(int mtDeliveryId) {
		this.mtDeliveryId = mtDeliveryId;
	}
	@Column(name = "dlvCode")
	private String dlvCode;
	@Column(name = "name")
	private String name;
	@Column(name = "type")
	private String type;
	@Column(name = "marName")
	private String marName;
	@Column(name = "city")
	private String city;
	@Column(name = "areaCode")
	private String areaCode;
	@Column(name = "routeCode")
	private String routeCode;
	@Column(name = "priority")
	private String priority;
	@Column(name = "remarks")
	private String remarks;
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
	
	public String getDlvCode() {
		return dlvCode;
	}
	public void setDlvCode(String dlvCode) {
		this.dlvCode = dlvCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMarName() {
		return marName;
	}
	public void setMarName(String marName) {
		this.marName = marName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getRouteCode() {
		return routeCode;
	}
	public void setRouteCode(String routeCode) {
		this.routeCode = routeCode;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
