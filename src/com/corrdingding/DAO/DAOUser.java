package com.corrdingding.DAO;
import com.corrdingding.DTO.UserDto;
import com.corrdingding.DriverDB.ConnectionDB;
import java.sql.*;

public class DAOUser {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String re = null;
	UserDto userdto =null;
	
	public DAOUser() throws ClassNotFoundException, SQLException {
		ConnectionDB db = new ConnectionDB();
		this.conn = db.DriverDB();
		System.out.println(this.conn +" conn in DAOUser.java");
	}
	
	public int checkId(String userId) throws SQLException {
		System.out.println("test1");
		pstmt=conn.prepareStatement("select * from tb_user where user_id = ?");
		pstmt.setString(1,userId);
		System.out.println(pstmt +"<---1");
		rs = pstmt.executeQuery();
		System.out.println(pstmt);
		if(rs.next()) { // 중복된 아이디가 있을 경우
			rs.close();
			pstmt.close();
			conn.close();
			return 1;
			
		} else {
			rs.close();
			pstmt.close();
			conn.close();
			return 0; // 중복된 아이디 존재하지 않을 경우
		}
		
		
	}
	public int insertUser(UserDto user) throws SQLException, ClassNotFoundException {
	
		String uid=user.getUserId();
		String upw=user.getUserPw();
		String uname=user.getUserName();
		String uemail=user.getUserEmail();

		
		pstmt=conn.prepareStatement("INSERT INTO tb_user(user_id, user_pw, user_name, user_email,user_profile,user_intro) VALUES (?,?,?,?,?,?)");
		pstmt.setString(1, uid);
		pstmt.setString(2, upw);
		pstmt.setString(3, uname);
		pstmt.setString(4, uemail);
		pstmt.setString(5, user.getUserProfile());
		pstmt.setString(6,user.getUserIntro());
		
		int result = pstmt.executeUpdate();
		if(result > 0) {
			System.out.println(result +"insert user query ok");
		} else {
			System.out.println(result +"insert user query fail");
		}
		pstmt.close();
		conn.close();
		return result;
	}
	public UserDto searchUser(String id) throws SQLException {
		
		UserDto m=new UserDto();
		pstmt=conn.prepareStatement("select * from tb_user where user_id=?");
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			m.setUserPw(rs.getString("user_pw"));
			m.setUserEmail(rs.getString("user_email"));
			m.setUserName(rs.getString("user_name"));
			m.setUserIntro(rs.getString("user_intro"));
			m.setUserProfile(rs.getString("user_profile"));
		
		}
		rs.close();
		pstmt.close();
		conn.close();
		return m;
	}
	
	public String UserLogin(String user_id, String user_pw) throws SQLException {
		pstmt = conn.prepareStatement("SELECT user_id,user_pw,user_name,user_level FROM tb_user WHERE user_id =  ?");
		pstmt.setString(1, user_id);
		System.out.println(pstmt + "<-- pstmt");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs");
		//System.out.println(rs.next() + "<-- rs.next()");
		if(rs.next()){
			System.out.println("01 아이디 일치 조건");
			if(user_pw.equals(rs.getString("user_pw"))){
				System.out.println("03 로그인성공 조건");
				re = "로그인성공";
			}else{
				System.out.println("04 비번 불일치 조건");	
				re = "비번불일치";
				rs.close();
				pstmt.close();
				conn.close();
			}
		}else{
			System.out.println("02 아이디 불일치 조건");
			re = "아이디불일치";
			rs.close();
			pstmt.close();
			conn.close();
		}
		return re;
	}
	
	public UserDto UgetSession(String user_id) throws SQLException {
		System.out.println("세션 연결 싀~~~작@!");
	
		pstmt=conn.prepareStatement("SELECT user_id,user_level,user_name FROM tb_user WHERE user_id =? ");
		pstmt.setString(1, user_id);
		System.out.println(pstmt + "<---pstmt");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs");
		if(rs.next()) {
			System.out.println("if(rs.next()) 시작");
			userdto = new UserDto();
			userdto.setUserId(rs.getString("user_id"));
			userdto.setUserLevel(rs.getString("user_level"));
			userdto.setUserName(rs.getString("user_name"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return userdto;
	}
	
	
	
}
