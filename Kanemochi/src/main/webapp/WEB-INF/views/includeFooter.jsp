<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
	.write {
		color: white;
		float: right;
	}
	.pencil {
		float: left;
		height: 60px;
		width: auto;
	}
	.avatar {
		float: right;
		height: 50px;
		width: auto;
	}
	.level {
		float: right;
		height: 50px;
		width: auto;
	}
</style>
<script>
	function popupOpen(){
		var popUrl = "/kanemochi/member/write";//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no";//팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
	}
</script>
</head>
<body>
	<a href="javascript:popupOpen()">
		<img class="pencil" src="/kanemochi/resources/image/icon/pencil.png">
	</a>
	<img class="level" src="/kanemochi/resources/image/level/level1.png">
	<img class="avatar" src="/kanemochi/resources/image/character/coolBoy.png">
</body>
</html>