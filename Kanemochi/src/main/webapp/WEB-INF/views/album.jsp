<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>album</title>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<!-- <link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
body {
	margin: 50px;
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
a{
	float:right;
}
.rounded{
	width: 300px;
}
#dog{
	width: 10%;
}
</style>
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
	  
	  function fuckingFB(){
	     var imgUrl = "/kanemochi/resources/image/screenshot/one.png";
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
</script>

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
          <canvas id="canvas" width="850" height="600"></canvas> <!-- 캔버스 크기 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="fuckingFB()">facebookShare</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

	<h1>Album</h1>
	<table>
		<tr>
			<td><a href="#" data-toggle="modal" data-target="#myModal">
			<img src="/kanemochi/resources/image/screenshot/one.png" class="rounded float-left" alt="left-img"></a></td>
			<td><a href="javascript:popupOpen();" id ="two" class="sc">
			<img src="/kanemochi/resources/image/screenshot/two.png" class="rounded float-left" alt="left-img"></a></td>
			<td><a href="javascript:popupOpen();" id ="three" class="sc">
			<img src="/kanemochi/resources/image/screenshot/three.png" class="rounded float-left" alt="left-img"></a></td>
		</tr>
		<tr>
			<td>2017-09-27 80:50:00</td>
			<td>2017-09-27 80:50:00</td>
			<td>2017-09-27 80:50:00</td>
		</tr>
		<tr>
			<td><a href="#" data-toggle="modal" data-target="#myModal">
			<img src="http://via.placeholder.com/300x200" class="rounded float-left" alt="left-img"></a></td>
			<td><a href="#"><img src="http://via.placeholder.com/300x200" class="rounded float-center" alt="center-img"></a></td>
			<td><a href="#"><img src="http://via.placeholder.com/300x200" class="rounded float-right" alt="right-img"></a></td>
		</tr>
		<tr>
			<td>2017-09-27 80:50:00</td>
			<td>2017-09-27 80:50:00</td>
			<td>2017-09-27 80:50:00</td>
		</tr>
	</table>
  
	<a type="button" href="/kanemochi/member/loginForm" class="btn btn-warning">home</a>
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
	
	<div class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body…</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
  
</div>
	
	
</body>
</html>