package com.corrdingding.DTO;


public class DTOContent {
	private int content_code;
	private String user_id;
	private String content_title;
	private String content_desc;
	private int view_count;
	private String content_reg_time;
	private String content_cate;
	
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
	public String getContent_title() {
		return content_title;
	}
	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}
	public String getContent_desc() {
		return content_desc;
	}
	public void setContent_desc(String content_desc) {
		this.content_desc = content_desc;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getContent_reg_time() {
		return content_reg_time;
	}
	public void setContent_reg_time(String content_reg_time) {
		this.content_reg_time = content_reg_time;
	}
	
	
	public String getContent_cate() {
		return content_cate;
	}
	public void setContent_cate(String content_cate) {
		this.content_cate = content_cate;
	}
	@Override
	public String toString() {
		return "DTOContent [content_code=" + content_code + ", user_id=" + user_id + ", content_title=" + content_title
				+ ", content_desc=" + content_desc + ", view_count=" + view_count + ", content_reg_time="
				+ content_reg_time + "]";
	}
	
	
	

}

