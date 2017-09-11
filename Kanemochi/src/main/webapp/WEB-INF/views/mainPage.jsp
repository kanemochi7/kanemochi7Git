<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>MAIN</title>
	<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
	<link rel="icon" href="/kanemochi/resources/image/favicon.png">
	<script src="/kanemochi/resources/js/bootstrap.js"></script>
	<!-- phaser -->
	<script type="text/javascript" src="resources/js/phaser.min.js"></script>
	<style type="text/css">
		body{
			margin: 0 auto;
			margin-top: 0%;
			text-align: center;
			background: #578CA9;
			background-image:url(/kanemochi/resources/image/bg/bg3.gif);
			background-size: 100% 100%;
			color: navy;
		}
		table {
			margin: auto;
			text-align: center;
		}
		th, td {
			padding: 10px;
		}
		label{
			text-align: center;
		}
		#logo{
			width: 30%;
		}
		#icon{
			width:20%;
		}
		.option_bar {
			background: black;
			height: 5%;
			width: 100%;
			float: left;
		}
		.category {
			background: black;
			height: 85%;
			width: 5%;
			float: left;
		}
		.game {
			background: white;
			height: 85%;
			width: 95%;
			float: right;
		}
		.budget_bar {
			padding: 15px;
			padding-left: 100px;
			background: black;
			height: 15%;
			width: 100%;
			float: left;
		}
	</style>

	<script>
	function popupOpen(){
		var popUrl = "write";	//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
		}
	</script>

</head>
<body>

	<div class="option_bar" align="right">
		<jsp:include page="includeLogin.jsp"></jsp:include>
	</div>
	
	<div class="category">
		<h3>items</h3>
		<table>
			<tr>
				<td><a href="javascript:beer();">beer</a></td>
			</tr>
			<tr>
				<td><input type="text" id="beer" value="${beer}"></td>			
			</tr>
			<tr>
				<td><a href="javascript:dessert();">dessert</a></td>			
			</tr>
			<tr>
				<td><input type="text" id="dessert" value="${dessert}"></td>
			</tr>
			<tr>
				<td><a href="javascript:burger();">burger</a></td>
			</tr>
			<tr>
				<td><input type="text" id="burger" value="${burger}"></td>
			</tr>
			<tr>
				<td><a href="javascript:popupOpen();" >write</a></td>
			</tr>
		</table>
	</div>
	
	<!-- include the main game file -->
	<div class="game" id="game">
	<script>
		var GameState = {
		
				preload: function() {
					this.load.image('bg5', 'resources/img/bg/bg5.png');
					this.load.image('beer','resources/img/beer.png');
					this.load.image('burger','resources/img/burger.png');
					this.load.image('dessert','resources/img/dessert.png');
				},
				create: function() {
					this.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
					this.background = this.game.add.sprite(0,0,'bg5');
				},
				update: function() {
				}
		
			}
		/* $('#game').width(), $('#game').height(), */
		var game = new Phaser.Game(1400, 610, Phaser.AUTO ,'game');
		
		game.state.add('GameState', GameState);
		game.state.start('GameState');
	</script>	
	
	</div>
	
	<div class="budget_bar">
	
	<div class="progress">
		<div class="progress-bar progress-bar-success" style="width: 40%"></div>
	</div>
	
	<div class="progress">
		<div class="progress-bar progress-bar-warning" style="width: 60%"></div>
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