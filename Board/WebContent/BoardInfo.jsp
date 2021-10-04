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
	int num = Integer.parseInt(request.getParameter("num").trim());
	

	SqlSession ss = DBService.getFactory().openSession(true);
	BoardBean board = null;
	try{
		ss.update("users.update", num);
		
		board = ss.selectOne("users.info", num);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		ss.close();
	}
	
	
	pageContext.setAttribute("board_info", board);
%>

<h2>게시글 보기 </h2>
<table width="600">
	<tr height="40">
		<td align="center" width="120">글번호</td>
		<td align="center" width="180">${board_info.num }</td>
		<td align="center" width="120">조회수</td>
		<td align="center" width="180">${board_info.readcount }</td>
				
	</tr>
	
	<tr height="40">
		<td align="center" width="120">작성자</td>
		<td align="center" width="180">${board_info.writer }</td>
		<td align="center" width="120">조회수</td>
		<td align="center" width="180">${board_info.reg_date }</td>
				
	</tr>
	
	<tr height="40">
		<td align="center" width="120">이메일</td>
		<td align="left" colspan="3">${board_info.email }</td>
	</tr>
	
	<tr height="40">
		<td align="center" width="120">제목</td>
		<td align="left" colspan="3">${board_info.subject }</td>
	</tr>
	
	<tr height="80">
		<td align="center" width="120">글 내용</td>
		<td align="left" colspan="3">${board_info.content }</td>
	</tr>
	
	<tr height="40">
		<td align="center" colspan="4">
			<input type="button" value="답글쓰기" 
			onclick="location.href='BoardReWriteForm.jsp?num=${board_info.num}&ref=${board_info.ref}&re_step=${board_info.re_step }&re_level=${board_info.re_level}'">
			<input type="button" value="수정하기" onclick="location.href='BoardUpdateForm.jsp?num=${board_info.num}'">
			<input type="button" value="삭제하기" onclick="location.href='BoardDeleteForm.jsp?num=${board_info.num}'">
			<input type="button" value="목록보기" onclick="location.href='BoardList.jsp'">
		</td>
	</tr>
</table>
</body>
</html>



