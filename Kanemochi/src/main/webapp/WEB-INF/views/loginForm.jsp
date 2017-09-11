<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
	<title>KANEMOCHI</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<link rel="icon" href="resources/img/favicon.png">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body{
	margin: 0 auto;
	margin-top: 5%;
	text-align: center;
	background: #578CA9;
	background-image:url(/kanemochi/resources/image/bg/bg3.gif);
	background-size: 100% 100%;
	color: navy;
}
table {
	margin: auto;
	text-align: center;
}
th, td {
	padding: 10px;
}
label{
	text-align: center;
}
#logo{
	width: 30%;
}
#icon{
	width:20%;
}
</style>
<script>
$(function() {
	$("#loginBtn").on('click', function() {
		if($("#id").val()=="" && $("#pwd").val()==""){
			alert("아이디와 비밀번호를 입력해주세요.");
			$("#id").focus();
			return false;
		}
		$("#login").submit();
	})
});
/*  $(function(){
	var header = $('body');

	var backgrounds = new Array(
	    'url(/kanemochi/resources/image/bg/jinja.gif)'
	  , 'url(/kanemochi/resources/image/bg/densha.gif)'
	  , 'url(/kanemochi/resources/image/bg/ame.gif)'
	  , 'url(/kanemochi/resources/image/bg/spring.gif)'
	);

	var current = 0;

	function nextBackground() {
	    current++;
	    current = current % backgrounds.length;
	    header.css('background-image', backgrounds[current]);
	}
	setInterval(nextBackground, 5000);

	header.css('background-image', backgrounds[0]);
	}); */  
	 

/* 	 $(function(){
	var imgs = new Array("/kanemochi/resources/image/bg/jinja.gif",
			"/kanemochi/resources/image/bg/densha.gif",
			"/kanemochi/resources/image/bg/ame.gif",
			"/kanemochi/resources/image/bg/spring.gif");
	function changeBg() {
	    var imgUrl = imgs[Math.floor(Math.random()*imgs.length)];
	    $('body').css('background-image', 'url(' + imgUrl + ')');
	    $('body').fadeIn(1000); //this is new, will fade in smoothly
	}
	
	function changeBackgroundSmoothly() {
	    $('body').fadeOut(1000, changeBg); //this is new, will fade out smoothly
	}
	
	setInterval(changeBackgroundSmoothly,5000);
	
	 }); */

</script>

</head>
<body>
<!-- <h1>KANEMOCHI</h1> -->
<a href="#"><img src="/kanemochi/resources/image/logo-white.gif" class="rounded float-left" alt="left-img" id="logo"></a>
<c:if test="${loginID ==null}">
<form id="login" action="/kanemochi/member/login" method="post">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" id="id" name="user_id" class="form-control input-sm"  placeholder="ID"></td>
	 	</tr>
	 	<tr>
			<td>Password</td>
			<td><input type="password" id="pwd" name="user_pw" class="form-control input-sm" placeholder="Password"></td>
	 	</tr>
	 	<tr>
	 		<td colspan ="2">
		 	<input type="button" id="loginBtn" class="btn btn-primary" value="ログイン">
		 	<input type="reset" class="btn btn-warning" value="キャンセル">
	 		</td>
	 	</tr>
	 	<tr>
	 		<td colspan="2">
				<a href="/kanemochi/member/signUpForm" class="btn btn-info">KANEMOCHI 会員登録</a>
				<a href="/kanemochi/member/findIdPwdForm" class="btn btn-success">id/pwdを探す</a>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>임시</td>
	 		<td><a href="/kanemochi/account/main">게임 화면으로 가기</a></td>
	 	</tr>
	</table>
</form>
</c:if>

<c:if test="${loginID != null}">
	<table>
		<tr>
			<td>
				<p>${loginName}님 로그인 중</p>
				<button type="button" class="btn btn-danger" onclick="location.href='/kanemochi/member/logout'">logout</button><br>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-success" onclick="location.href='/kanemochi/member/album'">album</button>
				<button type="button" class="btn btn-warning" onclick="location.href='/kanemochi/member/write'">write</button>
				<button type="button" class="btn btn-success" onclick="location.href='/kanemochi/member/myPage'">myPage</button>
				<button type="button" class="btn btn-warning" onclick="location.href='/kanemochi/member/list'">list</button>
				<button type="button" class="btn btn-success" onclick="location.href='/kanemochi/member/memberListForm'">memberListForm</button>
				<button type="button" class="btn btn-warning" onclick="location.href='/kanemochi/member/reportForm'">report</button>
			</td>
			<td></td>
		</tr>
	</table>
</c:if>
<br>
<a href="/kanemochi/game/game">재훈이의 작업실</a><br>
</body>
</html>
