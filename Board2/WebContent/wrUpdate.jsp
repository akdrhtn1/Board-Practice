
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<body>
<h2> 게시글 수정</h2>
<%
	session.getAttribute("bvo");
%>
<form action="wrUpdate_ok.jsp" method="post">
	<table width="600">
		<tr height="40">
			<td width="120" align="center">작성자</td>
			<td width="180" align="center">${bvo.writer }</td>
			<td width="120" align="center">작성일</td>
			<td width="180" align="center">${bvo.write_date }</td>
		</tr>
		<tr height="40">
			<td width="120" align="center">제목</td>
			<td width="480" align="center" colspan="3">&nbsp;<input type="text" name="subject" size="80" value="${bvo.subject }">
		</tr>
		<tr height="40">
			<td width="120" align="center">패스워드</td>
			<td width="480" align="center" colspan="3">&nbsp;<input type="password" name="pwd" size="80"></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">글내용</td>
			<td width="480" colspan="3"><textarea rows="10" cols="60" name="content" align="left">${bvo.content }</textarea>
			</td>
		</tr>
		
		<tr height="40">
			<td colspan="4" align="center">
			<input type="hidden" name="b_idx" value="${bvo.b_idx }">
			<input type="submit" value="글수정">&nbsp;&nbsp;
			<input type="button" onclick="location.href='list.jsp'" value="전체글보기">
			</td>
		</tr>			
	</table>
</form>>	
</body>
</html>