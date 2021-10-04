<%@page import="com.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="model.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
a{
	text-decoration : none;
}
</style>
<body>
	<%
		//전체 게시글의 내요을 jsp쪽으로 가져와야함
		int i = 0;
		List<BoardBean> list = new ArrayList<>();
		
		SqlSession ss = DBService.getFactory().openSession();
		try{
			
			list = ss.selectList("users.all");
		}catch(Exception e){
			
		}finally{
			ss.close();
		}
	
		pageContext.setAttribute("boardList",list);
	%>
	
<h2>전체 게시글 보기</h2>

<table width="700">
	<tr>
		<td width="50" align="center">번호</td>
		<td width="320" align="center">제목</td>
		<td width="100" align="center">작성자</td>
		<td width="150" align="center">작성일</td>
		<td width="80" align="center">조회수</td>
	</tr>
	
	<c:if test="${not empty boardList}">
		<c:forEach var="bean" items="${boardList }">
			<tr>
				<td width="50" align="center"><%=++i %></td>
				<td width="320" align="left"><a href="BoardInfo.jsp?num=${bean.num }">

				<c:if test="${bean.re_step>1}">
					<c:forEach begin="0" end="${(bean.re_step-1)*4}" step="1">
						&nbsp;
					</c:forEach>
				</c:if>
				${bean.subject }</a></td>
				<td width="100" align="center">${bean.writer }</td>
				<td width="150" align="center">${bean.reg_date }</td>
				<td width="80" align="center">${bean.readcount }</td>
			</tr>
		</c:forEach>
	</c:if>
	<tr height="40">
		<td align="center" colspan="5">
			<input type="button" value="글쓰기" onclick="location.href='BoardWriterForm.jsp'">
		</td>
	</tr>
	
	
	
</table>
</body>
</html>