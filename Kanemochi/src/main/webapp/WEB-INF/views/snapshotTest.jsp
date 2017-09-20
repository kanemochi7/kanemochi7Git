<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="/kanemochi/resources/js/html2canvas.js"></script>
<script>
window.takeScreenShot = function() {
    html2canvas(document.getElementById("target"), {
        onrendered: function (canvas) {
        	
        	// child 창 
        	var popUrl = "snapshot";	//팝업창에 출력될 페이지 URL
			var popOption = "width=600, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
        	
            document.body.appendChild(canvas);
        },
        width:200,
        height:300
    });
}

function popupOpen(){
	var popUrl = "snapshot";	//팝업창에 출력될 페이지 URL
	var popOption = "width=600, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}

/* html2canvas($my-div, {
    height: myDivHeight,
    width: 350,
    useCORS: true,
    allowTaint: true,
    proxy: "your url",
    onrendered: function (canvas) {
      window.canvas2ImagePlugin.saveImageDataToLibrary(
        function(msg){
          console.log(msg) //path where image is saved
        },
        function(err){
            console.log(err);
        },
        canvas // pass canvas as third parameter
      );
    }
  }); */

  $('#save_image_locally').click(function(){
	    html2canvas($('#imagesave'), 
	    {
	      onrendered: function (canvas) {
	        var a = document.createElement('a');
	        // toDataURL defaults to png, so we need to request a jpeg, then convert for file download.
	        a.href = canvas.toDataURL("image/jpeg").replace("image/jpeg", "image/octet-stream");
	        a.download = 'somefilename.jpg';
	        a.click();
	      }
	    });
	  }); 
  
</script>
<style>
button {
	display: block;
	height: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>S
	<div id="target">
		<!-- <a href="javascript:popupOpen();"> -->
			<img src="/kanemochi/resources/image/character/pinkGirl.gif"/>
		<!-- </a> -->
	</div>
	<button onclick="takeScreenShot()">to image</button>
	<button type ="button" id ="save_image_locally">save</button>
</body>
</html>