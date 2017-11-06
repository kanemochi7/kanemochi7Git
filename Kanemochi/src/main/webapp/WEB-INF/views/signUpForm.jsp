<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>SignUpForm</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<style type="text/css">
body {
	margin: 50px;
	text-align: center;
	background-color:#eeafaf;
	background-image:url(/kanemochi/resources/image/bg/pinkSky.png);
	background-repeat: repeat-x;
	color: black;
}

table {
	margin: auto;
	text-align: center;
	font-size:large;
	height: 15px; 
}

th, td {
	padding: 3px;
}

img{
	width: 15%;
}

span{
	white-space:pre;
}

#idMsg, #pwMsg, #nameMsg, #emailMsg, #phoneMsg, #genderMsg{
	height: 2px;
	color:  #ff6666; 
	font-size: 15px;
	font-weight: bold;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    -webkit-animation-name: fadeIn; /* Fade in the background */
    -webkit-animation-duration: 0.4s;
    animation-name: fadeIn;
    animation-duration: 0.4s
}

/* Modal Content */
.modal-content {
    position: fixed;
    bottom: 0;
    background-color: #fefefe;
    width: 100%;
    -webkit-animation-name: slideIn;
    -webkit-animation-duration: 0.4s;
    animation-name: slideIn;
    animation-duration: 0.4s
}

/* The Close Button */
.close {
    color: white;
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

.modal-header {
    padding: 2px 16px;
    background-color: #b7d0e5;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #fefefe;
    color: white;
}

/* Add Animation */
@-webkit-keyframes slideIn {
    from {bottom: -300px; opacity: 0} 
    to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
    from {bottom: -300px; opacity: 0}
    to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}

@keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}
</style>

<script type="text/javascript">
var idResult= false;
var pwResult = false;
var pwResult2 = false;
var nameResult = false;
var emailResult = false;
var phoneResult = false;
var genderResult = false;
var idDuplResult = false;
var emailDuplResult = false;

