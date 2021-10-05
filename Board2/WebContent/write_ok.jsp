<%@page import="com.bc.bbs.dao.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 DB에 저장하고 list.jsp 이동 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.bc.bbs.vo.BBSVO"/>
<jsp:setProperty property="*" name="vo"/>

<%

	int result = BBSDAO.insert(vo);
	
	if(result>=1){
%>
		<script>
		alert("데이터가 정상적으로 입력되었습니다.");
		location.href = "list.jsp";
		</script>
<%		
	}else{
%>
		<script>
		alert("데이터 입력중 오류가 발생했습니다.");
		location.href = "list.jsp";
		</script>
<% 
	}
%>
</head>
<body>

</body>
</html>