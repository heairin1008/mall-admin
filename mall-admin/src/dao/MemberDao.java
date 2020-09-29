package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

public class MemberDao {
	// 회원 정보 리스트 출력
	public ArrayList<Member> selectMemberList() throws Exception{
		ArrayList<Member> list = new ArrayList<Member>();
		//arraylist 선언
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//mariadb에 연결

		String sql = "select member_email, member_name, member_date from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		//쿼리 실행
		ResultSet rs = stmt.executeQuery();
		//반복문을 통해 데이터 순서대로 입력
		while(rs.next()) {
			Member member = new Member();
			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getString("member_date"));
			list.add(member);
		}
		conn.close();
		return list;
	}
	
	// 회원 정보 삭제(탈퇴)
	public void deleteMember(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//mariadb에 연결
		
		// 삭제 쿼리문
		String sql = "delete from member where member_email = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		// ? 값 입력
		stmt.setString(1, member.getMemberEmail());
		
		// 쿼리문 실행
		stmt.executeUpdate();
		
		conn.close();
	}
}
