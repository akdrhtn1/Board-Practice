<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 게시글 쓰기 </h2>
<form action="BoardWriteProc.jsp" method="post">
	<table width="600" border="1" bordercolor="gray" bgcolor="skyblue">
		<tr height="40">
			<td align="center" width="150">작성자</td>
			<td width="450"><input type="text" name="writer" size="60"></td>
		</tr>
		
		<tr height="40">
			<td align="center" width="150">제목</td>
			<td width="450"><input type="text" name="subject" size="60"></td>
		</tr>
		
		<tr height="40">
			<td align="center" width="150">이메일</td>
			<td width="450"><input type="email" name="email" size="60"></td>
		</tr>
		
		<tr height="40">
			<td align="center" width="150">비밀번호</td>
			<td width="450"><input type="password" name="password" size="60"></td>
		</tr>
		
		<tr height="40">
			<td align="center" width="150">글내용</td>
			<td width="450"><textarea rows="10" cols="50" name="content" ></textarea></td>
		</tr>
		
		<tr height="40">
			<td align="center" colspan="2">
			<input type="submit" value="글쓰기"> &nbsp;&nbsp;
			<input type="reset" value="다시작성">
			<input type='button' onclick="location.href='BoardList.jsp'" value='전체글보기'>
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>