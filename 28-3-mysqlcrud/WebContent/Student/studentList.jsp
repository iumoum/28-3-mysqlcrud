<!-- 2018-07-02 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/indexCss.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/entityList.css">
</head>
<body>
	<%@ include file="/module/header.jsp"%>
	<div id="container">
		<%@ include file="/module/nav.jsp"%>
		<div id="article">
			<h1>Student</h1>
			<br>
			<br>
			<br>
			<div id="buttonForSearch">
				<form action="<%=request.getContextPath()%>/Student/studentList.jsp"
					method="post">
					<select name="sk">
						<option value="student_no">��ȣ</option>
						<option value="student_name">�̸�</option>
						<option value="student_age">����</option>
					</select> <input type="text" name="sv"> <input type="submit"
						value="�˻�">
				</form>
			</div>
			<%
			request.setCharacterEncoding("euc-kr");
			String sk = request.getParameter("sk");
			String sv = request.getParameter("sv");
			//�˻� ���� �Է¹��� ���� �ٷ� �޴´�.
			if(sv != null && sv !=""){
			//���� ���⼭ �ؽ�Ʈ �ڽ��� ����ִ� ���� null�� ������ �ƴϸ�. ��, �ؽ�Ʈ �ڽ� �ȿ� ���ڸ� �Է��ϰ� submit ��ư�� ������ ��.
		%>
			<br>
			<br>
			<table id="entityListTable">
				<thead>
					<tr>
						<th style="width: 70px">�л� ��ȣ</th>
						<th>�л� �̸�</th>
						<th>�л� ����</th>
						<th>�ּ��Է�</th>
						<th>���� �Է�</th>
						<th>���� ����</th>
						<th>����</th>
						<th>����</th>
					</tr>
				</thead>
				<%
							int currentPage = 1;
							if (request.getParameter("currentPage") != null) {
								currentPage = Integer.parseInt(request.getParameter("currentPage"));
							}
							int rowPerPage = 4;
		
							int begin = (currentPage - 1) * rowPerPage;
		
							StudentDao dao = new StudentDao();
		
							ArrayList<Student> get_list = dao.selectStudent(begin, rowPerPage, sk, sv);
							//�Ű����� 4���� �̿��� ȣ��.
							for (int i = 0; i < get_list.size(); i++) {
								System.out.println(i);
								Student s1 = get_list.get(i);
								int send_no = s1.getNo();
						%>
				<tbody>
					<tr>
						<td><%=send_no%></td>
						<td><a class="buttonToShowAddress"
							href="<%=request.getContextPath()%>/Student/studentAddrList.jsp?send_no=<%=send_no%>"><%=s1.getName()%></a></td>
						<td><%=s1.getAge()%></td>
						<td><a class="buttonToInsertAddress"
							href="<%=request.getContextPath()%>/Student/studentAddrInsertForm.jsp?send_no=<%=send_no%>">+address</a></td>
						<%
									StudentScoreDao sDao = new StudentScoreDao();
									
									String scoreCheck = sDao.studentScoreCheck(send_no);
									
									if(scoreCheck.equals("���� �ִ�")){
								%>
						<td>-</td>
						<%
									}else{
								%>
						<td><a class="buttonToInsertScore"
							href="<%=request.getContextPath()%>/Student/insertStudentScoreForm.jsp?send_no=<%=send_no%>">����
								�Է�!</a></td>
						<%
									}
								%>
						<td><a class="buttonToUpdateEntity"
							href="<%=request.getContextPath()%>/Student/studentAndScoreList.jsp?send_no=<%=send_no%>">��������</a></td>
						<td><a class="buttonToShowScore"
							href="<%=request.getContextPath()%>/Student/updateStudentForm.jsp?send_no=<%=send_no%>">����</a></td>
						<td><a class="buttonToDeleteEntity"
							href="<%=request.getContextPath()%>/Student/deleteStudent.jsp?send_no=<%=send_no%>">����</a></td>
					</tr>
				</tbody>
				<%
							}
							Student stu = new Student();
		
							dao.countNo(stu);
		
							int lastPage = stu.getCountno();
							//�켱 ���ڵ��� �Ѱ����� ���� �޼ҵ带 ȣ���԰� ���ÿ� int ������ Ÿ���� lastPage�� ��´�
							if (lastPage % 4 == 0) {
							//���� ��Ʈ �������� 4�� �������� �������� 0�̸�.
								lastPage = lastPage / 4;
								//��Ʈ �������� ��Ʈ������ ������ 4.
							} else {
							//���� �װ� �ƴϸ�.
								lastPage = lastPage / 4 + 1;
								//��Ʈ �������� ��Ʈ ������ ������ 4 ���ϱ� 1. �� �Ҽ����� �پ��ִ� �������� ����� �Ѿ�´�.
							}
							System.out.println(lastPage);
						%>
			</table>
			<br>
			<div id="addEntity">
				<a id="buttonToAddEntity"
					href="<%=request.getContextPath()%>/Student/insertStudentForm.jsp">+
					STUDENT</a>&nbsp;<a id="buttonToAddEntity"
					href="<%=request.getContextPath() %>/Student/studentAboveAvgList.jsp">+SCORELIST</a>
			</div>
			<br> <br>
			<div id="buttonForAnotherPage">
				<%
							if (currentPage > 1) {
						%>
				<a id="buttonToPrevPage"
					href="./studentList.jsp?currentPage=<%=currentPage - 1%>">&lt;
					����</a>
				<%
							} else {
						%>
				<span
					style="text-decoration: none; border: 1px solid gray; font-size: 13px; border-radius: 3px; padding: 4px 6px 4px 6px; font-weight: bold; color: #d7d7d7">&lt;
					����</span>

				<%
							}
						%>
				<%
							if (currentPage != lastPage) {
						%>
				<a id="buttonToNextPage"
					href="./studentList.jsp?currentPage=<%=currentPage + 1%>">����
					&gt;</a>
				<%
							} else {
						%>
				<span
					style="text-decoration: none; border: 1px solid gray; font-size: 13px; border-radius: 3px; padding: 4px 6px 4px 6px; font-weight: bold; color: #d7d7d7;">����
					&gt;</span>
				<%
							}
						%>
			</div>
			<%
			}else if(sv == null || sv == ""){
			//���� sv��  null�϶� �ų�, sv�� �����϶�. ��, submit ��ư�� Ŭ������ �ʾ������� �ؽ�Ʈ �ڽ��ȿ� ���� �ƹ��͵� ������ ���� ��������϶�.
			%>
			<br>
			<br>
			<table id="entityListTable">
				<thead>
					<tr>
						<th style="width: 70px">�л� ��ȣ</th>
						<th>�л� �̸�</th>
						<th>�л� ����</th>
						<th>�ּ��Է�</th>
						<th>���� �Է�</th>
						<th>���� ����</th>
						<th>����</th>
						<th>����</th>
					</tr>
				</thead>
				<%
						int currentPage = 1;
						if (request.getParameter("currentPage") != null) {
							currentPage = Integer.parseInt(request.getParameter("currentPage"));
						}
						int rowPerPage = 4;
	
						int begin = (currentPage - 1) * rowPerPage;
	
						StudentDao dao = new StudentDao();
						
						ArrayList<Student> get_list = dao.selectStudentMore(begin, rowPerPage);
	
						for (int i = 0; i < get_list.size(); i++) {
							System.out.println(i);
							Student s1 = get_list.get(i);
							int send_no = s1.getNo();
					%>
				<tbody>
					<tr>
						<td><%=send_no%></td>
						<td><a class="buttonToShowAddress"
							href="<%=request.getContextPath()%>/Student/studentAddrList.jsp?send_no=<%=send_no%>"><%=s1.getName()%></a></td>
						<td><%=s1.getAge()%></td>
						<td><a class="buttonToInsertAddress"
							href="<%=request.getContextPath()%>/Student/studentAddrInsertForm.jsp?send_no=<%=send_no%>">+address</a></td>
						<%
								StudentScoreDao sDao = new StudentScoreDao();
								
								String scoreCheck = sDao.studentScoreCheck(send_no);
								
								if(scoreCheck.equals("���� �ִ�")){
							%>
						<td>-</td>
						<%
								}else{
							%>
						<td><a class="buttonToInsertScore"
							href="<%=request.getContextPath()%>/Student/insertStudentScoreForm.jsp?send_no=<%=send_no%>">����
								�Է�!</a></td>
						<%
								}
							%>
						<td><a class="buttonToUpdateEntity"
							href="<%=request.getContextPath()%>/Student/studentAndScoreList.jsp?send_no=<%=send_no%>">��������</a></td>
						<td><a class="buttonToShowScore"
							href="<%=request.getContextPath()%>/Student/updateStudentForm.jsp?send_no=<%=send_no%>">����</a></td>
						<td><a class="buttonToDeleteEntity"
							href="<%=request.getContextPath()%>/Student/deleteStudent.jsp?send_no=<%=send_no%>">����</a></td>
					</tr>
				</tbody>
				<%
						}
						Student stu = new Student();
	
						dao.countNo(stu);
	
						int lastPage = stu.getCountno();
						if (lastPage % 4 == 0) {
							lastPage = lastPage / 4;
						} else {
							lastPage = lastPage / 4 + 1;
						}
						System.out.println(lastPage);
					%>
			</table>
			<br>
			<div id="addEntity">
				<a id="buttonToAddEntity"
					href="<%=request.getContextPath()%>/Student/insertStudentForm.jsp">+
					STUDENT</a>&nbsp;<a id="buttonToAddEntity"
					href="<%=request.getContextPath() %>/Student/studentAboveAvgList.jsp">+SCORELIST</a>
			</div>
			<br> <br>
			<div id="buttonForAnotherPage">
				<%
						if (currentPage > 1) {
					%>
				<a id="buttonToPrevPage"
					href="./studentList.jsp?currentPage=<%=currentPage - 1%>">&lt;
					����</a>
				<%
						} else {
					%>
				<span
					style="text-decoration: none; border: 1px solid gray; font-size: 13px; border-radius: 3px; padding: 4px 6px 4px 6px; font-weight: bold; color: #d7d7d7">&lt;
					����</span>

				<%
						}
					%>
				<%
						if (currentPage != lastPage) {
					%>
				<a id="buttonToNextPage"
					href="./studentList.jsp?currentPage=<%=currentPage + 1%>">����
					&gt;</a>
				<%
						} else {
					%>
				<span
					style="text-decoration: none; border: 1px solid gray; font-size: 13px; border-radius: 3px; padding: 4px 6px 4px 6px; font-weight: bold; color: #d7d7d7;">����
					&gt;</span>
				<%
						}
					%>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@ include file="/module/footer.jsp"%>
</body>
</html>