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
			sc.println("alert('�α��ο� �����߽��ϴ�')");
			sc.println("location.href='hello.jsp'");
			sc.println("</script>");
			sc.close();
			
		}
		
		if (result==0) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('��й�ȣ�� Ʋ���ϴ�.')");
			sc.println("history.back()");
			sc.println("</script>");
			sc.close();
		}
		
		if (result==-1) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('���̵� �������� �ʽ��ϴ�.')");
			sc.println("history.back()");
			sc.println("</script>");
			sc.close();
		}
		
		
		
	%>

</body>
</html>