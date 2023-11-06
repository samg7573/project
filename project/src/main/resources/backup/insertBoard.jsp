<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.sample.service.BoardVO"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%
	Object loggedInUser = session.getAttribute("loggedInUser");
BoardVO board = new BoardVO();

if (loggedInUser != null) {
	String userName = ((UserVO) loggedInUser).getUser_nm();
	String userId = ((UserVO) loggedInUser).getUser_id();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<body>

	<center>
		<h1>게시글 등록</h1>
		<form id="boardForm" action="insertBoard.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center" bgcolor="skyblue" width="150">작성자</td>
					<td align="left"><input name="reg_user" type="text" size="52"
						value="${board.reg_user }" /></td>
				</tr>
				<tr>
					<td align="center" bgcolor="skyblue" width="150">수정자</td>
					<td align="left"><input name="mdfcn_user" type="text"
						size="52" value="${board.mdfcn_user }" /></td>
				</tr>
				<tr>
					<td align="center" bgcolor="skyblue" width="150">카테고리</td>
					<td align="left"><select name="ctgry_b">
							<option value="CTGRY_001">운동게시판</option>
							<option value="CTGRY_002">식단게시판</option>
							<option value="CTGRY_003">자유게시판</option>
							<option value="CTGRY_004">기타게시판</option>
					</select></td>
				</tr>
				<tr>
					<td align="center" bgcolor="skyblue" width="150">제목</td>
					<td align="left"><input name="ttl" type="text" size="52"
						value="${board.ttl }" /></td>
				</tr>

				<tr>
					<td align="center" bgcolor="skyblue" width="150">내용</td>
					<td align="left"><input name="bbs_cn" type="text" size="52"
						value="${board.bbs_cn }" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2" align="center"><input
						type="submit" value="글 등록" /></td>
				</tr>
			</table>
			<%-- <%
				UserVO loggedInUser = (UserVO) session.getAttribute("loggedInUser");
			if (loggedInUser != null) {
				String userId = ((UserVO) loggedInUser).getId();
				String nickNm = ((UserVO) loggedInUser).getNick_nm();
			%>
			<input type="hidden" name="reg_user" value="<%=nickNm%>" /> <input
				type="hidden" name="mdfcn_user" value="<%=nickNm%>" />
			<%
				}
			%> --%>
			<!-- <input type="hidden" id="reg_user" name="reg_user" />
			<input type="hidden" id="mdfcn_user" name="mdfcn_user" /> -->
		</form>

		<%-- <br> <a href="selectBoardList.do?userId=${loggedInUser.getId() }">게시글 목록</a> --%>
		<br> <a href="selectBoardList.do">게시글 목록</a>
	</center>
	<%
		}
	%>
</body>
</html>