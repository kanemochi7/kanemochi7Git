<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>includeHeader</title>
<!-- CSS -->
	<style type="text/css">
	body{
		background-size: 100% 100%
	    background-color:#DDD;
		color: white;
	}
	p {
		color: black;
		text-align: right;
	}
	.icon {
		width: 30px;
    	height: auto;
	}
</style>
</head>
<body>
	<%-- <c:if test="${loginID!=null}"> --%>
		<p>
			${loginName} 様　Welcome!
			<a href="/kanemochi/" class="btn btn-info">home</a>
			<a href="/kanemochi/member/logout" class="btn btn-info">ログアウト</a>
			<a href="/kanemochi/member/myPage">
				<input type="image" id="mypage" class="icon" data-toggle="tooltip" data-placement="bottom" title="マイページ" src="/kanemochi/resources/image/icon/mypage.png">
			</a>
			<a href="/kanemochi/member/list">
				<input type="image" id="record" class="icon" data-toggle="tooltip" data-placement="bottom" title="今までの記録" src="/kanemochi/resources/image/icon/folder.png">
			</a>
			<a href="/kanemochi/member/screenshotForm">
				<input type="image" id="screenshot" class="icon" data-toggle="tooltip" data-placement="bottom" title="スクリーンショットを撮る" src="/kanemochi/resources/image/icon/screenshot.png">
			</a>
			<a href="/kanemochi/member/album">
				<input type="image" id="album" class="icon" data-toggle="tooltip" data-placement="bottom" title="スクリーンショットアルバム" src="/kanemochi/resources/image/icon/album.png">
			</a>
			<a href="#">
				<input type="image" id="setting" class="icon" data-toggle="tooltip" data-placement="bottom" title="設定" src="/kanemochi/resources/image/icon/setting.png">
			</a>
			<a href="#">
				<input type="image" id="question" class="icon" data-toggle="tooltip" data-placement="bottom" title="アドバイス" src="/kanemochi/resources/image/icon/questionmark.png">
			</a>
		</p>
	<%-- </c:if> --%>
</body>
</html>