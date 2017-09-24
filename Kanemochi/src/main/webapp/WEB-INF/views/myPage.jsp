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
<script type="text/javascript">
$(function () {	
	var result = "${empty updateResult}";
	if(result!="true"){
		if("${updateResult}"== "true"){
			alert("update success");
		}else if("${updateResult}"=="false"){
			alert("update failed");
		}
	}

	$("#btnUpdate").on('click',function(){
		var id = $('#id').val()
		var pw = $('#pw').val();
		var name = $('#name').val();
		var email = $('#email').val();
		var phone = $('#phone').val();
		var gender = "${vo.user_gender}"
		if(id=="" || pw=="" || name=="" || email=="" || phone=="" || gender=="" ){
			alert("공백은 허용되지 않습니다.");
			$("#id").focus();
			return false;
		}
		$("#updateForm").submit();
	})
	
	$("#btnDelete").on('click',function(){
		var id = $('#id').val();
		location.href = "/kanemochi/member/deleteMember?user_id="+id;
	})
	
})
</script>
<style type="text/css">
body {
	margin: 50px;
	text-align: center;
	background-color:#fff5c3;
	background-image:url(/kanemochi/resources/image/bg/pinkSky2.png);
	background-repeat: repeat-x;
	color: black;
}

table {
	margin: auto;
	text-align: center;
}

th, td {
	padding: 10px;
}
</style>
</head>
<body>
<h1>[ My Page ]</h1>
<form action="/kanemochi/member/updateMember" id="updateForm" method="POST">
	<table>
			<tr>
				<td><label for="id">ID</label></td>
				<td><input type="text" class="form-control input-sm" id="id" name="user_id" placeholder="ID"  value="${vo.user_id}" readonly="readonly"/></td>
				<td rowspan ="6">
					<img src="${vo.img_url}" id="character" class="rounded float-center" alt="avatar-img"><br><br>
					<img src="http://via.placeholder.com/150x50" class="rounded float-center" alt="level-img">
				</td>
			</tr>
			<tr>
				<td><label for="password">Password</label></td>
				<td><input type="password" id="pw" name="user_pw" class="form-control input-sm" value="${vo.user_pw}"></td>
			</tr>
			<tr>
				<td><label for="name">お名前</label></td>
				<td><input type="text" class="form-control input-sm" id="name" name="user_name" value="${vo.user_name}"></td>
			</tr>
			
			<tr>
				<td><label for="email">Eメール</label></td>
				<td><input type="text" class="form-control input-sm" id="email"  name="user_email" value="${vo.user_email}"></td>
			</tr>
			
			<tr>
				<td><label for="phone">電話番号</label></td>
				<td>
					<input type="tel" class="form-control input-sm" id="phone" name="user_phone" value="${vo.user_phone}">
				</td>
			</tr>		
			<tr>
				<td>
					<label>性別</label>
				</td>
				<td>${vo.user_gender}</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="/kanemochi/member/loginForm" class ="btn btn-success">back</a>
					<button id="btnUpdate" class= "btn btn-success">Update</button>
				</td>
			</tr>
	</table>
	<input type="hidden" name="user_gender" value="${vo.user_gender}">
</form>
<button id="btnDelete" class= "btn btn-warning">Delete</button>
</body>
</html>