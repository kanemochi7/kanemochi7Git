<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body {
	margin: 50px;
	text-align: center;
	background: #CFB095;
	font-size: large;
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
<h1>Select Your Character</h1>
<table>
	<tr>
		<td>id</td>
		<td>hongsi</td>
		<td rowspan="3">
			<a href="#"><img src="/kanemochi/resources/image/chineseGirl_front.png" class="rounded float-left" alt="left-img" id="chrOne"></a>
			<a href="#"><img src="/kanemochi/resources/image/catGirl_front.png" class="rounded float-center" alt="center-img" id="chrTwo"></a>
			<a href="#"><img src="/kanemochi/resources/image/pinkGirl_front.png" class="rounded float-right" alt="right-img" id="chrThree"></a>
		</td>
	</tr>
	<tr class="warning">
		<td>password</td>
		<td>??</td>
	</tr>
	<tr class="info">
		<td>name</td>
		<td><p>Gyuhee Hong</p></td>
	</tr>
	<tr class="success">
		<td>email</td>
		<td><p>hong@naver.com</p></td>
		<td rowspan="3">
			<a href="#"><img src="/kanemochi/resources/image/englishBoy_front.png" class="rounded float-left" alt="left-img" id="chrFour"></a>
			<a href="#"><img src="/kanemochi/resources/image/coolBoy_front.png" class="rounded float-center" alt="center-img" id="chrFive"></a>
			<a href="#"><img src="/kanemochi/resources/image/Usoku_front.png" class="rounded float-right" alt="right-img" id="chrSix"></a>
		</td>
	</tr>
	<tr>
		<td>name</td>
		<td><p>010-111-1111</p></td>
	</tr>
	<tr>
		<td>gender</td>
		<td><p>女性</p></td>
	</tr>
	<tr>
		<td colspan="3">
		<a href="/kanemochi/member/signUpForm" class="btn btn-success">back</a>
		<a href="#" class="btn btn-warning">finish</a>
		</td>
	</tr>
</table>

</body>
</html>