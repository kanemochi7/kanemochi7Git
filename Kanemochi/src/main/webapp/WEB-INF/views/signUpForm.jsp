<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body {
	margin: 50px;
	text-align: center;
}

table {
	margin: auto;
	text-align: center;
}

th, td {
	padding: 10px;
}
</style>
<script type="text/javascript">
/* 	$(function(){
	
		function init(location){
			document.getElementById(location).innerHTML = "";
		}
		
		$('#joinBtn').on('click', function() {
			
		}); */
		
		
		$(function() {
			
			var idResult= false;
			var pwResult = false;
			var pwResult2 = false;
			
			$("#id").on('keyup', idCheck);
			$("#password").on('keyup', pwCheck);
			$("#password2").on('keyup', pwCheck2);
			$("#joinBtn").on('click', join);
			
		});
		
		function join(){
			if((pwResult== true) && (pwResult2 == true)){
				alert("ok");
				$('#joinForm').submit();
			}else{
				alert("you input something wrong");
			}
		}

		function idCheck(){
			var id = $('#id').val();
		    
		    if(id != ''){
		    	if (((id.charAt(0) < 'a') || (id.charAt(0)) > 'z')){
		        	document.getElementById("idMsg").innerHTML = "idはアルファベットの小文字で";
		        }else if ((id.length < 3) || (id.length > 10)) {
					document.getElementById("idMsg").innerHTML = "idは3～ 10文字";
				}else{
					document.getElementById("idMsg").innerHTML = "idcheckしてください";
					$("#idcheck").click(function(){
					document.getElementById("idMsg").innerHTML = "id ok!";
					idResult = true;
					});
				}
		    }
		}
		
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
						document.getElementById("pwMsg").innerHTML = "pwが一致しません"; // ? 
					}else{
						document.getElementById("pwMsg").innerHTML = "password ok!";
						pwResult2 = true;
					}
			    }
		}
		
		/* $('#id').keyup(function () {
		    var id = $('#id').val();
		    
		    if(id != ''){
		    	if (((id.charAt(0) < 'a') || (id.charAt(0)) > 'z')){
		        	document.getElementById("idMsg").innerHTML = "idはアルファベットの小文字で";
		        	return false;
		        }else if ((id.length < 3) || (id.length > 10)) {
					document.getElementById("idMsg").innerHTML = "idは3～ 10文字";
					return false;
				}else{
					document.getElementById("idMsg").innerHTML = "idcheckしてください";
					$("#idcheck").click(function(){
					document.getElementById("idMsg").innerHTML = "id ok!";
					return true;
					});
				}
		    }
		});
		
		$('#password').keyup(function() {
		    var password = $('#password').val();
		    
		    if(password != ''){
		    	if ((password.length < 5) || (password.length > 10)) {
					document.getElementById("pwMsg").innerHTML = "passwordは5～ 10文字";
					return false;
				}else{
					init("pwMsg");
					return true;
				}
		    }
		});
		
		$('#password2').keyup(function() {
		    var password = $('#password').val();
		    var password2 = $('#password2').val();
		    
		    if(password != ''){
		    	if(password != password2){
					document.getElementById("pwMsg").innerHTML = "pwが一致しません"; // ? 
					return false;
				}else{
					document.getElementById("pwMsg").innerHTML = "password ok!";
					return true;
				}
		    }
		});
		
		$('#name').keyup(function() {
			var name = $('#name').val();
		    
		    if(name == ''){
		    	document.getElementById("nameMsg").innerHTML = "nameを入力してください";
		    	return false;
		    }else if(name.match(/^[5678910]$/)){
		    	document.getElementById("nameMsg").innerHTML = "nameは文字だけ入力してください"; //? 숫자 특수문자 금지
		    	return false;
		    }else{
				document.getElementById("nameMsg").innerHTML = "name ok!";
				return true;
			}
		});
		
		$('#email').keyup(function() {
		    var email = $('#email').val();
		    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		    ///^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		    
		    if(email == ''){
		    	document.getElementById("emailMsg").innerHTML = "emailを入力してください";
		    	return false;
		    }else if(exptext.test(email) == false){
		    	document.getElementById("emailMsg").innerHTML = "emailが正しくありません"; //? 숫자 특수문자 금지
		    	return false;
		    }else{
				document.getElementById("emailMsg").innerHTML = "email ok!";
				return true;
			}
		});
		
		$('#phone').keyup(function() {
		    var phone = $('#phone').val();
		    var re = /^[0-9]+$/;
	        
		    if(phone == ''){
		    	document.getElementById("phoneMsg").innerHTML = "phoneを入力してください";
		    	return false;
		    }else if((!re.test(phone)) || (phone.length != 10)){
				document.getElementById("phoneMsg").innerHTML = "phone number is wrong!";
				return false;
			}else{
				document.getElementById("phoneMsg").innerHTML = "phone ok";
				return true;
			}
		});
		
		$('#gender').click(function() {
		    var gender = $('#gender').val();
		    
		    if(gender == ''){
		    	document.getElementById("genderMsg").innerHTML = "genderを入力してください";
		    	return false;
			}else{
				document.getElementById("genderMsg").innerHTML = "gender ok"; //gender woman은 안되는 이유?
				return true;
			}
		}); */
		
