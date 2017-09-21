<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>album</title>

<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"	src="//cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

<!-- <script src="/kanemochi/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

<style type="text/css">
/*폰트 설정해보기   */
body {
	margin: 50px;
	text-align: center;
	background-color:#fff5c3;
	background-image:url(/kanemochi/resources/image/bg/pinkSky2.png);
	background-repeat: repeat-x;
	/* color: black; */
}
table {
	margin: auto;
	text-align: center;
}
th, td {
	padding: 10px;
}
a{
	float:right;
}
.screenshot{
	width: 300px;
}
#dog{
	width: 10%;
}
div{
	display: block;
}
.table.table{
	/* background-color: transparent;  */
	background-color: mistyrose;
}
.table{ 
	display:table; 
	/* display: inline-block; */
	width: 100%;
}
.table-row {
	display:table-row;
	padding: 20px;
	/* float: right; */
 	/* position: relative;
 	left: 0;  */
}
.table-cell{
 	display: table-cell;
 	display: 
 	right: 50%;
}

.modal-content{
	position: relative;
	left: 50%;
	background-color: #fff5c3;
	/* background-color: rgba(255,255,255,0.2); */
}
</style>

</head>
<body>
	<!-- myModal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Album</h4>
        </div>
        <div class="modal-body">
          <canvas id="canvas" width="700" height="500"></canvas> <!-- 캔버스 크기 -->
        </div>
        <div class="modal-footer">
         <button type="button" class="btn btn-warning">delete</button>
          <button type="button" class="btn btn-default" onclick="fbShare()">facebookShare</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

	<h1>Album</h1>
	<div id="target" class="table">
		<!-- first row -->
		<div class="table-row">
			<div class="table-cell">
				<a href="" data-toggle="modal" data-target="#myModal">
					<img id="sc1" src="/kanemochi/resources/image/screenshot/one.png" class="screenshot"/>
				</a>
			</div>
			<div class="table-cell">
				<a href="#"  data-toggle="modal" data-target="#myModal">
					<img id="sc2" src="/kanemochi/resources/image/screenshot/two.png" class="screenshot"/>
				</a>
			</div>
			<div class="table-cell">
				<a href="#"  data-toggle="modal" data-target="#myModal">
					<img id="sc3" src="/kanemochi/resources/image/screenshot/three.png" class="screenshot"/>
				</a>
			</div>
			<div class="table-cell">
				<a href="#" data-toggle="modal" data-target="#myModal">
					<img id="sc4" src="/kanemochi/resources/image/screenshot/three.png" class="screenshot"/>
				</a>
			</div>
		</div>
		<!-- second row -->
		<div class="table-row">
			<div class="table-cell">
				<p>2017-09-27 80:50:00</p>
			</div>
			<div class="table-cell">
				<p>2017-09-27 80:50:00</p>
			</div>
			<div class="table-cell">
				<p>2017-09-27 80:50:00</p>
			</div>
			<div class="table-cell">
				<p>2017-09-27 80:50:00</p>
			</div>
		</div>
		
		<!-- third row -->
		<div class="table-row">
			<div class="table-cell">
				<a href="" data-toggle="modal" data-target="#myModal">
					<img id="sc1" src="/kanemochi/resources/image/screenshot/one.png" class="screenshot"/>
				</a>
			</div>
			<div class="table-cell">
				<a href="#"  data-toggle="modal" data-target="#myModal">
					<img id="sc2" src="/kanemochi/resources/image/screenshot/two.png" class="screenshot"/>
				</a>
			</div>
			<div class="table-cell">
				<a href="#"  data-toggle="modal" data-target="#myModal">
					<img id="sc3" src="/kanemochi/resources/image/screenshot/three.png" class="screenshot"/>
				</a>
			</div>
			<div class="table-cell">
				<a href="#" data-toggle="modal" data-target="#myModal">
					<img id="sc4" src="/kanemochi/resources/image/screenshot/three.png" class="screenshot"/>
				</a>
			</div>
		</div>
		
		<!-- fourth row -->
		<div class="table-row">
			<div class="table-cell">
				<p>2017-09-27 80:50:00</p>
			</div>
			<div class="table-cell">
				<p>2017-09-27 80:50:00</p>
			</div>
			<div class="table-cell">
				<p>2017-09-27 80:50:00</p>
			</div>
			<div class="table-cell">
				<p>2017-09-27 80:50:00</p>
			</div>
		</div>
		
	</div>
  
	<a type="button" href="/kanemochi/member/loginForm" class="btn btn-warning">home</a><br>
	
	<!-- paging -->
		<ul class="pagination">
		  <li class="disabled"><a href="#">&laquo;</a></li>
		  <li class="active"><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li><a href="#">&raquo;</a></li>
		</ul>
		<br>
	<img src="/kanemochi/resources/image/dog.gif" class="rounded float-left" alt="left-img" id="dog">
	<script>
//facebook share
window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '291845884627852',
	      xfbml      : true,
	      version    : 'v2.10'
	    });
	    FB.AppEvents.logPageView();
	  };

	  (function(d, s, id){
	     var js, fjs = d.getElementsByTagName(s)[0];
	     if (d.getElementById(id)) {return;}
	     js = d.createElement(s); js.id = id;
	     js.src = "//connect.facebook.net/en_US/sdk.js";
	     fjs.parentNode.insertBefore(js, fjs);
	   }(document, 'script', 'facebook-jssdk'));
	  
	  function fbShare(){
	     //var imgUrl = "/kanemochi/resources/image/screenshot/one.png";
	     var canvas = document.createElement("canvas");
	     canvas.width  = 900;
	     canvas.height = 600;
	     var context = canvas.getContext("2d");
	     var img = new Image();
	     img.src = imgUrl;
	     context.drawImage(img,0,0);
	     var data = canvas.toDataURL();
	     var blob;
	     try {
	       var byteString = atob(data.split(',')[1]);
	       var ab = new ArrayBuffer(byteString.length);
	       var ia = new Uint8Array(ab);
	       for (var i = 0; i < byteString.length; i++) {
	         ia[i] = byteString.charCodeAt(i);
	       }
	       blob = new Blob([ab], {type: 'image/png'});
	     } catch (e) {
	       console.log(e);
	     }
	     var fd = new FormData();
	     fd.append("source", blob);
	     fd.append("message", "Photo Text");
	     FB.login(function(){
	       var auth = FB.getAuthResponse();
	       console.log(auth.userID);
	       console.log(auth.accessToken);
	       $.ajax({
	         url:"https://graph.facebook.com/"+auth.userID+"/photos?access_token="+auth.accessToken,
	         type:"POST",
	         data:fd,
	         processData:false,
	         contentType:false,
	         cache:false,
	         success:function(data){
	           console.log("success " + data);
	           alert("페이스북에 성공적으로 업로드 되었습니다.");
	         },
	         error:function(shr,status,data){
	           console.log("error " + data + " Status " + shr.status);
	         },
	         complete:function(){
	           console.log("Ajax Complete");
	         }
	       });
	     }, {scope: 'publish_actions',
	        auth_type: 'rerequest'});
	     }
	  
//screenshot
	var canvas = document.getElementById('canvas');
	var ctx = canvas.getContext('2d');
	
	 $("a").on("click", function takeScreenshot(result) {
		var imgId = $(this).children().attr("id");
		var img = document.getElementById(imgId);
		html2canvas(document.getElementById("target"), {
			onrendered : function(canvas) {
				ctx.drawImage(img,0,0,700,500);
			}
		});
	});
</script>
	
</body>
</html>