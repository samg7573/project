<%@page import="egovframework.sample.service.category_EDAO"%>
<%@page import="egovframework.sample.service.Category_EVO"%>
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
<script type="text/javascript" src="/js/button.js"></script>
<head>
<style>
table {
	width: 70%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th {
	border: 1px solid #444444;
	text-align: center;
}

td {
	border: 1px solid #444444;
	padding: 10px;
	text-align: left;
}

a {
	text-decoration-line: none;
	color: black;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table>
			<tr>
			</tr>
			<tr>
				<fieldset>
					<form id="userinfoform" method="post" action="updateuserinfo.do">
						<legend>${user.user_nm} 님 회원 정보 수정</legend>
						<table>
							<tr>
								<td>ID</td>
								<td>${user.user_id}</td>
								<td>password</td>
								<td><input type='button'
									onclick="location='/updateuserinfo.do'" value='비밀번호 변경' /></td>
							</tr>
							<tr>
								<td>성별</td>
								<td scope="col"><c:set var="sexdstn"
										value="${user.sexdstn}" /> <c:choose>
										<c:when test="${sexdstn eq '남성'}">

											<label><input type='radio' name="sexdstn" value="남성"
												checked="checked" /> 남 </label>
											<br>
											<label><input type='radio' name="sexdstn" value="여성" />
												여</label>
										</c:when>

										<c:when test="${sexdstn eq '여성'}">

											<label><input type='radio' name="sexdstn" value="남성" />
												남 </label>
											<br>
											<label><input type='radio' name="sexdstn" value="여성"
												checked="checked" /> 여</label>
										</c:when>
									</c:choose></td>
								<td>이메일</td>
								<td><input type="text" name="eml" value="${user.eml}" /></td>
							</tr>
							<tr>
								<td>회원 등급</td>
								<td>${user.mbr_grd}</td>
								<td>닉네임</td>
								<td><input type="text" name="nick_nm"
									value="${user.nick_nm}"></td>
							</tr>
						</table>
						</b> <input type="submit" name="infoput" value="수정">
					</form>
				</fieldset>
				<br>
			</tr>
		</table>
	</div>

	<%
		}
	%>
</body>
</html>