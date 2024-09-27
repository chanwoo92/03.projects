<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
    body {
        margin: 0;
        padding: 0;
        height: 100vh; /* 화면 높이에 맞춤 */
        display: flex;
        justify-content: center;
        align-items: center;
    }
    table {
        width: 280px;
        height: 250px;
        margin: auto;
        font-size: 15px;
        background-color: rgba(255, 255, 255, 0.8); /* 배경 투명도 설정 */
        border-radius: 15px;
        padding: 20px;
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        height: 32px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233,233,233);
        margin-bottom: 10px;
    }
    .btn {
        width: 100%;
        height: 32px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(164, 199, 255);
        margin-bottom: 10px;
    }
    .btn:active {
        background-color: rgb(61, 135, 255);
    }
    a {
        font-size: 12px;
        color: darkgray;
        text-decoration-line: none;
    }
    .join {
        text-align: center;
    }
</style>
</head>
<body>
<form class="form_online" action="/findId2.do" method="post">
    <table>
    <tr>
        <td><h2>아이디 찾기</h2></td>
    </tr>
    <tr>
        <td><input type="text" placeholder="이름" id="user_name" name="user_name"></td>
    </tr>
    <tr>
        <td><input type="text" placeholder="이메일" name="email"> @ 
            <select name="email_domain">
                <option>naver.com</option>
                <option>gmail.com</option>
                <option>daum.net</option>
                <option>nate.com</option>
            </select>
    </tr>
    <tr>
        <td><input type="submit" value="제출하기" class="btn" ></td>
    </tr>
    </table>
</form>
</body>
</html>