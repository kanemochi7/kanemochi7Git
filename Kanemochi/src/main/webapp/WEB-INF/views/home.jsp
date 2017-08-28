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
	margin: 0 auto;
	text-align: center;
}

label{
	text-align: center;
}
 
</style>
</head>
<body>
<h1>KANEMOCHI</h1>
<form class="form-horizontal">
  <fieldset>
    <legend style="font-size:50px, text-align:center">ログイン</legend>
    <div class="form-group">
      <label for="id" class="col-lg-2 control-label">ID</label>
      <input type="text" id="id" placeholder="ID">
    </div>
    <div class="form-group">
      <label for="password" class="col-lg-2 control-label">Password</label>
      <input type="password" id="pwd" placeholder="Password">      
    </div>
  </fieldset>
  <input type="button"  class="btn btn-primary" value="ログイン">
  <input type="reset" class="btn btn-warning" value="キャンセル">
</form>
<a href="/kanemochi/member/signUpForm" class="btn btn-info">KANEMOCHI 加入</a><br><br>
<a href="/kanemochi/member/findIdPwdForm" class="btn btn-success">id/pwdを探す</a>
</body>
</html>
