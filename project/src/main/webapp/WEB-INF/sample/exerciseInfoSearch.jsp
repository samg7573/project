<%@page import="egovframework.sample.service.ExerciseVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="egovframework.sample.service.category_EDAO"%>
<%@page import="egovframework.sample.service.Category_EVO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%
	Object loggedInUser = session.getAttribute("loggedInUser");
if (loggedInUser != null) {
	String userName = ((UserVO) loggedInUser).getUser_nm();
	String userId = ((UserVO) loggedInUser).getUser_id();
	String userGrd = ((UserVO) loggedInUser).getMbr_grd();

	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<meta name="naver-site-verification" content="" />
<meta name="description" content="">
<meta property="og:type" content="website">
<meta property="og:title" content="Sample">
<meta property="og:description" content="">
<meta property="og:image" content="img/common/logo.png">
<meta property="og:image" content="img/sub/sub_main_banner.jpg">
<meta property="og:image" content="img/inc04/inc04_bg.jpg">

<meta property="og:url" content="">

<script src="js/jquery-ui.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/topmenu_script.js"></script>
<script src="js/swiper.min.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">
<link rel="stylesheet" href="css/sh_common.css">
<link rel="stylesheet" href="css/sh_main.css">

<style>
<!--
------------main-----------------
>
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

/* 테이블 전체 스타일 */
.exercise-table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	margin-top: 20px;
	border: 1px solid #ccc;
}

/* 제목 행 스타일 */
.title-row {
	background-color: #007bff;
	color: #fff;
	font-weight: bold;
}

/* 데이터 행 스타일 */
.data-row:nth-child(even) {
	background-color: #fff;
}

/* 셀 스타일 */
.exercise-table th, .exercise-table td {
	padding: 10px;
	text-align: center;
}

/* 버튼 스타일 */
.button-container button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	cursor: pointer;
	margin-right: 10px;
}

/* 수정 버튼 스타일 */
.edit-button {
	background-color: #28a745;
}

/* 삭제 버튼 스타일 */
.delete-button {
	background-color: #32A4FF;
}

h3 {
	color: #1478CD;
	font-size: 250%;
	font-weight: 500;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	margin-top: 7%;
	margin-bottom: 30px;
}

/* 스타일링된 링크 */
.styled-link {
	color: #3C3C8C;
	font-size: 15px;
	text-decoration: none;
	transition: color 0.3s;
}

.styled-link:hover {
	color: #ff6678;
}

/* 스타일링된 버튼 */
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
</style>
<!-- id는 jsp 페이지 안에서만 활용되지만 name은 컨트롤러로 가져가서 활용 -->
<title>main</title>
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
									<li><a href="logout.do" style=" font-size:19px; color:black; font-weight:20px">로그아웃</a></li>
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
				<h3>Look Up Routine</h3>
				<br> <br> <br>
				<h2 style="font-size: 150%;">"선택하신 루틴의 상세조회 화면입니다."</h2>
				<br> <br> <br>


				<hr style="border-color: #1478CD; margin: 20px 0;">
				<center>

					<h2 style="font-size: 150%; font-weight: bold;">
						${exerciseList.ttl}</h2>
					<br>
					<hr style="width: 80%">
					<br> <br>
					<h2 style="font-size: 150%;">
						[${exerciseList.reg_user.nick_nm}님 운동루틴]
					</h2>
					<br>
					<form name="form_insert" id="form_insert_id" style="width: 80%"
						action="insertExInfo.do" method="post">
						<input type="hidden" name="userId" value="${loggedInUser.getId()}" />
						<br> <br>
						<table class="exercise-table" style="font-size: 20px;">
							<tr class="title-row">
								<th scope="col" width="10%">칼로리(kcal)</th>
								<th scope="col" width="10%">운동 시간(min)</th>
								<th scope="col" width="10%">체중(kg)</th>
								<th scope="col" width="10%">조회수</th>
								<th scope="col" width="10%">공개여부</th>
								<th scope="col" width="20%">등록일</th>
							</tr>

							<tr class="data-row" style="height: 80px;">
								<td style="text-align: center; padding: 40px 0; font-size:20px;">${exerciseList.cal}</td>
								<td style="text-align: center; padding: 40px 0; font-size:20px;">${exerciseList.excr_tm}</td>
								<td style="text-align: center; padding: 40px 0; font-size:20px;">${exerciseList.wght}</td>
								<td style="text-align: center; padding: 40px 0; font-size:20px;">${exerciseList.inq_cnt}</td>
								<td style="text-align: center; padding: 40px 0; font-size:20px;"><c:set
										var="prvt" value="${exerciseList.prvt}" /> <c:choose>
										<c:when test="${prvt eq 'false'}">공개</c:when>
										<c:when test="${prvt eq 'true'}">비공개</c:when>
									</c:choose></td>
								<td style="text-align: center; padding: 40px 0; font-size:20px;">${exerciseList.reg_dt}</td>
							</tr>

							<tr>
								<td colspan="8" class="button-container"><br>
								<br><br>
									<button type="button" class="list-button"
										style="font-size: 20px;"
										onclick="location='/allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=${routine}'">목록</button>
									<c:choose>
										<c:when test="${routine eq 'me' }">
											<button type="button" class="list-button"
										style="font-size: 20px; background-color:#6c757d;"
												onclick="location='/UpdateExercise.do?id=${exerciseList.excr_id}&routine=${routine}'">수정</button>
											<button type="button" class="list-button"
										style="font-size: 20px; background-color:#6c757d;"
												onclick="location='/deleteExerciseBoard.do?userId=${loggedInUser.getId()}&id=${exerciseList.excr_id}&routine=${routine}'">삭제</button>
										</c:when>
									</c:choose></td>
							</tr>
						</table>
					</form>
				</center>


				<br> <br> <br> <br> <br>


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
		<%
			}
		%>
	
</body>
</html>