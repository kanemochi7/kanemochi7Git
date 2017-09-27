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
<!-- <script src="/kanemochi/resources/js/phaser.min.js"></script> -->
<script src="/kanemochi/resources/js/phaser_2.87.js"></script>

<!-- CSS -->
<style type="text/css">
	* {
		font-family: "GoodFont";
	}
	html{
	    width:100%;	
	    height:100%;
	}
	body{
		color: navy;
		margin: 0px;
		padding: 0px;
		text-align: center;
		background-color: white;
		background-size: 100% 100%;
	}

/* div */
	#container {
		width: 1538px;
		height: 730px;
		margin: 0px;
		padding: 0px;
		/* background-color: black; */
	}
	#header {
		width: 1518px;
		height: 59px;
		margin: 0px;
		padding: 0px;
		float: left;
		text_align: right;
		/* border: 1px solid black; */
		/* background-color: white; */
		
/*1*/
/* background-color: #fffbd1;
background-image: url("data:image/svg+xml,%3Csvg width='42' height='44' viewBox='0 0 42 44' xmlns='http://www.w3.org/2000/svg'%3E%3Cg id='Page-1' fill='none' fill-rule='evenodd'%3E%3Cg id='brick-wall' fill='%2352d4da' fill-opacity='0.55'%3E%3Cpath d='M0 0h42v44H0V0zm1 1h40v20H1V1zM0 23h20v20H0V23zm22 0h20v20H22V23z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); */
/*2*/
/* background-color: #ffacab;
background-image: url("data:image/svg+xml,%3Csvg width='6' height='6' viewBox='0 0 6 6' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23a8e9ec' fill-opacity='0.73' fill-rule='evenodd'%3E%3Cpath d='M5 0h1L0 6V5zM6 5v1H5z'/%3E%3C/g%3E%3C/svg%3E"); */
/*3*/
background-color: #c9f1f3;
background-image: url("data:image/svg+xml,%3Csvg width='6' height='6' viewBox='0 0 6 6' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23ffffff' fill-opacity='0.76' fill-rule='evenodd'%3E%3Cpath d='M5 0h1L0 6V5zM6 5v1H5z'/%3E%3C/g%3E%3C/svg%3E");

	}
	#sidebar {
		width: 121px;
		height: 600px;
		margin: 0px;
		padding: 0px;
		float: left;
		/* border: 1px solid black; */
		/* background-color: white; */

/*1*/
/* background-color: #fffbd1;
background-image: url("data:image/svg+xml,%3Csvg width='42' height='44' viewBox='0 0 42 44' xmlns='http://www.w3.org/2000/svg'%3E%3Cg id='Page-1' fill='none' fill-rule='evenodd'%3E%3Cg id='brick-wall' fill='%2352d4da' fill-opacity='0.55'%3E%3Cpath d='M0 0h42v44H0V0zm1 1h40v20H1V1zM0 23h20v20H0V23zm22 0h20v20H22V23z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); */
/*2*/
/* background-color: #ffacab;
background-image: url("data:image/svg+xml,%3Csvg width='6' height='6' viewBox='0 0 6 6' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23a8e9ec' fill-opacity='0.73' fill-rule='evenodd'%3E%3Cpath d='M5 0h1L0 6V5zM6 5v1H5z'/%3E%3C/g%3E%3C/svg%3E"); */
/*3*/
background-color: #c9f1f3;
background-image: url("data:image/svg+xml,%3Csvg width='6' height='6' viewBox='0 0 6 6' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23ffffff' fill-opacity='0.76' fill-rule='evenodd'%3E%3Cpath d='M5 0h1L0 6V5zM6 5v1H5z'/%3E%3C/g%3E%3C/svg%3E");
	
	}
	#footer {
		width: 1518px;
		height: 70px;
		margin: 0px;
		padding: 5px;
		float: left;
		text-align: left;
		/* border: 1px solid black; */
		/* background-color: white; */

/*1*/
/* background-color: #fffbd1;
background-image: url("data:image/svg+xml,%3Csvg width='42' height='44' viewBox='0 0 42 44' xmlns='http://www.w3.org/2000/svg'%3E%3Cg id='Page-1' fill='none' fill-rule='evenodd'%3E%3Cg id='brick-wall' fill='%2352d4da' fill-opacity='0.55'%3E%3Cpath d='M0 0h42v44H0V0zm1 1h40v20H1V1zM0 23h20v20H0V23zm22 0h20v20H22V23z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); */
/*2*/
/* background-color: #ffacab;
background-image: url("data:image/svg+xml,%3Csvg width='6' height='6' viewBox='0 0 6 6' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23a8e9ec' fill-opacity='0.73' fill-rule='evenodd'%3E%3Cpath d='M5 0h1L0 6V5zM6 5v1H5z'/%3E%3C/g%3E%3C/svg%3E"); */
/*3*/
background-color: #c9f1f3;
background-image: url("data:image/svg+xml,%3Csvg width='6' height='6' viewBox='0 0 6 6' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23ffffff' fill-opacity='0.76' fill-rule='evenodd'%3E%3Cpath d='M5 0h1L0 6V5zM6 5v1H5z'/%3E%3C/g%3E%3C/svg%3E");

	}

	#game {
		width: 1397px;
		height: 600px;
		margin: 0px;
		padding: 0px;
		float: left;
		border: 1px solid white; 
	}
	
