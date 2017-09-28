<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<meta charset="UTF-8">
<title>album</title>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

<script src="/kanemochi/resources/js/html2canvas.js"></script>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<!-- <script src="/kanemochi/resources/js/bootstrap.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

/*폰트 설정해보기   */
body {
	margin: 50px ;
	text-align: center;
	background-color:#fff5c3;
	background-image:url(/kanemochi/resources/image/bg/pinkSky2.png);
	background-repeat: repeat-x;
	color: black;
}
table {
	margin: auto;
	text-align: center;
}
th, td {
	padding: 10px;
}
.screenshot{
	width: 300px;
}
#dog{
	width: 10%;
}
.table{ 
	display:table; 
	width: 100%;
	color: black;
} 
.table.table{
	background-color: transparent;
	text-align: center;
	margin: 0 auto;
}
.table-row {
	display:table-row;
	padding: 10px; 
 	/* position: relative; */
}
.table-cell{
 	display: table-cell;
 	text-align: center;
    vertical-align: middle;
    align-items: center;
    margin: 0 auto;
}
element.style {	
	display: table-c;
    text-align: center;
    margin: 0 auto;
    vertical-align: middle;
}
.modal-content{
	position: relative;
	/* left: 45%; */
	background-color:#fff5c3;
	background-image:url(/kanemochi/resources/image/bg/pinkSky2.png);
	background-repeat: repeat-x;
	background-color: rgba(255,255,255,0.1);
}
.modal-header{
	width: 800px;
}
</style>
</head>

<body>
<div id="header">
	<jsp:include page="includeHeader.jsp"></jsp:include>
</div>

	<h1>Album</h1>
	
	<c:if test="${fn:length(scList) > 0}" var="result">
	<div id="target" class="table">
		<div class="table-row">
		<c:forEach items="${scList}" var="list" begin="0" end="${((fn:length(scList))/4)+1}" varStatus="status">
				<div class="table-cell">
					<a href="#" data-toggle="modal" data-target="#myModal">
						<img id="sc${status.index}" src="${list.screenshotdata}" class="screenshot"/>
					</a>
				</div>
	 	</c:forEach>
		</div>
		
 		<div class="table-row">
		<c:forEach items="${scList}" var="list" begin="0" end="${((fn:length(scList))/4)+1}" varStatus="status">
			<div class="table-cell">
				<p>${list.shotdate}</p>
			</div>
		</c:forEach>
		</div>
		
		<div class="table-row">
		<c:forEach items="${scList}" var="list"  begin="${((fn:length(scList))/4)+2}" end="${fn:length(scList)-1}" varStatus="status">
				<div class="table-cell">
					<a href="#" data-toggle="modal" data-target="#myModal">
						<img id="sc${status.index}" src="${list.screenshotdata}" class="screenshot"/>
					</a>
				</div>
	 	</c:forEach>
		</div>
		
		<div class="table-row">
		<c:forEach items="${scList}" var="list" begin="${((fn:length(scList))/4)+2}" end="${fn:length(scList)-1}" varStatus="status">
			<div class="table-cell">
				<p>${list.shotdate}</p>
			</div>
		</c:forEach>
		</div>
	</div>
	</c:if>
	
	<c:if test="${fn:length(scList) < 0}" var="result">
		<h1>Take your screenshot!</h1>
	</c:if>
 			 <!-- myModal -->
		  <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Album</h4>
		        </div>
		        <div class="modal-body modal-lg">
		          <canvas id="canvas" width="600" height="400"></canvas> <!-- 캔버스 크기 -->
		        </div>
		        <div class="modal-footer modal-lg">
		         <button type="button" class="btn btn-warning">delete</button>
		          <button type="button" class="btn btn-info" onclick="fbShare()">facebookShare</button>
		          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteScreenshot()">Close</button>
		        </div>
		      </div>
		    </div>
		  </div> 
		  
	<!-- 	  
		  Trigger the Modal
		<img id="myImg" src="img_fjords.jpg">
		
		The Modal
		<div id="myModal" class="modal">
		
		  The Close Button
		  <span class="close" onclick="document.getElementById('myModal').style.display='none'">&times;</span>
		
		  Modal Content (The Image)
		  <img class="modal-content" id="img01">
		
		  Modal Caption (Image Text)
		  <div id="caption"></div>
		</div> -->
	
	
<!-- 	<a type="button" href="/kanemochi/member/loginForm" class="btn btn-warning">home</a><br> -->
	
<!-- 	<!-- paging 
		<ul class="pagination">
		  <li class="disabled"><a href="#">&laquo;</a></li>
		  <li class="active"><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li><a href="#">&raquo;</a></li>
		</ul>
		<br> -->
	<img src="/kanemochi/resources/image/dog.gif" class="rounded float-left" alt="left-img" id="dog">
	
	<script>
//facebook share

		window.fbAsyncInit = function() {
			FB.init({
				appId : '291845884627852',
				xfbml : true,
				version : 'v2.10'
			});
			FB.AppEvents.logPageView();
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function fbShare() {

			var imgUrl = document.getElementById("canvas").toDataURL();
			//var imgUrl = $(this).children().attr("src");
			console.log(imgUrl);
			//var imgUrl = "/kanemochi/resources/image/screenshot/one.png";
			var canvas = document.createElement("canvas");
			canvas.width = 800;
			canvas.height = 500;
			var context = canvas.getContext("2d");
			var img = new Image();
			img.src = imgUrl;
			context.drawImage(img, 0, 0);
			var data = canvas.toDataURL();
			var blob;
			try {
				var byteString = atob(data.split(',')[1]);
				var ab = new ArrayBuffer(byteString.length);
				var ia = new Uint8Array(ab);
				for (var i = 0; i < byteString.length; i++) {
					ia[i] = byteString.charCodeAt(i);
				}
				blob = new Blob([ ab ], {
					type : 'image/png'
				});
			} catch (e) {
				console.log(e);
			}
			var fd = new FormData();
			fd.append("source", blob);
			fd.append("message", "Photo Text");
			FB.login(function() {
				var auth = FB.getAuthResponse();
				console.log(auth.userID);
				console.log(auth.accessToken);
				$.ajax({
					url : "https://graph.facebook.com/" + auth.userID
							+ "/photos?access_token=" + auth.accessToken,
					type : "POST",
					data : fd,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						console.log("success " + data);
						alert("페이스북에 성공적으로 업로드 되었습니다.");
					},
					error : function(shr, status, data) {
						console.log("error " + data + " Status " + shr.status);
					},
					complete : function() {
						console.log("Ajax Complete");
					}
				});
			}, {
				scope : 'publish_actions',
				auth_type : 'rerequest'
			});
		}

 		//screenshotToModal
		var canvas = document.getElementById('canvas');
		var ctx = canvas.getContext('2d');
		//var img = document.getElementById("sc0");
		var id = "";
		var img = "";

		$("a").on("click", function showOnModal() {
			id = $(this).children().attr("id");
			img = document.getElementById(id);

			html2canvas(document.getElementById("target"), {
				onrendered : function(canvas) {
					ctx.drawImage(img, 0, 0, 600, 400); // 내부 사진 크기
				}
			});
		});
		

		/* 	function downloadCanvas(link, canvasId, filename) {
		 link.href = document.getElementById(canvasId).toDataURL();
		 link.download = filename;
		 }
		
		 document.getElementById('download').addEventListener('click', function() {
		 downloadCanvas(this, 'canvas', 'screenshot.png');
		 } , false);
		 */
		</script>
		
</body>
</html>