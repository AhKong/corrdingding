package com.corrdingding.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.corrdingding.DTO.Comment;
import com.corrdingding.DriverDB.ConnectionDB;

public class DAOdelete {
	PreparedStatement pstmt = null;
	Connection conn = null;
	ResultSet rs = null;
	Comment comm = null;
	public void Commdelete(String comment_desc) throws ClassNotFoundException, SQLException {
		System.out.println("댓글 삭제 처리 시작");
		ConnectionDB db = new ConnectionDB();
		conn =db.DriverDB();
		pstmt = conn.prepareStatement( "DELETE FROM tb_comment WHERE comment_desc= ?");
		pstmt.setString(1, comment_desc);
		System.out.println(pstmt +"<----pstmt 1");
		int result = pstmt.executeUpdate();
		System.out.println(result + "<---result 1");
		pstmt.close();
		conn.close();
	}
	
}
		
