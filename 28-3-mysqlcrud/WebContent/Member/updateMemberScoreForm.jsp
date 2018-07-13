<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Score Form</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// memberScoreList.jsp�� ���� �Ѱܹ��� memberNo ���� ������ ���� �� �׽�Ʈ
					int memberNo = Integer.parseInt(request.getParameter("memberNo"));
					System.out.println("memberNo from memberScoreList.jsp : " + memberNo);
					
					// Ư�� �޼��带 ȣ���ϱ� ���� memberScoreDao ��ü ����
					MemberScoreDao memberScoreDao = new MemberScoreDao();
					
					// selectMemberAndMemberScore �޼��带 ȣ���ϰ� memberAndMemberScore ��ü�� �������� ���� �޾� ������ ����.
					MemberAndMemberScore memberAndMemberScore = memberScoreDao.selectMemberAndMemberScore(memberNo);
				%>
				<h1>Update MemberScore</h1>
				<form action="<%= request.getContextPath() %>/Member/updateMemberScoreAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>���� ��ȣ : </td>
							<td><input type="text" name="memberNo" value="<%= memberAndMemberScore.getMember().getMemberNo() %>" readonly>
						</tr>
						<tr>
							<td>���� �̸� : </td>
							<td><input type="text" name="memberName" value="<%= memberAndMemberScore.getMember().getMemberName() %>" readonly>
						</tr>
						<tr>
							<td>���� ���� : </td>
							<td><input type="text" name="memberScore" value="<%= memberAndMemberScore.getMemberScore().getScore() %>">
						</tr>
						<tr>
							<td colspan="2"><button>����</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>