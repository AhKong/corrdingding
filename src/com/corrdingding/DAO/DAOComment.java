package com.corrdingding.DAO;

import java.sql.*;
import java.util.ArrayList;

import com.corrdingding.DTO.Comment;
import com.corrdingding.DriverDB.ConnectionDB;
public class DAOComment {
	private Connection conn = null;
	private PreparedStatement pstmt= null;
	private ResultSet rs = null;
	private Comment comment = null;
	
	public DAOComment() throws ClassNotFoundException, SQLException{
		ConnectionDB db = new ConnectionDB();
		this.conn = db.DriverDB();
		System.out.println(this.conn +" conn in DAOComment.java");
	}
	
	public void insertComment(Comment comment) throws SQLException {
		pstmt = conn.prepareStatement("select max(CAST(substring(COMMENT_code,9) AS DECIMAL)) as maxcol from tb_comment");
		
		rs = pstmt.executeQuery();
		
		int max =0;
		String tempCode = "comment_";
		String comment_code = "comment_01";
		
		if(rs.next()){
			max = rs.getInt(1);
			System.out.println(max + "<-- max 1");
			max = max + 1;
			System.out.println(max + "<-- max 2");
			comment_code = tempCode + max;
		}
		pstmt= conn.prepareStatement("INSERT INTO tb_comment VALUES ( ?, ?, ?, ?, NOW())");
		pstmt.setString(1, comment_code);
		pstmt.setString(2, comment.getUser_id());
		pstmt.setInt(3, comment.getContent_code());
		pstmt.setString(4, comment.getComment_desc());
		System.out.println(pstmt + "<-- pstmt");
			
		int result = pstmt.executeUpdate();
		
		System.out.println(result + "<-- result");
		pstmt.close(); 
		conn.close();
	
	}
	
	public ArrayList<Comment> readComments(int contentCode) throws SQLException{
		
		pstmt = conn.prepareStatement("select * from tb_comment where content_code =?");
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		pstmt.setInt(1, contentCode);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			comment = new Comment();
			comment.setComment_code(rs.getString("comment_code"));
			comment.setUser_id(rs.getString("user_id"));
			comment.setComment_desc(rs.getString("comment_desc"));
			comment.setComment_reg_time(rs.getString("comment_reg_time"));
			commentList.add(comment);
		}
		
		return commentList;
		
	}
	
	public void updateComment(Comment comment) throws SQLException {
		System.out.println("댓글 수정 처리 시작");
		pstmt = conn.prepareStatement("UPDATE tb_comment SET comment_desc= ? WHERE comment_code = ?");
		pstmt.setString(1, comment.getComment_desc());
		pstmt.setString(2, comment.getUser_id());
		int result = pstmt.executeUpdate();
		if(result > 0) {
			System.out.println("update comment query ok");
		}else {
			System.out.println("update comment query fail");
		}
		
		pstmt.close();
		conn.close();
	}
	public void deleteComment(String commentCode) throws SQLException {
		System.out.println("댓글 삭제 처리 시작");
		pstmt = conn.prepareStatement( "DELETE FROM tb_comment WHERE comment_code= ?");
		pstmt.setString(1, commentCode);
		int result = pstmt.executeUpdate();
		if(result > 0) {
			System.out.println("delete comment query ok");
		}else {
			System.out.println("delete comment query fail");
		}
		
		pstmt.close();
		conn.close();
	}
	
	public boolean isMyComment(String userId,String commentCode) throws SQLException {
		pstmt = conn.prepareStatement("select comment_code from tb_comment where user_id= ? and comment_code =?");
		pstmt.setString(1, userId);
		pstmt.setString(2, commentCode);
		System.out.println(pstmt+"<dddsfs;ld!!");
		rs = pstmt.executeQuery();
		boolean result = false;
		if(rs.next()) {
			result = true;
		} else {
			result = false;
		}
	
		return result;
	}
	
}