$(function() {
	$("#id").on('keyup', idCheck);
	$("#password").on('keyup', pwCheck);
	$("#password2").on('keyup', pwCheck2);
	$("#name").on('keyup', nameCheck);
	$("#email").on('keyup', emailCheck);
	$("#phone").on('keyup', phoneCheck);
	$(".gender").on('click', genderCheck);

	$("#joinBtn").on('click', join);
	$("#idDuplCheck").on('click', idDuplCheck);
	$("#emailDuplCheck").on('click', emailDuplCheck);
	
	function join(){
			/* alert("ok");
			alert(idResult)
			alert(pwResult)
			alert(pwResult2)
			alert(nameResult)
			alert(emailResult)
			alert(phoneResult)
			alert(genderResult)
			alert(idDuplResult)
			alert(emailDuplResult) */
		if(idResult && pwResult && pwResult2 && nameResult && emailResult && phoneResult && genderResult && idDuplResult && emailDuplResult) {
			$('#joinForm').submit();
		}else{
			alert("もう一度確認して下さい。");
		}
	}
	
	function idDuplCheck(){
		var user_id = $('#id').val();
		$.ajax({
			url : 'idDuplCheck'
			, method : 'GET'
			, data : 'user_id=' + user_id
			, success: function(repo) {
				if(repo != true){
					alert("このidは使えません。");
					$('#id').val("");
					$('#id').focus();
				}
				if(repo == true){
					alert("このidは使えます！");
					document.getElementById("idMsg").innerHTML = "id ok!!!";
					idDuplResult= true;
				}
			}
			,error: function(repo) {
				alert("idをもう一度確認して下さい。");
			}
		});
	} 
	
	function emailDuplCheck(){
		var user_email= $('#email').val();
		if(emailResult){
			$.ajax({
				url:'/kanemochi/member/emailDuplCheck'
				, method: 'GET'
				, data: 'user_email=' +user_email
				, success: function(result) {
					
					if(result){
						$.ajax({
							url: '/kanemochi/member/emailCheck'
							, method: 'GET'
							, data: 'user_email=' +user_email
							, success: function (number) {
								emailModal(number);
								/* var newWindow = window.open('/kanemochi/member/checkForm?num='+number+'&user_email='+user_email,'check','height=50,weight=50,resizalbe=yes'); */
							}
						})
					}else{
						alert("このメールアドレスは使えません。");
					}
				}
			})
		}else{
			alert("このメールアドレスは使えません。");
		}
	} 
	
	function emailModal(number) {
		var modal = document.getElementById('myModal');
		modal.style.display = "block";
		var user_number = document.getElementById('txt_checkNum');
		var check_num = document.getElementById('btn_checkNum');
		check_num.onclick = function() {
			if (user_number = number) {
				alert("メール認証成功！");
				emailDuplResult = true;
				document.getElementById("emailMsg").innerHTML = "email ok！";
				modal.style.display = "none";
			} else {
				alert("メール認証失敗");
				emailDuplResult = false;
				document.getElementById("email").value = "";
			}
		}
		var span = document.getElementsByClassName("close")[0];
		span.onclick = function() {
		    modal.style.display = "none";
		}
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
	}
	
	function idCheck(){
		var user_id = $('#id').val();
	    if(user_id != ''){
	    	if (((user_id.charAt(0) < 'a') || (user_id.charAt(0)) > 'z')){
	        	document.getElementById("idMsg").innerHTML = "idはアルファベットの小文字で";
	        }else if ((user_id.length < 3) || (user_id.length > 10)) {
				document.getElementById("idMsg").innerHTML = "idは3～ 10文字";
			}else{
				document.getElementById("idMsg").innerHTML = "id checkをしてください！";
				idResult = true;
			}
	    }
	}
	
	$('input[name="autocompletedField]').on('change', function() {
	    $(this).valid();  // trigger validation test
	});
	
	function pwCheck() {
		var password = $('#password').val();
	    if(password != ''){
	    	if ((password.length < 5) || (password.length > 10)) {
				document.getElementById("pwMsg").innerHTML = "passwordは5～10文字";
			}else{
				document.getElementById("pwMsg").innerHTML = "	";
				pwResult = true;
			}
	    }	
	}
	
	function pwCheck2() {
		var password = $('#password').val();
		var password2 = $('#password2').val();
	    if(password != ''){
	    	if(password != password2 || password.length < 5){
				document.getElementById("pwMsg").innerHTML = "このpasswordは使えません。";
			}else{
				document.getElementById("pwMsg").innerHTML = "password ok!";
				pwResult2 = true;
			}
	    }
	}
	
	function nameCheck() {
		var name = $('#name').val();
		if(name == '') {
			document.getElementById("nameMsg").innerHTML = "nameを入力してください";
	    } else if(name.match(/^[5678910]$/)) {
			document.getElementById("nameMsg").innerHTML = "nameは文字だけ入力してください"; //? 숫자 특수문자 금지
	    } else {
			document.getElementById("nameMsg").innerHTML = "name ok!";
			nameResult = true;
		}
	}
	
	function emailCheck() {
		var email = $('#email').val();
	    var exptext = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    if(email == ''){
			document.getElementById("emailMsg").innerHTML = "emailを入力してください";
		} else if(exptext.test(email) == false) {
			document.getElementById("emailMsg").innerHTML = "emailが正しくありません"; 
		} else {
			document.getElementById("emailMsg").innerHTML = "email checkをしてください！";
			emailResult = true;
		}
	}
	
	function phoneCheck(){
		var phone = $('#phone').val();
	    var re = /^[0-9]+$/;
	    if(phone == '') {
			document.getElementById("phoneMsg").innerHTML = "phoneを入力してください";
		} else if((!re.test(phone)) || (phone.length > 12) || (phone.length <10)) {
			document.getElementById("phoneMsg").innerHTML = "番号を確認してください";
		} else {
			document.getElementById("phoneMsg").innerHTML = "phone ok";
			phoneResult = true;
		}
	}
	
	function genderCheck() {
		var gender = $(":input:radio[name='optionsRadios']:checked").val();
		if(gender == '') {
			document.getElementById("genderMsg").innerHTML = "genderを入力してください";
		} else {
		document.getElementById("genderMsg").innerHTML = "gender ok";
		genderResult= true;
		}
	}
});
</script>
</head>
<body>
	<h1>Join us!</h1>
	<!-- <a href="#"><img src="/kanemochi/resources/image/logo-black.gif" class="rounded float-left" alt="left-img" id="logo"></a> -->
	<form class="form-horizontal" id="joinForm"
		action="/kanemochi/member/tempSignUp" method="post">
		<fieldset>
			<legend>歓迎します!</legend>
			<table>
				<tr>
					<td><label for="id">ID</label></td>
					<td><input type="text" id="id" name="user_id" placeholder="ID" class="form-control input-sm" autofocus autocomplete="off"/></td>
					<td><input type="button" class="btn btn-success" id="idDuplCheck" value="CHECK"></td>
				</tr>
				<tr>
					<td colspan="3"><p>
							<span id="idMsg">	</span>
						</p></td>
				</tr>
				<tr>
					<td><label for="password">Password</label></td>
					<td><input type="password" id="password" name="user_pw"  class="form-control input-sm"	placeholder="Password"></td>
				</tr>
				<tr>
					<td><label for="password2">Password 確認</label></td>
					<td><input type="password" id="password2" class="form-control input-sm"	placeholder="Password 確認"></td>
				</tr>
				<tr>
					<td colspan="3"><p>
							<span id="pwMsg">	</span>
						</p></td>
				</tr>
				<tr>
					<td><label for="name">お名前</label></td>
					<td><input type="text" id="name" name="user_name"  class="form-control input-sm" placeholder="お名前" autocomplete="off"></td>
				</tr>
				<tr>
					<td colspan="3"><p>
							<span id="nameMsg">	</span>
						</p></td>
				</tr>
				<tr>
					<td><label for="email">Eメール</label></td>
					<td><input type="email" id="email" name="user_email"  class="form-control input-sm" placeholder="Eメール" autocomplete="off"></td>
					<!-- <a id ="emailDuplCheck" class="btn btn-success">email</a> -->
					<td><input type="button" class="btn btn-success" id="emailDuplCheck" value="CHECK"><!--  data-toggle="modal" data-target="#modal_email" --></td>
				</tr>
				<tr>
					<td colspan="3"><p><span id="emailMsg">	</span></p></td>
				</tr>
				<tr>
					<td><label for="phone">電話番号</label></td>
					<td><input type="tel" id="phone" name="user_phone"  class="form-control input-sm" placeholder="電話番号" autocomplete="off"></td>
				</tr>
				<tr>
					<td colspan="3"><p><span id="phoneMsg">	</span></p></td>
				</tr>
				<tr>
					<td><label>性別</label></td>
					<td>
					<input type="radio" name="user_gender" class ="gender" value="woman"> 女性
					<input type="radio" name="user_gender" class ="gender" value="man"> 男性
					</td>
				</tr>
				<tr>
					<td colspan="3"><p><span id="genderMsg">	</span></p></td>
				</tr>
			</table>
		</fieldset>
		<button type="button" class="btn btn-primary" id="joinBtn">　　次へ　　</button>
		<a href="/kanemochi/">
			<button type="button" class="btn btn-info">キャンセル</button>
		</a>
	</form>
	<!-- <a href="/kanemochi/member/characterSelect" class="btn btn-warning">characterSelect</a> -->
	<input type="hidden" id="smt">

<!-- The Modal -->
<div id="myModal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<div class="modal-header" style="height: 60px;">
		<span class="close">&times;</span>
		<h3>Email Check</h3>
		</div>
		<div class="modal-body" style="height: 40px;">
			<input type="text" id="txt_checkNum" style="margin: 5px;" placeholder="認証番号">
			<input type="button" id="btn_checkNum" style="margin: 5px;" value="check">
		</div>
		<div class="modal-footer" style="height: 40px;">
		</div>
	</div>
</div>
<audio src="/kanemochi/resources/sound/SignUp_Sound.mp3" autoplay="autoplay" loop="loop"></audio>
</body>
</html>
