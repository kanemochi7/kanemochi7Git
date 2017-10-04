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
/* The Modal (background) */
	.modal {
		text-align: center;
		vertical-align: middle;

	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    padding-top: 100px; /* Location of the box */
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    left: 0;
	    top: 0;
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
/* Modal Content */
	.modal-content {
		text-align: center;
	    vertical-align: middle;

	    width: 50%;
	    background-color: #aaaaaa;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #888;
	}
	.select {
		background-color: #fefefe;
		color: #aaaaaa;
	}
	
/* The Close Button */
	.close {
	    color: #aaaaaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
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
			<input type="image" id="question" class="icon" data-toggle="tooltip" data-placement="bottom" title="アドバイス" src="/kanemochi/resources/image/icon/questionmark.png">
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
						<div class="divTableCell"><img src="/kanemochi/resources/image/icon/music_minus.png" id="mg_sound_minus"></div>
						<div class="divTableCell"><img src="/kanemochi/resources/image/icon/music_plus.png" id="mg_sound_plus"></div>
					</div>
					<div class="divTableRow">
						<div class="divTableCell"></div>
						<div class="divTableCell">
							<input type="button" id="btn_setClose" class="btn btn-primary click" value="Close" >
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Advice -->
	<div id="advice" class="modal typewriter_body">
		<span class="close" id="close_advice">&times;</span>
		<div id="welcome">
			<div class="typewriter" id="1" onclick="nextLine(2)"><h1>KANEMOCHIへようこそ！</h1></div>
			<div class="typewriter" id="2" onclick="nextLine(3)" style="display:none;"><h1>今から格メニュを紹介します。</h1></div>
			<div class="typewriter" id="3" onclick="nextDiv()" style="display:none;"><h3>next▶</h3></div>
		</div>
		<div id="date_id_typewriter">
		 	<div class="typewriter" id="4" onclick="nextLine(5)">こちらへ今日の日付と、ログインしているユーザーのIDが票示されます。</div>
		 	<div class="typewriter" id="5" onclick="nextDiv2()" style="display:none;"><h3>next▶</h3></div>
		</div>
		<div id="budget_typewriter">
			<div class="typewriter" id="6" onclick="nextLine(7)">ここの予算メニュでは、期間・カテゴリによる予算を設定します。</div>
			<div class="typewriter" id="7" onclick="nextDiv3()" style="display:none;"><h3>next▶</h3></div>
			<div class="budgetbox"></div>
		</div>
		<div id="write_typewriter">
			<div class="typewriter" id="8" onclick="nextLine(9)">ここの記録メニュでは、自分の支払いをカテゴリを選んで記録します。</div>
			<div class="typewriter" id="9" onclick="nextDiv4()" style="display:none;"><h3>next▶</h3></div>
			<div class="writebox"></div>
		</div>
		<div id="category_typewriter">
			<div class="typewriter" id="10" onclick="nextLine(11)">記録したカテゴリは商店アイテムになって登場します!</div>
			<div class="typewriter" id="11" onclick="nextDiv5()" style="display:none;"><h3>next▶</h3></div>
			<div class="categorybox"></div>
		</div>
		<div id="progress_typewriter">
			<div class="typewriter" id="12" onclick="nextLine(13)">記録した価格は予算からどのぐらいか分かりやすくプログレスバーで票示されます!<br>出席、イベントなどを通してポイントを積むこともできます！</div>
			<div class="typewriter" id="13" onclick="nextDiv6()" style="display:none;"><h3>next▶</h3></div>
		</div>
		<div id="menu_typewriter">
			<div class="typewriter" id="14" onclick="nextLine(15)">マイペジーでは登録した会員情報を編集することができます。<br>通計メニュでは、今まで使ったお金の傾向をチェックできます。<br>screenshotでは自分のゲーム状態を保存でき、facebookへ共有できます。</div>
			<div class="typewriter" id="15" onclick="nextDiv7()" style="display:none;"><h3>next▶</h3></div>
			<div class="menubox"></div>
		</div>
		<div id="bye">
			<div class="typewriter" id="16" onclick="endModal()"><h1>ENJOY KANEMOCHI!</h1></div>
		</div>
	</div>
	
</body>
<style>
#welcome{
    position: absolute;
    right: 500px;
    top: 200px;
	background-color: black;
}
#date_id_typewriter {
	font-size: 18px;
    display: none;
    height: 50px;
    width: 365px;
    position: absolute;
    right: 374px;
    top: 60px;
    border-top: 3px solid white;
    padding: 10px;
	background-color: black;
}

#budget_typewriter {
    font-size: 18px;
    display: none;
    height: 70px;
    width: 300px;
    position: absolute;
    left: 122px;
    bottom: 60px;
    padding: 10px;
	background-color: black;
}
.budgetbox {
    height: 60px;
    width: 60px;
    border: 3px solid white;
    position: absolute;
    left: 28px;
    bottom: -68px;
}

