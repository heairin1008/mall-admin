package dao;
import vo.*;
import java.util.*;
import commons.DBUtil;
import java.sql.*;

public class NoticeDao {
	// ���� ����Ʈ ����
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		// mariadb�� ����
		
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
	
	//���� �󼼺���
		public Notice selectNoticeOne(int noticeId) throws Exception{
			Notice notice = null;
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			// mariadb�� ����
			
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
		
		// ������ �߰��ϱ�
		public void insertNotice(Notice notice) throws Exception{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			// mariadb�� ����
			
			String sql = "insert into notice(notice_title, notice_content, notice_date) values(?, ?, now())";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, notice.getNoticeTitle());
			stmt.setString(2, notice.getNoticeContent());
			
			stmt.executeUpdate();
			conn.close();
		}
		
		// ������ �����ϱ�
		public void updateNotice(Notice notice) throws Exception{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			// mariadb�� ����
			
			// ���� ������
			String sql = "update notice set notice_title = ?, notice_content = ? where notice_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			// ������ ? �� �Է�
			stmt.setString(1, notice.getNoticeTitle());
			stmt.setString(2, notice.getNoticeContent());
			stmt.setInt(3, notice.getNoticeId());
			
			// ������ ����
			stmt.executeUpdate();
			
			// �������
			conn.close();
		}
		
		// ������ �����ϱ�
		public void deleteNotice(Notice notice) throws Exception{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			// mariadb�� ����
			
			// ���� ������
			String sql = "delete from notice where notice_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			// ������ ? �� �Է�
			stmt.setInt(1, notice.getNoticeId());
			
			// ������ ����
			stmt.executeUpdate();
			
			conn.close();
		}
}
