package com.corrdingding.DTO;

public class Comment {
	
	private String comment_code;
	private int content_code;
	private String user_id;
	private String comment_desc;
	private String comment_reg_time;
	
	public String getComment_code() {
		return comment_code;
	}
	public void setComment_code(String comment_code) {
		this.comment_code = comment_code;
	}
	public int getContent_code() {
		return content_code;
	}
	public void setContent_code(int content_code) {
		this.content_code = content_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComment_desc() {
		return comment_desc;
	}
	public void setComment_desc(String comment_desc) {
		this.comment_desc = comment_desc;
	}
	public String getComment_reg_time() {
		return comment_reg_time;
	}
	public void setComment_reg_time(String comment_reg_time) {
		this.comment_reg_time = comment_reg_time;
	}
	@Override
	public String toString() {
		return "Comment [comment_code=" + comment_code + ", content_code=" + content_code + ", user_id=" + user_id
				+ ", comment_desc=" + comment_desc + ", comment_reg_time=" + comment_reg_time + "]";
	}
	
}
