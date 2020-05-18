package com.corrdingding.DTO;

public class ContentDeclare {

	private String conDeclareCode ;
	private String userId;
	private int contentCode;
	private int declareCode;
	private String declareDesc;
	private String declareRegTime;
	public String getConDeclareCode() {
		return conDeclareCode;
	}
	public void setConDeclareCode(String conDeclareCode) {
		this.conDeclareCode = conDeclareCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getContentCode() {
		return contentCode;
	}
	public void setContentCode(int contentCode) {
		this.contentCode = contentCode;
	}
	public int getDeclareCode() {
		return declareCode;
	}
	public void setDeclareCode(int declareCode) {
		this.declareCode = declareCode;
	}
	public String getDeclareDesc() {
		return declareDesc;
	}
	public void setDeclareDesc(String declareDesc) {
		this.declareDesc = declareDesc;
	}
	public String getDeclareRegTime() {
		return declareRegTime;
	}
	public void setDeclareRegTime(String declareRegTime) {
		this.declareRegTime = declareRegTime;
	}
	@Override
	public String toString() {
		return "ContentDeclare [conDeclareCode=" + conDeclareCode + ", userId=" + userId + ", contentCode="
				+ contentCode + ", declareCode=" + declareCode + ", declareDesc=" + declareDesc + ", declareRegTime="
				+ declareRegTime + "]";
	}
	
	
}
