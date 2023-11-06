<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.sample.service.BoardVO"%>
<%@ page import="egovframework.sample.service.CommentbVO"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%
	Object loggedInUser = session.getAttribute("loggedInUser");
if (loggedInUser != null) {
	String userName = ((UserVO) loggedInUser).getUser_nm();
	String userNick = ((UserVO) loggedInUser).getNick_nm();
	BoardVO board = (BoardVO) request.getAttribute("board");
	String reg = board.getReg_user();
	String userGrd = ((UserVO) loggedInUser).getMbr_grd();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<meta name="naver-site-verification" content="" />
<meta name="description" content="">
<meta property="og:type" content="website">
<meta property="og:title" content="Sample">
<meta property="og:description" content="">
<meta property="og:image" content="img/common/logo.png">
<meta property="og:url" content="">
<title>글 상세</title>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/topmenu_script.js"></script>
<script src="js/swiper.min.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">
<link rel="stylesheet" href="css/sh_common.css">
<link rel="stylesheet" href="css/sh_main.css">
<style>

/* ★★★★★★★★스타일링된 테이블★★★★★★★★ */
table {
	width: 80%;
	border-collapse: collapse;
	margin-top: 50px;
	border: none;
	font-size: 16px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	boarder: none;
}

th {
	background-color: #f8fafc;
	text-align: center;
}

/* 마우스 호버 효과 */
th:hover, td:hover {
	background-color: #f4f4f4;
}

/* 제목 행 디자인 */
th {
	font-weight: bold;
	border-bottom: 2px solid #1478CD;
	border-top: 2px solid #1478CD;
}

th:first-child {
	
}

/* 내용 행 디자인 */
td {
	vertical-align: middle;
}

/* 테이블 위 아래 여백 조정 */
table:first-child {
	margin-top: 0;
}

table:last-child {
	margin-bottom: 0;
}
/* 테이블의 세로선 제거 */
table th, table td {
	border-left: none;
	border-right: none;
}

/* ★★★★★★★★스타일링된 테이블★★★★★★★★ */
h3 {
	color: #1478CD;
	font-size: 200%;
	font-weight: 500;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.styled-link {
	color: #3C3C8C;
	font-size: 15px;
	text-decoration: none;
	transition: color 0.3s;
}

.styled-link:hover {
	color: #ff6678;
}

button[type="submit"] {
	padding: 5px 10px;
	background-color: #32A4FF;
	border-radius: 10px;
	color: white;
}

button[type="submit"]:hover {
	background-color: #ff6678;
}

#form-controls button {
	border: none;
	font-size: 120%;
}

#form-controls button:hover {
	cursor: pointer;
}

button[type="button"] {
	padding: 16px 0 16px 35px;
	background-color: transparent;
	color: #ED4B5E;
}

#form-inner-container {
	background-color: #EBF5FF;
	max-width: 70%;
	border-radius: 8px;
	box-shadow: 0 0 20px gainsboro;
}

#form-controls {
	margin-bottom: 20px;
}

h3 {
	color: #1478CD;
	font-size: 150%;
	font-weight: 500;
}

h6 {
	color: #1478CD;
	font-size: 100%;
	font-weight: 500;
}

.styled-link {
	color: #3C3C8C;
	text-decoration: none;
	transition: color 0.3s;
}

.styled-link:hover {
	color: #ff6678;
}

.rounded-input {
	border-radius: 10px; /* 원하는 값으로 조절 */
	border: 1px solid #ccc;
	padding: 8px; /* 내용과 경계 사이의 간격 */
	width: 100%;
	box-sizing: border-box; /* padding을 포함한 전체 크기 설정 */
}

/* 추천하기 버튼 스타일 */
button.recommend-button {
	padding: 5px 10px;
	background-color: #ff6678;
	border-radius: 10px;
	color: white;
}

button.recommend-button:hover {
	background-color: #32A4FF; /* 호버 시 색상 변경 */
}

.special-table {
	border-collapse: collapse; /* 테이블 테두리 합치기 */
}

.special-table, .special-table th, .special-table td {
	border: none; /* 테두리 없애기 */
}

#left_image {
	position: absolute;
	top: 45%;
	left: 300px;
	transform: translateY(-50%);
}

.center-image {
	display: flex;
	justify-content: center;
}

