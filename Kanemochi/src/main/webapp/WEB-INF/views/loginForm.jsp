<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body{
	margin: 0 auto;
	text-align: center;
}

label{
	text-align: center;
}

table {
	margin: auto;
	text-align: center;
}

th, td {
	padding: 10px;
}

</style>
</head>
<body>
<h1>KANEMOCHI</h1>
<table>
	<tr>
		<td>ID</td>
		<td><input type="text" id="id" class="form-control input-sm"  placeholder="ID"></td>
 	</tr>
 	<tr>
		<td>Password</td>
		<td><input type="password" id="pwd" class="form-control input-sm" placeholder="Password"></td>
 	</tr>
 	<tr>
 		<td colspan ="2">
	 	<input type="button"  class="btn btn-primary" value="ログイン">
	 	<input type="reset" class="btn btn-warning" value="キャンセル">
 		</td>
 	</tr>
</table>


<a href="/kanemochi/member/signUpForm" class="btn btn-info">KANEMOCHI 会員登録</a><br><br>
<a href="/kanemochi/member/findIdPwdForm" class="btn btn-success">id/pwdを探す</a>
<a href="/kanemochi/game/game">재훈이의 작업실</a>
<a href="/kanemochi/member/characterSelect">characterSelect</a>
</body>
</html>
