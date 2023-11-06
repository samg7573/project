<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USER 회원가입</title>
</head>
<body>


	<center>
		<h1>USER 회원가입</h1>

		<form action="insertUser.do" method="post">

			<table border="1" cellpadding="0" cellspacing="0">

				<tr>
					<td bgcolor="skyblue">이름</td>
					<td align="left"><input name="user_nm" type="text" size="20"
						required /></td>

				</tr>

				<tr>
					<td bgcolor="skyblue">닉네임</td>
					<td align="left"><input name="nick_nm" type="text" size="20"
						required /></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td align="left"><input name="user_id" type="text"
						id="user_id" size="20" required />
						<button type="button" id="checkDuplicate">중복 확인</button>
						<div id="duplicateResult"></div>
						<div id="koreanErrorMessage" style="color: red;" /></td>
				</tr>

				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td align="left"><input name="user_pswd" id="user_pswd"
						type="text" size="20" required />
						<div id="passwordKoreanErrorMessage" style="color: red;" /></td>
				</tr>

				<tr>
					<td bgcolor="skyblue">비밀번호 확인</td>
					<td align="left"><input name="confirm_pswd" id="confirm_pswd"
						type="text" size="20" required />
						<div id="passwordMismatch" style="color: red;" /></td>
				</tr>


				<tr>
					<td bgcolor="skyblue">성별</td>
					<td align="left"><select name="sexdstn">
							<option value="남성">남성</option>
							<option value="여성">여성</option>
					</select></td>
				</tr>

				<tr>
					<td bgcolor="skyblue">이메일</td>
					<td align="left"><input name="eml_prefix" type="text"
						size="10" required /> <span>&nbsp;@&nbsp;</span> <input
						name="eml_suffix" type="text" size="10" required /> <select
						name="eml_domain" id="eml_domain_select">
							<option value="" disabled selected>도메인 선택</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
					</select>
				</tr>
				<tr id="emailVerificationRow" style="display: none;">
					<td bgcolor="skyblue">이메일 인증번호</td>
					<td align="left"><input name="email_verification"
						id="email_verification" type="text" size="20" required />
						<button type="button" id="verifyCode">인증 확인</button>
						<div id="verificationResult"></div></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">회원등급</td>
					<td align="left"><input type="radio" name="mbr_grd" value="일반"
						checked> 일반 <input type="radio" name="mbr_grd" value="전문가">
						전문가</td>
				</tr>




				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="회원 등록" id="signupButton" disabled /></td>
				</tr>


				</form>


				<br>
				<a href="loginUser.do">로그인</a>
				<br>

				</center>
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

				<script>
					$(document)
							.ready(
									function() {
										var isIdDuplicate = false;
										var isPasswordMatch = false;
										var emailVerificationSent = false;
										var verificationCode = "";

										$("#eml_domain_select")
												.change(
														function() {
															var selectedDomain = $(
																	this).val();
															if (selectedDomain === "직접입력") {
																$(
																		"#eml_custom_domain_input")
																		.show();
															} else {
																$(
																		"#eml_custom_domain_input")
																		.hide();
																$(
																		"input[name='eml_suffix']")
																		.val(
																				selectedDomain);
															}
															checkSignupButtonStatus();
														});

										$("#eml_custom_domain_input").on(
												"input", function() {
													checkSignupButtonStatus();
												});

										$("#checkDuplicate")
												.click(

														function() {
															var user_id = $(
																	"#user_id")
																	.val();
															if (user_id === "") {
																return;
															}
															$
																	.ajax({
																		url : "checkDuplicateUserId.do",
																		method : "POST",
																		data : {
																			user_id : user_id
																		},
																		success : function(
																				data) {
																			if (data === "duplicate") {
																				$(
																						"#duplicateResult")
																						.text(
																								"이미 사용 중인 아이디입니다.");
																				isIdDuplicate = false;
																			} else {
																				$(
																						"#duplicateResult")
																						.text(
																								"사용 가능한 아이디입니다.");
																				isIdDuplicate = true;
																			}
																			checkSignupButtonStatus();
																		}
																	});
														});

										$("#user_id")
												.on(
														"input",
														function() {
															isIdDuplicate = false;
															checkSignupButtonStatus();
															var value = $(this)
																	.val();
															var isKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/
																	.test(value);

															if (isKorean) {
																$(
																		"#koreanErrorMessage")
																		.text(
																				"한글은 사용 불가능합니다.");
																$(
																		"#checkDuplicate")
																		.prop(
																				"disabled",
																				true);
															} else {
																$(
																		"#koreanErrorMessage")
																		.text(
																				"");
																$(
																		"#checkDuplicate")
																		.prop(
																				"disabled",
																				false);
															}
														});

										$("#user_pswd")
												.on(
														"input",
														function() {
															var value = $(this)
																	.val();
															var isKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/
																	.test(value);

															if (isKorean) {
																$(
																		"#passwordKoreanErrorMessage")
																		.text(
																				"한글은 사용 불가능합니다.");
															} else {
																$(
																		"#passwordKoreanErrorMessage")
																		.text(
																				"");
															}
															checkSignupButtonStatus();
														});

										$("#confirm_pswd")
												.on(
														"blur",
														function() {
															var password = $(
																	"#user_pswd")
																	.val();
															var confirmPassword = $(
																	this).val();

															if (password === confirmPassword) {
																$(
																		"#passwordMismatch")
																		.text(
																				"비밀번호가 일치합니다.");
																isPasswordMatch = true;
															} else {
																$(
																		"#passwordMismatch")
																		.text(
																				"비밀번호가 일치하지 않습니다.");
																isPasswordMatch = false;
															}
															checkSignupButtonStatus();
														});
										$("#signupButton")
												.click(
														function() {
															var eml_prefix = $(
																	"input[name='eml_prefix']")
																	.val();
															var eml_suffix = $(
																	"input[name='eml_suffix']")
																	.val();
															var eml = eml_prefix
																	+ "@"
																	+ eml_suffix;
															var sexdstn = $(
																	"select[name='sexdstn'] option:selected")
																	.text();
															var formData = {
																user_nm : $(
																		"input[name='user_nm']")
																		.val(),
																nick_nm : $(
																		"input[name='nick_nm']")
																		.val(),
																user_id : $(
																		"input[name='user_id']")
																		.val(),
																user_pswd : $(
																		"input[name='user_pswd']")
																		.val(),
																sexdstn : sexdstn,
																eml : eml,
																mbr_grd : $(
																		"input[name='mbr_grd']")
																		.val()
															};
															$
																	.ajax({
																		url : "insertUser.do",
																		method : "POST",
																		data : formData,
																		success : function(
																				data) {
																			if (data != null) {
																				alert("회원 등록이 성공적으로 처리되었습니다.");
																				window.location.href = "loginUser.do";
																			} else {
																				alert("회원 등록에 실패하였습니다. 다시 시도해주세요.");
																			}
																		},
																		error : function() {
																			alert("서버와의 통신에 문제가 발생하였습니다. 다시 시도해주세요.");
																		}
																	});
														});

										function checkSignupButtonStatus() {
											if (!isIdDuplicate
													|| !isPasswordMatch) {
												$("#signupButton").prop(
														"disabled", true);
											} else {
												$("#signupButton").prop(
														"disabled", false);
											}
										}

									});
				</script>
			
</body>
</html>