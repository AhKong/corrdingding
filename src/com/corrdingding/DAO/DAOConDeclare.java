
package com.corrdingding.DAO;
import java.sql.*;
import com.corrdingding.DTO.ContentDeclare;
import com.corrdingding.DriverDB.ConnectionDB;

public class DAOConDeclare {
	private Connection conn = null;
	private PreparedStatement pstmt= null;
	private ResultSet rs = null;
	
	public DAOConDeclare() throws ClassNotFoundException, SQLException{
		ConnectionDB db = new ConnectionDB();
		this.conn = db.DriverDB();
		System.out.println(this.conn +" conn in DAOConDeclare.java");
	}
	
	public boolean isDeclared (String userId, int contentCode) throws SQLException {
		pstmt = conn.prepareStatement("select user_id from tb_con_declare where user_id =? and content_code =?");
		pstmt.setString(1, userId);
		pstmt.setInt(2, contentCode);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return true;
		} else {
			return false;			
		}
	}
	
	public int declareContent(ContentDeclare declare) throws SQLException {
		pstmt = conn.prepareStatement("select max(CAST(substring(con_declare_code,13) AS DECIMAL)) as maxcol from tb_con_declare;");
		rs = pstmt.executeQuery();
		int max =0;
		String tempCode = "con_declare_";
		String declare_code = "con_declare_1";
		if(rs.next()) {
			max = rs.getInt(1);
			max = max + 1;
		}
		System.out.println(max + "<-- max 2");
		declare_code = tempCode + max;
		pstmt = conn.prepareStatement("insert into tb_con_declare values(?,?,?,?,?,now());");
		pstmt.setString(1,declare_code);
		pstmt.setString(2,declare.getUserId());
		pstmt.setInt(3, declare.getContentCode());
		pstmt.setInt(4, declare.getDeclareCode());
		pstmt.setString(5, declare.getDeclareDesc());
		System.out.println(pstmt+"<sdfjlksjdfl!~!!!");
		int result = pstmt.executeUpdate();
		if(result >0) {
			System.out.println("insert content declare query ok");
		} else {
			System.out.println("insert content declare query fail");
		}
		rs.close();
		pstmt.close();
		conn.close();	
		return result;
	}

}
