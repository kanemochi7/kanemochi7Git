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
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<style type="text/css">
body {
	margin: auto;
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
#dog{
	width: 10%;
}
#scshot{
	width: 100%;
}
.icon{
	width: 40%;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td><img src="/kanemochi/resources/image/screenshot/one.png" class="rounded float-left" alt="scshotOne" id="scshot"></td>
		</tr>
		<tr>
			<td>
				<a href="#"><img src="/kanemochi/resources/image/icon/folder.png" class="rounded icon float-left" alt="fdIcon"></a>
				<a href="#"><img src="/kanemochi/resources/image/icon/facebook.png" class="rounded icon float-left" alt="fbIcon"></a>
				<a href="#"><img src="/kanemochi/resources/image/icon/twitter.png" class="rounded icon float-left" alt="twIcon"></a>
			</td>
		</tr>
	</table>
</body>
</html>