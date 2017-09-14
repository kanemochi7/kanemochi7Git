<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>album</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<style type="text/css">
body {
	margin: auto;
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
#dog{
	width: 10%;
}
#scshot{
	width: 100%;
}
.icon{
	width: 40%;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td><img src="/kanemochi/resources/image/screenshot/one.png" class="rounded float-left" alt="scshotOne" id="scshot"></td>
		</tr>
		<tr>
			<td>
				<!-- <a href="#"><img src="/kanemochi/resources/image/icon/folder.png" class="rounded icon float-left" alt="fdIcon"></a>
				<a href="#"><img src="/kanemochi/resources/image/icon/facebook.png" class="rounded icon float-left" alt="fbIcon"></a>
				<a href="#"><img src="/kanemochi/resources/image/icon/twitter.png" class="rounded icon float-left" alt="twIcon"></a> -->
				
				<!-- Your share button code --> <!-- url to share -->
				  <!-- <div class="fb-share-button" 
				    data-href="http://www.naver.com"  
				    data-layout="button_count">
				  </div> -->
				  
				  <div class="fb-share-button" data-href="http://www.google.com"
				  data-layout="button" data-size="large" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" 
				  target="_blank" 
				  href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">
				  </a></div>
				  
			</td>
		</tr>
	</table>
	
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId            : '291845884627852',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v2.10'
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
</script>

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.10";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>




</body>
</html>