style>body {
	font-family: Arial, sans-serif;
	font-size: 150%;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.banner {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #969696;
	color: #fff;
	padding: 1px;
	position: relative;
}

.logo {
	display: inline-block;
	margin-left: 50px;
}

.logo img {
	width: 100px;
	height: auto;
	vertical-align: auto;
	margin-left: 30px;
}

.submenu {
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #fff;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	min-width: 160px;
	z-index: 1;
	display: none;
}

.submenu a {
	display: block;
	padding: 10px;
	text-decoration: none;
	color: #333;
	transition: background-color 0.3s;
}

.submenu a:hover {
	background-color: #f4f4f4;
}

.submenu.active {
	display: block;
}

.user-info {
	position: relative;
	margin-right: 200px;
}

.user-info-menu {
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #fff;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	min-width: 160px;
	z-index: 1;
	display: none;
}

.user-info-menu a {
	display: block;
	padding: 10px;
	text-decoration: none;
	color: #333;
	transition: background-color 0.3s;
}

.user-info-menu a:hover {
	background-color: #f4f4f4;
}

.user-info:hover .user-info-menu {
	display: block;
}

button.yt-icon-button {
	display: inline-block;
	width: 24px;
	height: 24px;
	margin-left: 10px;
	padding: 0;
	background: none;
	border: none;
	cursor: pointer;
}

button {
	appearance: auto;
	text-rendering: auto;
	color: buttontext;
	letter-spacing: normal;
	word-spacing: normal;
	line-height: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: center;
	align-items: flex-start;
	cursor: default;
	box-sizing: border-box;
	background-color: buttonface;
	writing-mode: horizontal-tb !important;
	margin: 0em;
	padding-block: 1px;
	padding-inline: 6px;
	border-width: 2px;
	border-style: outset;
	border-color: buttonborder;
	border-image: initial;
}

.submenu a:hover {
	background-color: #f4f4f4;
}

.image-cell .image {
	width: 90%;
	height: auto;
	display: block;
	transition: transform 0.3s;
}

.image-cell:hover {
	transform: scale(1.05);
}

.center-link {
	display: block;
	text-align: center;
	margin-top: 20px;
	font-weight: bold;
	color: #007bff;
}

.image-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: center;
	align-content: flex-start;
}

.image-cell {
	width: calc(33.33% -10px);
	text-align: center;
	margin-bottom: 0;
	margin: 0 0 0 0;
	overflow: hidden;
	/* position: relative; */
}

.image {
	width: 100%;
	height: auto;
	object-fit: cover;
	align-self: center;
}

.submenu.show {
	display: block;
}

.tooltip {
	position: relative;
	display: inline-block;
	cursor: pointer;
}

.tooltip:hover::before {
	content: "목록보기";
	position: absolute;
	background-color: white;
	color: black;
	padding: 5px;
	border-radius: 5px;
	top: 100%;
	left: 15%;
	transform: translateX(-50%);
	white-space: nowrap;
	opacity: 0;
	transition: opacity 0.3s ease;
}

.tooltip:hover::before {
	opacity: 1;
}

.sh_nav_wrap {
	justify-content: space-between;
}

.info-box {
	margin-bottom: 20px;
	padding: 15px;
	border-radius: 5px;
	border: 1px solid #e1e1e1;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.info-label {
	font-weight: bold;
	color: #333;
	flex: 1;
}

.info-content {
	flex: 3;
	padding-left: 10px;
}

.rounded-input {
	border-radius: 5px;
	width: 100%;
	padding: 10px;
	border: 1px solid #e1e1e1;
}
</style>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>

