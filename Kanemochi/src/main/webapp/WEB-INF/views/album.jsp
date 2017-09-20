<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>album</title>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>

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

/* modal */ 
/* The Modal (background) */
	.modal {
		text-align: center;
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 100px; /* Location of the box */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    /*background-color: #ffffff;  /* Fallback color */
	    background-color: rgba(255,255,255,0);  /*Black w/ opacity  */
	    opacity: 0.5;  
	}
/* Modal Content */
	.modal-content {
		text-align: center;
	    background-color: #aaaaaa;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #888;
	    width: 50%;
	}
	.select {
		background-color: #fefefe;
		color: #aaaaaa;
	}
/* The Close Button */
	.close {
	    color: #aaaaaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}
	
</style>
<script>
function popupOpen(){

	var popUrl = "screenshotForm";	//팝업창에 출력될 페이지 URL

	var popOption = "width=600, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}

</script>

</head>
<body>

  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>This is a large modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

	<h1>Album</h1>
	<table>
		<tr>
			<td><a href="javascript:popupOpen();" id ="one" class="sc">
			<img src="/kanemochi/resources/image/screenshot/one.png" class="rounded float-left" alt="left-img"></a></td>
			<td><a href="javascript:popupOpen();" id ="two" class="sc">
			<img src="/kanemochi/resources/image/screenshot/two.png" class="rounded float-left" alt="left-img"></a></td>
			<td><a href="javascript:popupOpen();" id ="three" class="sc">
			<img src="/kanemochi/resources/image/screenshot/three.png" class="rounded float-left" alt="left-img"></a></td>
			
			
			<!-- <td><a href="#"><img src="/kanemochi/resources/image/screenshot/two.png" class="rounded float-center" alt="center-img"></a></td>
			<td><a href="#"><img src="/kanemochi/resources/image/screenshot/three.png" class="rounded float-right" alt="right-img"></a></td> -->
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
		<!-- Modal -->
		

  
	<!-- <button type="button" class="btn btn-warning" onclick="location.href='/kanemochi/member/loginForm'">Back</button><br> -->
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