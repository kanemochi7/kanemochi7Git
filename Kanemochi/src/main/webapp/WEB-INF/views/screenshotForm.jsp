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
              
              
         </td>
      </tr>
   </table>
   


</a>
<script>
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
  
//   'publish_actions'
</script>
 <button onclick="fuckingFB()">fuckingFB</button>
</body>
</html>