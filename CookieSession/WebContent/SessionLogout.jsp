<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	//id에 null값을 부여
	session.setAttribute("id", null);
	//세션 유지시간을 죽이시오
	session.setMaxInactiveInterval(0);
	
	response.sendRedirect("SessionMain.jsp");
%>
</body>
</html>