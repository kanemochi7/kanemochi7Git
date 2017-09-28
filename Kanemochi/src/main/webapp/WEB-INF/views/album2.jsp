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
/* body {
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
} 
.table.table{
	background-color: transparent;
	text-align: center;
	margin: 0 auto;
}
.table-row {
	display:table-row;
	padding: 10px; 
 	/* position: relative;
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
	left: 45%;
	background-color:#fff5c3;
	background-image:url(/kanemochi/resources/image/bg/pinkSky2.png);
	background-repeat: repeat-x;
	/* background-color: rgba(255,255,255,0.2); 
} */

/* Style the Image Used to Trigger the Modal */
#myImg {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
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
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (Image) */
.modal-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
}

/* Caption of Modal Image (Image Text) - Same Width as the Image */
#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}

/* Add Animation - Zoom in the Modal */
.modal-content, #caption { 
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)} 
    to {-webkit-transform:scale(1)}
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
}

/* The Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
    .modal-content {
        width: 100%;
    }
}

</style>

</head>
<body>
<div id="header">
	<jsp:include page="includeHeader.jsp"></jsp:include>
</div>
<div id="container">
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
				<a href="#" data-toggle="modal" data-target="#myModal">
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
</div>

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
	     var imgUrl = "/kanemochi/resources/image/screenshot/one.png"; // 공유할 이미지 주소
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
	 
	 
//modal

</script>
</body>
</html>