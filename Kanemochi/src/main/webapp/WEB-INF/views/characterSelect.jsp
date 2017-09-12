<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>characterSelect</title>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body {
	margin: 50px;
	text-align: center;
	background: #CFB095;
	font-size: large;
	background-color: #fff5c3;
	background-image: url(/kanemochi/resources/image/bg/pinkSky2.png);
	background-repeat: repeat-x;
	color: black;
}

h1 {
	font-weight: bolder;
	margin: 5%;
}

table {
	margin: auto;
	text-align: center;
	font-size: x-large;
}

th, td {
	padding: 10px;
}

input[type="text"] {
	background: transparent;
	border: none;
}
/* .chrOne:hover{
	cursor:pointer; 
    background:url('/kanemochi/resources/image/character/chineseGirl2.gif');
} */
</style>

<script>
	$(function() {
		var joinid = $("#user_id").val();
		var url = "";
		var frontURL = "/kanemochi/resources/image/character/";
		var chrName = "";
		var pngName = "";
		var gifName = "";
		var clicks = true;
		
		//alert(joinid)
		$("#joinBtn").on('click', join);

		function join() {
			//var which = document.getElementsByClassName("chr")[0].id;

			if (url != "") {
				$('#joinform').submit();
			} else {
				alert("plz select your character!");
				return false;
			}
		}
		
 		/*  $('.chr').click(function(event) {
		     if(this.id == "chrOne") {
		          pngName = "chineseGirl.png";  gifName= "chineseGirl2.gif"; chrEvent("#chrOne");
		     }else if(this.id == "chrTwo"){
		    	 pngName = "catGirl.png";  gifName= "catGirl2.gif"; chrEvent("#chrTwo");
		     }else if(this.id == "chrThree"){
		    	 pngName = "pinkGirl.png";  gifName= "pinkGirl2.gif"; chrEvent("#chrThree");
		     }else if(this.id == "chrFour"){
		    	 pngName = "englishBoy.png";  gifName= "englishBoy2.gif"; chrEvent("#chrFour");
		     }else if(this.id == "chrFive"){
		    	 pngName = "coolBoy.png";  gifName= "coolBoy2.gif"; chrEvent("#chrFive");
		     }else if(this.id == "chrSix"){
		    	 pngName = "usoku.png";  gifName= "usoku2.gif"; chrEvent("#chrSix");
		     }
		});  */
		
		function hideLine(){
			$("#chrOne").css("outline", "none");
			$("#chrTwo").css("outline", "none");
			$("#chrThree").css("outline", "none");
			$("#chrFour").css("outline", "none");
			$("#chrFive").css("outline", "none");
			$("#chrSix").css("outline", "none");
		}
		
/*  		function chrEvent(chrName){
			$(chrName).mouseenter(function() {
				$(this).attr("src", frontURL + gifName);
			}).mouseleave(function() {
				$(this).attr("src", frontURL + pngName);
			}).click (function(){
				if(clicks){
					hideLine();
					$(this).css("outline", "5px dotted red");
					clicks = false;
				}else{
					$(this).css("outline", "none");
					clicks = true;
				}
			});
		}  */
		
		
 		$("#chrOne").mouseenter(function() {
			gifName = "chineseGirl2.gif";
			$(this).attr("src", frontURL + gifName);
		}).mouseleave(function() {
			pngName = "chineseGirl.png";
			$(this).attr("src", frontURL + pngName);
		}).click (function(){
			if(clicks){
				hideLine();
				$(this).css("outline", "5px dotted red");
				clicks = false;
			}else{
				$(this).css("outline", "none");
				clicks = true;
			}
		});
		
		$("#chrTwo").mouseenter(function() {
			gifName = "catGirl2.gif";
			$(this).attr("src", frontURL + gifName);
		}).mouseleave(function() {
			pngName = "catGirl.png";
			$(this).attr("src", frontURL + pngName);
		}).click (function(){
			if(clicks){
				hideLine();
				$(this).css("outline", "5px dotted red");
				clicks = false;
			}else{
				$(this).css("outline", "none");
				clicks = true;
			}
		});
		
		
		$("#chrThree").mouseenter(function() {
			gifName = "pinkGirl2.gif";
			$(this).attr("src", frontURL + gifName);
		}).mouseleave(function() {
			pngName = "pinkGirl.png";
			$(this).attr("src", frontURL + pngName);
		}).click (function(){
			if(clicks){
				hideLine();
				$(this).css("outline", "5px dotted red");
				clicks = false;
			}else{
				$(this).css("outline", "none");
				$(this).attr("src", frontURL + gifName);
				clicks = true;
			}
		});
		
		$("#chrFour").mouseenter(function() {
			gifName = "englishBoy2.gif";
			$(this).attr("src", frontURL + gifName);
		}).mouseleave(function() {
			pngName = "englishBoy.png";
			$(this).attr("src", frontURL + pngName);
		}).click (function(){
			if(clicks){
				hideLine();
				$(this).css("outline", "5px dotted red");
				clicks = false;
			}else{
				$(this).css("outline", "none");
				clicks = true;
			}
		});
		
		$("#chrFive").mouseenter(function() {
			gifName = "coolBoy2.gif";
			$(this).attr("src", frontURL + gifName);
		}).mouseleave(function() {
			pngName = "coolBoy.png";
			$(this).attr("src", frontURL + pngName);
		}).click (function(){
			if(clicks){
				hideLine();
				$(this).css("outline", "5px dotted red");
				clicks = false;
			}else{
				$(this).css("outline", "none");
				clicks = true;
			}
		});
		
		$("#chrSix").mouseenter(function() {
			gifName = "usoku2.gif";
			$(this).attr("src", frontURL + gifName);
		}).mouseleave(function() {
			pngName = "usoku.png";
			$(this).attr("src", frontURL + pngName);
		}).click (function(){
			if(clicks){
				hideLine();
				$(this).css("outline", "5px dotted red");
				$(this).attr("src", frontURL + gifName);
				clicks = false;
			}else{
				$(this).css("outline", "none");
				clicks = true;
			}
		}); 
		
		
	});
