<%@page import="com.bc.bbs.dao.BBSDAO"%>
<%@page import="com.bc.bbs.vo.BBSVO"%>
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
<jsp:useBean id="vo" class="com.bc.bbs.vo.BBSVO"/>
<jsp:setProperty property="*" name="vo"/>
<%


	BBSVO bvo = (BBSVO)session.getAttribute("bvo");
	
	System.out.println(bvo.getPwd() +" " + vo.getPwd());
		if(bvo.getPwd().equals(vo.getPwd())){
			//데이터 수정 메소드 호출
			BBSDAO.update(vo);
%>
		<script>
			alert("수정처리가 완료 되었습니다.")
			location.href="list.jsp";
		</script>
<% 
		}else{
%>
		<script>
			alert("패스워드가 일치 하지 않습니다.\n 다시 확인후 수정해주세요");
			history.go(-1);
		</script>
<%
		}
		

%>
</body>
</html>