<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>album</title>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
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
.rounded{
	width: 300px;
}
#dog{
	width: 10%;
}
</style>
<script>
function popupOpen(){

	var popUrl = "screenshotForm";	//팝업창에 출력될 페이지 URL

	var popOption = "width=600, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}

</script>

</head>
<body>
	<h1>Album</h1>
	<table>
		<tr>
			<td><a href="javascript:popupOpen();"><img src="/kanemochi/resources/image/screenshot/one.png" class="rounded float-left" alt="left-img"></a></td>
			<td><a href="#"><img src="/kanemochi/resources/image/screenshot/two.png" class="rounded float-center" alt="center-img"></a></td>
			<td><a href="#"><img src="/kanemochi/resources/image/screenshot/three.png" class="rounded float-right" alt="right-img"></a></td>
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
	<!-- <button type="button" class="btn btn-warning" onclick="location.href='/kanemochi/member/loginForm'">Back</button><br> -->
	<a type="button" href="/kanemochi/member/signUpForm" class="btn btn-warning">back</a>
		<ul class="pagination">
		  <li class="disabled"><a href="#">&laquo;</a></li>
		  <li class="active"><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li><a href="#">&raquo;</a></li>
		</ul>
		<br>
	<img src="/kanemochi/resources/image/dog.gif" class="rounded float-left" alt="left-img" id="dog">
</body>
</html>