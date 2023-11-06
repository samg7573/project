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
	String userGrd = ((UserVO) loggedInUser).getMbr_grd();

	int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
	int recordsPerPage = 10;
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
table {
	width: 80%;
	border-collapse: collapse;
	margin-top: 40%;
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
	text-align: center;
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
	margin-top: 30px;
	margin-bottom: 30px;
	color: #1478CD;
	font-size: 250%;
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
	color: #32A4FF;
}

button[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 18px;
	cursor: pointer;
	margin-top: 15px;
	transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
	background-color: #32A4FF;
}

<!--
-------------------------------------
> /* 검색 필드와 버튼을 감싸는 fieldset 요소의 스타일 */
/* fieldset[form="Exboard"] {
	text-align: center;
	margin: 20px 0;
	border: 1px solid #ccc;
	padding: 10px;
	background-color: #f9f9f9;
	border-radius: 5px;
}

/* legend 요소의 스타일 */
fieldset[form="Exboard"] legend {
	font-weight: bold;
	font-size: 1.2em;
	margin-bottom: 10px;
}

/* 검색 필드 스타일 */
fieldset[form="Exboard"] input[type="text"], fieldset[form="Exboard"] select
	{
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
	font-size: 1em;
}

/* 검색 버튼 스타일 */
fieldset[form="Exboard"] input[type="submit"] {
	padding: 8px 15px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1em;
}

/* 검색 버튼에 호버 효과 추가 */
fieldset[form="Exboard"] input[type="submit"]:hover {
	background-color: #0056b3;
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
									style="font-size: 19px; color: black; font-weight: 20px; margin-bottom: 10px;">메인화면</a></li>
								<li><a
									href="selectBoardList.do?userId=${loggedInUser.getId()}"
									style="font-size: 19px; color: black; font-weight: 20px; margin-bottom: 10px;">자유게시판</a></li>
								<li><a
									href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=other"
									style="font-size: 19px; color: black; font-weight: 20px; margin-bottom: 10px;">타회원
										루틴</a></li>
								<li><a href="getAllParts.do?userId=${loggedInUser.getId()}"
									style="font-size: 19px; color: black; font-weight: 20px; margin-bottom: 10px;">자료실</a></li>
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
										style="font-size: 19px; color: black; font-weight: 20px; margin-bottom: 10px;">운동루틴</a></li>
									<li><a
										href="mypageinfo.do?userId=${loggedInUser.getId()}&routine=me"
										style="font-size: 19px; color: black; font-weight: 20px; margin-bottom: 10px;">회원정보</a></li>
									<%
										if (userGrd.equals("관리자")) {
									%>
									<li><a href="selectUserList.do"
										style="font-size: 19px; color: black; font-weight: 20px; margin-bottom: 10px;">회원관리</a></li>
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
				<br> <br> <br> <br> <br> <br>
				<tr>
					<c:choose>
						<c:when test="${routine eq 'me' }">
							<h3>
								User <br> Exercise Routine
							</h3>
							<br>
							<br>
							<br>
							<h2 style="font-size: 150%;">"회원님의 운동 루틴을 게시할 수 있는 운동 루틴
								게시판입니다."</h2>
						</c:when>
						<c:when test="${routine eq 'other' }">
							<h3>
								Other User <br>Exercise Routine
							</h3>
							<br>
							<br>
							<br>
							<h2 style="font-size: 150%;">"회원님들의 운동 루틴을 자유롭게 공유할 수 있는 운동
								루틴 게시판입니다."</h2>
						</c:when>
					</c:choose>
				</tr>

				<br> <br> <br> <br> <br>

				<tr>
					<fieldset form="Exboard" style="font-size: 20px;">
						<form method="post"
							onsubmit="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=${routine}">
							<select name="ser_ctgry_e" id="telecom" title="운동 카테고리선택">
								<b>제목</b>
								<option value="0,전체">전체</option>
								<c:forEach var="catorylist" items="${catorylist}"
									varStatus="status">
									<option value="${catorylist.e_ctgry_id},${catorylist.clsf_nm}"><c:out
											value="${catorylist.clsf_nm}" /></option>
								</c:forEach>
								<center>
									<input name="searchWrd" type="text" size="30" class="word"
										value="" maxlength="35" onkeypress="doKeyPress(event);"
										title="검색어 입력">
							</select> <b> <input type="submit" name="ser" value="조회">
							</b>
			</center>
			</form>
			</fieldset>
			<br>
			</tr>

			<center>
				<table
					style="margin-top: 20px; margin-bottom: 20px; font-size: 20px;"
					border="1" cellpadding="0" cellspacing="0" width="80%">
					<tr style="height: 50px; width: 80%">
						<th align="center" width="100" style="vertical-align: middle;">번호</th>
						<th align="center" width="300" style="vertical-align: middle;">운동
							유형</th>
						<th align="left" width="200" style="vertical-align: middle;">제목</th>
						<th align="center" width="300" style="vertical-align: middle;">작성자</th>
						<th align="center" width="300" style="vertical-align: middle;">등록일</th>
						<th align="center" bgcolor="skyblue" width="240"
							style="vertical-align: middle;">조회수</th>

					</tr>


					<c:forEach var="exerciseAllList" items="${exerciseAllList}"
						varStatus="status">
						<tr style="height: 50px; width: 80%;">
							<td align="center" width="100"><c:out
									value="${exerciseAllList.excr_id.substring(9)}" /></td>
							<td align="center" width="300"><c:out
									value="${exerciseAllList.ctgry_e.clsf_nm}" /></td>
							<td align="left" width="2000"><span><a
									href="/selectExindex.do?id=${exerciseAllList.excr_id}&routine=${routine}">
										<c:out value="${exerciseAllList.ttl}" />
								</a></span></td>
							<td align="center" width="300"><c:out
									value="${exerciseAllList.reg_user.nick_nm}" /></td>
							<td align="center" width="300"><c:out
									value="${exerciseAllList.reg_dt}" /></td>
							<td align="center" width="100"><c:out
									value="${exerciseAllList.inq_cnt}" /></td>
						</tr>
					</c:forEach>
				</table>
<br>
			<center><p style="font-size:20px;">1</p></center><br>
				<c:if test="${routine eq 'me' }">
					<button type="submit"
						style="width: 100px; height: 50px; font-size: 20px;"
						onclick="location='/selectCategory.do?&routine=${routine}'">글등록</button>
				</c:if>
			</center>
			<br> <br> <br>
			<div class="pagination">
				<c:if test="${currentPage > 1}">
					<a
						href="selectBoardList.do?page=1&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">처음</a>
					<a
						href="selectBoardList.do?page=${currentPage - 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이전</a>
				</c:if>
				<c:forEach var="page" begin="1" end="${totalPages}">
					<c:choose>
						<c:when test="${page == currentPage}">
							<span class="current-page">${page}</span>
						</c:when>
						<c:otherwise>
							<a
								href="selectBoardList.do?page=${page}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${page}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage < totalPages}">
					<a
						href="selectBoardList.do?page=${currentPage + 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">다음</a>
					<a
						href="selectBoardList.do?page=${totalPages}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">끝</a>
				</c:if>
			</div>
			<br>
			<br>
			<br>
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