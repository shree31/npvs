package com.kryptos.npp.model;
@Entity
@Table(name = "mtExecutive")
public class MtExecutive {
	
	@Id
	@GeneratedValue
	@Column(name = "mtExecutive_id")
	private int mtExecutiveId;

	public int getMtExecutiveId() {
		return mtExecutiveId;
	}
	public void setMtExecutiveId(int mtExecutiveId) {
		this.mtExecutiveId = mtExecutiveId;
	}
	@Column(name = "execCode")
	private String execCode;
	@Column(name = "name")
	private String name;
	@Column(name = "type")
	private String type;
	@Column(name = "add1")
	private String add1;
	@Column(name = "add2")
	private String add2;
	@Column(name = "tel")
	private String tel;
	@Column(name = "mob")
	private String mob;
	@Column(name = "area")
	private String area;
	@Column(name = "amCode")
	private String amCode;
	@Column(name = "rmCode")
	private String rmCode;
	@Column(name = "zmCode")
	private String zmCode;
	@Column(name = "trgt")
	private String trgt;
	@Column(name = "trgtAch")
	private String trgtAch;
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

	public String getExecCode() {
		return execCode;
	}
	public void setExecCode(String execCode) {
		this.execCode = execCode;
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
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMob() {
		return mob;
	}
	public void setMob(String mob) {
		this.mob = mob;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAmCode() {
		return amCode;
	}
	public void setAmCode(String amCode) {
		this.amCode = amCode;
	}
	public String getRmCode() {
		return rmCode;
	}
	public void setRmCode(String rmCode) {
		this.rmCode = rmCode;
	}
	public String getZmCode() {
		return zmCode;
	}
	public void setZmCode(String zmCode) {
		this.zmCode = zmCode;
	}
	public String getTrgt() {
		return trgt;
	}
	public void setTrgt(String trgt) {
		this.trgt = trgt;
	}
	public String getTrgtAch() {
		return trgtAch;
	}
	public void setTrgtAch(String trgtAch) {
		this.trgtAch = trgtAch;
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
