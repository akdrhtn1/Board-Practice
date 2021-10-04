<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<style>
*{
	paddin:0px;
	margin:0px;
}
h2{
	margin-top : 50px;
	text-align : center;
}
table{

	margin : 0 auto;
	margin-top: 20px;
	border : 1px solid black;
	width : 400px;
}
tr{
	height : 50px;
}
td{
	text-align : center;
	border : 1px solid black;
}
</style>
<body>
	<%
		//사용자 컴퓨터의 쿠키 저장소로부터 쿠키값을 읽어드림 몇개인지 모르기에 배열을 이용하여 쿠키값을 저장
		Cookie[] cookies = request.getCookies();
		String id="";
		//쿠키값이 없을 수도 있기에 null처리를 해줍니다.
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("id")){
					id = cookies[i].getValue();
					break; // 우리가원하는 데이터를 찾았기에 반복문을 빠져 나옴
				}
			}
		}
	%>
	<h2>쿠키 로그인</h2>
	<form action="CookieLoginProc.jsp" method="post">
	<table>
		<tr>
			<td width="150">아이디</td>
			<td width="250"><input type="text" name="id" value="<%=id %>"></td>
		</tr>
		
		
		<tr>
			<td width="150">패스워드</td>
			<td width="250"><input type="password" name="pass"></td>
		</tr>
		
		
		<tr>
			<td colspan="2"><input type="checkbox" name="save" value="1">&nbsp;아이디 저장</td>
		</tr>
		
		
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
	</table>
	
	</form>
</body>
</html>