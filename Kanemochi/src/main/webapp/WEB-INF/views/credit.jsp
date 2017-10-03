<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" rel='stylesheet' type='text/css'>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>

<title>Credit</title>
<style>
@font-face{ 
	font-family:'PixelMplus12'; 
	src: url('/kanemochi/resources/fonts/PixelMplus12-Regular.ttf') format('truetype');
}
body {
  background: #333333;
  font-family:'PixelMplus12'; 
  /* font-family: 'Titillium Web', Helvetica, Arial; */
  font-size: 16px;
  color: #eeeeee;
  font-weight: 300;
  margin: 0;
  padding: 0;
   -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
h1, h2, h3, h4, h5, h6 {
  margin-top: 0;
}
h1 {
  font-size: 3rem;
  margin-bottom: 3rem;
}
h2 {
  font-size: 2rem;
  margin-bottom: 1rem;
}
h3 {
  font-size: 1.5rem;
 /*  line-height: 3rem; */
  line-height: 150px;
  /* margin-top: 0; */
}
.container {
  margin-top: 3rem;
  text-align: center;
  background: #333333;
  height: 100px;
}
.team_member{
	width: 100px;
	margin:0 auto;
}
.members{
	display: inline;
	margin-top: 0;
	
}
</style>
</head>
<body>

<div class="container">
  <h1>Credit</h1>
  <div class="slider">
<!--   	<h3>Developed By</h3>
  	<h3 style ="color: gold;">team KANEMOCHI</h3>
    <h3>KYUHEE HONG</h3>
    <img id="ggyu" src="/kanemochi/resources/image/team_member/ggyu.png" class="team_member" style="width: 10px"/>
    <h3>YOUNGHYUN KIM</h3>
    <h3>UNGSOO SHIN</h3>
    <h3>JAEHUN JEONG</h3>
    <h3>GARAM PARK</h3> -->
    <div>
    	<h3>Developed By</h3>
    </div>
    <div>
    	<h3 style ="color: gold;">team KANEMOCHI</h3>
    </div>
    <div class="members">
    	<p>KYUHEE HONG  <img id="ggyu" src="/kanemochi/resources/image/team_member/ggyu.png" class="team_member" /></p>
    </div>
     <div class="members">
    	<p>YOUNGHYUN KIM  <img id="yhk" src="/kanemochi/resources/image/team_member/yhk.png" class="team_member" /></p>
    </div>
     <div class="members">
    	<p>UNGSOO SHIN   <img id="ungc" src="/kanemochi/resources/image/team_member/ungc.png" class="team_member" /></p>
    </div>
     <div class="members">
    	<p>JAEHUN JEONG   <img id="jh" src="/kanemochi/resources/image/team_member/jh.png" class="team_member" /></p>
    </div>
     <div class="members">
    	<p>GARAM PARK  <img id="ram" src="/kanemochi/resources/image/team_member/ram.png" class="team_member" /></p>
    </div>
     <div class="members">
    </div>
    
  </div>
</div>

<script>
$(function (){
	$('.slider').slick({
		  vertical: true,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  speed: 300
	});
});
</script>
</body>
</html>