#write_typewriter {
    font-size: 18px;
    display: none;
    height: 70px;
    width: 320px;
    position: absolute;
    left: 20px;
    bottom: 60px;
    padding: 10px;
    background-color: black;
}
.writebox {
    height: 60px;
    width: 60px;
    border: 3px solid white;
    position: absolute;
    left: 20px;
    bottom: -68px;
}

#category_typewriter {
	font-size: 18px;
    display: none;
    height: 200px;
    width: 290px;
    position: absolute;
    left: 122px;
    top: 60px;
    padding: 10px;
    background-color: black;
}
.categorybox {
    height: 420px;
    width: 120px;
    border: 3px solid white;
    position: absolute;
    left: -120px;
    top: 0px;
}

#progress_typewriter {
    font-size: 18px;
    display: none;
    height: 80px;
    width: 1100px;
    position: absolute;
    right: 180px;
    bottom: 58px;
    border-bottom: 3px solid white;
    padding: 10px;
    background-color: black;
}

#menu_typewriter {
    font-size: 18px;
    display: none;
    height: 80px;
    width: 650px;
    position: absolute;
    right: 0px;
    top: 58px;
    padding: 10px;
    background-color: black;
}
.menubox {
    height: 50px;
    width: 274px;
    border: 3px solid white;
    position: absolute;
    right: 1px;
    top: -56px;
}

#bye {
    display: none;
    position: absolute;
    right: 500px;
    top: 200px;
	background-color: black;
}
	
/* GLOBAL STYLES */
.typewriter_body {
  background: #333;
  padding-top: 5em;
  /* display: flex; */
  justify-content: center;
}

/* DEMO-SPECIFIC STYLES */
.typewriter h1 {
  color: #fff;
  /* font-family: monospace; */
  overflow: hidden; /* Ensures the content is not revealed until the animation */
  border-right: .15em solid orange; /* The typwriter cursor */
  white-space: nowrap; /* Keeps the content on a single line */
  margin: 0 auto; /* Gives that scrolling effect as the typing happens */
  letter-spacing: .15em; /* Adjust as needed */
  animation: 
    typing 3.5s steps(30, end),
    blink-caret .5s step-end infinite;
}

/* The typing effect */
@keyframes typing {
  from { width: 0 }
  to { width: 100% }
}

/* The typewriter cursor effect */
@keyframes blink-caret {
  from, to { border-color: transparent }
  50% { border-color: orange }
}
</style>
<script type="text/javascript">
function nextLine(next) {
	document.getElementById(next).style.display = "block";
}
function nextDiv() {
	document.getElementById("welcome").style.display = "none";
	document.getElementById("date_id_typewriter").style.display = "block";
}
function nextDiv2() {
	document.getElementById("date_id_typewriter").style.display = "none";
	document.getElementById("budget_typewriter").style.display = "block";
}
function nextDiv3() {
	document.getElementById("budget_typewriter").style.display = "none";
	document.getElementById("write_typewriter").style.display = "block";
}
function nextDiv4() {
	document.getElementById("write_typewriter").style.display = "none";
	document.getElementById("category_typewriter").style.display = "block";
}
function nextDiv5() {
	document.getElementById("category_typewriter").style.display = "none";
	document.getElementById("progress_typewriter").style.display = "block";
}
function nextDiv6() {
	document.getElementById("progress_typewriter").style.display = "none";
	document.getElementById("menu_typewriter").style.display = "block";
}
function nextDiv7() {
	document.getElementById("menu_typewriter").style.display = "none";
	document.getElementById("bye").style.display = "block";
}
function endModal() {
	document.getElementById("bye").style.display = "none";
	document.getElementById("advice").style.display = "none";
	document.getElementById("welcome").style.display = "none";
}

var advice_modal = document.getElementById("advice");
var btn_advice = document.getElementById("question");
var btn_close_advice = document.getElementById("close_advice");
	btn_advice.onclick = function() {
	advice_modal.style.display = "block";
	btn_close_advice.onclick = function() {
		modal_budget.style.display = "none";
	}
	window.onclick = function(event_b) {
		if (event_b.target == advice_modal) {
			advice_modal.style.display = "none";
		}
	}
};


var volume_form = document.getElementById("volume");
var setting_b = document.getElementById("setting");
var close_b = document.getElementById("close_volume");
var btn_setClose = document.getElementById("btn_setClose");
var mg_sound_minus = document.getElementById("mg_sound_minus");
var mg_sound_plus = document.getElementById("mg_sound_plus");
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
	btn_setClose.onclick = function(){
		volume_form.style.display = "none";
	}
	mg_sound_minus.onclick = function() {
		main_music.volume -= 0.03;
		console.log(main_music.volume);
		if(main_music.volume < 0){
			main_music.mute = true;
			console.log(main_music.volume);
		}
	}
	mg_sound_plus.onclick = function() {
		main_music.volume += 0.03;
		console.log(main_music.volume);
		if(main_music.volume < 0){
			main_music.mute = false;
			console.log(main_music.volume);
		}
	}
	
};
</script>
</html>