<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
	<title>KANEMOCHI</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body{
	margin: 0 auto;
	margin-top: 5%;
	text-align: center;
	background: #578CA9;
	background-image:url(/kanemochi/resources/image/bg/bg3.gif);
	background-size: 100% 100%;
	color: navy;
}
table {
	margin: auto;
	text-align: center;
}
th, td {
	padding: 10px;
}
label{
	text-align: center;
}
#logo{
	width: 30%;
}
#icon{
	width:20%;
}
a > b{
	border-bottom: 1px solid #348b8f;
    outline-color: blue;
    /* color: #5858FA; */
    color: #348b8f;
} 

/* Modal Content */
	.modal-content {
		text-align: center;
	    vertical-align: middle;

	    width: 60%;
	    background-color: #aaaaaa;
	    margin: auto;
	    padding: 20px;
	    border: none;
	    display: block;
	}
	.select {
		background-color: #fefefe;
		color: #aaaaaa;
	}
</style>
<script>
$(function() {
	var loginResult = "${empty loginResult}";
	var findResult = "${empty findResult}";
	var signupResult = "${empty signupResult}";
	
	if(loginResult!="true"){
		if("${loginResult}"== "true"){
			alert("ログイン成功");
		}else if("${loginResult}"=="false"){
			alert("ログイン失敗");
		}
	}else if(findResult!="true"){
		
		if("${findResult}"== "true"){
			alert("メールを確認してください。");
		}else if("${findResult}"=="false"){
			alert("転送失敗");
		}
		
	}else if(signupResult!="true"){
		
		if("${signupResult}"== "true"){
			alert("加入完了");
		}else if("${signupResult}"=="false"){
			alert("加入失敗");
		}
		
	}

	$(".btn").on('click', function() {
		var audio = new Audio("/kanemochi/resources/sound/ClickOn.wav");
		audio.volume = 1;
		audio.play();
	})
		
	$("#loginBtn").on('click', function() {		
		if($("#id").val()=="" && $("#pwd").val()==""){
			alert("IDとpasswordを入力してください。");
			$("#id").focus();
			return false;
		}
		$("#login").submit();
	})
	
	//enter 입력시 loginBtn 실행
	$('#login').keypress(function (e){
		  if(e.keyCode=='13'){ //Keycode for "Return"
		     $('#loginBtn').click();
		  }
	});

});
/*  $(function(){
	var header = $('body');

	var backgrounds = new Array(
	    'url(/kanemochi/resources/image/bg/jinja.gif)'
	  , 'url(/kanemochi/resources/image/bg/densha.gif)'
	  , 'url(/kanemochi/resources/image/bg/ame.gif)'
	  , 'url(/kanemochi/resources/image/bg/spring.gif)'
	);

	var current = 0;

	function nextBackground() {
	    current++;
	    current = current % backgrounds.length;
	    header.css('background-image', backgrounds[current]);
	}
	setInterval(nextBackground, 5000);

	header.css('background-image', backgrounds[0]);
	}); */  
	 

/* 	 $(function(){
	var imgs = new Array("/kanemochi/resources/image/bg/jinja.gif",
			"/kanemochi/resources/image/bg/densha.gif",
			"/kanemochi/resources/image/bg/ame.gif",
			"/kanemochi/resources/image/bg/spring.gif");
	function changeBg() {
	    var imgUrl = imgs[Math.floor(Math.random()*imgs.length)];
	    $('body').css('background-image', 'url(' + imgUrl + ')');
	    $('body').fadeIn(1000); //this is new, will fade in smoothly
	}
	
	function changeBackgroundSmoothly() {
	    $('body').fadeOut(1000, changeBg); //this is new, will fade out smoothly
	}
	
	setInterval(changeBackgroundSmoothly,5000);
	
	 }); */

</script>

</head>
<body>
<!-- <h1>KANEMOCHI</h1> -->
<a href="#"><img src="/kanemochi/resources/image/logo_white.gif" class="rounded float-left" alt="kanemochi" id="logo"></a>
<c:if test="${loginID ==null}">
<form id="login" action="/kanemochi/member/login" method="post">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" id="id" name="user_id" class="form-control input-sm"  placeholder="ID"></td>
	 	</tr>
	 	<tr>
			<td>Password</td>
			<td><input type="password" id="pwd" name="user_pw" class="form-control input-sm" placeholder="Password"></td>
	 	</tr>
	 	<tr>
	 		<td colspan ="2">
		 	<input type="button" id="loginBtn" class="btn btn-primary" value="ログイン">
		 	<input type="reset" class="btn btn-warning" value="キャンセル">
	 		</td>
	 	</tr>
	 	<tr>
	 		<td colspan="2">
	 			<input type="button" id="joinBtn" class="btn btn-info" value="KANEMOCHI 会員登録" onclick="location.href='/kanemochi/member/signUpForm';">
				<!-- <a href="/kanemochi/member/signUpForm" class="btn btn-info">KANEMOCHI 会員登録</a> -->
	 		</td>
	 	</tr>
	 	<tr>
	 		<td colspan="2" id="idpw">
	 			<a href="/kanemochi/member/findIdPwdForm?menu=findinfo"><b>id</b></a> /
				<a href="/kanemochi/member/findIdPwdForm?menu=findpw"><b>pwd を探す</b></a><br><br>
				<a href="/kanemochi/credit" class="btn btn-info" id="credit">credit</a>
			</td>
	 	</tr>
	</table>
</form>
</c:if>

<c:if test="${loginID != null}">
	<table>
		<tr>
			<td>
				<p> LOGIN : ${loginName}</p>
				<button type="button" class="btn btn-danger" onclick="location.href='/kanemochi/member/logout'">logout</button><br>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-success" onclick="location.href='/kanemochi/member/album'">album</button>
				<button type="button" class="btn btn-warning" onclick="location.href='/kanemochi/member/write'">write</button>
				<button type="button" class="btn btn-success" onclick="location.href='/kanemochi/member/myPage'">myPage</button>
				<button type="button" class="btn btn-warning" onclick="location.href='/kanemochi/member/list'">list</button>
				<button type="button" class="btn btn-success" onclick="location.href='/kanemochi/member/memberListForm'">memberListForm</button>
				<button type="button" class="btn btn-warning" onclick="location.href='/kanemochi/record/reportForm'">report</button>
				<button type="button" class="btn btn-success" onclick="location.href='/kanemochi/member/main'">mainPage</button>
			</td>
			<td></td>
		</tr>
	</table>
</c:if>
<audio src="/kanemochi/resources/sound/Login_Sound.mp3" autoplay="autoplay" loop="loop"></audio>

<%-- <!-- Credit Modal -->
		  <div class="modal fade" id="modal_credit" role="dialog">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close btn btn-default" data-dismiss="modal" id ="close_modal_credit">&times;</button>
		          <h1 class="modal-title">Credit</h1>
		        </div>
		        <div class="modal-body modal-lg">
		        <jsp:include page="credit.jsp"></jsp:include>
		        </div>
		        <div class="modal-footer modal-lg">
		         <!-- <button type="button" class="btn btn-warning">delete</button> -->
		          <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-family:PixelMplus12" onclick="deleteScreenshot()">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>  --%>
</body>
<script>

/*  	//Credit Modal
	$("#credit").on("click", function showOnModal() {
		
	}); */
</script>
</html>
