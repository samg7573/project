
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
Object loggedInUser = session.getAttribute("loggedInUser");
if (loggedInUser != null) {
	String userName = ((UserVO) loggedInUser).getUser_nm();
	String userId = ((UserVO) loggedInUser).getUser_id();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>

	<center>
		<h1>비밀번호 변경</h1>
		<form action="PwUserChange.do" method="post">
		<input type="hidden" name="userId" value="${loggedInUser.getId()}"/>
			<table border="1" cellpadding="0" cellspacing="0">

				<tr>
					<td bgcolor="skyblue">현재 비밀번호</td>
					<td align="left"><input name="now_pw" id="now_pw"
						type="text" size="20" required /></td>
				</tr>

				<tr>
					<td bgcolor="skyblue">새로운 비밀번호</td>
					<td align="left"><input name="new_pw" id="new_pw"
						type="text" size="20" required /></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호 확인</td>
					<td align="left"><input name="new_pwcheck" id="new_pwcheck" type="text"
						size="20" required /></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="비밀번호  수정" />

						<button type="button"
							onclick="location='/allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=${routine}'">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</center>
	<%
		}
	%>
</body>
</html>