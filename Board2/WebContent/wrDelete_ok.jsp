<%@page import="com.bc.bbs.dao.BBSDAO"%>
<%@page import="com.bc.bbs.vo.BBSVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	String pass = request.getParameter("password");
	
	BBSVO bvo = (BBSVO)session.getAttribute("bvo");
	

	System.out.println(bvo.getPwd());
	
	if(pass.equals(bvo.getPwd())){
		//패스워드가 둘다 같다면
		BBSDAO.delete(Integer.parseInt(bvo.getB_idx()));
		
		response.sendRedirect("list.jsp");
	}else{
%>
	<script>
		alert("패스워드가 틀려서 삭제 할수 없습니다. 패스워드를 확인해주세요");
		history.go(-1);
	</script>			
<%			
	}


%>
</body>
</html>