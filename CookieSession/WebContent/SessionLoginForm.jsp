<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	paddin:0px;
	margin:0px;
}
h2{
	margin-top : 50px;
	text-align : center;
}

</style>
</head>
<body>
<h2>세션 로그인</h2>
	<form action="SessionLoginProc.jsp" method="post">
	<table border="1" align="center">
		<tr>
			<td width="150">아이디</td>
			<td width="250"><input type="text" name="id"></td>
		</tr>
		
		
		<tr>
			<td width="150">패스워드</td>
			<td width="250"><input type="password" name="pass"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><input type="submit" value="로그인"></td>
		</tr>
	</table>
	
	</form>
</body>
</html>