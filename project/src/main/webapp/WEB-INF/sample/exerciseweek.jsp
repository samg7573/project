<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="egovframework.sample.service.category_EDAO"%>
<%@page import="egovframework.sample.service.Category_EVO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%
	request.setCharacterEncoding("UTF-8");

Object loggedInUser = session.getAttribute("loggedInUser");
if (loggedInUser != null) {
	String userName = ((UserVO) loggedInUser).getUser_nm();
	String userId = ((UserVO) loggedInUser).getUser_id();
	String userGrd = ((UserVO) loggedInUser).getMbr_grd();
%>
<!DOCTYPE html>
<html>
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
<head>
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

h3 {
	margin-top: 7%;
	margin-bottom: 30px;
	color: #1478CD;
	font-size: 250%;
	font-weight: 500;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
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
>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f8fafc;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 15px;
	margin-left: 10px;
}

label {
	font-size: 20px;
	font-weight : bold;
	
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.btn {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	font-size: 16px;
}

.btn-secondary {
	background-color: #ccc;
}
</style>
<title>Insert title here</title>
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
								<div style="width: 100%; height: 100%; fill: black;">
									<svg height="24" viewBox="0 0 24 24" width="24"
										focusable="false"
										style="pointer-events: none; display: block; width: 100%; height: 100%;">
            			<path d="M21 6H3V5h18v1zm0 5H3v1h18v-1zm0 6H3v1h18v-1z">
						</path></svg>
								</icon-shape></yt-icon-shape></yt-icon>
							</button>

							<ul class="sh_nav_s">
								<li><a href="showMain.do?userId=${loggedInUser.getId()}"
									style="font-size: 19px; color: black; font-weight: 20px; margin-bottom:10px;">메인화면</a></li>
								<li><a
									href="selectBoardList.do?userId=${loggedInUser.getId()}"
									style="font-size: 19px; color: black; font-weight: 20px; margin-bottom:10px;">자유게시판</a></li>
								<li><a
									href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=other"
									style="font-size: 19px; color: black; font-weight: 20px; margin-bottom:10px;">타회원
										루틴</a></li>
								<li><a href="getAllParts.do?userId=${loggedInUser.getId()}"
									style="font-size: 19px; color: black; font-weight: 20px; margin-bottom:10px;">자료실</a></li>
							</ul>
						</li>

						<ul id="sh_nav">
							<li class="menu-item active"><a
								href="mypageinfo.do?userId=${loggedInUser.getId()}&routine=me"
								style="font-size: 19px; color: black; font-weight: bold">"<%=userName%>"
									님 마이페이지
							</a>
								<ul class="sh_nav_s">
									<li><a
										href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=me"
										style="font-size: 19px; color: black; font-weight: 20px; margin-bottom:10px;">운동루틴</a></li>
									<li><a
										href="mypageinfo.do?userId=${loggedInUser.getId()}&routine=me"
										style="font-size: 19px; color: black; font-weight: 20px; margin-bottom:10px;">회원정보</a></li>
									<%
										if (userGrd.equals("관리자")) {
									%>
									<li><a href="selectUserList.do"
										style="font-size: 19px; color: black; font-weight: 20px; margin-bottom:10px;">회원관리</a></li>
									<%
										}
									%>
									<li><a href="logout.do"
										style="font-size: 19px; color: black; font-weight: 20px">로그아웃</a></li>
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
				<table width="800" height="20" border="0" cellpadding="0"
					cellspacing="0"></table>
				<hr style="border-color: #1478CD; margin: 20px 0;">
				<h3>주간 운동 목표 설정</h3>
				<br> <br> <br>

				<hr style="border-color: #1478CD; margin: 20px 0; width: 80%;">

				<br> <br> <br>
				
				<div class="container">
					<form id="Weekform" method="post" action="insertWeek.do">
						<input type="hidden" name="reg_user_str"
							value="${loggedInUser.getId()}">
						<tr>
							<input type="hidden" style="text-align: center;" name="prps_y"
								value="${alltime.year}">
							</b>
							<input type="hidden" style="text-align: center;" name="prps_m"
								value="${alltime.month}">
							</b>
							<input type="hidden" style="text-align: center;" name="mnth_wk"
								value="${alltime.weekOfMonth}">
						</tr>
						<center>
						<div class="form-group">
							<input type="text" text-align="center" style="width: 40%;"
								value="${alltime.year}년  ${alltime.month}월  ${alltime.weekOfMonth} 째 주"
								readonly>
						</div>

<br><br>
						<div class="form-group" style="width: 80%;">
							<label for="allcal">목표 총 칼로리 (kcal)</label><br><br> <input type="text"
								name="allcal" value="">
						</div>

						<div class="form-group" style="width: 80%;">
							<label for="wk">목표 총 운동시간 (min)</label> <br> <br><input type="text"
								name="wk" value="">
						</div>

						<div class="form-group" style="width: 80%;">
							<label for="reg_dt_str">등록일</label> <br> <br><input type="text"
								name="reg_dt_str" value="${today}" readonly>
						</div>
						<br><br><br>
						<p style="color:red; font-weight:bold; font-size:15px;"><b>이미 목표가 설정되어 있다면 현재 목표로 변환됩니다.</b></p>
<br><br><br>
</center>
						<button type="submit" class="btn">저장</button>
						<button type="button" class="btn btn-secondary"
							onclick="location='showMain.do'">취소</button>
					</form>
				</div>



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