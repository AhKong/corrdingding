package com.corrdingding.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.corrdingding.DTO.Comment;
import com.corrdingding.DriverDB.ConnectionDB;

public class DAOudate {
	
	PreparedStatement pstmt = null;
	Connection conn = null;
	ResultSet rs = null;
	Comment comm = null;
	
	private void Commupdate(String comment_code) throws ClassNotFoundException, SQLException {
		System.out.println("댓글 수정 처리 시작");
		ConnectionDB db = new ConnectionDB();
		conn = db.DriverDB();
		pstmt = conn.prepareStatement(
				"UPDATE tb_comment SET comment_desc= ? WHERE comment_code = ?");
		

	}
	

}
