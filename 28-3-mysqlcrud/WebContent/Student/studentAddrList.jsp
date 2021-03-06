<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.StudentAddrDao"%>
<%@ page import="service.StudentAddr"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
			
			<h1>Student Address</h1>
			<br><br><br>
			<table id="entityListTable">
				<thead>
					<tr>
						<th style="width:70px">주소 번호</th>
						<th>학생 번호</th>
						<th>학생 주소</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<%
				request.setCharacterEncoding("euc-kr");
				
				int send_no = Integer.parseInt(request.getParameter("studentNo"));
				
				
				StudentAddrDao aDao = new StudentAddrDao();
				
				StudentAddr sa = aDao.studentNo(send_no);
				
				System.out.println(sa);
			
			
				%>
				<tr>
					<td><%=sa.getStudentAddrNo() %></td>
					<td><%=sa.getStudentNo() %></td>
					<td><%=sa.getStudentAddrContent() %></td>
					<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Student/updateStudentAddrForm.jsp?send_no=<%= send_no %>">UPDATE</a></td>
					<td><a class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Student/deleteStudentAddrAction.jsp?send_no=<%= send_no %>">DELETE</a></td>
				</tr>
			</table>
			<br><br>
			<div id="listButton">
				<a id="buttonToList" href="<%= request.getContextPath() %>/Student/studentList.jsp">목록으로</a>
			</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>