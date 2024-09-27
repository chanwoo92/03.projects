<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Join</title>
<!-- <style>
    table {
        width: 280px;
        height: 550px;
        margin: auto;
    }
    .email, .text, select, .btn {
        font-size: 15px;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
    }
    .email, .text {
        width: 250px;
        height: 32px;
        border: 0;
        background-color: rgb(233, 233, 233);
    }
    .email {
        width: 127px;
    }
    .id-input {
        width: 180px;
        height: 32px;
        border: 0;
        background-color: rgb(233, 233, 233);
    }
    select {
        width: 100px;
        height: 32px;
        border: 1;
    }
    .btn, .id-btn {
        height: 32px;
        border: 0;
        background-color: rgb(164, 199, 255);
    }
    .id-btn {
        width: 70px;
        font-size: 13px;
    }
    .btn {
        width: 262px;
    }
    .btn:active, .id-btn:active {
        background-color: rgb(61, 135, 255);
    }
</style> -->
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

    function checkId() {
        const userId = $("#user_id").val();
        if (userId === "") {
            alert("아이디를 입력하세요");
            return false;
        } else {
            $("#checkIdBtn").text('확인 중...');
            $.ajax({
                url: "/checkId.do",
                type: "GET",
                data: { user_id: userId },
                success: function(response) {
                    if (response.isAvailable) {
                        alert("사용 가능한 아이디입니다.");
                    } else {
                        alert("이미 존재하는 아이디입니다.");
                    }
                },
                error: function() {
                    alert("아이디 중복 확인 중 오류가 발생했습니다.");
                },
                complete: function() {
                    $("#checkIdBtn").text('중복 확인');
                }
            });
        }
    }
</script>
</head>
<body>
<form class="form-outline" action="/insert.do" method="post" onsubmit="return checkPassword();">
    <table>
    <tr>
        <td><h2>회원가입</h2></td>
    </tr>
    <tr><td>아이디</td></tr>
    <tr>
        <td>
            <input type="text" id="user_id" class="id-input" name="user_id" required>
            <button type="button" id="checkIdBtn" onclick="return checkId();">중복 확인</button>
        </td>
    </tr>
    <tr><td>비밀번호</td></tr>
    <tr><td><input type="password" class="text" id="password" name="password" required></td></tr>
    <tr><td>비밀번호 확인</td></tr>
    <tr><td><input type="password" class="text" id="confirm_password" name="confirm_password" required></td></tr>
    <tr><td>이름</td></tr>
    <tr><td><input type="text" class="text" name="user_name" required></td></tr>
    <tr><td>이메일</td></tr>
    <tr>
        <td>
            <input type="text" class="email" id="email" name="email" required> @ 
            <select name="email_domain" required>
                <option value="naver.com">naver.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="daum.net">daum.net</option>
                <option value="nate.com">nate.com</option>
            </select>
        </td>
    </tr> 
    <tr><td><input type="submit" value="가입하기" class="btn"></td></tr>
    </table>
</form>
</body>
</html>