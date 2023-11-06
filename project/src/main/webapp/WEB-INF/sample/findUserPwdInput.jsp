<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPassword</title>
</head>
<style type="text/css">
		body {
  		background:#F3F4F9;
  		margin: 0;
    	padding: 0;
    	font-family: Verdana, Geneva, Tahoma, sans-serif;
		}
		
		#form-container {
    	height: 100vh;
    	display: flex;
    	justify-content: center;
    	align-items: center;
		}
		
		#form-inner-container {
    	background-color: white;
    	max-width: 70%;
    	border-radius: 8px;
    	box-shadow: 0 0 20px gainsboro;
		}
		
		#sign-up-container, #sign-in-container {
    	padding: 60px 80px;
    	width: 320px;
    	display: inline-block;
		}
		
		form input {
    	display: block;
    	margin-bottom: 20px;
    	border: 1px solid #E5E9F5;
    	background-color: #F6F7FA;
    	padding: 20px;
    	margin-top: 10px;
    	border-radius: 10px;
    	width: 100%;
		}

		#form-controls {
    	margin-bottom: 20px;
		}
		
		h3 {
    	color: red;
    	font-size: 150%;
    	font-weight: 500;
		}
		
		label {
    	color: #7369AB;
		}
		
		::placeholder {
    	color: #C0C7DB;
    	font-size: larger;
    	letter-spacing: 1.2px;
		}
		
		#form-controls button {
   	 	border: none;
    	font-size: 120%;
		}

		#form-controls button:hover {
    	cursor: pointer;
		}

		button[type="submit"] {
    	padding: 16px 75px;
    	background-color: #ED4B5E;
    	border-radius: 10px;
    	color: white;
		}

		button[type="submit"]:hover {
    	background-color: #ff6678;
		}

		button[type="button"] {
   	 	padding: 16px 0 16px 35px;
    	background-color: transparent;
    	color: #ED4B5E;
		}
		
	.styled-link {
    color: #3C3C8C;
    text-decoration: none;
    transition: color 0.3s;
	}

	.styled-link:hover {
    color: #ff6678;
	}
	
</style>

<body>

<div id="form-container">
	<div id="form-inner-container">

		<div id="sign-up-container">
<h3>Reset Password</h3>
<form action="findPwdByUserId.do" method="post">

		<label for="user_nm">이름</label>
		<input name="user_nm" type="text" id="user_nm" placeholder="이름을 입력하세요" required />
		
		<label for="user_id">아이디</label>
		<input name="user_id" type="text" id="user_id" placeholder="아이디를 입력하세요" required />
		
		<label for="eml">이메일</label>
		<input name="eml" type="text" id="eml" placeholder="이메일을 입력하세요" required />
	
   		<center>
   		<br><br>
		<div id="form-controls">
           <button type="submit">Reset Password</button>
        </div>
        </center>
    
</form>


<br>
<center>
<a class="styled-link" href="loginUser.do">로그인 화면</a>&nbsp;&nbsp;&nbsp;
<a class="styled-link" href="findUserIdByUsername.do">아이디 찾기</a>
</center>
</div>
</div>
</body>
</html>