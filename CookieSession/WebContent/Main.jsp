<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table{
		margin : 0 auto;

	}
</style>
</head>
<body>
	<table width="800" border="1">
		<!-- Top -->
		<tr height="150">
			<td align="center" colspan="2"> 
				<jsp:include page="Top.jsp"/>
			</td>
		</tr>

		
		<!-- Left -->
		<tr height="400">
			<td align="center" width="200">
				<jsp:include page="Left.jsp"/>
			</td>
		
		
		<!-- Center -->

			<td align="center" width="600">
				<jsp:include page="Center.jsp"/>
			</td>
		</tr>
		
		<tr height="100">
			<td align="center" colspan="2"> 
				<jsp:include page="Bottom.jsp"/>
			</td>
		</tr>
		
		
		
	</table>
</body>
</html>