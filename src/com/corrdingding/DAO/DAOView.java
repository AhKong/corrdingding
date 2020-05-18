package com.corrdingding.DAO;
import java.sql.*;

import com.corrdingding.DTO.DTOContent;
import com.corrdingding.DriverDB.ConnectionDB;


public class DAOView {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public DAOView() throws ClassNotFoundException, SQLException {
		ConnectionDB db = new ConnectionDB();
		this.conn = db.DriverDB();
		System.out.println(this.conn +" conn in DAOView.java");
	}
	
	public int checkView(String userId,int contentCode) throws SQLException {
		pstmt = conn.prepareStatement("select * from tb_view where user_id = ? AND content_code =?");
		pstmt.setString(1, userId);
		pstmt.setInt(2,contentCode);
		System.out.println(pstmt+"<---psmtmt view");
		rs = pstmt.executeQuery();
		int result = 0;
		
		if(rs.next()) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
		
	}
	
	public void insertView(String userId, int contentCode) throws SQLException {
		System.out.println("제대로 실행 되냐?");
		int check = checkView(userId,contentCode);
		System.out.println(check +"<----check!!!!!!!!!!!!");
		if(check ==1) {
			System.out.println("This user has already been viewed");
			
		} else if(check == 0) {
			pstmt = conn.prepareStatement("select max(CAST(substring(view_code,6) AS DECIMAL)) as maxcol from tb_view;");
			rs = pstmt.executeQuery();
			
			int max =0;
			String tempCode = "view_";
			String view_code = "view_01";
			if(rs.next()) {
				max = rs.getInt(1);
				max = max + 1;
			}
			System.out.println(max + "<-- max 2");
			view_code = tempCode + max;
			
			pstmt = conn.prepareStatement("insert into tb_view(view_code,user_id,content_code) values(?,?,?);");
			pstmt.setString(1, view_code);
			pstmt.setString(2,userId);
			pstmt.setInt(3, contentCode);
			System.out.println(pstmt +"<---view insert query");
			int result = pstmt.executeUpdate();
			if(result > 0 ) {
				System.out.println("insert view query ok"); 
			} else {
				System.out.println("insert view query fail"); 
			}
		}
		
		
	}
	
	public int viewCount(int contentCode) throws SQLException {
		pstmt = conn.prepareStatement("select count(*) from tb_view where content_code = ?");
		System.out.println("아악아악아악!~!!!!!!!!!!!!!!!!!!1");
		pstmt.setInt(1, contentCode);
		rs = pstmt.executeQuery();
		int result =0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return result;
	}
	
}
