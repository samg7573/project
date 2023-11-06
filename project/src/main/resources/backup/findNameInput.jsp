<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find User ID</title>
</head>
<body>
    <h1>Find User ID</h1>
    
    <form action="findUserIdByUsername.do" method="post">
        <label for="user_nm">이름:</label>
        <input type="text" id="user_nm" name="user_nm" required>
        <button type="submit">아이디 찾기</button>
    </form>
    

</body>
</html>
