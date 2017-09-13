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
<!-- favicon -->
	<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<!-- phaser -->
	<script type="text/javascript" src="/kanemochi/resources/js/phaser.js"></script>
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
			width: 101px;
			height: 600px;
			margin: 0px;
			padding: 0px;
			float: left;
			border: 1px solid white;
		}
		#game {
			width: 1417px;
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
		button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
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
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
		
	</style>
	<script>
	$(document).ready(function() {
		// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu>a").click(function() {
			var submenu = $(this).next("ul");
			if(submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});

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
</script>
</head>
<body>
<div id="container">
	<div id="header">
	<jsp:include page="includeHeader.jsp"></jsp:include>
	</div>
	
	<div id="sidebar">
	<button class="accordion">Section 1</button>
<div class="panel">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 2</button>
<div class="panel">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 3</button>
<div class="panel">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
	</div>

	<div id="game">
	<script>
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
	</div>
	
	<div id="footer">
	<jsp:include page="includeFooter.jsp"></jsp:include>
	</div>
	
</div>

<script>
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