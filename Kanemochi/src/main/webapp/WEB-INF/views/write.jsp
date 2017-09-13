<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Write</title>
<!-- jquery -->
	<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<!-- jquery-ui -->
	<script src="/kanemochi/resources/js/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="/kanemochi/resources/css/jquery-ui.css">
<!-- bootstrap -->
	<script src="/kanemochi/resources/js/bootstrap.js"></script>
	<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<!-- phaser -->
	<script type="text/javascript" src="/kanemochi/resources/js/phaser.js"></script>
<!-- favicon -->
	<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<!-- CSS -->
	<style type="text/css">
		body {
			height: 100%;
			width: 100%;
			margin: 50px;
			text-align: center;
		}
		table {
			height: 500px;
			width: 500px;
			text-align: left;
		}
	</style>
	
</head>
<body>
	<h1>支出</h1>
	<form class="form-horizontal">
	<fieldset>
	<legend>[今日はいくら使いましたか？]</legend>
	
	<table>
		<tr>
			<td>date</td>
			<td><input type="text" id="datepicker" placeholder="date"></td>
		</tr>
		<tr>
			<td>category</td>
			<td><select id="select1" onchange="itemChange()">
				<option>食べ物</option>
				<option>文化生活</option>
				<option>ファッション</option>
				<option>医慮</option>
				<option>教育</option>
				<option>交通</option>
				<option>貯金</option>
			</select>
			<select id="select2">
			</select></td>
		</tr>
		<tr>
			<td>price</td>
			<td>
			<input type="text" id="price" placeholder="値">
			<select id="select-price">
				<option>円</option>
				<option>￦</option>
				<option>$</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>tag</td>
			<td><textarea rows="3" id="textArea-tag" placeholder="#item"></textarea></td>
		</tr>
		<tr>
			<td>pay</td>
			<td>
			<input type="radio" name="cash" id="cash" value="cash" checked="checked">cash 
			<input type="radio" name="card" id="card" value="card" >card
			</td>
		</tr>
		<tr>
			<td></td>
			<td><button type="reset">reset</button><button type="submit">ok</button></td>
		</tr>
	</table>
	</fieldset>
	</form>
<script>
		$(function () {
		    $('#datepicker').datepicker();
		});
		
		function itemChange(){
			var food = ["バーがー","ラーメン","すし", "カフェ", "デザート", "ビール", "コンビニ"];
			var culture = ["映画"];
			var fashion = ["服","美容室"];
			var medical = ["病院","薬局"];
			var education = ["学院","本"];
			var transportation = ["バス","地下鉄"];
			var save = ["銀行"];
			 
			var selectItem = $("#select1").val();
			var changeItem;
			
			if(selectItem == "食べ物"){
				changeItem = food;
			}
			else if(selectItem == "文化生活"){
				changeItem = culture;
			}
			else if(selectItem == "ファッション"){
				changeItem =  fashion;
			}
			else if(selectItem == "医慮"){
				changeItem =  medical;
			}
			else if(selectItem == "教育"){
				changeItem = education;
			}
			else if(selectItem == "交通"){
				changeItem = transportation;
			}
			else if(selectItem == "貯金"){
				changeItem = save;
			}

			$('#select2').empty();
			 
			for(var count = 0; count < changeItem.size(); count++){                
				var option = $("<option>"+changeItem[count]+"</option>");
				$('#select2').append(option);
			}
		}
	</script>
</body>
</html>