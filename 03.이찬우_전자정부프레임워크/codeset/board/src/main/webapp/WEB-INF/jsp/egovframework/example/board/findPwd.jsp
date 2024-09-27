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
<script src="/js/jquery-3.5.1.min.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
function checkPassword() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm_password').value;
    if (password !== confirmPassword) {
        alert('비밀번호가 일치하지 않습니다.');
        document.getElementById('password').value = '';
        document.getElementById('confirm_password').value = '';
        document.getElementById('password').focus();
        return false;
    }
    return true;
}
function checkAll(){
	if( $("#user_name").val() ==""){
		alert("이름를 입력하세요");
		return false;
	}
	if( $("#password").val() ==""){
		alert("비밀번호를 입력하세요");
		return false;
	}
	checkPassword();
	return true;
}
</script>
</head>
<body>
<form>
    <table>
    <tr>
        <td><h2>비밀번호 재설정</h2></td>
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
        <td><input type="text" placeholder="새 비밀번호" id="password" name="password"></td>
    </tr>
    <tr>
        <td><input type="text" placeholder="비밀번호 확인" id="confirm_password" name="confirm_password"></td>
    </tr>
    <tr>
        <td><input type="submit" value="제출하기" class="btn" onclick="return checkAll()"></td>
    </tr>
    </table>
</form>
</body>
</html>