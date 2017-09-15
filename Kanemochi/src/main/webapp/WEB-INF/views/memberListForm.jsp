<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberLIST</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
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
			var row = '<tr><th>id</th><th>お名前</th><th>性別</th><th>メール</th><th>電話番号</th></tr>';
			var arr = ["info","success","danger","warning","acive"];
			var i = 0;
			var addrow = "<tbody>";
			$("#listTable").append(row);
			$(result).each(function (index,item) {
				alert("hi")
				console.log(index);
					/* if(i==5){
						i=0;
					} */
					addrow += "<tr class='"+arr[i]+"''>";
					addrow += '<td>'+item.user_id+'</td>';
					addrow += '<td>'+item.user_name+'</td>';
					addrow += '<td>'+item.user_email+'</td>';
					addrow += '<td>'+item.user_gender+'</td>';
					addrow += '<td>'+item.user_phone+'</td></tr>';
					if(Object.keys(result).length==index+1){
						addrow += "</tbody>";
						$("#listTable").append(addrow);
						alert("bye");
					}
				i++;
				if(i==4){
					i=0;
				}
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
	
	<table id="listTable" class="table table-striped table-hover ">
	</table>
	<input type="button" id="home" value="첫 화면 으로" onclick="home()">
</div>

</body>
</html>