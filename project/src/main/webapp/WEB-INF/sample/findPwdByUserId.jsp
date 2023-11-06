<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
       margin: 0 auto;
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
      
      #checkDuplicate {
        padding: 10px 20px;
        background-color: #6495ED;
       border: none;
        color: white;
        border-radius: 5px;
        cursor: pointer;
      }

      #checkDuplicate:hover {
        background-color: #ff6678;
      }
      
      #email-container {
        display: flex;
        align-items: center;
      }

      #eml_prefix {
        flex-grow: 1;
        border-radius: 10px 0 0 10px;
      }

      #email-at-symbol {
        padding: 0 10px;
      }

      #eml_suffix {
        border-radius: 0 10px 10px 0;
      }
      
      select {
        border: 1px solid #E5E9F5;
        background-color: #F6F7FA;
        padding: 10px;
        border-radius: 10px;
        width: 100%;
      }

      /* 옵션 박스의 옵션 스타일링 */
      select option {
        padding: 10px;
      }

      /* 선택된 옵션 스타일링 */
      select option:checked {
        background-color: #ED4B5E;
        color: white;
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
</head>
<body>
   <div id="form-container">
      <div id="form-inner-container">
      <div id="sign-up-container">
<center>
    <h3>Password Reset</h3>
    
    <c:if test="${user_pswd != null}">
        <p>임시 비밀번호: ${param.user_nm} : ${user_pswd}</p>
        <br>
        
        <a class="styled-link" href="loginUser.do">로그인 화면</a>
    </c:if>
    
    <c:if test="${user_pswd == null}">
        <p>존재하지 않는 회원입니다.</p>
        <br>
         
        </div>
        
      <a class="styled-link" href="insertUser.do">회원가입</a>&nbsp;&nbsp;&nbsp;
      <a class="styled-link" href="findPwdByUserId.do">다시 입력하기</a>&nbsp;&nbsp;&nbsp;
      <a class="styled-link" href="findUserIdByUsername.do">아이디 찾기</a>
      </div>
        </div>
    </c:if>


</center>
</body>
</html>