<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.sample.service.FeedbackVO"%>
<%@ page import="egovframework.sample.service.CommentfVO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%
	Object loggedInUser = session.getAttribute("loggedInUser");
if (loggedInUser != null) {
	String userName = ((UserVO) loggedInUser).getUser_nm();
	String userId = ((UserVO) loggedInUser).getId();
	FeedbackVO feedback = (FeedbackVO) request.getAttribute("feedback");
	String reg = feedback.getReg_user();
	UserVO user = (UserVO) request.getAttribute("user");
	String userGrd = ((UserVO) loggedInUser).getMbr_grd();
	System.out.println(reg + userName+userId);
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


<title>피드백 상세</title>
</head>


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
.delete-button {
    display: inline-block;
    padding: 10px 20px; /* 버튼 크기를 조정하세요. */
    background-color: #ED4B5E; /* 배경색을 원하는 색상으로 변경하세요. */
    color: white; /* 텍스트 색상을 원하는 색상으로 변경하세요. */
    text-decoration: none; /* 링크에 밑줄 제거 */
    border-radius: 5px; /* 버튼 모서리를 둥글게 만듭니다. */
    font-weight: bold; /* 텍스트 굵기 설정 (선택 사항) */
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

h3 {
	margin-top: 7%;
	margin-bottom: 30px;
	color: #1478CD;
	font-size: 250%;
	font-weight: 500;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
}

center {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 1000px;
	margin-top: 20px;
	background-color: #FFFFFF;
}

table, th, td {
	border: 1px solid #CCCCCC;
}

th, td {
	padding: 10px;
}

input[type="text"], textarea {
	width: 100%;
	padding: 5px;
	border: 1px solid #CCCCCC;
}

img {
	max-width: 100%;
	height: auto;
	display: block;
	margin: 0 auto;
}

hr {
	border: none;
	border-top: 1px solid #1478CD;
	margin: 20px 0;
}

.image-container {
	float: left; /* 오른쪽으로 이동 */
	max-width: 30%; /* 이미지 최대 너비 설정 */
	max-height: 40%;
	margin-left: 10%; /* 이미지와의 간격 설정 */
	position: relative; /* 상대 위치 지정 */
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
									style="font-size: 19px; color: black; font-weight: 20px">자료실</a></li>
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
							<div id="sh_top_logo" style="margin-top: 7%;">
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

				<h3>Look Up Feedback</h3>
				<br> <br> <br>
				<h2 style="font-size: 150%;">"전문가의 의견을 받는 피드백 상세화면입니다."</h2>
				<br> <br> <br>

			</center>
			<hr style="border-color: #1478CD; margin: 20px 0;">

			<div class="image-container">
				<c:url var="imageUrl" value="/photo/${feedback.photo}" />
				<img src="${imageUrl}" alt="이미지"
					style="max-width: 70%; height: auto; margin-top: 10%;" />
			</div>
			<br> <br>
			<center>
				<h2
					style="font-size: 25px; font-weight: bold; text-align: left; margin-left: -15%;">
					${feedback.ttl}</h2>
				<hr>


				<form action="updateFeedback.do" method="post"
					enctype="multipart/form-data"
					style="margin-left: -15%; font-size: 20px;">
					<input type="hidden" name="id" value="${feedback.id}">
					<table>
						<tr>
							<td width="120" align="center"
								style="text-align: center; font-weight: bold;"
								value="${loggedInUser.getId()}">작성자</td>
							<td align="left" name="reg_user" value="${feedback.reg_user}">${ Nick_nm}</td>
						</tr>
						<tr>
							<td align="center"
								style="text-align: center; vertical-align: middle; font-weight: bold;">내용</td>

							<%
								if (userId.equals(reg)) {
							%>
							<td align="left"><textarea rows="8" cols="40" name="bbs_cn"
									style="font-size: 20px;">${feedback.bbs_cn}</textarea></td>
							<%
								} else {
							%>
							<td align="left"><textarea rows="8" cols="40" name="bbs_cn"
									style="font-size: 20px;" disabled>${feedback.bbs_cn}</textarea></td>
							<%
								}
							%>

						</tr>
						<tr>
							<td align="center" style="text-align: center; font-weight: bold;">등록일</td>
							<td align="left">${feedback.reg_dt}</td>
						</tr>
						<%
							if (userId.equals(reg)) {
						%>
						<tr>
							<td align="center" style="text-align: center; font-weight: bold;"
								size="40">수정 파일</td>
							<td align="left"><input type="file" name="uploadphoto"
								style="font-size: 20px;" size="40"></td>
							<%
								}
							%>
						</tr>
						<tr>
							<td align="center" style="text-align: center; font-weight: bold;">추천수</td>
							<td align="left" id="rcmdtn_cnt"> ${feedback.rcmdtn_cnt }
							
								<button onclick="increaseRcmdtn('${feedback.id}')"
									style="height: 40px; font-size: 20px; margin-left: 80%; background-color: #007bff; /* 배경 색상 */ color: #fff; /* 글자 색상 */ padding: 5px 10px; /* 내부 여백 */ border: none; cursor: pointer;">추천하기</button>
							</td>
						</tr>
						<tr>
							<td align="center" style="text-align: center; font-weight: bold;">조회수</td>
							<td align="left" id="view_num">${feedback.view_num }</td>
						</tr>

					</table>
					<br> <br> <br>
					<%
						if (userId.equals(reg)) {
					%>
					<input type="submit" class="button"
						style="height: 40px; font-size: 20px; margin-left: 80%; background-color: #007bff; /* 배경 색상 */ color: #fff; /* 글자 색상 */ padding: 5px 10px; /* 내부 여백 */ border: none; cursor: pointer;"
						value="UPDATE">
					<a href="deleteFeedback.do?id=${feedback.id }" class="delete-button">DELETE</a>
					<%
						}
					%>


				</form>
				<br> <br> <br> <br> <br>

				<%
					if (userGrd.equals("전문가")) {
				%>

				<center>
					<form action="insertCommentf.do" method="post">
						<table cellpadding="0" cellspacing="0" width="100%"
							style="border-collapse: collapse; font-size: 20px; margin-left: -40%; border: none;">
							<tr>
								<td align="center" width="70"
									style="font-weight: bold; font-size: 25px; color: black; border: none;">comment</td>
								<td align="left" style="border: none;"><input name="cmnt"
									type="text" size="150" value="${commentf.cmnt }"
									class="rounded-input" /></td>
								<td style="border: none;"><input type="hidden"
									name="reg_user" value="${loggedInUser.getId() }"> <input
									type="hidden" name="mdfcn_user"
									value="${loggedInUser.getId() }"> <input type="hidden"
									name="bbs_fk" value="${feedback.id }"> <input
									type="submit"
									style="padding: 10px; width: 80px; font-size: 20px; border: none;"
									value="등록" /></td>

							</tr>
						</table>

					</form>
					<%
						}
					%>
					<br> <br> <br>

					<table cellpadding="0" cellspacing="0" width="90%"
						style="border-collapse: collapse; font-size: 20px; margin-left: -80%; border: none;">
						<c:forEach var="commentf" items="${commentfList}">
							<tr>
								<td align="center"
									style="width: 100px; vertical-align: top; border: none;">${commentf.id.substring(9) }</td>
								<td align="center"
									style="padding: 10px; width: 300px; vertical-align: top; border: none;"
									value="${loggedInUser.getId() }">${commentf.reg_user }</td>
								<td align="center"
									style="padding: 10px; width: 400px; vertical-align: top; border: none;">${commentf.cmnt }</td>
								<td align="center"
									style="padding: 10px; width: 300px; vertical-align: top; border: none;"><fmt:formatDate
										value="${commentf.reg_dt}" pattern="yyyy-MM-dd" /></td>

								<td align="center"
									style="padding: 10px; width: 100px; vertical-align: top; border: none;"><a
									href="deleteCommentf.do?id=${commentf.id }&bbs_fk=${feedback.id}">삭제</a>
								</td>
								
							</tr>
							<br>
						</c:forEach>
					</table>
				</center>


				<br> <br> <br>
				<hr>



				</hr>
			</center>
</body>
</div>

<script src="https://code.jquery.com/jquery-1.4.2.min.js"></script>
<script>
	function increaseRcmdtn(id) {
		$.ajax({
			type : "POST",
			url : "<c:url value='/increaseRcmdtn.do' />", // 여기를 수정
			data : {
				id : id
			},
			success : function(response) {
				var rcmdtnCntElement = $("#rcmdtn_cnt");
				rcmdtnCntElement.text(parseInt(rcmdtnCntElement.text()) + 1);
			}
		});
	}
</script>

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

<%
	}
%>
</html>