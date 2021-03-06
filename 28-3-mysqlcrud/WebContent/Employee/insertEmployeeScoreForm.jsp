<!-- 2018-07-12 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Score Form</title>
	</head>
	<body>
		<%
			System.out.println("-----------------------------insertEmployeeScoreForm.jsp-----------------------------");
			System.out.println("employeeList.jsp에서 insertEmployeeScoreForm.jsp로 넘겨준 employeeNo : " + request.getParameter("employeeNo"));
		%>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<h1>Insert Employee Score Form</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/Employee/insertEmployeeScoreAction.jsp" method="post">
					<table border="1">
						<tr>
							<td>점수 : </td>
							<td><input type="text" name="score"></td>
						</tr>
						<tr>		
							<td colspan="2">
								<input type="hidden" name="employeeNo" value="<%= request.getParameter("employeeNo") %>">
								<input type="submit" value="등록">
							</td>			
						</tr>
					</table>
				</form>	
				<br>
				<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">목록으로</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>		
	</body>
</html>