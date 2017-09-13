<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>MAIN</title>
<!-- jquery -->
	<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<!-- bootstrap -->
	<script src="/kanemochi/resources/js/bootstrap.js"></script>
	<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<!-- phaser -->
	<script type="text/javascript" src="/kanemochi/resources/js/phaser.js"></script>
<!-- favicon -->
	<link rel="icon" href="/kanemochi/resources/image/favicon.png">
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
	</style>
</head>
<body>
<div id="container">
	<div id="header">
		<jsp:include page="includeHeader.jsp"></jsp:include>
	</div>
	
	<div id="sidebar">
		<button class="accordion">食べ物</button>
		<div class="panel">
			<p>バーがー  <span class="badge">0</span></p>
			<p>ラーメン  <span class="badge">0</span></p>
			<p>すし  <span class="badge">0</span></p>
			<p>カフェ  <span class="badge">0</span></p>
			<p>デザート  <span class="badge">0</span></p>
			<p>ビール  <span class="badge">0</span></p>
			<p>コンビニ  <span class="badge">0</span></p>
		</div>
		<button class="accordion">文化生活</button>
		<div class="panel">
			<p>映画  <span class="badge">0</span></p>
		</div>
		<button class="accordion">ファッション</button>
		<div class="panel">
			<p>服  <span class="badge">0</span></p>
			<p>美容室  <span class="badge">0</span></p>
		</div>
		<button class="accordion">医慮</button>
		<div class="panel">
			<p>病院  <span class="badge">0</span></p>
			<p>薬局  <span class="badge">0</span></p>
		</div>
		<button class="accordion">教育</button>
		<div class="panel">
			<p>学院  <span class="badge">0</span></p>
			<p>本  <span class="badge">0</span></p>
		</div>
		<button class="accordion">交通</button>
		<div class="panel">
			<p>バス  <span class="badge">0</span></p>
			<p>地下鉄  <span class="badge">0</span></p>
		</div>
		<button class="accordion">貯金</button>
		<div class="panel">
			<p>銀行  <span class="badge">0</span></p>
		</div>
		<button class="accordion">その他</button>
		<div class="panel">
			<p>エレベーター  <span class="badge">0</span></p>
		</div>
	</div>

	<div id="game">
	</div>
	
	<div id="footer">
		<jsp:include page="includeFooter.jsp"></jsp:include>
	</div>
	
</div>

<script>
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
	
	

	function input() {
		var param = $("#recordForm").serialize();
		$.ajax({
			url : 'input',
			method : 'post',
			cache : false,
			data : param,
			success: function (result) {
				if (result.category == "beer") {
					document.getElementById("beer").value = result.count;					
				} else if (result.category == "dessert") {
					document.getElementById("dessert").value = result.count;					
				} else if (result.category == "burger") {
					document.getElementById("burger").value = result.count;					
				}
			},
			error: function() {
			}
		});
	}
	
	function beer() {
		$.ajax({
			url : 'discount',
			method : 'post',
			data : 'category=beer',
			success: function(result) {
				GameState.game.add.image(0,0,'beer');
				document.getElementById("beer").value = result;
			},
			error: function() {}
		});
	} 
	
	function dessert() {
		$.ajax({
			url : 'discount',
			method : 'post',
			data : 'category=dessert',
			success: function(result) {
				GameState.game.add.image(0,0,'dessert');
				document.getElementById("dessert").value = result;
			},
			error: function() {}
		});	
	}
	
	function burger() {
		$.ajax({
			url : 'discount',
			method : 'post',
			data : 'category=burger',
			success: function(result) {
				GameState.game.add.image(0,0,'burger');
				document.getElementById("burger").value = result;
			},
			error: function() {}
		});	
	}
</script>
</body>
</html>