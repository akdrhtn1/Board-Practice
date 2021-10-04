<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h2{
	text-align : center;
}
table{
	border : 1px solid black;
	background : skyblue;
	margin : 0 auto;
}
tr{
	height : 40px;
}
td{
	border : 1px solid black;
}
</style>
</head>
<body>
	<h2>답변글 입력하기</h2>

<form action="BoardRewriterProc.jsp" method="POST">
	<table width="600">
		<tr height="40">
			<td width="150" align="center">작성자</td>
			<td width="450"> <input type="text" name="writer" size="60"></td>
		</tr>
		
		<tr height="40">
			<td width="150" align="center">제목</td>
			<td width="450"> <input type="text" name="subject" value="[답변]" size="60"></td>
		</tr>
		
		<tr height="40">
			<td width="150" align="center">이메일</td>
			<td width="450"> <input type="email" name="email" size="60"></td>
		</tr>
		
			<tr height="40">
			<td width="150" align="center">비밀벌호</td>
			<td width="450"> <input type="password" name="password" size="60"></td>
		</tr>
		
		<tr height="40">
			<td align="center" width="150">글내용</td>
			<td width="450"><textarea rows="10" cols="50" name="content" ></textarea></td>
		</tr>
		<!-- form에서 사용자로부터 입력받지않고 데이터를 넘김 -->
		<tr height="40">
			<td align="center" colspan="2">
				<input type="hidden" name="ref" value="${param.ref }">
				<input type="hidden" name="re_step" value="${param.re_step }">
				<input type="hidden" name="re_level" value="${param.re_level }">
				<input type="submit" value="답글쓰기완료"> &nbsp; &nbsp;
				<input type="reset" value="취소"> &nbsp; &nbsp;
				<input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기">
			</td>
		</tr>
	</table>
	
</form>
</body>
</html>