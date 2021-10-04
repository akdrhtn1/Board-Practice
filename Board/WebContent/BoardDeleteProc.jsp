<%@page import="com.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	String pass = request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	String password = "";
	
	SqlSession ss = DBService.getFactory().openSession(true);
	
	try{
		password = ss.selectOne("users.getPass", num);
		if(pass.equals(password)){
			//패스워드가 둘다 같다면
			ss.delete("users.delete",num);
			
			response.sendRedirect("BoardList.jsp");
		}else{
%>
		<script>
			alert("패스워드가 틀려서 삭제 할수 없습니다. 패스워드를 확인해주세요");
			history.go(-1);
		</script>			
<%			
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		ss.close();
	}
%>
</body>
</html>