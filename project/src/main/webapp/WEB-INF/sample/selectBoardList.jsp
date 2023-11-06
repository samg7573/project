<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.sample.service.BoardVO"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%
	Object loggedInUser = session.getAttribute("loggedInUser");
if (loggedInUser != null) {
	String userName = ((UserVO) loggedInUser).getUser_nm();
	String userId = ((UserVO) loggedInUser).getUser_id();
	String userGrd = ((UserVO) loggedInUser).getMbr_grd();

	// 현재 페이지 및 페이지당 레코드 수 설정
	int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
	int recordsPerPage = 10;

	// 검색 조건 및 키워드 설정
	String searchCondition = (request.getParameter("searchCondition") != null)
	? request.getParameter("searchCondition")
	: "ttl";
	String searchKeyword = (request.getParameter("searchKeyword") != null)
	? request.getParameter("searchKeyword")
	: "bbs_cn";
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
<title>자유게시판</title>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/topmenu_script.js"></script>
<script src="js/swiper.min.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">
<link rel="stylesheet" href="css/sh_common.css">
<link rel="stylesheet" href="css/sh_main.css">
<style>
table {
	width: 80%;
	border-collapse: collapse;
	margin-top: 50px;
	border: none;
	font-size: 20px;
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
	font-size: 20px;
	text-decoration: none;
	transition: color 0.3s;
}

.styled-link:hover {
	color: #ff6678;
}

button[type="submit"] {
	display: block;
	width: 100px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	font-size: 20px;
	cursor: pointer;
	transition: background-color 0.3s;
	padding: 20px 20px;
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
								<li><a href="getAllParts.do?userId=${loggedInUser.getId()}" style=" font-size:19px; color:black; font-weight:20px; margin-bottom:10px;">자료실</a></li>
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
					<br><br>
					<br>
					<br>
					<br>
					<br>
					<h3>Free Board</h3>
					<br>
					<br>
					<br>
					<h2 style="font-size: 150%;">"회원님들의 건강,운동에 대한 의견을 자유롭게 공유할 수
						있는 자유게시판 입니다."</h2>

					<table width="300" height="20" border="0" cellpadding="0"
						cellspacing="0"></table>
					<table style="margin-top: 20px; margin-bottom: 20px" border="1"
						cellpadding="0" cellspacing="0" width="5000">
						<tr style="height: 50px;">
							<th align="center" width="100" style="vertical-align: middle;">번호</th>
							<th align="center" width="300" style="vertical-align: middle;">카테고리</th>
							<th align="center" width="2000" style="vertical-align: middle;">제목</th>
							<th align="center" width="300" style="vertical-align: middle;">등록자</th>
							<th align="center" width="300" style="vertical-align: middle;">등록일</th>
							<th align="center" width="200" style="vertical-align: middle;">좋아요</th>
							<th align="center" bgcolor="skyblue" width="240"
								style="vertical-align: middle;">조회수</th>

						</tr>
						<c:forEach var="board" items="${boardList}">
							<tr style="height: 50px;">
								<td align="center">${board.id.substring(6)}</td>
								<td align="center" value="${board.ctgry_b}">${board.ctgry_b }</td>

								<td align="left" style="padding-left: 10px;"><a
									href="updateViewNum.do?id=${board.id}">${board.ttl }</a></td>
								<td align="center" value="${board.reg_user }">${board.reg_user }</td>
								<td align="center"><fmt:formatDate value="${board.reg_dt}"
										pattern="yyyy-MM-dd" var="formattedRegDt" />
									${formattedRegDt}</td>

								<td align="center">${board.rcmdin_cnt}</td>
								<td align="center">${board.view_num}</td>
							</tr>
						</c:forEach>
					</table>

					<br>
					<br>
					<br>
					<div class="pagination" style="font-size: 20px;">
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

					<%
						String encodedNickNm = null;

					if (loggedInUser != null) {
						String nickNm = ((UserVO) loggedInUser).getNick_nm();
						encodedNickNm = java.net.URLEncoder.encode(nickNm, "UTF-8");
					}
					%>
					<form action="selectBoardList.do" method="post">
						<div
							style="display: flex; justify-content: center; align-items: center;">
							<tr>
								<!-- 검색 폼 -->
								<td align="right"><select name="searchCondition"
									style="margin-right: 40px; padding: 15px; font-size: 20px;">
										<option value="ttl"
											<c:if test="${searchCondition=='ttl'}">selected</c:if>>제목</option>
										<option value="bbs_cn"
											<c:if test="${searchCondition=='bbs_cn'}">selected</c:if>>내용</option>
								</select> <input name="searchKeyword" type="text"
									value="${searchKeyword}"
									style="padding: 20px; border: 1px solid #ccc; width: 500px;">&nbsp;&nbsp;

									<button type="submit" style="margin-left: 20px;">검색</button>
							</tr>
						</div>
					</form>


					<br>
					<br>
					<br> <a class="styled-link"
						href="insertBoard.do?nickNm=<%=encodedNickNm%>">New</a>
					</table>
					<br>
					<br>
					<br>
					<br>
					<br>
				</center>



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