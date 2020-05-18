package com.corrdingding.DTO;

public class View {
		private String view_code;
		private String content_code;
		private String user_id;
		private String view_reg_time;
		public String getView_code() {
			return view_code;
		}
		public void setView_code(String view_code) {
			this.view_code = view_code;
		}
		public String getContent_code() {
			return content_code;
		}
		public void setContent_code(String content_code) {
			this.content_code = content_code;
		}
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public String getView_reg_time() {
			return view_reg_time;
		}
		public void setView_reg_time(String view_reg_time) {
			this.view_reg_time = view_reg_time;
		}
		@Override
		public String toString() {
			return "View [view_code=" + view_code + ", content_code=" + content_code + ", user_id=" + user_id
					+ ", view_reg_time=" + view_reg_time + "]";
		}
		
		
}
