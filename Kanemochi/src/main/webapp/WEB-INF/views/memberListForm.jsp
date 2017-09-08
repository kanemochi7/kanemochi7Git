<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberLIST</title>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<script type="text/javascript">
$(function() {
	init();
});

function init() { 
	$.ajax({
		url:"/kanemochi/member/memberList",
		type:"POST",
		success: function(result) {
			$(".table table-striped table-hover").empty();
			var row = '<tr><th>id</th><th>お名前</th><th>性別</th><th>メール</th><th>電話番号</th><th>전화번호</th><th>승인여부</th></tr>';
			$(".table table-striped table-hover").append(row);
			$(result).each(function (index,item) {
				var addrow  ='<tr>'
					+'<td>'+item.userid+'</td>';
				addrow += '<td>'+item.name+'</td>';
				addrow += '<td>'+item.gender+'</td>';
				addrow += '<td>'+item.email+'</td>';
				addrow += '<td>'+item.phone+'</td>';
				$(".table table-striped table-hover").append(addrow);
			});
		}
	})
}


function home() {
	location.href = "/kanemochi/";
}
</script>
</head>
<body>
<div id="wrapper">
	<h1>[　 メンバーリスト　]</h1>
	
	<table class="table table-striped table-hover">
	</table>
	<input type="button" id="home" value="첫 화면 으로" onclick="home()">
</div>

</body>
</html>