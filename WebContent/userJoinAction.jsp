<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		String userPW = null;
		String userName = null;
		
		if(request.getParameter("userID") != null) {
			userID = request.getParameter("userID");
		}
		if(request.getParameter("userPW") != null) {
			userPW = request.getParameter("userPW");
		}
		if(request.getParameter("userName") != null) {
			userName = request.getParameter("userName");
		}
		
		
		if(userID==null || userPW==null || userName==null) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('모두 입력해주세요.');");
			sc.println("history.back()");
			sc.println("</script>");
			sc.close();
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new UserDTO(userID, userPW, userName));
		
		if(result == 1) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('회원가입에 성공했습니다.');");
			sc.println("location.href='login.jsp'");
			sc.println("</script>");
			sc.close();
			
		}
		
		if(result == -1) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('회원가입에 실패했습니다.');");
			sc.println("history.back()");
			sc.println("</script>");
			sc.close();
			
		}
		
	%>

</body>
</html>