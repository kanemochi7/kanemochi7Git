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
	#p_footer {
		text-align: center;
		color: white;
	}
	.icon_footer {
		float: left;
		height: 50px;
		width: auto;
		margin: 5px;
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
	setbudget();
});
	function datepicker() {
		$('#record_date').datepicker({
			format: 'yyyy/mm/dd',
			autoclose: true,
			todayHighlight: true
		});
	}
	
	function setbudget() {
		$.ajax({
		url : '/kanemochi/account/setbudget',
		method : 'get',
		cache : false,
		success: function (result) {
		    document.getElementById("month_result").innerHTML = result.;
		    document.getElementById("weekly_result").innerHTML = result.;
		    document.getElementById("daily_result").innerHTML = result.;
			},
		error: function() {
			alert("ng")
			}
		});
	}
	
	function input() {
		/* 유효성 검사 해야 함 */
			var param = $("#input-form").serialize();
			$.ajax({
			url : '/kanemochi/account/input',
			method : 'post',
			cache : false,
			data : param,
			success: function (result) {
				document.getElementById(result.category).textContent = result.count.toString();
				modal.style.display = "none";
				document.getElementById("input-form").reset();
				},
			error: function() {
				alert("ng")
				}
			});
	}

	function cal() {
		var budget_Monthly = document.getElementById("budget_month").value;
	    var budget_Weekly = budget_Monthly/4;
	    var budget_Daily = budget_Monthly/30;
	    document.getElementById("month_result").innerHTML = numberWithCommas(parseInt(budget_Monthly));
	    document.getElementById("weekly_result").innerHTML = numberWithCommas(parseInt(budget_Weekly));
	    document.getElementById("daily_result").innerHTML = numberWithCommas(parseInt(budget_Daily));
	}
	
	function numberWithCommas(x) { return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); }

	function savebudget() {
		var month = document.getElementById("month_result").innerHTML;
		var week = document.getElementById("weekly_result").innerHTML;
		var day =  document.getElementById("daily_result").innerHTML;
		
		$.ajax({
		url : '/kanemochi/account/savebudget',
		method : 'post',
		cache : false,
		data : {"month":month,"week":week, "day":day},
		success: function (result) {
			setbudget();
			document.getElementById("budget_month").hide();
			alert("ok")
			},
		error: function() {
			alert("ng")
			}
		});
		
	}
</script>
</head>
<body>
<img class="icon_footer" id="write" src="/kanemochi/resources/image/icon/write.png">
<img class="icon_footer" id="budget" src="/kanemochi/resources/image/icon/moneyPack.png">
<img class="icon_footer" id="statistics" src="/kanemochi/resources/image/icon/pieGraph.png">

<!-- Modal_write -->
<div id="modal_write" class="modal">
	<div class="modal-content">
	<span class="close" id="close_modal_write">&times;</span>
	<h3>支出</h3>
	<h4>[今日はいくら使いましたか？]</h4>
	<form id="input-form" name="input-form">
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
			<td>
			<input type="reset" value="reset">
			<input type="button" value="ok" onclick="input()">
			</td>
		</tr>
	</table>
	</form>
	</div>
</div>

<!-- Modal_budget -->
<div id="modal_budget" class="modal">
	<div class="modal-content">
		<span class="close" id="close_modal_budget">&times;</span>
		<h3>Budget</h3>
		<p id="p_footer">
		[<span id="today_year_budget"></span>年
		<span id="today_month_budget"></span>月]
		</p>
		<form id="budget_form" name="budget_form">
		一ヵ月の予算 : <input type="text" id="budget_month" placeholder="予算" onkeyup="cal()">￦<br>
<!-- 	<input type="checkbox" name="plan" value="month">monthly
		<input type="checkbox" name="plan" value="weekly">weekly
		<input type="checkbox" name="plan" value="daily">daily -->		
		monthly budget : <span id="month_result"></span>￦<br>
		weekly budget : <span id="weekly_result"></span>￦<br>
		daily_budget : <span id="daily_result"></span>￦<br>
		</form>
		<input type="button" value="save this plan" onclick="savebudget()">
		
	</div>
</div>

<!-- Modal_statistic -->
<div id="modal_statistic" class="modal">
	<div class="modal-content">
		<span class="close" id="close_modal_statistic">&times;</span>
		<h3>通計</h3>
		<div class="progress">
			<div class="progress-bar progress-bar-info" style="width: 20%"></div>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-success" style="width: 40%"></div>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-warning" style="width: 60%"></div>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-danger" style="width: 80%"></div>
		</div>
	</div>
</div>
<script>
/* modal_statistic */
	var modal_statistic = document.getElementById('modal_statistic');
	var btn_s = document.getElementById("statistics");
	var span_s = document.getElementById("close_modal_statistic");
	btn_s.onclick = function() {
		modal_statistic.style.display = "block";
		span_s.onclick = function() {
			modal_statistic.style.display = "none";
		}
		window.onclick = function(event_s) {
			if (event_s.target == modal_statistic) {
				modal_statistic.style.display = "none";
			}
		}
	}
/* modal_budget */
	var modal_budget = document.getElementById('modal_budget');
	var btn_b = document.getElementById("budget");
	var span_b = document.getElementById("close_modal_budget");
	btn_b.onclick = function() {
		modal_budget.style.display = "block";
		span_b.onclick = function() {
			modal_budget.style.display = "none";
		}
		window.onclick = function(event_b) {
			if (event_b.target == modal_budget) {
				modal_budget.style.display = "none";
			}
		}
	}
/* modal_write */
	var modal_write = document.getElementById('modal_write');
	var btn_w = document.getElementById("write");
	var span_w = document.getElementsByClassName("close")[0];
	btn_w.onclick = function() {
		modal_write.style.display = "block";
		span_w.onclick = function() {
			modal_write.style.display = "none";
		}
		window.onclick = function(event_w) {
			if (event.target == modal_write) {
				modal_write.style.display = "none";
			}
		}
	}
/* modal_write - category change */
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