</script>
</head>
<body>
	<h1>Select Your Character</h1>
	<form action="/kanemochi/member/signup" id="joinform" method="post">
		<table>
			<tr>
				<td>id</td>
				<td><input type="text" id="user_id" name="user_id"
					value="${memVO.user_id}" readonly="readonly" /></td>
				<td rowspan="3"><a href="#"><img
						src="/kanemochi/resources/image/character/chineseGirl.png"
						class="chr" alt="left-img" id="chrOne"></a> <a href="#"><img
						src="/kanemochi/resources/image/character/catGirl.png" class="chr"
						alt="center-img" id="chrTwo"></a> <a href="#"><img
						src="/kanemochi/resources/image/character/pinkGirl.png"
						class="chr" alt="right-img" id="chrThree"></a></td>
			</tr>
			<tr class="warning">
				<td>password</td>
				<td><input type="text" id="user_pw" name="user_pw"
					value="${memVO.user_pw}" readonly="readonly" /></td>
			</tr>
			<tr class="info">
				<td>name</td>
				<td><input type="text" id="user_name" name="user_name"
					value="${memVO.user_name}" readonly="readonly" /></td>
			</tr>
			<tr class="success">
				<td>email</td>
				<td><input type="text" id="user_email" name="user_email"
					value="${memVO.user_email}" readonly="readonly" /></td>
				<td rowspan="3"><a href="#"><img
						src="/kanemochi/resources/image/character/englishBoy.png"
						class="rounded float-left" alt="left-img" id="chrFour"></a> <a
					href="#"><img
						src="/kanemochi/resources/image/character/coolBoy.png"
						class="rounded float-center" alt="center-img" id="chrFive"></a>
					<a href="#"><img
						src="/kanemochi/resources/image/character/usoku.png"
						class="rounded float-right" alt="right-img" id="chrSix"></a></td>
			</tr>
			<tr>
				<td>phone</td>
				<td><input type="text" id="user_phone" name="user_phone"
					value="${memVO.user_phone}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>gender</td>
				<td><input type="text" id="user_gender" name="user_gender"
					value="${memVO.user_gender}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td colspan="3"><a type="button"
					href="/kanemochi/member/signUpForm" class="btn btn-success">back</a>
					<button id="joinBtn" class="btn btn-warning">finish</button></td>
			</tr>
			<tr>
				<td><input type="hidden" name="img_id" value="" id="imgURL" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>