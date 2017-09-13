<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>includeFooter</title>
<!-- jquery -->
	<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<!-- bootstrap -->
	<script src="/kanemochi/resources/js/bootstrap.js"></script>
	<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<!-- phaser -->
	<script type="text/javascript" src="/kanemochi/resources/js/phaser.js"></script>
<!-- CSS -->
	<style type="text/css">
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
			var popUrl = "/kanemochi/member/write";
			var popName = "writePOP";
			var popOption = "width=1000px, height=1000px, resizable=no, scrollbars=no, status=no";
		  //window.open(URL,    name,    specs,   replace);
			window.open(popUrl, popName, popOption);
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