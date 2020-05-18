package com.corrdingding.DTO;

public class Like {
	 private String likeCode;
	 private String userId;
	 private int contentCode;
	 private int likeRegTime;
	 
	public String getLikeCode() {
		return likeCode;
	}
	public void setLikeCode(String likeCode) {
		this.likeCode = likeCode;
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
	public int getLikeRegTime() {
		return likeRegTime;
	}
	public void setLikeRegTime(int likeRegTime) {
		this.likeRegTime = likeRegTime;
	}
	@Override
	public String toString() {
		return "Like [likeCode=" + likeCode + ", userId=" + userId + ", contentCode=" + contentCode + ", likeRegTime="
				+ likeRegTime + "]";
	}
	 
	 

}
