<%@page import="com.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="vo" class="model.BoardBean"/>
	<jsp:setProperty property="*" name="vo"/>
	
	<%
		//데이터베이스 객체 생성
		SqlSession ss = DBService.getFactory().openSession(true);
		try{
			ss.update("users.reUpdate", vo);
			
			vo.setRe_step(vo.getRe_step()+1); //답글이기에 부모글 re_stap에 1을 더해줌 
			vo.setRe_level(vo.getRe_level()+1);
			
			ss.insert("users.reInsert", vo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ss.close();
		}
		response.sendRedirect("BoardList.jsp");
	%>
	
</body>
</html>