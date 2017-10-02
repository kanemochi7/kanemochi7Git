<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>characterSelect</title>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body {
	margin: 50px;
	text-align: center;
	background: #CFB095;
	font-size: large;
	background-color: #fff5c3;
	background-image: url(/kanemochi/resources/image/bg/pinkSky2.png);
	background-repeat: repeat-x;
	color: black;
}

h1 {
	font-weight: bolder;
	margin: 5%;
}

table {
	margin: auto;
	text-align: center;
	font-size: x-large;
}

th, td {
	padding: 10px;
}

input[type="text"] {
	background: transparent;
	border: none;
}
</style>

<script>
$(function() {
	//alert(joinid)
	$("#joinBtn").on('click', join);
	$("#backBtn").on('click', back);
 
	function back(){
		location.href ="/kanemochi/member/signUpForm";
	}
	function join() {
		var img_id = $("#img_id").val();

		if (img_id != "") {
			$('#joinform').submit();
		} else {
			alert("plz select your character!");
			return false;
		}
	}
	
	
	$("a").on("click", function(result) {
		var id = $(this).attr("id");
		var frontURL = "/kanemochi/resources/image/character/";
		var gifName ="";
		
		if(id=="chr1"){
			gifName = "chineseGirl.gif";
			$("#imgURL").attr("value", "chineseGirl");
		}else if (id =="chr2"){
			gifName = "catGirl.gif";
			$("#imgURL").attr("value", "catGirl");
		}else if (id =="chr3"){
			gifName = "pinkGirl.gif";
			$("#imgURL").attr("value", "pinkGirl");
		}else if (id =="chr4"){
			gifName = "englishBoy.gif";
			$("#imgURL").attr("value", "englishBoy");
		}else if (id =="chr5"){
			gifName = "coolBoy.gif";
			$("#imgURL").attr("value", "coolBoy");
		}else if (id =="chr6"){
			gifName = "usoku.gif";
			$("#imgURL").attr("value", "usoku");
		}else{
			init();
			$("#imgURL").attr("value", "");
		}
	
		$("a").css("outline", "none");
		init();
		$(this).children().attr("src", frontURL + gifName);
		$(this).css("outline", "5px dotted  #ff6666");
		
		function init(){
			$("#chrOne").attr("src", frontURL + "chineseGirl.png");
			$("#chrTwo").attr("src", frontURL + "catGirl.png");
			$("#chrThree").attr("src", frontURL + "pinkGirl.png");
			$("#chrFour").attr("src", frontURL + "englishBoy.png");
			$("#chrFive").attr("src", frontURL + "coolBoy.png");
			$("#chrSix").attr("src", frontURL + "usoku.png");
		}
	});
});

</script>
</head>
<body>
	<h1>Select Your Character</h1>
	<form action="/kanemochi/member/signup" id="joinform" method="post">
	<!-- <form action="javascript:test()" id="joinform" method="post"> -->
		<table>
			<tr>
				<td>id</td>
				<td><input type="text" id="user_id" name="user_id"
					value="${memVO.user_id}" readonly="readonly" /></td>
				<td rowspan="3">
				<a href="#" id="chr1"><img src="/kanemochi/resources/image/character/chineseGirl.png" class="chr" alt="left-img" id="chrOne"></a>
				<a href="#" id="chr2"><img src="/kanemochi/resources/image/character/catGirl.png" class="chr"	alt="center-img" id="chrTwo"></a>
				<a href="#" id="chr3"><img src="/kanemochi/resources/image/character/pinkGirl.png" class="chr" alt="right-img" id="chrThree"></a>
				</td>
			</tr>
			<tr class="warning">
				<td>password</td>
				<td><input type="text" id="user_pw" name="user_pw"
					value="${memVO.user_pw}" readonly="readonly" /></td>
			</tr>
			<tr class="info">
				<td>name</td>
				<td><input type="text" id="user_name" name="user_name"
					value="${memVO.user_name}" readonly="readonly" /></td>
			</tr>
			<tr class="success">
				<td>email</td>
				<td><input type="text" id="user_email" name="user_email"
					value="${memVO.user_email}" readonly="readonly" /></td>
				<td rowspan="3">
				<a href="#" id="chr4"><img src="/kanemochi/resources/image/character/englishBoy.png"class="rounded float-left" alt="left-img" id="chrFour"></a> 
				<a href="#" id="chr5"><img src="/kanemochi/resources/image/character/coolBoy.png"	class="rounded float-center" alt="center-img" id="chrFive"></a>
				<a href="#" id="chr6"><img src="/kanemochi/resources/image/character/usoku.png" class="rounded float-right" alt="right-img" id="chrSix"></a>
				</td>
			</tr>
			<tr>
				<td>phone</td>
				<td><input type="text" id="user_phone" name="user_phone"
					value="${memVO.user_phone}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>gender</td>
				<td><input type="text" id="user_gender" name="user_gender"
					value="${memVO.user_gender}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td colspan="3">
					<!-- <a type="button" href="/kanemochi/member/signUpForm" class="btn btn-success">back</a> -->
					<button id="backBtn" class="btn btn-success">back</button>
					<button id="joinBtn" class="btn btn-warning">finish</button>
				</td>
			</tr>
			<tr>
				<td><input type="hidden" name="img_id" value="none" id="imgURL" />
				</td>
			</tr>
		</table>
	</form>
	<audio src="/kanemochi/resources/sound/SignUp_Sound.mp3" autoplay="autoplay" loop="loop"></audio>
</body>
</html>