package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

public class MemberDao {
	// ȸ�� ���� ����Ʈ ���
	public ArrayList<Member> selectMemberList() throws Exception{
		ArrayList<Member> list = new ArrayList<Member>();
		//arraylist ����
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//mariadb�� ����

		String sql = "select member_email, member_name, member_date from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		//���� ����
		ResultSet rs = stmt.executeQuery();
		//�ݺ����� ���� ������ ������� �Է�
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
	
	// ȸ�� ���� ����(Ż��)
	public void deleteMember(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//mariadb�� ����
		
		// ���� ������
		String sql = "delete from member where member_email = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		// ? �� �Է�
		stmt.setString(1, member.getMemberEmail());
		
		// ������ ����
		stmt.executeUpdate();
		
		conn.close();
	}
}
