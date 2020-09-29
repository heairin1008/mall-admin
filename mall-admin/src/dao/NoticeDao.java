package dao;
import vo.*;
import java.util.*;
import commons.DBUtil;
import java.sql.*;

public class NoticeDao {
	// 공지 리스트 보기
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		// mariadb에 연결
		
		String sql = "select notice_id, notice_title, notice_date from notice";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeDate(rs.getString("notice_date"));
			
			list.add(notice);
		}
		
		conn.close();
		return list;
	}
	
	//공지 상세보기
		public Notice selectNoticeOne(int noticeId) throws Exception{
			Notice notice = null;
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			// mariadb에 연결
			
			String sql = "select notice_id, notice_title, notice_content, notice_date from notice where notice_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, noticeId);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				notice = new Notice();
				notice.setNoticeId(rs.getInt("notice_id"));
				notice.setNoticeTitle(rs.getString("notice_title"));
				notice.setNoticeContent(rs.getString("notice_content"));
				notice.setNoticeDate(rs.getString("notice_date"));
			}
			
			conn.close();
			return notice;
		}
		
		// 공지글 추가하기
		public void insertNotice(Notice notice) throws Exception{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			// mariadb에 연결
			
			String sql = "insert into notice(notice_title, notice_content, notice_date) values(?, ?, now())";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, notice.getNoticeTitle());
			stmt.setString(2, notice.getNoticeContent());
			
			stmt.executeUpdate();
			conn.close();
		}
		
		// 공지글 수정하기
		public void updateNotice(Notice notice) throws Exception{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			// mariadb에 연결
			
			// 수정 쿼리문
			String sql = "update notice set notice_title = ?, notice_content = ? where notice_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			// 쿼리문 ? 값 입력
			stmt.setString(1, notice.getNoticeTitle());
			stmt.setString(2, notice.getNoticeContent());
			stmt.setInt(3, notice.getNoticeId());
			
			// 쿼리문 실행
			stmt.executeUpdate();
			
			// 연결끊기
			conn.close();
		}
		
		// 공지글 삭제하기
		public void deleteNotice(Notice notice) throws Exception{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			// mariadb에 연결
			
			// 삭제 쿼리문
			String sql = "delete from notice where notice_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			// 쿼리문 ? 값 입력
			stmt.setInt(1, notice.getNoticeId());
			
			// 쿼리문 실행
			stmt.executeUpdate();
			
			conn.close();
		}
}
