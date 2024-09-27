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
        background-image: url('https://www.dell.com/community/assets/3958/ea5f0e1b-eba8-401d-b99d-0b3e8f3e167e-362209723.jpeg'); /* 배경 이미지 경로 설정 */
        background-size: cover; /* 배경 이미지 화면에 꽉 차게 설정 */
        background-position: center; /* 배경 이미지 중앙 정렬 */
        background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
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
<script src="/js/jquery-3.5.1.min.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
function check(){
	if( $("#user_id").val() ==""){
		alert("아이디를 입력하세요");
		return false;
	}
	if( $("#password").val() ==""){
		alert("비밀번호를 입력하세요");
		return false;
	}
	return true;
}
function getQueryParams() {
    var params = {};
    var queryString = window.location.search.substring(1);
    var regex = /([^&=]+)=([^&]*)/g;
    var match;
    while (match = regex.exec(queryString)) {
        params[decodeURIComponent(match[1])] = decodeURIComponent(match[2]);
    }
    return params;
}

// 페이지 로드 시 메시지 알림 표시
window.onload = function() {
    var queryParams = getQueryParams();
    if (queryParams.msg) {
        alert(queryParams.msg);
    }
};
</script>
</head>
<body>
<form class="form-inline" action="/login.do" method="post">
    <table>
    <tr>
        <td><h2>로그인</h2></td>
    </tr>
    <tr>
        <td><input type="text" placeholder="ID" id="user_id" name="user_id"></td>
    </tr>
    <tr>
        <td><input type="password" placeholder="비밀번호" id="password" name="password"></td>
    </tr>
    <tr>
       <td><label><input type="checkbox"> 로그인 정보 저장</label></td>
    </tr>
    <tr>
        <td>
            <button type="button" id="idBtn" onclick="location.href='/findId.do'">아이디 찾기</button>
            <button type="button" id="pwdBtn" onclick="location.href='/findPwd.do'">비밀번호 찾기</button>
        </td>
    </tr>
    <tr>
        <td><input type="submit" value="LogIn" class="btn" onclick="return check();"></td>
    </tr>
    <tr>
        <td class="join"><a href="/join.do">회원가입</a></td>
    </tr>
    </table>
</form>
</body>
</html>