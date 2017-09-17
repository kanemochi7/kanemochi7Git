<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>MAIN</title>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap-datepicker.min.css">

<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<script src="/kanemochi/resources/js/bootstrap-datepicker.min.js"></script>
<script src="/kanemochi/resources/js/phaser.js"></script>

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
		width: 1518px;
		height: 59px;
		margin: 0px;
		padding: 0px;
		text_align: right;
		background-color: white;
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
		width: 1518px;
		height: 59px;
		margin: 0px;
		padding: 0px;
		text-align: left;
		background-color: white;
		border: 1px solid white;
	}

/* sidebar */
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
<script>
$(function() {
	countset();
});
	
	function countset() {
		$.ajax({
			url : '/kanemochi/account/getAllCount',
			method : 'get',
			success: function(result) {
				document.getElementById("cafe").textContent = result.cafe;
				document.getElementById("beer").textContent = result.beer;
				document.getElementById("ramen").textContent = result.ramen;
				document.getElementById("cvs").textContent = result.cvs;
				document.getElementById("sushi").textContent = result.sushi;
				document.getElementById("dessert").textContent = result.dessert;
				document.getElementById("bus").textContent = result.bus;
				document.getElementById("movie").textContent = result.movie;
				document.getElementById("hospital").textContent = result.hospital;
				document.getElementById("book").textContent = result.book;
				document.getElementById("hair").textContent = result.hair;
				document.getElementById("clothes").textContent = result.clothes;
				document.getElementById("burger").textContent = result.burger;
			},
			error: function() {}
		});
	}

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

	<div id="game"></div>

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

/* click->image */
	function createItem(category) {
		var num = document.getElementById(category).textContent;
		if (num == 0) {
			
		} else {
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

</script>
</body>
</html>