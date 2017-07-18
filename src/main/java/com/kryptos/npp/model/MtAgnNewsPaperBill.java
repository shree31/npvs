package com.kryptos.npp.model;
@Entity
@Table(name = "mtAgnNewsPaperBill")
public class MtAgnNewsPaperBill {
	@Id
	@GeneratedValue
	@Column(name = "mtAgnNewsPaperBill_id")
	private int mtAgnNewsPaperBillId;
	
	
	public int getMtAgnNewsPaperBillId() {
		return mtAgnNewsPaperBillId;
	}
	public void setMtAgnNewsPaperBillId(int mtAgnNewsPaperBillId) {
		this.mtAgnNewsPaperBillId = mtAgnNewsPaperBillId;
	}
	@Column(name = "agnCode")
	private String agnCode;
	@Column(name = "pubCode")
	private String pubCode;
	@Column(name = "copyStartDate")
	private String copyStartDate;
	@Column(name = "pymtMode")
	private String pymtMode;
	@Column(name = "day1")
	private int day1;
	@Column(name = "day2")
	private int day2;
	@Column(name = "day3")
	private int day3;
	@Column(name = "day4")
	private int day4;
	@Column(name = "day5")
	private int day5;
	@Column(name = "day6")
	private int day6;
	@Column(name = "day7")
	private int day7;
	@Column(name = "day8")
	private int day8;
	@Column(name = "day9")
	private int day9;
	@Column(name = "day10")
	private int day10;
	@Column(name = "day11")
	private int day11;
	@Column(name = "day12")
	private int day12;
	@Column(name = "day13")
	private int day13;
	@Column(name = "day14")
	private int day14;
	@Column(name = "day15")
	private int day15;
	@Column(name = "day16")
	private int day16;
	@Column(name = "day17")
	private int day17;
	@Column(name = "day18")
	private int day18;
	@Column(name = "day19")
	private int day19;
	@Column(name = "day20")
	private int day20;
	@Column(name = "day21")
	private int day21;
	@Column(name = "day22")
	private int day22;
	@Column(name = "day23")
	private int day23;
	@Column(name = "day24")
	private int day24;
	@Column(name = "day25")
	private int day25;
	@Column(name = "day26")
	private int day26;
	@Column(name = "day27")
	private int day27;
	@Column(name = "day28")
	private int day28;
	@Column(name = "agnCode")
	private int day29;
	@Column(name = "day30")
	private int day30;
	@Column(name = "day31")
	private int day31;
	@Column(name = "creationDt")
	private String creationDt;
	@Column(name = "maker")
	private String maker;
	@Column(name = "makerDt")
	private String makerDt;
	@Column(name = "status")
	private String status;
	@Column(name = "wkSup")
	private String wkSup;
	@Column(name = "copy")
	private int copy;
	@Column(name = "avdCoupon")
	private int avdCoupon;
	@Column(name = "paperCont")
	private String paperCont;
	@Column(name = "couponNo")
	private String couponNo;
	@Column(name = "cpnStDt")
	private String cpnStDt;
	@Column(name = "cpnEnDt")
	private String cpnEnDt;
	@Column(name = "commPer")
	private double commPer;
	@Column(name = "pubRun")
	private String pubRun;
	@Column(name = "pubDay1")
	private int pubDay1;
	@Column(name = "pubDay2")
	private int pubDay2;
	@Column(name = "pubDt")
	private String pubDt;
	@Column(name = "pubDtAllFlg")
	private String pubDtAllFlg;
	@Column(name = "servChrg")
	private double servChrg;
	@Column(name = "loginUsrVendorId")
	private String loginUsrVendorId;
	@Column(name = "billDate")
	private String billDate;
	public String getAgnCode() {
		return agnCode;
	}
	public void setAgnCode(String agnCode) {
		this.agnCode = agnCode;
	}
	public String getPubCode() {
		return pubCode;
	}
	public void setPubCode(String pubCode) {
		this.pubCode = pubCode;
	}
	public String getCopyStartDate() {
		return copyStartDate;
	}
	public void setCopyStartDate(String copyStartDate) {
		this.copyStartDate = copyStartDate;
	}
	public String getPymtMode() {
		return pymtMode;
	}
	public void setPymtMode(String pymtMode) {
		this.pymtMode = pymtMode;
	}
	public int getDay1() {
		return day1;
	}
	public void setDay1(int day1) {
		this.day1 = day1;
	}
	public int getDay2() {
		return day2;
	}
	public void setDay2(int day2) {
		this.day2 = day2;
	}
	public int getDay3() {
		return day3;
	}
	public void setDay3(int day3) {
		this.day3 = day3;
	}
	public int getDay4() {
		return day4;
	}
	public void setDay4(int day4) {
		this.day4 = day4;
	}
	public int getDay5() {
		return day5;
	}
	public void setDay5(int day5) {
		this.day5 = day5;
	}
	public int getDay6() {
		return day6;
	}
	public void setDay6(int day6) {
		this.day6 = day6;
	}
	public int getDay7() {
		return day7;
	}
	public void setDay7(int day7) {
		this.day7 = day7;
	}
	public int getDay8() {
		return day8;
	}
	public void setDay8(int day8) {
		this.day8 = day8;
	}
	public int getDay9() {
		return day9;
	}
	public void setDay9(int day9) {
		this.day9 = day9;
	}
	public int getDay10() {
		return day10;
	}
	public void setDay10(int day10) {
		this.day10 = day10;
	}
	public int getDay11() {
		return day11;
	}
	public void setDay11(int day11) {
		this.day11 = day11;
	}
	public int getDay12() {
		return day12;
	}
	public void setDay12(int day12) {
		this.day12 = day12;
	}
	public int getDay13() {
		return day13;
	}
	public void setDay13(int day13) {
		this.day13 = day13;
	}
	public int getDay14() {
		return day14;
	}
	public void setDay14(int day14) {
		this.day14 = day14;
	}
	public int getDay15() {
		return day15;
	}
	public void setDay15(int day15) {
		this.day15 = day15;
	}
	public int getDay16() {
		return day16;
	}
	public void setDay16(int day16) {
		this.day16 = day16;
	}
	public int getDay17() {
		return day17;
	}
	public void setDay17(int day17) {
		this.day17 = day17;
	}
	public int getDay18() {
		return day18;
	}
	public void setDay18(int day18) {
		this.day18 = day18;
	}
	public int getDay19() {
		return day19;
	}
	public void setDay19(int day19) {
		this.day19 = day19;
	}
	public int getDay20() {
		return day20;
	}
	public void setDay20(int day20) {
		this.day20 = day20;
	}
	public int getDay21() {
		return day21;
	}
	public void setDay21(int day21) {
		this.day21 = day21;
	}
	public int getDay22() {
		return day22;
	}
	public void setDay22(int day22) {
		this.day22 = day22;
	}
	public int getDay23() {
		return day23;
	}
	public void setDay23(int day23) {
		this.day23 = day23;
	}
	public int getDay24() {
		return day24;
	}
	public void setDay24(int day24) {
		this.day24 = day24;
	}
	public int getDay25() {
		return day25;
	}
	public void setDay25(int day25) {
		this.day25 = day25;
	}
	public int getDay26() {
		return day26;
	}
	public void setDay26(int day26) {
		this.day26 = day26;
	}
	public int getDay27() {
		return day27;
	}
	public void setDay27(int day27) {
		this.day27 = day27;
	}
	public int getDay28() {
		return day28;
	}
	public void setDay28(int day28) {
		this.day28 = day28;
	}
	public int getDay29() {
		return day29;
	}
	public void setDay29(int day29) {
		this.day29 = day29;
	}
	public int getDay30() {
		return day30;
	}
	public void setDay30(int day30) {
		this.day30 = day30;
	}
	public int getDay31() {
		return day31;
	}
	public void setDay31(int day31) {
		this.day31 = day31;
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
	public String getWkSup() {
		return wkSup;
	}
	public void setWkSup(String wkSup) {
		this.wkSup = wkSup;
	}
	public int getCopy() {
		return copy;
	}
	public void setCopy(int copy) {
		this.copy = copy;
	}
	public int getAvdCoupon() {
		return avdCoupon;
	}
	public void setAvdCoupon(int avdCoupon) {
		this.avdCoupon = avdCoupon;
	}
	public String getPaperCont() {
		return paperCont;
	}
	public void setPaperCont(String paperCont) {
		this.paperCont = paperCont;
	}
	public String getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(String couponNo) {
		this.couponNo = couponNo;
	}
	public String getCpnStDt() {
		return cpnStDt;
	}
	public void setCpnStDt(String cpnStDt) {
		this.cpnStDt = cpnStDt;
	}
	public String getCpnEnDt() {
		return cpnEnDt;
	}
	public void setCpnEnDt(String cpnEnDt) {
		this.cpnEnDt = cpnEnDt;
	}
	public double getCommPer() {
		return commPer;
	}
	public void setCommPer(double commPer) {
		this.commPer = commPer;
	}
	public String getPubRun() {
		return pubRun;
	}
	public void setPubRun(String pubRun) {
		this.pubRun = pubRun;
	}
	public int getPubDay1() {
		return pubDay1;
	}
	public void setPubDay1(int pubDay1) {
		this.pubDay1 = pubDay1;
	}
	public int getPubDay2() {
		return pubDay2;
	}
	public void setPubDay2(int pubDay2) {
		this.pubDay2 = pubDay2;
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
	public double getServChrg() {
		return servChrg;
	}
	public void setServChrg(double servChrg) {
		this.servChrg = servChrg;
	}
	public String getLoginUsrVendorId() {
		return loginUsrVendorId;
	}
	public void setLoginUsrVendorId(String loginUsrVendorId) {
		this.loginUsrVendorId = loginUsrVendorId;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	
}
