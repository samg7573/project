<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
       height: auto;
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
       width: 500px;
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
<title>loginForm</title>
</head>
<body>

   <div id="form-container">
   <div id="form-inner-container">
   <div id="sign-up-container">
   
      <h3>Sign in</h3>

      <form action="insertUser.do" method="post">
      
      <label for="user_nm">이름</label>
      <input name="user_nm" type="text" id="user_nm" placeholder="이름을 입력하세요" required />

      <label for="user_nm">닉네임</label>
      <input name="nick_nm" type="text" id="nick_nm" placeholder="닉네임을 입력하세요" required />
      
      <label for="user_id">아이디</label>
      <input name="user_id" type="text" id="user_id" placeholder="아이디를 입력하세요" required />
      <button type="button" id="checkDuplicate">중복 확인</button>
         <div id="duplicateResult"></div>
         <div id="koreanErrorMessage" style="color: red;" ></div>
         
       <br>
      <label for="user_nm">비밀번호</label>
      <input name="user_pswd" type="text" id="user_pswd" placeholder="비밀번호를 입력하세요" required />
         <div id="passwordKoreanErrorMessage" style="color: red;"></div>
         
      <label for="user_nm">비밀번호확인</label>
      <input name="confirm_pswd" type="password" id="confirm_pswd" placeholder="비밀번호를 다시 한 번 입력하세요" required />
         <div id="passwordMismatch" style="color: black;" ></div>
         
      <label for="sexdstn">성별</label><br><br>
         <select name="sexdstn">
            <option value="남성">남성</option>
            <option value="여성">여성</option>
         </select>
      <br><br>

      
<!--       <label for="user_nm">이메일</label>
      <div id="email-container">
           <input name="eml_prefix" type="text" id="eml_prefix" required />
           <span id="email-at-symbol">@</span> 
           <input name="eml_suffix" type="text" size="10" id="eml_suffix" required /> &nbsp;&nbsp;&nbsp;
           <select name="eml_domain" id="eml_domain_select">
             <option value="" disabled selected>도메인 선택</option>
             <option value="naver.com">naver.com</option>
             <option value="gmail.com">gmail.com</option>
             <option value="daum.net">daum.net</option>
           </select>
      </div> -->
      
      <label for="eml">이메일</label>
      <div id="email-container">
           <input name="eml" type="text" id="eml" placeholder="이메일을 입력하세요" required />
      </div>
      
         
      <label for="mbr_grd">회원등급</label><br><br>
         <select name="mbr_grd">
            <option value="일반">일반인</option>
            <option value="전문가">전문가</option>
         </select>
         
      </div>
            
      <br><br>
      <center>
         <div id="form-controls">
            <button type="submit" id="signupButton" disabled>Sign up</button>
           </div>
        </center>



   </form>
            
   </div>
   </div>

<br>
      <center> 
      <a class="styled-link" href="loginUser.do">로그인</a>
      </center>
      <br>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        var isIdDuplicate = false;
        var isPasswordMatch = false;
        var emailVerificationSent = false;
        var verificationCode = "";

        $("#eml_domain_select").change(function() {
            var selectedDomain = $(this).val();
            if (selectedDomain === "직접입력") {
                $("#eml_custom_domain_input").show();
            } else {
                $("#eml_custom_domain_input").hide();
                $("input[name='eml_suffix']").val(selectedDomain);
            }
            checkSignupButtonStatus();
        });

        $("#eml_custom_domain_input").on("input", function() {
            checkSignupButtonStatus();
        });

        $("#checkDuplicate").click(function() {
            var user_id = $("#user_id").val();
            if (user_id == "") {
                return;
            }
            $.ajax({
                url: "checkDuplicateUserId.do",
                method: "POST",
                data: {
                    user_id: user_id
                },
                success: function(data) {
                    if (data === "duplicate") {
                        $("#duplicateResult").text("이미 사용 중인 아이디입니다.");
                        isIdDuplicate = false;
                    } else {
                        $("#duplicateResult").text("사용 가능한 아이디입니다.");
                        isIdDuplicate = true;
                    }
                    checkSignupButtonStatus();
                }
            });
        });

        $("#user_id").on("input", function() {
            var value = $(this).val();
            var isKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(value);

            if (isKorean) {
                $("#koreanErrorMessage").text("한글은 사용 불가능합니다.");
                $("#checkDuplicate").prop("disabled", true);
            } else {
                $("#koreanErrorMessage").text("");
                $("#checkDuplicate").prop("disabled", false);
            }
            checkSignupButtonStatus();
        });

        $("#user_pswd").on("input", function() {
            var value = $(this).val();
            var isKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(value);

            if (isKorean) {
                $("#passwordKoreanErrorMessage").text("한글은 사용 불가능합니다.");
            } else {
                $("#passwordKoreanErrorMessage").text("");
            }
            checkSignupButtonStatus();
        });

        $("#confirm_pswd").on("input", function() {
            var password = $("#user_pswd").val();
            var confirmPassword = $(this).val();

            if (password === confirmPassword) {
                $("#passwordMismatch").text("비밀번호가 일치합니다.");
                isPasswordMatch = true;
            } else {
                $("#passwordMismatch").text("비밀번호가 일치하지 않습니다.");
                isPasswordMatch = false;
            }
            checkSignupButtonStatus();
        });

        function checkSignupButtonStatus() {
            if (!isIdDuplicate || !isPasswordMatch) {
                $("#signupButton").prop("disabled", true);
            } else {
                $("#signupButton").prop("disabled", false);
            }
        }
    });
</script>

         
</body>
</html>