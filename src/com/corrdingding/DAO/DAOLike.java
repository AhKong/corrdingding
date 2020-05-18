package com.corrdingding.DAO;
import java.sql.*;

import com.corrdingding.DriverDB.ConnectionDB;

public class DAOLike {
	private Connection conn = null;
	private PreparedStatement pstmt= null;
	private ResultSet rs = null;
	
	public DAOLike() throws ClassNotFoundException, SQLException{
		ConnectionDB db = new ConnectionDB();
		this.conn = db.DriverDB();
		System.out.println(this.conn +" conn in DAOContent.java");
	}
	
	public boolean isLiked(String userId, int contentCode) throws SQLException {
		
		pstmt = conn.prepareStatement("select * from tb_like where user_id =? and content_code =?");
		pstmt.setString(1, userId);
		pstmt.setInt(2,contentCode);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return true;
		} else {
			return false;
		}
	}
	
	public int insertLike(String userId, int contentCode) throws SQLException {
		pstmt = conn.prepareStatement("select max(CAST(substring(like_code,6) AS DECIMAL)) as maxcol from tb_like;");
		rs = pstmt.executeQuery();
		int max =0;
		String tempCode = "like_";
		String like_code = "like_1";
		if(rs.next()) {
			max = rs.getInt(1);
			max = max + 1;
		}
		System.out.println(max + "<-- max 2");
		like_code = tempCode + max;
		pstmt = conn.prepareStatement("insert into tb_like value(?,?,?,now())");
		pstmt.setString(1, like_code);
		pstmt.setString(2, userId);
		pstmt.setInt(3, contentCode);
		int result = pstmt.executeUpdate();
		
		if(result >0) {
			System.out.println("insert like query ok");
			
		} else {
			System.out.println("insert like query fail");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return result;
	}
	
	public int cancelLike(String userId, int contentCode) throws SQLException  {
		pstmt = conn.prepareStatement("delete  from tb_like where user_id = ? and content_code =?");
		pstmt.setString(1, userId);
		pstmt.setInt(2, contentCode);
		int result = pstmt.executeUpdate();
		if(result >0) {
			System.out.println("delete like query ok");
		} else {
			System.out.println("delete like query fail");
		}
		pstmt.close();
		conn.close();
		
		return result;
	}
	

}
