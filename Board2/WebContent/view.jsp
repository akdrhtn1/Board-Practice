<%@page import="com.bc.bbs.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.bbs.vo.BBSVO"%>
<%@page import="com.bc.bbs.dao.BBSDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값 b_idx 
	1. 게시글 조회수 1증가(실습)
	2. 게시글 (b_idx) 데이터 조회 후 화면 표시
	3. 게시글 (b_idx)에 딸린 댓글이 있으면 화면 표시
--%>
<%
	//파라미터 값 추출 확인
	int b_idx = Integer.parseInt(request.getParameter("b_idx"));

	//1. 게시글 조회수 1증가 (실습)
	BBSDAO.hitCreate(b_idx);
	
	BBSVO bvo = BBSDAO.selectOne(b_idx);
	System.out.println("> bvo : " + bvo);
	//2. 게시글(b_idx) 데이터 조회
	List<CommentVO> list = BBSDAO.getCommList(b_idx);
	System.out.println("> list" + list);
	
	//EL, JSTL 사용을 위한 SCOPE상에 속성 등록하기
	
	//DB데이터 화면출력
	pageContext.setAttribute("c_list",list);
	session.setAttribute("bvo", bvo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
 <link rel="stylesheet" href="css/view.css">
<style>

#bbs table{
	width: 580px;
	margin-left : 10px;
	border-collapse: collapse;
	font-size: 14px;
}
#bbs table caption{
	font-size : 20px;
	font-weight : bold;
	margin-bottom : 10px;
}
#bbs th, #bbs td{
	text-align : center;
	border : 1px solid black;
	padding : 4px 10px;
}
#bbs .align-left{ text-align:left; }

.title {background : lightsteelblue; }

.no { width : 10%; }
.writer{ width : 15%; }
.regdate{ width : 20%; }
.hit{ width : 15%; }

/**** 페이지 표시 **/
.paging { list-style:none;}
.paging li{
	float:left;
	margin-right: 8px;
}
.paging li a {
	text-decoration: none;
	display : block;
	padding : 3px 7px;
	border : 1px solid #00B3DC;
	font-weight: bold;
	color : black;
}

.paging .disable{
	border : 1px solid silver;
	padding : 3px 7px;
	color:silver;		
}
.paging .now{
	border : 1px solid #ff4aa5;
	padding : 3px 7px;
	background : #ff4aa5;	
}
</style>
</head>

<body>


<div id = "bbs">
	
<%-- 게시글 내용 표시 --%>
<table>
	<caption>상세보기</caption>
	<tbody>
		<tr>
			<th>제목</th>
			<td>${bvo.subject }</td>
			<th>조회수</th>
			<td>${bvo.hit }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3">${bvo.writer }</td>
		</tr>
		<tr>
			<th>시간</th>
			<td colspan="3">${bvo.write_date }</td>
		</tr>
		
		<tr>
			<th>글내용</th>
			<td colspan="3">${bvo.content }</td>
		</tr>
	</tbody>
</table>

</div>

<hr>
<%-- 게시글에 대한 댓글 작성 영역 --%>

<button class="btn" name="btn1" onclick="location.href='wrDelete.jsp'">글 삭제</button>
<button class="btn" name="btn2" onclick="location.href='wrUpdate.jsp'" >글 수정</button>
<button class="btn" name="btn3" >댓글 등록</button>


<%-- 게시글에 작성된 댓글 표시 영역 --%>
<hr>
<div id="bbs">
	<table>
		<caption>댓글 목록</caption>
		<thead>
			<tr class="title">
				<th class="no">번호</th>
				<th class="writer">글쓴이</th>
				<th class="regdate">날짜</th>
				<th class="content">글내용</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${empty c_list }">
				<tr>
					<td colspan="5"><h2>현재 등록된 댓글이 없습니다.</h2></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="cvo" items="${c_list }">
					<tr>
						<td>${cvo.c_idx }</td>
						<td>${cvo.writer }</td>
						<td>${cvo.write_date.substring(0,10) }</td>
						<td>${cvo.content }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		</tbody>
	</table>

</div>

</body>
</html>