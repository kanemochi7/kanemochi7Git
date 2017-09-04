<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FindID/PWD</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
</head>
<body>
<c:if test="${menu='findpwd'}">
<form action="/kanemochi/member/findpwd">
	<label>ID</label><input type="text" id="id">
	<label>名前</label><input type="text" id="name">
	<label>メール</label><input type="email" id="email">
	<input type="button" class="btn btn-info">
</form>
</c:if>
<c:if test="${menu='findinfo'}">
<form action="/kanemochi/member/findinfo">
	<h1></h1>
	<label>名前</label><input type="text" id="name">
	<label>メール</label><input type="email" id="email">
	<input type="button" class="btn btn-info">
</form>
</c:if>
</body>
</html>