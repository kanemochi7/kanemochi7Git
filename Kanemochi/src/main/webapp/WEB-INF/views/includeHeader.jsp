<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<style type="text/css">
body{
	background-size: 100% 100%
    background-color:#DDD;
	color: white;
}
#p_header {
	color: black;
	text-align: right;
}
.icon {
	width: 30px;
   	height: auto;
}
</style>
<script>
$(function() {
	getToday();
});

function getToday() {
	var date = new Date();
	var year = date.getFullYear();
	var month = (1 + date.getMonth());
		month = month >= 10 ? month : '0' + month;
	var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
	var week = new Array("日","月","火","水","木","金","土");
		weekday = week[date.getDay()];
		
		document.getElementById("today_year").innerHTML = year;
		document.getElementById("today_month").innerHTML = month;
		document.getElementById("today_day").innerHTML = day;
		document.getElementById("today_weekday").innerHTML = weekday;
}

</script>
</head>
<body>
	<%-- <c:if test="${loginID!=null}"> --%>
	<p id="p_header">
		<span id="today">
			「<b>今日</b>
			<span id="today_year"></span>年
			<span id="today_month"></span>月
			<span id="today_day"></span>日
			<span id="today_weekday"></span>曜日」   
		</span>
		
		${loginName} 様　Welcome!
		<a href="/kanemochi/member/logout">
			<input type="button" id="btnLogout" class="btn btn-default" value="ログアウト">
		</a>
		<a href="/kanemochi/member/main">
			<input type="image" id="main" class="icon" data-toggle="tooltip" data-placement="bottom" title="メインページ" src="/kanemochi/resources/image/icon/main.png">
		</a>
		<a href="/kanemochi/member/myPage">
			<input type="image" id="mypage" class="icon" data-toggle="tooltip" data-placement="bottom" title="マイページ" src="/kanemochi/resources/image/icon/mypage.png">
		</a>
		<a href="/kanemochi/record/reportForm">
			<input type="image" id="record" class="icon" data-toggle="tooltip" data-placement="bottom" title="今までの記録" src="/kanemochi/resources/image/icon/graph.png">
		</a>
		<a href="#">
			<input type="image" id="screenshot" class="icon" data-toggle="tooltip" data-placement="bottom" title="スクリーンショットを撮る" src="/kanemochi/resources/image/icon/screenshot.png">
		</a>
		<a href="/kanemochi/printScreenshotAll">
			<input type="image" id="album" class="icon" data-toggle="tooltip" data-placement="bottom" title="スクリーンショットアルバム" src="/kanemochi/resources/image/icon/album.png">
		</a>
			<input type="image" id="setting" class="icon" data-toggle="tooltip" data-placement="bottom" title="設定" src="/kanemochi/resources/image/icon/setting.png">
		<a href="#">
			<input type="image" id="question" class="icon" data-toggle="tooltip" data-placement="bottom" title="アドバイス" src="/kanemochi/resources/image/icon/questionmark.png">
		</a>
	</p>
	<%-- </c:if> --%>
	
	<!-- Modal_volume -->
	<div id="volume" class="modal">
		<div class="modal-content">
			<span class="close" id="close_volume">&times;</span>
			<h3>音量調節</h3>
			<div class="divTable blueTable" style="text-align: center; position: relative; left: 10%;">
				<div class="divTableBody">
					<div class="divTableRow">
						<div class="divTableCell">game theme</div>
						<div class="divTableCell"><img src="/kanemochi/resources/image/icon/music_minus.png"></div>
						<div class="divTableCell"><img src="/kanemochi/resources/image/icon/music_plus.png"></div>
					</div>
					<div class="divTableRow">
						<div class="divTableCell">sound effect</div>
						<div class="divTableCell"><img src="/kanemochi/resources/image/icon/music_minus.png"></div>
						<div class="divTableCell"><img src="/kanemochi/resources/image/icon/music_plus.png"></div>
					</div>
					<div class="divTableRow">
						<div class="divTableCell"></div>
						<div class="divTableCell">
							<input type="button" id="" class="btn btn-primary click" value="closes" onclick="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var volume_form = document.getElementById("volume");
var setting_b = document.getElementById("setting");
var close_b = document.getElementById("close_volume");
setting_b.onclick = function() {
	volume_form.style.display = "block";
	close_b.onclick = function() {
		volume_form.style.display = "none";
	}
	window.onclick = function(event_v) {
		if (event_v.target == volume_form) {
			volume_form.style.display = "none";
		}
	}
};
</script>
</html>