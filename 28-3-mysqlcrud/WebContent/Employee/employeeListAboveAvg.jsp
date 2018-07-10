<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>employeeListAboveAvg</h1>
		<%
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
			int scoreAvg = employeeScoreDao.selectScoreAvg();
			
			ArrayList<EmployeeAndScore> arrayListEmployeeAndScore = new ArrayList<EmployeeAndScore>();
			arrayListEmployeeAndScore = employeeScoreDao.selectEmployeeListAboveAvg();
			System.out.println(arrayListEmployeeAndScore + "<<<<-----");
		%>
		<div>
			평균 : <%= scoreAvg %>
		</div>
		<table>
			<thead>
				<tr>
					<th>직원 번호</th>
					<th>직원 이름</th>
					<th>점수 번호</th>
					<th>점수</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0; i<arrayListEmployeeAndScore.size(); i++) {
						EmployeeAndScore employeeAndScore = arrayListEmployeeAndScore.get(i);
				%>
						<tr>
							<td><%=arrayListEmployeeAndScore.get(i).getEmployee().getEmployeeNo()%></td>
							<td><%=arrayListEmployeeAndScore.get(i).getEmployee().getEmployeeName()%></td>
							<td><%=arrayListEmployeeAndScore.get(i).getEmployeeScore().getEmployeeScoreNo()%></td>
							<td><%=arrayListEmployeeAndScore.get(i).getEmployeeScore().getScore()%></td>
						</tr>
				<%
					}
				%>		
			</tbody>
		</table>
	</body>
</html>