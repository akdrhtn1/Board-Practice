<%@page import="model.BoardBean"%>
<%@page import="com.mybatis.DBService"%>
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
	//해당 게시글번호를 통하여 게시글을 수정
	int num = Integer.parseInt(request.getParameter("num").trim());
	
	//하나의 게시글의 메소드를 리턴
	SqlSession ss = DBService.getFactory().openSession();
	BoardBean board = null;
	try{
		board = ss.selectOne("users.info", num);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		ss.close();
	}
	pageContext.setAttribute("boardOne", board);
%>
<form action="BoardUpdateProc.jsp" method="post">
	<table width="600">
		<tr height="40">
			<td width="120" align="center">작성자</td>
			<td width="180" align="center">${boardOne.writer }</td>
			<td width="120" align="center">작성일</td>
			<td width="180" align="center">${boardOne.reg_date }</td>
		</tr>
		<tr height="40">
			<td width="120" align="center">제목</td>
			<td width="480" align="center" colspan="3">&nbsp;<input type="text" name="subject" size="80" value="${boardOne.subject }">
		</tr>
		<tr height="40">
			<td width="120" align="center">패스워드</td>
			<td width="480" align="center" colspan="3">&nbsp;<input type="password" name="password" size="80"></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">글내용</td>
			<td width="480" colspan="3"><textarea rows="10" cols="60" name="content" align="left">${boardOne.content }</textarea>
			</td>
		</tr>
		
		<tr height="40">
			<td colspan="4" align="center">
			<input type="hidden" name="num" value="${boardOne.num }">
			<input type="submit" value="글수정">&nbsp;&nbsp;
			<input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기">
			</td>
		</tr>			
	</table>
</form>>	
</body>
</html>