/* 	}); */
	
	
</script>
</head>
<body>
	<a href="#" class="btn btn-default">Default</a>
	<a href="#" class="btn btn-primary">Primary</a>
	<a href="#" class="btn btn-success">Success</a>
	<a href="#" class="btn btn-info">Info</a>
	<a href="#" class="btn btn-warning">Warning</a>
	<a href="#" class="btn btn-danger">Danger</a>
	<a href="#" class="btn btn-link">Link</a>
	<h1>KANEMOCHI</h1>
	<form class="form-horizontal" id="joinForm"
		action="/kanemochi/member/signup" method="post">
		<fieldset>
			<legend>歓迎します!</legend>
			<table>
				<tr>
					<td><label for="id">ID</label></td>
					<td><input type="text" id="id" placeholder="ID" autofocus /></td>
					<td><a href="/kanemochi/member/idcheck" id="idcheck"
						class="btn btn-success">IDCHECK</a></td>
				</tr>
				<tr>
					<td colspan="3"><p>
							<span id="idMsg"></span>
						</p></td>
				</tr>
				<tr>
					<td><label for="password">Password</label></td>
					<td><input type="password" id="password"
						placeholder="Password"></td>
				</tr>
				<tr>
					<td><label for="password2">Password 確認</label></td>
					<td><input type="password" id="password2"
						placeholder="Password 確認"></td>
				</tr>
				<tr>
					<td colspan="3"><p>
							<span id="pwMsg"></span>
						</p></td>
				</tr>
				<tr>
					<td><label for="name">お名前</label></td>
					<td><input type="text" id="name" placeholder="お名前"></td>
				</tr>
				<tr>
					<td colspan="3"><p>
							<span id="nameMsg"></span>
						</p></td>
				</tr>
				<tr>
					<td><label for="email">Eメール</label></td>
					<td><input type="text" id="email" placeholder="Eメール"></td>
					<td><a href="/kanemochi/member/emailcheck" class="btn btn-success">email</a></td>
				</tr>
				<tr>
					<td colspan="3"><p><span id="emailMsg"></span></p></td>
				</tr>
				<tr>
					<td><label for="phone">電話番号</label></td>
					<td><input type="tel" id="phone" placeholder="電話番号"></td>
				</tr>
				<tr>
					<td colspan="3"><p><span id="phoneMsg"></span></p></td>
				</tr>
				<tr>
					<td><label>性別</label></td>
					<td>
					<input type="radio" name="optionsRadios" id="gender"value="man"> 男性
					<input type="radio" name="optionsRadios" id="gender"value="woman"> 女性
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
	
	<a href ="/kanemochi/member/album">album으로</a><br>
	<a href ="/kanemochi/member/write">write로</a><br>
	<a href ="/kanemochi/member/myPage">myPage로</a>
</body>
</html>
