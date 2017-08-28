<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body{
	margin: 50px;
	text-align: center;
}

table{
	margin: auto;
	text-align: center;
}
th, td {
	padding: 10px;
}


</style>
<script type="text/javascript">
/* function check() {		
 	var id = document.getElementById("id").value;
	var password = document.getElementById("password").value;
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(id ==""){
		alert("IDを入力してください");
	}else if(id.length<5 || id.length>12 ){
		alert("IDは５字以上12字以下で入力してください");
	}else if(password ==""){
		alert("パスワードを入力してください");
	}else if(password.length<7 || password.length>12){
		alert("パスワードは7字以上12字以下で入力してください");
	}else if(name ==""){
		alert("お名前を入力してください");
	}else if(email ==""){
		alert("Eメールを入力してください");
	}else if(exptext.test(email)==false){
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
		alert("このEメールは形式は正しくありません");
		document.addjoin.email.focus();
		return false;
	}
	
	 else if(email!=""){
		if(exptext.test(email)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("このEメールは形式は正しくありません");
			document.addjoin.email.focus();
			return false;
		}
	} 
	
}  */

// id 5자리 이상 될때까지 경고 메세지 출력
	function myFunction() {
	    var id = document.getElementById("id").value;
	    if(id.length == 0){
		    document.getElementById("demo").innerHTML = "IDを入力してください";
	    	//$("title").attr("id를 입력하세요");
	    }else if(id.length<5 || id.length>12 ){
	    	document.getElementById("demo").innerHTML = "IDは５字以上12字以下で入力してください";
	    }else if(id.length>=5 && id.length<=12 ){
	    	document.getElementById("demo").innerHTML = "";
	    }
	}  

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

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
<form class="form-horizontal">
  <fieldset>
    <legend>歓迎します!</legend>
	<table>
		<tr>
			<td><label for="id" >ID</label></td>
			<td><input type="text" id="id" placeholder="ID" onkeyup="myFunction()" data-toggle="tooltip" title="툴팁 테스트!"/></td>
			<td><a href="/kanemochi/member/idcheck" class="btn btn-success">IDCHECK</a></td>
		</tr>
		<tr>
			<td colspan="3"><p><span id="demo"></span></p></td>
		</tr>
		<tr>
			<td><label for="password">Password</label></td>
       		<td><input type="password" id="password" placeholder="Password"></td>
		</tr>
		<tr>
			<td><label for="name">お名前</label></td>
       		<td><input type="text" id="name" placeholder="お名前"></td>
		</tr>
		<tr>
			<td><label for="email">Eメール</label></td>
       		<td><input type="text" id="email" placeholder="Eメール"></td>
		</tr>
		<tr>
			<td><label for="phone" >電話番号</label></td>
       		<td><input type="tel" id="phone" placeholder="電話番号"></td>
		</tr>
		<tr>
			<td><label>性別</label></td>
			<td> 
				<input type="radio" name="optionsRadios" id="gender" value="man">
          		男性
          	</td>
			<td>
				<input type="radio" name="optionsRadios" id="gender" value="woman">
         		女性
			</td>
		</tr>
	</table>    
  </fieldset>
  <button type="button" class="btn btn-primary" onclick="check()">確認</button>
			
       			<button type="reset" class="btn btn-info">キャンセル</button>
       	
</form>
</body>
</html>
