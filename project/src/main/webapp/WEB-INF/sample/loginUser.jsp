<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.sample.service.UserVO"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

	<div id="form-container">
	<div id="form-inner-container">

		<div id="sign-up-container">
		 <h3>Login</h3>
		<form action="loginUser.do" method="post">
			<label for="user_id">Id</label>
			<input name="user_id" type="text" id="user_id" placeholder="아이디를 입력하세요" required />
					
			<label for="user_pswd">PassWord</label>
			<input name="user_pswd" type="password" id="user_pswd" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;" required />
				
			<center>
			<div id="form-controls">
            <button type="submit">Login</button>
        	</div>
        	</center>
		</div>

		</form>

		<center>
		<a class="styled-link" href="insertUser.do">회원가입</a>&nbsp;&nbsp;&nbsp;
		<!-- <a class="styled-link" href="selectUserList.do">회원목록</a>&nbsp;&nbsp;&nbsp; -->
		<a class="styled-link" href="findUserIdByUsername.do">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
		<a class="styled-link" href="findPwdByUserId.do">비밀번호 찾기</a>
		</center>
		<br><br><br>

	 </div>
	 <!--  <img src="C:\Users\LG\mainlogo.png" alt="홈페이지 로고" style="position: absolute; top: 0; width: 100px; height: 100px;"> -->
	 </div>
</body>
</html>