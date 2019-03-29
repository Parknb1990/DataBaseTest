package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	
	//.. 테이블에서 선언한 속성과 이름이 똑같아야 한다.
	//.. 테이블 속성을 userid, userpw로 선언한 예제
	
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
				//.. SQL 사용자 비밀번호가 같은지 확인
				if (rs.getString(1).equals(userPW)) {
					return 1; //로그인 성공
				}
				else {
					return 0; //비밀번호 틀림
				}
			}
			return -1; //아이디 없음 
			 
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
		return -2; //데이터베이스 오류
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
			
			//.. 데이터가 정상적으로 삽입되면 1 반환
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
		return -1; // 회원가입 실패
	}
	
}
