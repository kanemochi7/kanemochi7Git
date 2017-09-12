<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FindID/PWD</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body {
	margin: 100px;
	text-align: center;
	background-color:#eeafaf;
	background-image:url(/kanemochi/resources/image/bg/pinkSky.png);
	background-repeat: repeat-x;
	color: black;
}

table{
	margin: auto;
	text-align: center;
	font-size: large;
}
h1{
	color: yellow;
}

tr,td{
	padding: 10px;
}

img{
	width: 15%;
}
p{
	
}
</style>
<script type="text/javascript">
$(function () {
	
	<c:if test="${findResult!=null}">
		var findResult = ${findResult};
		if(findResult==false){
			alert("없는 정보 입니다.");
		}
	</c:if>
	
	$("#commit1").on('click',findinfo);
	$("#commit2").on('click',findpw);
	
	function findinfo() {
		$('#findid').submit();
	}
	
	function findpw() {
		$('#findpw').submit();
	}
})
</script>
</head>
<body>
<img src="/kanemochi/resources/image/logo-white.gif" class="rounded float-left" alt="left-img" id="logo">
<h1>id/pw を探す</h1>
<h4>下記の情報を全て入力して確認ボタンを押してください。
加入する際に入力したメールで情報をお送りいたします。</h4>
<c:if test="${menu=='findinfo'}">
<form action="/kanemochi/member/findId" id="findid" method="POST">
<fieldset>
	<table>
		<tr>
			<td><label>名前 </label><input type="text" id="name" name="user_name"></td>
		</tr>
		<tr>
			<td><label>メール </label><input type="email" id="email" name="user_email"></td>
		</tr>
	</table>
</fieldset>
<button type="button" class="btn btn-info" id="commit1">確認</button>
</form>
</c:if>
<c:if test="${menu=='findpw'}">
<form action="/kanemochi/member/findPw" id="findpw" method="POST">
<table>
	<tr>
		<td><label>ID </label><input type="text" id="id" name="user_id"></td>
	</tr>
	<tr>
		<td><label>名前 </label><input type="text" id="name" name="user_name"></td>
	</tr>
	<tr>
		<td><label>メール </label><input type="email" id="email" name="user_email"></td>
	</tr>
</table>
<button type="button" class="btn btn-info" id="commit2">確認</button>
</form>
</c:if>
</body>
</html>