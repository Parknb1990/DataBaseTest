<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<section class="container mt-3" style="max-width: 560px;">
		<form action="./userJoinAction.jsp" method="post">
			
			<div class="form-group">
				<label>���̵�</label>
				<input type="text" name="userID" class="form-control">
			</div>
			<div class="form-group">
				<label>��й�ȣ</label>
				<input type="password" name="userPW" class="form-control">
			</div>
			<div class="form-group">
				<label>�̸�</label>
				<input type="text" name="userName" class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">ȸ������</button>
			<button type="reset" class="btn btn-danger">���</button>
		</form>
	</section>


	<script src="./js/jquery.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>