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
<script type="text/javascript">
	function telecom_check() {
		var telecom_ch = document.forms["form_insert_id"]["ctgry_e_str"].value;

		if (telecom_ch == null || telecom_ch == " "
				|| telecom_ch == "----- 선택하세요 -----") {
			alert("운동유형을 선택하세요.");
			return false;
		}
	}
</script>
<!--차트 관련 -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!--부트스트랩 -->

<script src="/js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">




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

<!--
----------------------------------
>
form {
	width: 60%;
	margin: 0 auto;
	padding: 20px;
	background-color: #f7f7f7;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
	text-align: center;
}

/* 테이블 셀 스타일 */
th, td {
	padding: 10px;
	border: 1px solid #ddd;
}

/* 테이블 헤더 스타일 */
th {
	background-color: #f8fafc;
	color: #000000;
}

/* 입력 필드 스타일 */
input[type="text"], select {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

h3 {
	color: #1478CD;
	font-size: 250%;
	font-weight: 500;
	font-family: Verdana, Geneva, Tahoma, sans-serif;

	margin-bottom: 30px;
}

.flex-center {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 30vh; /* 화면 전체 높이에 맞춤 */
}

.graph_style {
	width: 400px;
	height: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 30vh; /* 화면 전체 높이에 맞춤 */
}

.container {
	display: grid;
	grid-template-columns: 1fr 2.6fr 2.5fr 1fr;
	grid-template-rows: 0.3fr 1fr 0.5fr 2fr 1fr 0.3fr;
	gap: 25px 13px;
	grid-auto-flow: row;
	justify-content: stretch;
	align-content: stretch;
	justify-items: stretch;
	align-items: stretch;
	grid-template-areas: ". . . ." ". UserInfo UserInfo ."
		". weekinfo_button_station weekinfo_button_station ."
		". graph1 graph2 ." ". weekInfo weekInfo ."
		". . . .";
	width: 80%;
	height: 1000px;
	overflow-x: hidden;
	overflow-y: auto;
}

.UserInfo {
	grid-area: UserInfo;
}

.weekinfo_button_station {
	grid-area: weekinfo_button_station;
}

.graph2 {
	grid-area: graph2;
	border-radius: .25rem;
	border-radius-sm: .2rem;
	border-radius-lg: .3rem;
	border-radius-pill: 50rem;
}

.graph1 {
	grid-area: graph1;
	border-radius: .25rem;
	border-radius-sm: .2rem;
	border-radius-lg: .3rem;
	border-radius-pill: 50rem;
}

.weekInfo {
	grid-area: weekInfo;
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

<br><br><br><br><br>
			<center>
				<h3>Personal information</h3>
				<br> <br> <br>
				<h2 style="font-size: 150%;">회원정보수정</h2>
				<br>

				<hr style="border-color: #1478CD; margin: 20px 0;">
				<br>
			</center>
			<center>
				<div class="container">
					<div class="UserInfo">
						<form id="userinfoform" method="post" action="updateuserinfo.do">
							<table>
								<tr>
									<th>ID</th>
									<td>${user.user_id}</td>
									<th>password</th>
									<td><input type='button'
										onclick="location='/mypagepwOn.do'"
										value='         비밀번호 변경         ' /></td>
								</tr>
								<tr>
									<th>성별</th>
									<td scope="col"><c:set var="sexdstn"
											value="${user.sexdstn}" /> <c:choose>
											<c:when test="${sexdstn eq '남성'}">
												<input type='radio' name="sexdstn" id="sexdstn_man"
													value="남성" checked="checked" />
												<label for="sexdstn_id">남성</label>
												<input type='radio' name="sexdstn" id="sexdstn_woman"
													value="여성" />
												<label for="sexdstn_woman">여성</label>
											</c:when>
											<c:when test="${sexdstn eq '여성'}">
												<input type='radio' name="sexdstn" id="sexdstn_man"
													value="남성" />
												<label for="sexdstn_id">남성</label>
												<input type='radio' name="sexdstn" id="sexdstn_woman"
													value="여성" checked="checked" />
												<label for="sexdstn_woman">여성</label>
											</c:when>
										</c:choose></td>
									<th>이메일</th>
									<td><input type="text" name="eml" value="${user.eml}" /></td>
								</tr>
								<tr>
									<th>회원 등급</th>
									<td>${user.mbr_grd}</td>
									<th>닉네임</th>
									<td><input type="text" name="nick_nm"
										value="${user.nick_nm}"></td>
								</tr>
								<tr>
									<td align="right" scope="col" colspan="4" style="border: 0px">
										<input type="submit" name="infoput" class="btn btn-primary"
										value="회원 정보 수정">
									</td>
								</tr>
							</table>
						</form>
					</div>
					<div class="weekinfo_button_station">
						<from action=method="post"> <c:forEach var="button_week"
							items="${purposeVOs}" varStatus="status">
							<button type="submit" class="btn btn-outline-primary btn-lg"
								onclick="location='/button_mypageinfo.do?userId=${loggedInUser.getId()}&routine=me&weekbutton_reg_dt=${button_week.reg_dt }'">${button_week.prps_m}월
								${button_week.mnth_wk} 주 차</button>
						</c:forEach> </from>


					</div>
					<div class="graph1">
						<p class="h4">주간 소비 칼로리 그래프</p>
						<!-- 그래프를 표시할 캔버스 엘리먼트를 만듭니다. -->
						<canvas id="cal_data" width="726" height="484"
							style="display: block; box-sizing: border-box; height: 484px, width:700px;">
				</canvas>
						<script>
							// 그래프 데이터를 정의합니다.
							var data = {
								labels : [ "${graphX[0]}", "${graphX[1]}",
										"${graphX[2]}", "${graphX[3]}",
										"${graphX[4]}", "${graphX[5]}",
										"${graphX[6]}" ],
								datasets : [
										{
											label : '하루 소비 칼로리',
											data : [ "${Allcal[0]}",
													"${Allcal[1]}",
													"${Allcal[2]}",
													"${Allcal[3]}",
													"${Allcal[4]}",
													"${Allcal[5]}",
													"${Allcal[6]}", ],
											backgroundColor : [
													'rgba(255, 99, 132, 0.2)',
													'rgba(255, 159, 64, 0.2)',
													'rgba(255, 205, 86, 0.2)',
													'rgba(75, 192, 192, 0.2)',
													'rgba(54, 162, 235, 0.2)',
													'rgba(153, 102, 255, 0.2)',
													'rgba(201, 203, 207, 0.2)' ],
											borderColor : [
													'rgb(255, 99, 132)',
													'rgb(255, 159, 64)',
													'rgb(255, 205, 86)',
													'rgb(75, 192, 192)',
													'rgb(54, 162, 235)',
													'rgb(153, 102, 255)',
													'rgb(201, 203, 207)' ],
											borderWidth : 3
										},
										{
											type : 'line',
											label : '총 소비 칼로리',
											data : [ "${purpose.allcal}",
													"${purpose.allcal}",
													"${purpose.allcal}",
													"${purpose.allcal}",
													"${purpose.allcal}",
													"${purpose.allcal}",
													"${purpose.allcal}" ],
											fill : false,
											borderColor : 'rgb(54, 162, 235)'
										} ]
							};

							// 캔버스에 그래프를 그립니다.
							var ctx = document.getElementById('cal_data')
									.getContext('2d');
							var myChart = new Chart(ctx, {
								type : 'bar', // 그래프 타입을 바 차트로 설정합니다.
								data : data,
							/* 							options : {
							 responsive : false,
							 legend : {
							 position : 'top',
							 },
							 title : {
							 display : true,
							 text : 'chat'
							 },
							 }
							 */});
						</script>

					</div>

					<div class="graph2">
						<p class="h4">주간 운동시간 그래프</p>
						<canvas id="time_data" width="726" height="484"
							style="display: block; box-sizing: border-box; height: 484px, width:700px;">
				</canvas>
						<script>
							// 그래프 데이터를 정의합니다.
							var data = {
								labels : [ "${graphX[0]}", "${graphX[1]}",
										"${graphX[2]}", "${graphX[3]}",
										"${graphX[4]}", "${graphX[5]}",
										"${graphX[6]}" ],
								datasets : [
										{
											label : '하루 운동시간 (분)',
											data : [ "${Alltime[0]}",
													"${Alltime[1]}",
													"${Alltime[2]}",
													"${Alltime[3]}",
													"${Alltime[4]}",
													"${Alltime[5]}",
													"${Alltime[6]}", ],
											backgroundColor : [
													'rgba(255, 99, 132, 0.2)',
													'rgba(255, 159, 64, 0.2)',
													'rgba(255, 205, 86, 0.2)',
													'rgba(75, 192, 192, 0.2)',
													'rgba(54, 162, 235, 0.2)',
													'rgba(153, 102, 255, 0.2)',
													'rgba(201, 203, 207, 0.2)' ],
											borderColor : [
													'rgb(255, 99, 132)',
													'rgb(255, 159, 64)',
													'rgb(255, 205, 86)',
													'rgb(75, 192, 192)',
													'rgb(54, 162, 235)',
													'rgb(153, 102, 255)',
													'rgb(201, 203, 207)' ],
											borderWidth : 3
										},
										{
											type : 'line',
											label : '총 운동시간 (분)',
											data : [ "${purpose.wk}",
													"${purpose.wk}",
													"${purpose.wk}",
													"${purpose.wk}",
													"${purpose.wk}",
													"${purpose.wk}",
													"${purpose.wk}" ],
											fill : false,
											borderColor : 'rgb(54, 162, 235)'
										} ]
							};

							// 캔버스에 그래프를 그립니다.
							var ctx = document.getElementById('time_data')
									.getContext('2d');
							var myChart = new Chart(ctx, {
								type : 'bar', // 그래프 타입을 바 차트로 설정합니다.
								data : data
							});
						</script>
					</div>
					<div class="weekInfo">
						<form id="weekInfo_form" method="post" action="updateweekinfo.do?userId=${loggedInUser.getId()}">
						<input type="hidden" name="prps_id" value="${purpose.prps_id}">
							<table>
								<tr>
									<th scope="row">목표 총 칼로리</th>
									<td><input type="text" name="allcal"
										value="${purpose.allcal}"></td>
								</tr>
								<tr>
									<th scope="row">목표 총 운동시간 (분)</th>
									<td><input type="text" name="wk" value="${purpose.wk}"></td>
								</tr>
								<tr>
									<th scope="row">등록일</th>
									<td><input type="hidden" name="reg_dt_str"
										value="${purpose.reg_dt}">${purpose.reg_dt}</td>
								</tr>
								<tr>
									<td align="right" scope="col" colspan="2" style="border: 0px">
									
									<button
										type="submit" name="weekupdate" class="btn btn-primary">${purpose.prps_m}월 ${purpose.mnth_wk}주 정보 수정</button></td>
								</tr>
							</table>

						</form>
					</div>

				</div>
		</div>
		</center>
<br><br><br><br><br>

		<footer class=bottom_info>
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
		</footer>

	</div>
	<%
		}
	%>
</body>
</html>