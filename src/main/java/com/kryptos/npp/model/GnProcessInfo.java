package com.kryptos.npp.model;
@Entity
@Table(name = "gnProcessInfo")

public class GnProcessInfo{
    @Id
	@GeneratedValue
	@Column(name = "gnProcessInfo_id")
	private int gnProcessInfoId;
	
	public int getGnProcessInfoId() {
		return gnProcessInfoId;
	}
	public void setGnProcessInfoId(int gnProcessInfoId) {
		this.gnProcessInfoId = gnProcessInfoId;
	}
	@Column(name = "processId")
	private String processId;
	
	@Column(name = "processName")
	private String processName;
	
	@Column(name = "processStatus")
	private String processStatus;
	
	@Column(name = "processDate")
	private String processDate;
	
	@Column(name = "fileName")
	private String fileName;
	
	@Column(name = "processUser")
	private String processUser;
	
	@Column(name = "loginUsrVendorId")
	private int loginUsrVendorId;
	
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	public String getProcessName() {
		return processName;
	}
	public void setProcessName(String processName) {
		this.processName = processName;
	}
	public String getProcessStatus() {
		return processStatus;
	}
	public void setProcessStatus(String processStatus) {
		this.processStatus = processStatus;
	}
	public String getProcessDate() {
		return processDate;
	}
	public void setProcessDate(String processDate) {
		this.processDate = processDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getProcessUser() {
		return processUser;
	}
	public void setProcessUser(String processUser) {
		this.processUser = processUser;
	}
	public int getLoginUsrVendorId() {
		return loginUsrVendorId;
	}
	public void setLoginUsrVendorId(int loginUsrVendorId) {
		this.loginUsrVendorId = loginUsrVendorId;
	}
	
}
