<%@page import="com.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="model.BoardBean"/>
<jsp:setProperty property="*" name="vo"/>
<%
	SqlSession ss = DBService.getFactory().openSession(true);
	String password = "";
	try{
		password = ss.selectOne("users.getPass", vo.getNum());
		// 기존 패스워드값과 update시 작성했던 password 값과 같은지 비교
		if(password.equals(vo.getPassword())){
			//데이터 수정 메소드 호출
			ss.update("users.updateBoard",vo);
			response.sendRedirect("BoardList.jsp");
		}else{
%>
		<script>
			alert("패스워드가 일치 하지 않습니다.\n 다시 확인후 수정해주세요");
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