/* sidebar */
	button.accordion {
		width: 100%;
		color: #444;
		padding: 8px;
		border: none;
		outline: none;
		font-size: 13px;
		cursor: pointer;
		text-align: left;
		transition: 0.4s;
		background-color: white;
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
		/* content: "\2212"; */
	}
	div.panel {
		max-height: 0;
		padding: 0 2px;
		font-size: 10px;
		overflow: hidden;
		background-color: white;
		transition: max-height 0.2s ease-out;
	}

</style>
<script>
$(function() {
	countset();
});
	function countset() {
		$.ajax({
			url : '/kanemochi/record/getAllCount',
			method : 'get',
			success: function(result) {
				document.getElementById("cafe").textContent = result.cafe;
				buildingCounter[0] = result.cafe;
				document.getElementById("beer").textContent = result.beer;
				buildingCounter[1] = result.beer;
				document.getElementById("ramen").textContent = result.ramen;
				buildingCounter[2] = result.ramen;
				document.getElementById("cvs").textContent = result.cvs;
				buildingCounter[3] = result.cvs;
				document.getElementById("sushi").textContent = result.sushi;
				buildingCounter[4] = result.sushi;
				document.getElementById("dessert").textContent = result.dessert;
				buildingCounter[5] = result.dessert;
				document.getElementById("bus").textContent = result.bus;
				buildingCounter[6] = result.bus;
				document.getElementById("movie").textContent = result.movie;
				buildingCounter[7] = result.movie;
				document.getElementById("hospital").textContent = result.hospital;
				buildingCounter[8] = result.hospital;
				document.getElementById("book").textContent = result.book;
				buildingCounter[9] = result.book;
				document.getElementById("hair").textContent = result.hair;
				buildingCounter[10] = result.hair;
				document.getElementById("clothes").textContent = result.clothes;
				buildingCounter[11] = result.clothes;
				document.getElementById("burger").textContent = result.burger;
				buildingCounter[12] = result.burger;
// 				document.getElementById("elevator").textContent = result.elevator;
// 				buildingCounter[13] = result.elevator;
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
			<p><a href="javascript:createItem('bank')">銀行  </a><span class="badge" id="bank">0</span></p>
		</div>
		<button class="accordion">その他</button>
		<div class="panel">
			<p><a href="javascript:createItem('elevator')">エレベーター  </a><span class="badge" id="elevator">1</span></p>
		</div>
	</div>

	<div id ="game">
		<script src="/kanemochi/resources/js/game.js"></script>
	</div>

	<div id="footer">
		<jsp:include page="includeFooter.jsp"></jsp:include>
	</div>

</div>
<script>

/* sidebar menu */
	var acc = document.getElementsByClassName("accordion");
	var i;
	var res;
	for (i = 0; i < acc.length; i++) {
		acc[i].onclick = function() {			
		this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight){
				panel.style.maxHeight = null;
			} else {
				hideAll();
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		}
	}

	function hideAll() {
	    for (i = 0; i < acc.length; i++) {
	        $(acc[i]).attr("class", "accordion");
	        var panel = acc[i].nextElementSibling;
	        panel.style.maxHeight = null;
	    }
	}
	//상태 받아오는 로직.
// 	function getStatus(){
// 		$.ajax({
// 			url : '/kanemochi/record/getStatus',
// 			method : 'post',
// 			dataType : "json",
// 			success: function(result) {
// 				$(result).each(function(index,item){
// 					setTimeout(stateBuilding(item.img_id,item.img_x,item.img_y),200);
// 				});
// 			},
// 			error: function() {
// 				console.log("error");
// 			}
// 		});
// 	}
/* click->image */
   function createItem(category) {
		var num = document.getElementById(category).textContent;
		if (category == 'elevator') {
			createBuilding(category);
			var timer2 = setTimeout(function(){
				console.log(res);
			}, 100000000);	
			var myVar2=setInterval(function(){
	  			console.log(res);
	  			if(res == true || res == false){
	  				clearTimeout(timer2);
					clearInterval(myVar2);
					console.log(res);
					if(res){
						console.log(res);
					}
				  res = undefined;
	  			}
	  		},500);
		} else if(category != 'elevator' && num>0){
				createBuilding(category);
				var timer2 = setTimeout(function(){
					console.log(res);
				}, 100000000);	
				var myVar2=setInterval(function(){
		  			console.log(res);
		  			if(res == true || res == false){
		  				clearTimeout(timer2);
						clearInterval(myVar2);
						console.log(res);
						if(res){
							console.log(res);
							$.ajax({
								url : '/kanemochi/record/downcount',
								method : 'post',
								data : {'category':category},
								success: function(result) {
									
									document.getElementById(result.category).textContent = result.count.toString();
								},
								error: function() {}
							});
						}
					  res = undefined;
		  			}
		  		},500);
		}
	}

</script>
</body>
</html>