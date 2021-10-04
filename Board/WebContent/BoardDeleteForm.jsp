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
<%
	BoardBean board =null;

	SqlSession ss = DBService.getFactory().openSession();
	try{
		board = ss.selectOne("users.info", Integer.parseInt(request.getParameter("num")));	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		ss.close();
	}
	pageContext.setAttribute("bean",board);
	
%>
<h2> 게시글 삭제</h2>
<form action="BoardDeleteProc.jsp" method="post">
	<table width="600">
		<tr height="40">
			<td width="120" align="center">작성자</td>
			<td width="180" align="center">${bean.writer }</td>
			<td width="120" align="center">작성일</td>
			<td width="180" align="center">${bean.reg_date }</td>
		</tr>
		<tr height="40"> 
			<td width="120" align="center">제목</td>
			<td align="left" colspan="3">${bean.subject }</td>
		</tr>
		
		<tr height="40"> 
			<td width="120" align="center">패스워드</td>
			<td align="left" colspan="3"><input type="password" name="password" size="60"></td>
		</tr>
		<tr height="40">
		
			<td align="center" colspan="4">
				<input type="hidden" name="num" value="${bean.num }">
				<input type="submit" value="글삭제">&nbsp;&nbsp;
				<input type="button" onclick="location.href='BoardList.jsp'" value="목록보기">
		    </td>
		</tr>
	</table>
</form>
</body>
</html>