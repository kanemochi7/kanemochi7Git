<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<script type="text/javascript">
function gotoParents() {
	var authNum = ${checkNum};
	var userNum = $('#userNum').val();
	if(userNum==authNum){
		alert("이메일 인증성공");
		opener.document.getElementById("email").value = "${user_email}";
		opener.emailDuplResult = true;
		opener.document.getElementById("emailMsg").innerHTML = "email ok！";
		window.close();
	}else{
		alert("이메일 인증 실패");
		opener.emailDuplResult = false;
		opener.document.getElementById("email").value = "";
	}
}
</script>
</head>
<body>
<h5>인증번호를 확인해주세요.</h5>
<input type="text" id="userNum">
<button onclick="gotoParents()">確認</button>
</body>
</html>