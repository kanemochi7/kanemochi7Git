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
</head>
<body>
<h1>My Page</h1>
<table>
		<tr>
			<td><label for="id">ID</label></td>
			<td><input type="text" class="form-control" id="id" placeholder="ID" autofocus  /></td>
			<td rowspan ="6">
				<img src="http://via.placeholder.com/150x200" class="rounded float-center" alt="avatar-img"><br><br>
				<img src="http://via.placeholder.com/150x50" class="rounded float-center" alt="level-img">
			</td>
		</tr>
		<tr>
			<td><label for="password">Password</label></td>
			<td><input type="password" id="password" class="form-control" placeholder="Password"></td>
		</tr>
		<tr>
			<td><label for="name">お名前</label></td>
			<td><input type="text" class="form-control" id="name" placeholder="お名前"></td>
		</tr>
		
		<tr>
			<td><label for="email">Eメール</label></td>
			<td><input type="text" class="form-control" id="email" placeholder="Eメール"></td>
		</tr>
		
		<tr>
			<td><label for="phone">電話番号</label></td>
			<td><input type="tel" class="form-control" id="phone" placeholder="電話番号"></td>
		</tr>
	
		<tr>
			<td><label>性別</label></td>
			<td> 女性 </td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="#" class ="btn btn-success">back</a>
				<a href="#" class ="btn btn-success">ok</a>
			</td>
		</tr>
</table>
</body>
</html>