<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

	<h2> 세션 로그인 처리 1</h2>
<%
	request.setCharacterEncoding("UTF-8");
	
	//사용자로부터 데이터를 읽어드림
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	//아이디와 패스워드를 저장
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	
	//세션의 유지시간 설정 (60초간유지)
	session.setMaxInactiveInterval(60*2);  //2분간 유지
	
	response.sendRedirect("SessionMain.jsp");
%>
<%-- 	<h2>당신의 아이디는 <%=id %>입니다. </h2>
	<a href="SessionLoginProc2.jsp">다음페이지로 이동</a> --%>
</body>
</html>