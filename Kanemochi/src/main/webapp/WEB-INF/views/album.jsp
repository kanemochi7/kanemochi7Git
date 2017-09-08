<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>album</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body {
	margin: 50px;
	text-align: center;
	background-color:#fff5c3;
	background-image:url(/kanemochi/resources/image/bg/pinkSky2.png);
	background-repeat: repeat-x;
	color: black;
}

table {
	margin: auto;
	text-align: center;
}

th, td {
	padding: 10px;
}
a{
	float:right;
}
</style>
</head>
<body>
	<h1>Album</h1>
	<table>
		<tr>
			<td><a href="#"><img src="http://via.placeholder.com/300x200" class="rounded float-left" alt="left-img"></a></td>
			<td><a href="#"><img src="http://via.placeholder.com/300x200" class="rounded float-center" alt="center-img"></a></td>
			<td><a href="#"><img src="http://via.placeholder.com/300x200" class="rounded float-right" alt="right-img"></a></td>
		</tr>
		<tr>
			<td>2017-09-27 80:50:00</td>
			<td>2017-09-27 80:50:00</td>
			<td>2017-09-27 80:50:00</td>
		</tr>
		<tr>
			<td><a href="#"><img src="http://via.placeholder.com/300x200" class="rounded float-left" alt="left-img"></a></td>
			<td><a href="#"><img src="http://via.placeholder.com/300x200" class="rounded float-center" alt="center-img"></a></td>
			<td><a href="#"><img src="http://via.placeholder.com/300x200" class="rounded float-right" alt="right-img"></a></td>
		</tr>
		<tr>
			<td>2017-09-27 80:50:00</td>
			<td>2017-09-27 80:50:00</td>
			<td>2017-09-27 80:50:00</td>
		</tr>
	</table>
	<a href="/kanemochi/member/loginForm" class="btn btn-warning">Back</a>
</body>
</html>