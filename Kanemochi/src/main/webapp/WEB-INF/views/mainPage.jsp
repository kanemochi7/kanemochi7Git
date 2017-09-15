<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>MAIN</title>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap-datepicker.min.css">
<link rel="icon" href="/kanemochi/resources/image/favicon.png">

<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<script src="/kanemochi/resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/phaser.js"></script>

<!-- CSS -->
<style type="text/css">
	html{
	    width:100%;
	    height:100%;
	}
	body{
		margin: 0px;
		padding: 0px;
		text-align: center;
		background-color: white;
		background-size: 100% 100%;
		color: navy;
	}
/* div */
	#container {
		background-color: white;
		width: 1538px;
		height: 730px;
		margin: 0px;
		padding: 0px;
	}
	#header {
		background-color: white;
		width: 1518px;
		height: 59px;
		margin: 0px;
		padding: 0px;
		border: 1px solid white;
	}
	#sidebar {
		background-color: white;
		width: 121px;
		height: 600px;
		margin: 0px;
		padding: 0px;
		float: left;
		border: 1px solid white;
	}
	#game {
		width: 1397px;
		height: 600px;
		margin: 0px;
		padding: 0px;
		float: left;
		border: 1px solid white;
	}
	#footer {
		background-color: white;
		width: 1518px;
		height: 60px;
		margin: 0px;
		padding: 10px;
		float: left;
		border: 1px solid white;
		text-align: left;
	}
/* table */
	table {
		text-align: left;
	}
/* accordian - sidebar menu */
	button.accordion {
		background-color: white;
		color: #444;
		cursor: pointer;
		padding: 8px;
		width: 100%;
		border: none;
		text-align: left;
		outline: none;
		font-size: 13px;
		transition: 0.4s;
	}
	button.accordion.active, button.accordion:hover {
		background-color: #ddd;
	}
	button.accordion:after {
		content: '\002B';
		color: #777;
		font-weight: bold;
		float: right;
		margin-left: 5px;
	}
	button.accordion.active:after {
		content: "\2212";
	}
	div.panel {
		padding: 0 2px;
		background-color: white;
		max-height: 0;
		overflow: hidden;
		font-size: 10px;
		transition: max-height 0.2s ease-out;
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
	$('#record_date').datepicker({
		format: 'yyyy/mm/dd',
	    autoclose: true,
	    todayHighlight: true
	});
});
</script>
</head>
<body>
<div id="container">

	<div id="header">
	<jsp:include page="includeHeader.jsp"></jsp:include>
	</div>

	<div id="sidebar">
		<button class="accordion">食べ物</button>
		<div class="panel">
			<p><a href="javascript:createItem('burger')">バーがー  </a><span class="badge" id="burger">0</span></p>
			<p><a href="javascript:createItem('ramen')">ラーメン  </a><span class="badge" id="ramen">0</span></p>
			<p><a href="javascript:createItem('sushi')">すし  </a><span class="badge" id="sushi">0</span></p>
			<p><a href="javascript:createItem('cafe')">カフェ  </a><span class="badge" id="cafe">0</span></p>
			<p><a href="javascript:createItem('dessert')">デザート  </a><span class="badge" id="dessert">0</span></p>
			<p><a href="javascript:createItem('beer')">ビール  </a><span class="badge" id="beer">0</span></p>
			<p><a href="javascript:createItem('cvs')">コンビニ  </a><span class="badge" id="cvs">0</span></p>
		</div>
		<button class="accordion">文化生活</button>
		<div class="panel">
			<p><a href="javascript:createItem('movie')">映画  </a><span class="badge" id="movie">0</span></p>
		</div>
		<button class="accordion">ファッション</button>
		<div class="panel">
			<p><a href="javascript:createItem('clothes')">服  </a><span class="badge" id="clothes">0</span></p>
			<p><a href="javascript:createItem('hair')">美容室  </a><span class="badge" id="hair">0</span></p>
		</div>
		<button class="accordion">医慮</button>
		<div class="panel">
			<p><a href="javascript:createItem('hospital')">病院  </a><span class="badge" id="hospital">0</span></p>
			<!-- <p>薬局  <span class="badge" id="hospital">0</span></p> -->
		</div>
		<button class="accordion">教育</button>
		<div class="panel">
			<!-- <p>学院  <span class="badge" id="book">0</span></p> -->
			<p><a href="javascript:createItem('book')">本  </a><span class="badge" id="book">0</span></p>
		</div>
		<button class="accordion">交通</button>
		<div class="panel">
			<p><a href="javascript:createItem('bus')">バス  </a><span class="badge" id="bus">0</span></p>
			<!-- <p>地下鉄  <span class="badge" id="bus">0</span></p> -->
		</div>
		<button class="accordion">貯金</button>
		<div class="panel">
			<p><a href="javascript:createItem('bank')">銀行  </a></p>
		</div>
		<button class="accordion">その他</button>
		<div class="panel">
			<p><a href="javascript:createItem('elevator')">エレベーター  </a></p>
		</div>
	</div>

	<div id="game">
	</div>
	
	<div id="footer">
	<img class="pencil" id="write" src="/kanemochi/resources/image/icon/pencil.png">
	</div>

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
</div>

<script>
/* account */
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

/* sidebar menu */
	var acc = document.getElementsByClassName("accordion");
	var i;	
	for (i = 0; i < acc.length; i++) {
		acc[i].onclick = function() {
		this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight){
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		}
	}
	
/* phaser */
	var GameState = {
			preload: function() {
				this.load.image('bg', '/kanemochi/resources/image/bg/bg.jpg');
				this.load.image('beer','/kanemochi/resources/image/beer.png');
				this.load.image('burger','/kanemochi/resources/image/burger.png');
				this.load.image('dessert','/kanemochi/resources/image/dessert.png');
				
			},
			create: function() {
				this.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
				this.background = this.game.add.sprite(0,0,'bg');
			},
			update: function() {
			}
		}
	var game = new Phaser.Game($("#game").width(), $("#game").height(), Phaser.AUTO ,"game");
	game.state.add('GameState', GameState);
	game.state.start('GameState');

/* click->image */
	function createItem(category) {
		$.ajax({
			url : '/kanemochi/account/downcount',
			method : 'post',
			data : {'category':category},
			success: function(result) {
				GameState.game.add.image(0,0,category);
				document.getElementById(result.category).textContent = result.count.toString();
			},
			error: function() {}
		});
	} 
	
</script>
</body>
</html>