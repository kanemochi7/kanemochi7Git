<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${loginID!=null}">
	<p>
		${loginName} 様　Welcome!
		<a href="/kanemochi/member/logout" class="btn btn-danger"></a>
		<a href="/kanemochi/member/mypageForm" class="btn btn-info">マイページ</a>
	</p>
</c:if>
</body>
</html>