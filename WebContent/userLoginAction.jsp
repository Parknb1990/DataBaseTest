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
		
		if (request.getParameter("userID") != null) {
			userID = request.getParameter("userID");
		}
		
		if(request.getParameter("userPW") != null) {
			userPW = request.getParameter("userPW");
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(userID, userPW);
		if(result==1) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('로그인에 성공했습니다')");
			sc.println("location.href='hello.jsp'");
			sc.println("</script>");
			sc.close();
			
		}
		
		if (result==0) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('비밀번호가 틀립니다.')");
			sc.println("history.back()");
			sc.println("</script>");
			sc.close();
		}
		
		if (result==-1) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('아이디가 존재하지 않습니다.')");
			sc.println("history.back()");
			sc.println("</script>");
			sc.close();
		}
		
		
		
	%>

</body>
</html>