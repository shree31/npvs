package com.kryptos.npp.model;
@Entity
@Table(name="mtCommission")
public class MtCommission {
	@Id
	@GeneratedValue
	@Column(name = "mtCommission_id")
	private int mtCommissionId;
	
	public int getMtCommissionId() {
		return mtCommissionId;
	}
	public void setMtCommissionId(int mtCommissionId) {
		this.mtCommissionId = mtCommissionId;
	}
	@Column(name="commCode")
	private String commCode;
	@Column(name="commName")
	private String commName;
	@Column(name="commMon")
	private double commMon;
	@Column(name="commTue")
	private double commTue;
	@Column(name="commWed")
	private double commWed;
	@Column(name="commThu")
	private double commThu;
	@Column(name="commFri")
	private double commFri;
	@Column(name="commSat")
	private double commSat;
	@Column(name="commSun")
	private double commSun;
	@Column(name="addCommMon")
	private double addCommMon;
	@Column(name="addCommTue")
	private double addCommTue;
	@Column(name="addCommWed")
	private double addCommWed;
	@Column(name="addCommThu")
	private double addCommThu;
	@Column(name="addCommFri")
	private double addCommFri;
	@Column(name="addCommSat")
	private double addCommSat;
	@Column(name="addCommSun")
	private double addCommSun;
	@Column(name="incMon")
	private double incMon;
	@Column(name="incTue")
	private double incTue;
	@Column(name="incWed")
	private double incWed;
	@Column(name="incThu")
	private double incThu;
	@Column(name="incFri")
	private double incFri;
	@Column(name="incSat")
	private double incSat;
	@Column(name="incSun")
	private double incSun;
	@Column(name="insMon")
	private double insMon;
	@Column(name="insTue")
	private double insTue;
	@Column(name="insWed")
	private double insWed;
	@Column(name="insThu")
	 private double insThu;
	@Column(name="insFri")
	private double insFri;
	@Column(name="insSat")
	private double insSat;
	@Column(name="insSun")
	 private double insSun;
	@Column(name="creationDt")
	 private String creationDt;
	@Column(name="maker")
	private String maker;
	@Column(name="makerDt")
	 private String  makerDt;
	@Column(name="status")
	private String status;
	@Column(name="pubCode")
	private String pubCode;
	@Column(name="oldCode")
	private String oldCode;
	@Column(name="loginUsrVendorId")
	private String loginUsrVendorId;
	public String getCommCode() {
		return commCode;
	}
	public void setCommCode(String commCode) {
		this.commCode = commCode;
	}
	public String getCommName() {
		return commName;
	}
	public void setCommName(String commName) {
		this.commName = commName;
	}
	public double getCommMon() {
		return commMon;
	}
	public void setCommMon(double commMon) {
		this.commMon = commMon;
	}
	public double getCommTue() {
		return commTue;
	}
	public void setCommTue(double commTue) {
		this.commTue = commTue;
	}
	public double getCommWed() {
		return commWed;
	}
	public void setCommWed(double commWed) {
		this.commWed = commWed;
	}
	public double getCommThu() {
		return commThu;
	}
	public void setCommThu(double commThu) {
		this.commThu = commThu;
	}
	public double getCommFri() {
		return commFri;
	}
	public void setCommFri(double commFri) {
		this.commFri = commFri;
	}
	public double getCommSat() {
		return commSat;
	}
	public void setCommSat(double commSat) {
		this.commSat = commSat;
	}
	public double getCommSun() {
		return commSun;
	}
	public void setCommSun(double commSun) {
		this.commSun = commSun;
	}
	public double getAddCommMon() {
		return addCommMon;
	}
	public void setAddCommMon(double addCommMon) {
		this.addCommMon = addCommMon;
	}
	public double getAddCommTue() {
		return addCommTue;
	}
	public void setAddCommTue(double addCommTue) {
		this.addCommTue = addCommTue;
	}
	public double getAddCommWed() {
		return addCommWed;
	}
	public void setAddCommWed(double addCommWed) {
		this.addCommWed = addCommWed;
	}
	public double getAddCommThu() {
		return addCommThu;
	}
	public void setAddCommThu(double addCommThu) {
		this.addCommThu = addCommThu;
	}
	public double getAddCommFri() {
		return addCommFri;
	}
	public void setAddCommFri(double addCommFri) {
		this.addCommFri = addCommFri;
	}
	public double getAddCommSat() {
		return addCommSat;
	}
	public void setAddCommSat(double addCommSat) {
		this.addCommSat = addCommSat;
	}
	public double getAddCommSun() {
		return addCommSun;
	}
	public void setAddCommSun(double addCommSun) {
		this.addCommSun = addCommSun;
	}
	public double getIncMon() {
		return incMon;
	}
	public void setIncMon(double incMon) {
		this.incMon = incMon;
	}
	public double getIncTue() {
		return incTue;
	}
	public void setIncTue(double incTue) {
		this.incTue = incTue;
	}
	public double getIncWed() {
		return incWed;
	}
	public void setIncWed(double incWed) {
		this.incWed = incWed;
	}
	public double getIncThu() {
		return incThu;
	}
	public void setIncThu(double incThu) {
		this.incThu = incThu;
	}
	public double getIncFri() {
		return incFri;
	}
	public void setIncFri(double incFri) {
		this.incFri = incFri;
	}
	public double getIncSat() {
		return incSat;
	}
	public void setIncSat(double incSat) {
		this.incSat = incSat;
	}
	public double getIncSun() {
		return incSun;
	}
	public void setIncSun(double incSun) {
		this.incSun = incSun;
	}
	public double getInsMon() {
		return insMon;
	}
	public void setInsMon(double insMon) {
		this.insMon = insMon;
	}
	public double getInsTue() {
		return insTue;
	}
	public void setInsTue(double insTue) {
		this.insTue = insTue;
	}
	public double getInsWed() {
		return insWed;
	}
	public void setInsWed(double insWed) {
		this.insWed = insWed;
	}
	public double getInsThu() {
		return insThu;
	}
	public void setInsThu(double insThu) {
		this.insThu = insThu;
	}
	public double getInsFri() {
		return insFri;
	}
	public void setInsFri(double insFri) {
		this.insFri = insFri;
	}
	public double getInsSat() {
		return insSat;
	}
	public void setInsSat(double insSat) {
		this.insSat = insSat;
	}
	public double getInsSun() {
		return insSun;
	}
	public void setInsSun(double insSun) {
		this.insSun = insSun;
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
	public String getPubCode() {
		return pubCode;
	}
	public void setPubCode(String pubCode) {
		this.pubCode = pubCode;
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