</head>
<body>
	<div id="sh_wrapper">
		<div id="sh_hd">
			<div class="top_nav_bg"></div>
			<div id="sh_hd_wrapper">
				<div id="sh_nav_wrap">
					<ul id="sh_nav">
						<li class="menu-item active" style="margin-left: -20%">
							<button id="button" class="style-scope yt-icon-button"
								aria-label="가이드" aria-pressed="false">
								<yt-icon id="guide-icon" icon="yt-icons:menu"
									class="style-scope ytd-masthead"> <yt-icon-shape
									class="style-scope yt-icon"> <icon-shape
									class="yt-spec-icon-shape">
								<div style="width: 100%; height: 100%; fill: currentcolor;">
									<svg height="24" viewBox="0 0 24 24" width="24"
										focusable="false"
										style="pointer-events: none; display: block; width: 100%; height: 100%;">
            			<path d="M21 6H3V5h18v1zm0 5H3v1h18v-1zm0 6H3v1h18v-1z">
						</path></svg>
								</icon-shape></yt-icon-shape></yt-icon>
							</button>

							<ul class="sh_nav_s">
								<li><a href="showMain.do?userId=${loggedInUser.getId()}">메인화면</a></li>
								<li><a
									href="selectBoardList.do?userId=${loggedInUser.getId()}">자유게시판</a></li>
								<li><a
									href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=other">타회원 운동 루틴</a></li>
								<li><a href="getAllParts.do?userId=${loggedInUser.getId()}">자료실</a></li>
							</ul>
						</li>

						<ul id="sh_nav">
							<li class="menu-item active"><a
								href="Mypage.do?userId=${loggedInUser.getId()}"><%=userName%>님
									마이페이지</a>
								<ul class="sh_nav_s">
									<li><a
										href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=me">운동루틴</a></li>
									<li><a href="Mypage.do?userId=${loggedInUser.getId()}">회원정보</a></li>
									<%
										if (userGrd.equals("관리자")) {
									%>
									<li><a href="selectUserList.do">회원관리</a></li>
									<%
										}
									%>
									<li><a href="logout.do">로그아웃</a></li>
								</ul></li>
							<div id="sh_top_logo">
								<a href="showMain.do?userId=${loggedInUser.getId()}"> <img
									src="/img/common/logo.png" alt="Logo" width="250" height="auto"
									style="margin-left: 20%">
								</a>
							</div>
				</div>

			</div>
		</div>
		<script>
			const button = document.getElementById("button");
			const submenu = document.getElementById("submenu");
			const tooltip = document.querySelector(".tooltip");

			button.addEventListener("click", function() {
				submenu.classList.toggle("show");

			});
		</script>

		<center>
			<table width="800" height="20" border="0" cellpadding="0"
				cellspacing="0"></table>
			<table width="800" height="20" border="0" cellpadding="0"
				cellspacing="0"></table>
			<table width="800" height="20" border="0" cellpadding="0"
				cellspacing="0"></table>
			<h3>select Board</h3>
			<br> <br> <br>
			<h4>"선택하신 게시글의 상세조회 화면입니다."</h4>
			<br> <br> <br>
		</center>

		<form action="updateBoard.do" method="post">
			<input name="id" type="hidden" value="${board.id }" /> <br> <br>
			<br>

			<div class="info-box">
				<div class="info-content">${board.ctgry_b }</div>
			</div>
			<div class="info-box">
				<div class="info-content">
					<input name="ttl" type="text" size="100" value="${board.ttl }"
						class="rounded-input" />
				</div>
			</div>

			<div class="info-box" align="left">
				<div class="info-content" text-size="100" >${loggedInUser.getNick_nm()}<b><%=userGrd %></b></div>
			</div>


			<div class="info-box">
				<div class="info-label">내용</div>
				<div class="info-content">
					<textarea name="bbs_cn" rows="6" cols="50" class="rounded-input">${board.bbs_cn }</textarea>
				</div>
			</div>

			<div class="info-box">
				<div class="info-label">추천수</div>
				<div class="info-content" id="rcmdin_cnt">${board.rcmdin_cnt }</div>
			</div>


			<center>
				<div id="form-controls">
					<button type="submit">update</button>
					&nbsp;&nbsp;&nbsp;
					<button class="recommend-button"
						onclick="increaseRcmdin('${board.id}')">like</button>
				</div>
			</center>

		</form>

<center>
		<form action="insertCommentb.do" method="post">
			<table class="special-table" border="1" cellpadding="0"
				cellspacing="0">
				<tr>
					<td align="center" width="70"
						style="font-weight: bold; color: #3296FF">comment</td>
					<td align="left"><input name="cmnt" type="text" size="52"
						value="${commentb.cmnt }" class="rounded-input" /></td>
					<td>
						<input type="hidden" name="reg_user" value="${board.reg_user }">
						<input type="hidden" name="mdfcn_user"
						value="${board.mdfcn_user }"> <input type="hidden"
						name="bbs_fk" value="${board.id }"> <input type="submit"
						value="등록" />
					</td>
				</tr>
			</table>
		</form>
		<table class="special-table" cellpadding="0" cellspacing="0"
			width="1000" style="border-collapse: collapse;">
			<c:forEach var="commentb" items="${commentbList}">
				<tr>
					<td align="center"
						style="padding: 10px; width: 300px; vertical-align: top;">${commentb.id }</td>
					<td align="center"
						style="padding: 10px; width: 100px; vertical-align: top;">${commentb.reg_user }</td>
					<td align="center"
						style="padding: 10px; width: 400px; vertical-align: top;">${commentb.cmnt }</td>
					<td align="left"
						style="padding: 10px; width: 300px; vertical-align: top;"><fmt:formatDate
							value="${commentb.reg_dt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

					<td align="center"
						style="padding: 10px; width: 100px; vertical-align: top;"><a
						href="deleteCommentb.do?id=${commentb.id }&bbs_fk=${board.id}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br> <br> <br>
	</div>
</center>

	<br>
	<br>
	<br>
	<center>
		<a class="styled-link" href="insertBoard.do">new</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="styled-link" href="deleteBoard.do?id=${board.id }">delete</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="styled-link" href="selectBoardList.do">list</a>
	</center>
	<br>
	<br>
	<br>
</body>
<script src="https://code.jquery.com/jquery-1.4.2.min.js"></script>
<script>
	function increaseRcmdin(id) {
		$.ajax({
			type : "POST",
			url : "<c:url value='/increaseRcmdin.do' />", // 여기를 수정
			data : {
				id : id
			},
			success : function(response) {
				var rcmdinCntElement = $("#rcmdin_cnt");
				rcmdinCntElement.text(parseInt(rcmdinCntElement.text()) + 1);
			}
		});
	}
</script>
<%
	}
%>
</html>