package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	
	//.. ���̺��� ������ �Ӽ��� �̸��� �Ȱ��ƾ� �Ѵ�.
	//.. ���̺� �Ӽ��� userid, userpw�� ������ ����
	
	public int login(String userID, String userPW) {
		String SQL = "select userpw from lecture where userid=?";
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		try {
			con = DatabaseUtil.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//.. SQL ����� ��й�ȣ�� ������ Ȯ��
				if (rs.getString(1).equals(userPW)) {
					return 1; //�α��� ����
				}
				else {
					return 0; //��й�ȣ Ʋ��
				}
			}
			return -1; //���̵� ���� 
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -2; //�����ͺ��̽� ����
	}
	
	public int join(UserDTO user) {
		String SQL = "insert into lecture(userID, userPW, userName) values(?, ?, ?)";
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		try {
			con = DatabaseUtil.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getUserName());
			
			//.. �����Ͱ� ���������� ���ԵǸ� 1 ��ȯ
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // ȸ������ ����
	}
	
}
