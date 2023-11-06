<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.sample.service.FeedbackVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<%
	Object loggedInUser = session.getAttribute("loggedInUser");
if (loggedInUser != null) {
	UserVO user = (UserVO) loggedInUser;
	String userName = user.getUser_nm();
	String userId = user.getUser_id();
	String userGrd = user.getMbr_grd();
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
<link rel="stylesheet" href="css/main.css">
<style type="text/css">

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
	gap: 30px;
	justify-content: center;
	align-content: flex-start;
}

.image-cell {
	width: calc(33.33% -10px);
	text-align: center;
	margin-bottom: 10px;
	margin-right: 20px;
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

.image-title {
	padding: 10px;
	text-align: center;
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

.sidebar {
	position: fixed;
	top: 50%;
	/* left: -270px; */
	left: 10%;
	float: left;  /*좌측으로 띄우기 */
	margin-top: 10px;
	width: 150px; /* 사이드바의 너비 지정 */
	height: 400px;
	background-color: #fff; /* 배경색 지정 */
	color: #000000; /* 글자색 지정 */
	padding: 20px; /* 패딩 추가 */
	box-shadow: 1px 1px 2px #C8C8C8; /* 그림자 효과 추가 */
	transition: left 0.4s;
	border-radius: 10px;
	z-index: 9999;
}

.content {
	margin-left: 270px; /* 컨텐츠 영역을 사이드바 너비만큼 오른쪽으로 밀어냄 */
}

/* 목록 스타일 */
ul {
	list-style: none; /* 목록 기호 제거 */
	padding: 0;
}

li {
	margin-bottom: 10px;
}


a {
	text-decoration: none;
	color: #000000;
	transition: color 0.3s;
	font-weight: bold;
	
}


a:hover {
	color: #000000;
	font-weight: bold;
	
}

.sidebar-heading {
	font-weight: bold;
	padding: 10px 20px; 
	color: #000000; 
	background-color: #FFA374
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

.image-title {
	font-weight: bold;
}

.atc04-link {
	text-decoration: none;
	color: #000000;
}

</style>
<title>메인화면</title>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const loading = document.getElementById("loading");
    let page = 2;

    window.addEventListener("scroll", function () {
        if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
            loading.style.display = "block";

            fetch(`/getMoreData?page=${page}`)
                .then(response => response.json())
                .then(data => {
                    appendDataToPage(data);
                    page++;
                    loading.style.display = "none";
                })
                .catch(error => {
                    console.error("데이터를 가져오는 동안 오류 발생:", error);
                });
        }
    });

    function appendDataToPage(data) {
        const container = document.getElementById("data-container"); 
        data.forEach(item => {
            const element = createHTMLElement(item);
            container.appendChild(element);
        });
    }

    function createHTMLElement(item) {
        const div = document.createElement("div");
        div.textContent = item.title;
        return div;
    }
    
    document.addEventListener("DOMContentLoaded", function () {
        const header = document.getElementById("sh_hd");
        const subBanner = document.getElementById("sh_sub_banner");
        let isHeaderVisible = true;
        let prevScrollPos = window.pageYOffset;

        window.addEventListener("scroll", function () {
            const currentScrollPos = window.pageYOffset;

            // 스크롤 방향을 확인하여 헤더를 보이거나 숨깁니다.
            if (currentScrollPos > prevScrollPos) {
                // 아래로 스크롤할 때 헤더를 숨김
                if (isHeaderVisible) {
                    header.style.transform = "translateY(-100%)";
                    isHeaderVisible = false;
                }
            } else {
                // 위로 스크롤할 때 헤더를 보이게 함
                if (!isHeaderVisible) {
                    header.style.transform = "translateY(0)";
                    isHeaderVisible = true;
                }
            }

            // 스크롤 위치가 subBanner 아래로 이동할 때 헤더를 다시 생성
            const subBannerBottom = subBanner.offsetTop + subBanner.clientHeight;
            if (currentScrollPos >= subBannerBottom) {
                header.style.transform = "translateY(0)";
                isHeaderVisible = true;
            }

            prevScrollPos = currentScrollPos;
        });
    });



   
</script>

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
								<li><a href="showMain.do?userId=${loggedInUser.getId()}" style=" font-size:19px; color:black; font-weight:20px">메인화면</a></li>
								<li><a
									href="selectBoardList.do?userId=${loggedInUser.getId()}" style=" font-size:19px; color:black; font-weight:20px">자유게시판</a></li>
								<li><a
									href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=other" style=" font-size:19px; color:black; font-weight:20px">타회원
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
										href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=me" style=" font-size:19px; color:black; font-weight:20px">운동루틴</a></li>
									<li><a href="mypageinfo.do?userId=${loggedInUser.getId()}&routine=me" style=" font-size:19px; color:black; font-weight:20px">회원정보</a></li>
									<%
										if (userGrd.equals("관리자")) {
									%>
									<li><a href="selectUserList.do" style=" font-size:19px; color:black; font-weight:20px">회원관리</a></li>
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

		 <div class="sidebar" id="sidebar">
			<ul>
				<li class="sidebar-heading" style="text-align:center;">메뉴</li>
				<br>
				<li><a href="selectBoardList.do?userId=${loggedInUser.getId()}">자유게시판</a></li>
				<br>
				<li><a
					href="allExerciseselectList.do?userId=${loggedInUser.getId()}&routine=other">타회원 루틴</a></li>
						<br>
				<li><a href="getAllParts.do?userId=${loggedInUser.getId()}">자료실</a></li>
				<br>
				<li><a href="#atc04" class="atc04-link">피드백 바로가기</a></li>
				<br><br>
				<li class="sidebar-heading" style="text-align:center;">마이페이지</li>
				<br>
				<li><a href="mypageinfo.do?userId=${loggedInUser.getId()}&routine=me"> 회원정보</a></li>
				<br>
				<li><a href="logout.do"> 로그아웃</a></li>
				
<br>
			</ul>
		</div>


		<div id="sh_sub_banner"></div>

		<div id="atc01">
			<div class="inner2">
				<p class="tit">
					<b>Health Care</b><br>System
				</p>
				<p class="txt">비대면 헬스 케어 관리 시스템</p><br><br>
				<p>
					<a href="insertWeektargetExercise.do">주간운동목표설정</a>
				</p>
			</div>
		</div>

		<div id="atc02" style="margin-top: -10%; margin-bottom: 5%">
			<ul>
				<li><a href="">
						<p class="img"></p>
						<p class="txt">
							<span>Online Care</span><br>비대면 관리
						</p>
				</a></li>
				<li><a href="">
						<p class="img"></p>
						<p class="txt">
							<span>Professional</span><br>전문적인 조언
						</p>
				</a></li>
				<li><a href="">
						<p class="img"></p>
						<p class="txt">
							<span>Community</span><br>다양한 사람과의 소통
						</p>
				</a></li>
				<li><a href="">
						<p class="img"></p>
						<p class="txt">
							<span>Health</span><br>건강한 생활
						</p>
				</a></li>
			</ul>
			
		</div>
<br> <br>
		<div id="atc03">
			<div class="index01">
				<p class="tit">
					<span></span>
				</p>
				<ul>
					<li>
						<div class="sh_date">
							<span class="day">15</span> <span class="day_02">Aug</span>
						</div>
						<div class="txt_wrap">
							<p class="sh_notice">게시판 개선 사항</p>
							<p class="sh_contents">자유 게시판 개선 사항입니다. </p>
						</div>
					</li>
					<li>
						<div class="sh_date">
							<span class="day">01</span> <span class="day_02">Aug</span>
						</div>
						<div class="txt_wrap">
							<p class="sh_notice">건강 관리 시스템 서비스 공지사항</p>
							<p class="sh_contents">헬스 케어 프로그램 개설 관련 공지사항입니다.  </p>
						</div>
					</li>


				</ul>
			</div>
			<div class="index02">
				<p class="tit">
					<span></span>
				</p>
				<ul>
					<li>
						<div class="sh_date">
							<span class="day">07</span> <span class="day_02">Sep</span>
						</div>
						<div class="txt_wrap">
							<p class="sh_notice">회사 내부 이벤트</p>
							<p class="sh_contents">회사 내부 이벤트 진행 현황입니다.</p>
						</div>
					</li>
					
					<li>
						<div class="sh_date">
							<span class="day">30</span> <span class="day_02">Aug</span>
						</div>
						<div class="txt_wrap">
							<p class="sh_notice">회사 시스템 개설 축하 이벤트</p>
							<p class="sh_contents">개설 이벤트 진행 중입니다. 관련 사항은 첨부파일을 참고하여 주세요.</p>
						</div>
					</li>


				</ul>
			</div>
		</div>
		
		
<br><br><br>

		<div id="atc04" class="atc04" >
			<p class="tit">
				<b>Professional Feedback</b>
			</p>
			<p class="txt">전문가의 피드백 한눈에 살펴보기</p>
			<div class="more">
				<a href="insertFeedback.do">게시물 등록</a>
			</div>
		</div>
		<div style="margin-top : 5%"></div>
		<div class="image-container" >
			<c:forEach var="feedback" items="${feedbackList}">
				<div class="image-cell" style="margin-right : 1%">
					<a href="updateViewNum2.do?id=${feedback.id}"> <img
						class="image" src="/photo/${feedback.photo}?v=${imageVersion}"
						alt="이미지" style="width: 300px; height: 300px;" />
						<table>
							<tr>
								<th>ID</th>
								<th>Title</th>
							</tr>
							<tr>
								<td>${feedback.id}</td>
								<td class="image-title">${feedback.ttl}</td>
							</tr>
						</table>
					</a>
				</div>
			</c:forEach>
		</div>
		<br> <br><br><br><br>


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