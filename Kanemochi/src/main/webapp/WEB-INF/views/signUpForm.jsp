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
function check() {		
	alert(document.getElementById("email").value);
	var email = document.getElementById("email").value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(email!=""){
		if(exptext.test(email)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("이 메일형식이 올바르지 않습니다.");
			document.addjoin.email.focus();
			return false;
		}
	}
}
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
			<td><input type="text" id="id" placeholder="ID"></td>
			<td><a href="/kanemochi/member/idcheck" class="btn btn-success">IDCHECK</a></td>
		</tr>
		<tr>
			<td><label for="password">Password</label></td>
       		<td><input type="password" id="password" placeholder="Password"></td>
		</tr>
		<tr>
			<td><label for="email">メール</label></td>
       		<td><input type="text" id="email" placeholder="メール"></td>
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
			
       			<button type="reset" class="btn btn-default">キャンセル</button>
       	
</form>
</body>
</html>
