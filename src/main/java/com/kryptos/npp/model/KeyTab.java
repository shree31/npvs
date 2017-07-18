package com.kryptos.npp.model;
@Entity
@Table(name = "keyTab")
public class KeyTab {
	
	@Id
	@GeneratedValue
	@Column(name = "keyTab_id")
	private int keyTabId; 
	
	public int getKeyTabId() {
		return keyTabId;
	}
	public void setKeyTabId(int keyTabId) {
		this.keyTabId = keyTabId;
	}
	@Column(name = "keyEnc")
	private String keyEnc;
	@Column(name = "loginUsrVendorId")
	private String loginUsrLoginId;
	public String getKeyEnc() {
		return keyEnc;
	}
	public void setKeyEnc(String keyEnc) {
		this.keyEnc = keyEnc;
	}
	public String getLoginUsrLoginId() {
		return loginUsrLoginId;
	}
	public void setLoginUsrLoginId(String loginUsrLoginId) {
		this.loginUsrLoginId = loginUsrLoginId;
	}
	
}
