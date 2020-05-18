package com.corrdingding.DAO;
import java.sql.*;
import java.util.ArrayList;

import com.corrdingding.DTO.DTOContent;
import com.corrdingding.DTO.Search;
import com.corrdingding.DriverDB.ConnectionDB;


public class DAOContent {
	private Connection conn = null;
	private PreparedStatement pstmt= null;
	private ResultSet rs = null;
	private DTOContent content = null;
	public DAOContent() throws ClassNotFoundException, SQLException{
		ConnectionDB db = new ConnectionDB();
		this.conn = db.DriverDB();
		System.out.println(this.conn +" conn in DAOContent.java");
	}
	
	public void writeContent(DTOContent content) throws SQLException {
		pstmt = conn.prepareStatement("insert into tb_content(user_id,content_title,content_desc,content_cate) values(?,?,?,?)");
		pstmt.setString(1,content.getUser_id());
		pstmt.setString(2,content.getContent_title());
		pstmt.setString(3,content.getContent_desc());
		pstmt.setInt(4,Integer.parseInt(content.getContent_cate()));
		System.out.println(pstmt +"<---pstmt insertContents");
		int result = pstmt.executeUpdate();
		if(result > 0) {
			System.out.println(result +"<--insert tb_content query ok");
			pstmt = conn.prepareStatement("select max(content_code) from tb_content");
			rs =pstmt.executeQuery();
			if(rs.next()) {
				int maxCodeNum = rs.getInt(1);
				content.setContent_code(maxCodeNum);
			}
		} else {
			
			System.out.println(result+"<--insert tb_content query fail");	
		}
		pstmt.close();
		conn.close();
	}
	//게시글 1개 읽기 
	public DTOContent readContent(int contentCode) throws SQLException {
		
		pstmt = conn.prepareStatement("Select * from tb_content where content_code = ?");
		pstmt.setInt(1, contentCode);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			content = new DTOContent();
			content.setContent_code(rs.getInt("content_code"));
			content.setUser_id(rs.getString("user_id"));
			content.setContent_title(rs.getString("content_title"));
			content.setContent_desc(rs.getString("content_desc"));
			content.setContent_cate(rs.getString("content_cate"));
			content.setContent_reg_time(rs.getString("content_reg_time"));
			content.setView_count(rs.getInt("view_count"));
		}
		
		return content;
	}
	
	// 카테고리별 게시글 리스트 조회
	
	public ArrayList<DTOContent> readContentList(String contentSearch,String searchWord, String cate) throws SQLException{
		
		String sql = "select * from tb_content where content_cate = "+cate;
		if(contentSearch ==null || searchWord==null) {
			pstmt = conn.prepareStatement(sql);
		} else {
			pstmt = conn.prepareStatement(sql+" and "+ contentSearch + " LIKE '%"+searchWord+"%'");
		}
		System.out.println(pstmt);
		ArrayList<DTOContent> contentList = new ArrayList<DTOContent>();
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			content = new DTOContent();
			content.setContent_code(rs.getInt("content_code"));
			content.setUser_id(rs.getString("user_id"));
			content.setContent_title(rs.getString("content_title"));
			content.setContent_desc(rs.getString("content_desc"));
			content.setContent_cate(rs.getString("content_cate"));
			content.setContent_reg_time(rs.getString("content_reg_time"));
			content.setView_count(rs.getInt("view_count"));
			contentList.add(content);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return contentList;
	}
	public void increasedView(int viewCtn,int contentCode) throws SQLException {
		System.out.println("니가 문제니,,?");
		pstmt = conn.prepareStatement("update tb_content set view_count = ? where content_code =?;");
		pstmt.setInt(1, viewCtn);
		pstmt.setInt(2, contentCode);
		System.out.println(pstmt+"increasedView pstmt");
		int result = pstmt.executeUpdate();
		if(result >1) {
			System.out.println("veiw ctn update query ok");
		} else {
			System.out.println("veiw ctn update query fail");
		}
		rs.close();
		pstmt.close();
		conn.close();

	}
	//아이디로 검색
	public ArrayList<DTOContent> searchContent(String sk,String searchword) throws ClassNotFoundException, SQLException {
		ArrayList<DTOContent> searchList=new ArrayList<DTOContent>();
		String sql = "SELECT * FROM tb_content WHERE " +sk+ " LIKE '%"+searchword+"%'";
		pstmt=conn.prepareStatement(sql);
		System.out.println(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTOContent c=new DTOContent();
			c.setContent_cate(rs.getString("content_cate"));
			c.setUser_id(rs.getString("user_id"));
			c.setContent_code(rs.getInt("content_code"));
			c.setContent_reg_time(rs.getString("content_reg_time"));;
			c.setContent_title(rs.getString("content_title"));
			c.setView_count(rs.getInt("view_count"));
			c.setContent_code(rs.getInt("content_code"));
			searchList.add(c);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return searchList;
	}
	// 내 게시물인지 확인하는 메서드
	public boolean isMyContent(String userId,int contentCode) throws SQLException {
		pstmt = conn.prepareStatement("select content_code from tb_content where user_id = ? and content_code = ?");	
		pstmt.setString(1, userId);
		pstmt.setInt(2, contentCode);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			return true;
		} else 
		return false;
	}
	
	public void updateContent(DTOContent updateContent) throws SQLException {
		pstmt = conn.prepareStatement("update tb_content set content_title = ?, content_cate = ? ,content_desc =? where content_code=?");
		pstmt.setString(1,updateContent.getContent_title());
		pstmt.setString(2, updateContent.getContent_cate());
		pstmt.setString(3, updateContent.getContent_desc());
		pstmt.setInt(4, updateContent.getContent_code());
		System.out.println(pstmt +"<--update content query");
		int result = pstmt.executeUpdate();
		if(result >0) {
			System.out.println("update contente query ok");
		} else {
			System.out.println("update contente query fail");
		}
		pstmt.close();
		conn.close();
	}
	public void deleteContent(int contentCode) throws SQLException  {
		pstmt = conn.prepareStatement("delete from tb_content where content_code =?");
		pstmt.setInt(1, contentCode);
		int result = pstmt.executeUpdate();
		if(result >0) {
			System.out.println("update delete query ok");
		} else {
			System.out.println("update delete query fail");
		}
		pstmt.close();
		conn.close();
	}
	// 조회수 기준으로 10개 보여주기  인기글 ! 
	public ArrayList<DTOContent>popularContents() throws SQLException {
		ArrayList<DTOContent> popularContents =new ArrayList<DTOContent>();
		pstmt = conn.prepareStatement("select content_title,content_code   from tb_content order by view_count desc limit 10");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			content = new DTOContent();
			content.setContent_title(rs.getString("content_title"));
			content.setContent_code(rs.getInt("content_code"));
			popularContents.add(content);
		}	
		return popularContents;
		
	}
	
	public ArrayList<DTOContent>noticeContents() throws SQLException {
		ArrayList<DTOContent> noticeContents =new ArrayList<DTOContent>();
		pstmt = conn.prepareStatement("select content_title,content_code  from tb_content where content_cate ='6' order by content_reg_time desc limit 10");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			content = new DTOContent();
			content.setContent_title(rs.getString("content_title"));
			content.setContent_code(rs.getInt("content_code"));
			noticeContents.add(content);
		}	
		return noticeContents;
		
	}
}
