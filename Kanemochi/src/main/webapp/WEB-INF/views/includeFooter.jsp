<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap-datepicker.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<script src="/kanemochi/resources/js/bootstrap-datepicker.min.js"></script>

<!-- CSS -->
<style type="text/css">
	body {
		height: 100%;
		width: 100%;
	}
	.level {
		float: right;
		height: 50px;
		width: auto;
	}
/* The Modal (background) */
	.modal {
		text-align: center;
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 100px; /* Location of the box */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
/* Modal Content */
	.modal-content {
		text-align: center;
	    background-color: #aaaaaa;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #888;
	    width: 50%;
	}
	.select {
		background-color: #fefefe;
		color: #aaaaaa;
	}
/* The Close Button */
	.close {
	    color: #aaaaaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}
</style>
<script>
$(function() {
	datepicker();
});
	
	function datepicker() {
		$('#record_date').datepicker({
			format: 'yyyy/mm/dd',
			autoclose: true,
			todayHighlight: true
		});
	}

	function input() {
		var category = document.getElementById("category");
		var val;
		for(i=0; i<category.options.length; i++) {
			if(category.options[i].selected == true) {
				val = category.options[i].value;
			break;
			}
		}
		
		var param = $("#input-form").serialize();
			$.ajax({
			url : '/kanemochi/account/input',
			method : 'post',
			cache : false,
			data : param,
			success: function (result) {
				document.getElementById(result.category).textContent = result.count.toString();
				modal.style.display = "none";
			},
			error: function() {
				alert("ng")
			}
		});
	}

</script>
</head>
<body>
	<img class="pencil" id="write" src="/kanemochi/resources/image/icon/pencil.png">
	<div style="border: 1px solid black;">
		<table><tr><td></td></tr></table>
	</div>
	<span style="border: 1px solid black;">
	</span>
	
<!-- The Modal -->
	<div id="myModal" class="modal">
<!-- Modal content -->
		<div class="modal-content">
		<span class="close">&times;</span>
		<h3>支出</h3>
		<form id="input-form" name="input-form">
		<fieldset>
		<legend>[今日はいくら使いましたか？]</legend>
		<table>
			<tr>
				<td>date</td>
				<td><input type="text" id="record_date" name="record_date" placeholder="date"></td>
			</tr>
			<tr>
				<td>category</td>
				<td>
				<select class="select" id="select-category" name="select-category" onchange="itemChange()">
					<option>選択してください！</option>
					<option value="食べ物">食べ物</option>
					<option value="文化生活">文化生活</option>
					<option value="ファッション">ファッション</option>
					<option value="医慮">医慮</option>
					<option value="教育">教育</option>
					<option value="交通">交通</option>
					<option value="貯金">貯金</option>
				</select>
				<select class="select" id="category" name="category">
				</select>
				</td>
			</tr>
			<tr>
				<td>price</td>
				<td>
				<input type="text" id="record_price" name="record_price" placeholder="値">
				<select class="select" id="record_unit" name="record_unit">
					<option value="￦">￦</option>
					<option value="￥">￥</option>
					<option value="$">$</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>tag</td>
				<td><textarea rows="3" id="record_tag" name="record_tag" placeholder="#item"></textarea></td>
			</tr>
			<tr>
				<td>pay</td>
				<td>
				<input type="radio" name="record_pay" id="cash" value="cash" checked="checked">cash 
				<input type="radio" name="record_pay" id="card" value="card" >card
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="reset" value="reset">
				<input type="button" value="ok" onclick="input()">
				</td>
			</tr>
		</table>
		</fieldset>
		</form>
		</div>
	</div>

<script>
/* modal */
	var modal = document.getElementById('myModal');
	var btn = document.getElementById("write");
	var span = document.getElementsByClassName("close")[0];
	btn.onclick = function() {
		modal.style.display = "block";
	}
	span.onclick = function() {
		modal.style.display = "none";
	}
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

/* modal - category change */
function itemChange(){
	var food = ["バーがー","ラーメン","すし", "カフェ", "デザート", "ビール", "コンビニ"];
	var culture = ["映画"];
	var fashion = ["服","美容室"];
	var medical = ["病院"];
	var education = ["本"];
	var transportation = ["バス"];
	 
	var selectItem = $("#select-category").val();
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
	
	$("#category").empty();
	for(var count = 0; count < changeItem.length; count++){
		var option = "<option value='"+changeItem[count]+"'>"+changeItem[count]+"</option>";
		$("#category").append(option);
	}
}

</script>
</body>
</html>