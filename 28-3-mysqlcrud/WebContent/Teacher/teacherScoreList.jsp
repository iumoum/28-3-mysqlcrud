<!-- 2018.07.09 김지완-->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Score List</title>
	</head>
	<body>
		<%
			// TeacherScoreDao 객체 생성
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
		
			// teacherList.jsp로 부터 전달 받은 teacherNo 값을 변수에 대입
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			
			// teacherNo 변수 안의 값을 테스트
			System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
			
			// selectTeacherAddress 메서드를 호출하고 리턴받은 TeacherAddr객체의 참조 값을 teacherAddr 객체 참조변수에 대입 
			TeacherAndTeacherScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacherNo);		
		%>
		<h1>Teacher Address</h1>
		<table border="1">
			<tr>
				<td>교사 번호</td>
				<td>교사 이름</td>
				<td>교사 나이</td>
				<td>점수 번호</td>
				<td>점수</td>
			</tr>
			<tr>
				<td><%= teacherAndTeacherScore.getTeahcer().getTeacherNo() %></td>
				<td><%= teacherAndTeacherScore.getTeahcer().getTeacherName() %></td>
				<td><%= teacherAndTeacherScore.getTeahcer().getTeacherAge() %></td>
				<td><%= teacherAndTeacherScore.getTeacherScore().getScoreNo() %></td>
				<td><%= teacherAndTeacherScore.getTeacherScore().getScore() %></td>
			</tr>
		</table>
		<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">teacherList로 이동</a>
	</body>
</html>