<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.sample.service.BoardVO"%>
<%@ page import="egovframework.sample.service.CommentbVO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%
	Object loggedInUser = session.getAttribute("loggedInUser");
if (loggedInUser != null) {
	String userName = ((UserVO) loggedInUser).getUser_nm();
	String userNick = ((UserVO) loggedInUser).getNick_nm();
	BoardVO board = (BoardVO) request.getAttribute("board");
	
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

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fff;
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

<!--
----------------------------------
> /* 내용 테이블 스타일 */
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
	border: none;
}

th {
	background-color: #f8fafc;
	text-align: center;
	font-weight: bold;
}

/* 마우스 호버 효과 */
th:hover, td:hover {
	background-color: #f4f4f4;
}

/* 제목 행 디자인 */
th {
	border-bottom: 2px solid #1478CD;
	border-top: 2px solid #1478CD;
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

/* 글 제목 스타일 */
h3 {
	margin-top: 30px;
	margin-bottom: 30px;
	color: #1478CD;
	font-size: 250%;
	font-weight: 500;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.form-group {
	margin-bottom: 2%;
	size: 10px;
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
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

button[type="submit"]:hover {
	background-color: #ff6678;
}

/* 추천하기 버튼 스타일 */
button.recommend-button {
	padding: 5px 10px;
	background-color: #ff6678;
	border-radius: 10px;
	color: white;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

button.recommend-button:hover {
	background-color: #32A4FF;
}

.button-link {
	display: inline-block;
	padding: 10px 20px;
	background-color: #1478CD;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
	font-weight: bold;
}

.button-link:hover {
	background-color: #0f63b0;
	/* 버튼에 마우스를 올렸을 때의 배경색 변경 */
}

/* 테이블 테두리 스타일링 */
.special-table {
	border-collapse: collapse;
}

.special-table, .special-table th, .special-table td {
	border: none;
}

#form-inner-container {
	background-color: #EBF5FF;
	max-width: 60%;
	border-radius: 8px;
	box-shadow: 0 0 20px gainsboro;
}

/* 추가 스타일링 */
.info-box {
	padding: 15px;
	border-radius: 5px;
	border-left: 1px solid #1478CD;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 10px;
	margin-bottom: 20px;
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

.container {
	background-color: #fff;
	border-radius: 10px;
	padding: 20px;
	margin: 0 auto;
	margin-top: 5%;
	margin-bottom: 5%;
	width: 100%;
	max-width: 1200px;
}

hr {
	border: 1px solid #ddd;
	margin: 20px 0;
}

label {
	font-weight: bold;
	margin-left: 3%;
	margin-top: 10px;
}

input[type="text"], select {
	width: 100%;
	height: 40px;
	margin-top: 5px;
	padding: 5px;
}

textarea {
	width: 100%;
	height: 200px;
	padding: 5px;
	font-size: 16px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group-a {
	margin-top: -10%;
}

.btn-submit {
	display: block;
	width: 20%;
	padding: 10px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn-submit:hover {
	background-color: #0056b3;
}

.btn-back {
	display: block;
	width: 20%;
	padding: 10px;
	background-color: #6c757d;
	color: #fff;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
	transition: background-color 0.3s;
}

.btn-back:hover {
	background-color: #495057;
}
</style>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>
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
			<div id="sh_hd_wrapper" >
				<div id="sh_nav_wrap">
					<ul id="sh_nav">
						<li class="menu-item active" style="margin-left: -20%">
							<button id="button" class="style-scope yt-icon-button"
								aria-label="가이드" aria-pressed="false">
								<yt-icon id="guide-icon" icon="yt-icons:menu"
									class="style-scope ytd-masthead"> <yt-icon-shape
									class="style-scope yt-icon"> <icon-shape
									class="yt-spec-icon-shape">
								<div style="width: 100%; height: 100%; fill: black;">
									<svg height="24" viewBox="0 0 24 24" width="24"
										focusable="false"
										style="pointer-events: none; display: block; width: 100%; height: 100%;">
            			<path d="M21 6H3V5h18v1zm0 5H3v1h18v-1zm0 6H3v1h18v-1z">
						</path></svg>
								</icon-shape></yt-icon-shape></yt-icon>
							</button>

							<ul class="sh_nav_s">
								<li><a href="showMain.do?userId=${loggedInUser.getId()}" style=" font-size:19px; color:black; font-weight:20px; margin-bottom:10px;">메인화면</a></li>
								<li><a
									href="selectBoardList.do?userId=${loggedInUser.getId()}" style=" font-size:19px; color:black; font-weight:20px; margin-bottom:10px;">자유게시판</a></li>
								<li><a
									href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=other" style=" font-size:19px; color:black; font-weight:20px; margin-bottom:10px;">타회원
										루틴</a></li>
								<li><a href="getAllParts.do?userId=${loggedInUser.getId()}" style=" font-size:19px; color:black; font-weight:20px">자료실</a></li>
							</ul>
						</li>

						<ul id="sh_nav">
							<li class="menu-item active">
							<a
								href="mypageinfo.do?userId=${loggedInUser.getId()}&routine=me" style=" font-size:19px; color:black; font-weight:bold">"<%=userName%>" 님
									마이페이지</a>
								<ul class="sh_nav_s">
									<li><a
										href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=me" style=" font-size:19px; color:black; font-weight:20px; margin-bottom:10px;">운동루틴</a></li>
									<li><a href="mypageinfo.do?userId=${loggedInUser.getId()}&routine=me" style=" font-size:19px; color:black; font-weight:20px; margin-bottom:10px;">회원정보</a></li>
									<%
										if (userGrd.equals("관리자")) {
									%>
									<li><a href="selectUserList.do" style=" font-size:19px; color:black; font-weight:20px; margin-bottom:10px;">회원관리</a></li>
									<%
										}
									%>
									<li><a href="logout.do" style=" font-size:19px; color:black; font-weight:20px; margin-bottom:10px;">로그아웃</a></li>
								</ul></li>
							<div id="sh_top_logo">
								<a href="showMain.do?userId=${loggedInUser.getId()}"> <img
									src="/img/common/logo.png" alt="Logo" width="250" height="auto"
									style="margin-left: 20%">
								</a>
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

				<br> <br> <br>
				<br> <br> <br>
				<h3>Registering a Board</h3>
				<br> <br> <br>
				<h2 style="font-size: 150%">"게시글 등록화면입니다. 자유로운 주제로 작성해주세요."</h4>
				<br> <br> <br>
			</center>

			<hr style="border-color: #1478CD; margin: 20px 0;">
			<center>
				<div id="form-inner-container">
					<br> <br> <br>
					<div class="container">
						<form id="boardForm" action="insertBoard.do" method="post">
							<div class="form-group-a" style="margin-top: 5px;">
								<p style="font-size: 20px; font-weight: bold; align: left;">제목</p>
								&nbsp;&nbsp;<br> <input type="text"
									style="width: 700px; margin-right: 5%; font-size: 20px;"
									id="ttl" name="ttl" placeholder="제목을 입력하세요"
									value="${board.ttl }" type="required"> <select
									id="ctgry_b" name="ctgry_b"
									style="width: 200px; font-size: 20px;" type="required">
									<option value="CTGRY_001">운동게시판</option>
									<option value="CTGRY_002">식단게시판</option>
									<option value="CTGRY_003">자유게시판</option>
									<option value="CTGRY_004">기타게시판</option>
								</select> <br> <br>
								<hr style="border-color: #1478CD; margin: 20px 0;">
							</div>
							<br> <br>
							<div class="form-group">
								<p style="font-size: 20px; font-weight: bold;">내용</p>
								&nbsp;&nbsp;<br>
								<textarea id="bbs_cn" name="bbs_cn" placeholder="내용을 입력하세요"
									style="font-size: 20px;" value="${board.bbs_cn }"
									type="required"></textarea>
							</div>
							<center>
								<div class="form-group">
									<input type="submit" class="btn-submit" value="글 등록">&nbsp;<a
										href="selectBoardList.do" class="btn-back">게시글 목록</a>
								</div>
								<div class="form-group" style="display: none;">
									<input type="text" id="reg_user" name="reg_user"
										style="width: 100px; float: left; margin-bottom: 5%"
										type="hidden" value="${loggedInUser.getId()}">
								</div>
							</center>
							<%-- <input type="hidden" id="reg_user" name="reg_user"
               value="${loggedInUser.getId()}" /> --%>
							<input type="hidden" id="mdfcn_user" name="mdfcn_user"
								value="${loggedInUser.getId()}" />
						</form>
					</div>
					<br> <br> <br>
				</div>
				<br> <br> <br>
			</center>

			<input type="hidden" id="reg_user" name="reg_user"
				value="${board.reg_user }" /> <input type="hidden" id="mdfcn_user"
				name="mdfcn_user" value="${board.mdfcn_user }" />

		</div>

		<br> <br> <br>
		</center>
		</form>
	</div>


















	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="sh_ft">
		<div class="info">
			<span style="font-size: 20px;">HealthCare</span> 고객센터:1234-5678 <br>
			이메일:healthcare123@naver.com 주소:대구광역시 수성구 알파시티1 160
		</div>
		<div class="copy">
			<div class="copy_wrap">
				<span>ⓒ <b>Sample</b> All rights reserved.
				</span>
			</div>
		</div>
	</div>
	</div>
	</div>
	<%
		}
	%>
</body>
</html>
