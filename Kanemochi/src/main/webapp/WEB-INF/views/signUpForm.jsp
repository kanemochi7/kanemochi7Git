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
}

th, td {
	padding: 10px;
}
img{
	width: 15%;
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
					alert("ok");
					alert(idResult)
					alert(pwResult)
					alert(pwResult2)
					alert(nameResult)
					alert(emailResult)
					alert(phoneResult)
					alert(genderResult)
					alert(idDuplResult)
					alert(emailDuplResult)
				if(idResult && pwResult && pwResult2 && nameResult && emailResult && phoneResult && genderResult && idDuplResult && emailDuplResult) {
					$('#joinForm').submit();
				}else{
					alert("you input something wrong");
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
							alert("중복되는 아이디가 있습니다.");
							$('#id').val("");
							$('#id').focus();
						}
						if(repo == true){
							alert("사용하실 수 있는 아이디입니다.");
							document.getElementById("idMsg").innerHTML = "id ok!!!";
							idDuplResult= true;
						}
					}
					,error: function(repo) {
						alert("오류 발생");
					}
				});
			} 
			
			function emailDuplCheck(){
				var user_email= $('#email').val();
				if(emailResult){
					$.ajax({
						url: '/kanemochi/member/emailCheck'
						, method: 'GET'
						, data: 'user_email=' +user_email
						, success: function (number) {
							var newWindow = window.open('/kanemochi/member/checkForm?num='+number+'&user_email='+user_email,'check','height=50,weight=50,resizalbe=yes');
						}
					});
				}else{
					alert("올바른 이메일 형식이 아닙니다.");
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
			
			function pwCheck(){
				var password = $('#password').val();
			    
			    if(password != ''){
			    	if ((password.length < 5) || (password.length > 10)) {
						document.getElementById("pwMsg").innerHTML = "passwordは5～ 10文字";
					}else{
						document.getElementById("pwMsg").innerHTML = "";
						pwResult = true;
					}
			    }	
			}
			
			function pwCheck2(){
				 var password = $('#password').val();
				 var password2 = $('#password2').val();
				    
				    if(password != ''){
				    	if(password != password2){
							document.getElementById("pwMsg").innerHTML = "pwが一致しません"; 
						}else{
							document.getElementById("pwMsg").innerHTML = "password ok!";
							pwResult2 = true;
						}
				    }
			}
			
			function nameCheck() {
				var name = $('#name').val();
			    
			    if(name == ''){
			    	document.getElementById("nameMsg").innerHTML = "nameを入力してください";
			    }else if(name.match(/^[5678910]$/)){
			    	document.getElementById("nameMsg").innerHTML = "nameは文字だけ入力してください"; //? 숫자 특수문자 금지
			    }else{
					document.getElementById("nameMsg").innerHTML = "name ok!";
					nameResult = true;
			    }
			}
			
			function emailCheck(){
				var email = $('#email').val();
			    var exptext = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			    
			    if(email == ''){
			    	document.getElementById("emailMsg").innerHTML = "emailを入力してください";
			    }else if(exptext.test(email) == false){
			    	document.getElementById("emailMsg").innerHTML = "emailが正しくありません"; 
			    }else{
			    	document.getElementById("emailMsg").innerHTML = "email checkをしてください！";
					emailResult = true;
				}
			}
			
			function phoneCheck(){
				var phone = $('#phone').val();
			    var re = /^[0-9]+$/;
		        
			    if(phone == ''){
			    	document.getElementById("phoneMsg").innerHTML = "phoneを入力してください";
			    }else if((!re.test(phone)) || (phone.length != 11)){
					document.getElementById("phoneMsg").innerHTML = "phone number is wrong!";
				}else{
					document.getElementById("phoneMsg").innerHTML = "phone ok";
					phoneResult = true;
				}
			}
			
			function genderCheck(){
				var gender = $(":input:radio[name='optionsRadios']:checked").val();
				
			    if(gender == ''){
			    	document.getElementById("genderMsg").innerHTML = "genderを入力してください";
				}else{
				document.getElementById("genderMsg").innerHTML = "gender ok";
				genderResult= true;
				}
			}
		});
		
</script>
</head>
<body>
<!-- 	<a href="#" class="btn btn-default">Default</a>
	<a href="#" class="btn btn-primary">Primary</a>
	<a href="#" class="btn btn-success">Success</a>
	<a href="#" class="btn btn-info">Info</a>
	<a href="#" class="btn btn-warning">Warning</a>
	<a href="#" class="btn btn-danger">Danger</a>
	<a href="#" class="btn btn-link">Link</a>
	<h1>[ KANEMOCHI ]</h1> -->
	<h1>Join us!</h1>
	<!-- <a href="#"><img src="/kanemochi/resources/image/logo-black.gif" class="rounded float-left" alt="left-img" id="logo"></a> -->
	<form class="form-horizontal" id="joinForm"
		action="/kanemochi/member/tempSignUp" method="post">
		<fieldset>
			<legend>歓迎します!</legend>
			<table>
				<tr>
					<td><label for="id">ID</label></td>
					<td><input type="text" id="id" name="user_id" placeholder="ID" class="form-control input-sm" autofocus /></td>
					<td><a id="idDuplCheck" class="btn btn-success">IDCHECK</a></td>
				</tr>
				<tr>
					<td colspan="3"><p>
							<span id="idMsg"></span>
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
							<span id="pwMsg"></span>
						</p></td>
				</tr>
				<tr>
					<td><label for="name">お名前</label></td>
					<td><input type="text" id="name" name="user_name"  class="form-control input-sm" placeholder="お名前"></td>
				</tr>
				<tr>
					<td colspan="3"><p>
							<span id="nameMsg"></span>
						</p></td>
				</tr>
				<tr>
					<td><label for="email">Eメール</label></td>
					<td><input type="email" id="email" name="user_email"  class="form-control input-sm" placeholder="Eメール" autocomplete="off"></td>
					<td><a id ="emailDuplCheck" class="btn btn-success">email</a></td>
				</tr>
				<tr>
					<td colspan="3"><p><span id="emailMsg"></span></p></td>
				</tr>
				<tr>
					<td><label for="phone">電話番号</label></td>
					<td><input type="tel" id="phone" name="user_phone"  class="form-control input-sm" placeholder="電話番号"></td>
				</tr>
				<tr>
					<td colspan="3"><p><span id="phoneMsg"></span></p></td>
				</tr>
				<tr>
					<td><label>性別</label></td>
					<td>
					<input type="radio" name="user_gender" class ="gender" value="woman"> 女性
					<input type="radio" name="user_gender" class ="gender" value="man"> 男性
					</td>
				</tr>
				<tr>
					<td colspan="3"><p><span id="genderMsg"></span></p></td>
				</tr>
			</table>
		</fieldset>
		<button type="button" class="btn btn-primary" id="joinBtn">確認</button>

		<button type="reset" class="btn btn-info">キャンセル</button>

	</form>
	
<!-- <a href ="/kanemochi/member/album">album으로</a><br>
	<a href ="/kanemochi/member/write">write로</a><br>
	<a href ="/kanemochi/member/myPage">myPage로</a><br>
	<a href ="/kanemochi/member/list">list로</a><br>
	<a href ="/kanemochi/member/memberListForm">memberListForm으로</a>
	<a href ="/kanemochi/member/reportForm">report로</a><br> -->
	<a href="/kanemochi/member/characterSelect" class="btn btn-warning">characterSelect</a>
	<input type="hidden" id="smt">
</body>
</html>
