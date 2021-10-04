<%@page import="com.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 게시글 작성한 데이터를 한번에 읽어드림 -->
<jsp:useBean id="boardbean" class="model.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="boardbean"/>

<%
	int ref = 0;
	int re_step =1;
	int re_level=1;
	//데이터 베이스 쪽으로 bean클래스를 넘겨줌
	
	SqlSession ss = DBService.getFactory().openSession(true);
	
	try{
		int refsql = ss.selectOne("users.one");

		
		boardbean.setRef(refsql);
		boardbean.setRe_step(re_step);
		boardbean.setRe_level(re_level);
		
		System.out.println(boardbean);
		
		ss.insert("users.insert",boardbean);
		
		//게시글 저장후 전체 게시글 보기
		response.sendRedirect("BoardList.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		ss.close();
	}
	
%>
</body>
</html>