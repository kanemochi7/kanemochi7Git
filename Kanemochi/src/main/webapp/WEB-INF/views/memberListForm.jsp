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
<style type="text/css">
	body{
		text-align: center;
	}
	
	h3{
		padding-bottom: 50px;
	}
	
	table{
		text-align: center;
	}
	
	.btnDelete{
		color: black;
		background-color: white;
	}
	
	#logo{
		width: 15%;
	}

</style>
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
			var row = '<tr><th>id</th><th>お名前</th><th>メール</th><th>性別</th><th>電話番号</th><th>会員削除</th></tr>';
			var arr = ["info","success","danger","warning","acive"];
			var i = 0;
			var addrow = "<tbody>";
			$("#listTable").append(row);
			$(result).each(function (index,item) {
				
					addrow += "<tr class='"+arr[i]+"''>";
					addrow += '<td>'+item.user_id+'</td>';
					addrow += '<td>'+item.user_name+'</td>';
					addrow += '<td>'+item.user_email+'</td>';
					addrow += '<td>'+item.user_gender+'</td>';
					addrow += '<td>'+item.user_phone+'</td>';
					addrow += '<td><a class="btnDelete" href="/kanemochi/member/deleteMember?user_id='+item.user_id+'">削除</a></td></tr>'
					if(Object.keys(result).length==index+1){
						addrow += "</tbody>";
						$("#listTable").append(addrow);
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
<img src="/kanemochi/resources/image/logo-white.gif" class="rounded float-left" alt="left-img" id="logo">
<div id="wrapper">
	<h3>[　 メンバーリスト　]</h3>	
	<table id="listTable" class="table table-striped table-hover ">
	</table>
	<input type="button" id="home" value="첫 화면 으로" onclick="home()">
</div>

</body>
</html>