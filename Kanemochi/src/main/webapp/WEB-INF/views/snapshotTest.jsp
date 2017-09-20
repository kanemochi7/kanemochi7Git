<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ScreenshotTest</title>
<script src="/kanemochi/resources/js/html2canvas.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
canvas {
    border:1px solid black;
}
img{
	width:auto;
}
#cameraBtn{
	height: 30px;
}
</style>
</head>
<body>
	<!-- <a class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="takeScreenShot()">Take a Screenshot</a> -->
	<a class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="takeScreenShot()">
		<img src="/kanemochi/resources/image/icon/camera.png" id="cameraBtn"/>
	</a>
	<div id="target">
		<img id ="img" src="/kanemochi/resources/image/screenshot/one.png"/>
	</div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">ScreenShot</h4>
        </div>
        <div class="modal-body">
			<canvas id="canvas" width="850" height="600"></canvas> <!-- 캔버스 크기 -->
        </div>
        <div class="modal-footer">
          <a class="btn btn-default" id="download">Save</a>
          <a class="btn btn-default" data-dismiss="modal">Close</a>
        </div>
      </div>
      
    </div>
  </div>
<script>
	var canvas = document.getElementById('canvas');
	var ctx = canvas.getContext('2d');
	var img = document.getElementById("img");
	
	function doCanvas() {
		/* ctx.drawImage(img,0,0,400,600); */ // 내부 사진 크기
		ctx.drawImage(img,0,0);
	}
	
	function downloadCanvas(link, canvasId, filename) {
	    link.href = document.getElementById(canvasId).toDataURL();
	    link.download = filename;
	}
	
	document.getElementById('download').addEventListener('click', function() {
		downloadCanvas(this, 'canvas', 'test.png');
	}, false);
	
	function takeScreenShot() {
		html2canvas(document.getElementById("target"), {
			onrendered : function(canvas) {
				doCanvas();
			}
		});
	}
</script>

</body>
</html>