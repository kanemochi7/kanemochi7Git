<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>풀캘린더</title>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<link href="/kanemochi/resources/js/fullcalendar.css" rel="stylesheet" />
<link href="/kanemochi/resources/js/fullcalendar.print.css"
	rel="stylesheet" media="print" />
<script type="text/javascript"
	src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="/kanemochi/resources/js/moment.min.js"></script>
<script type="text/javascript"
	src="/kanemochi/resources/js/fullcalendar.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	  $.ajax({
	   
	     type : "POST" 
	     , url : "/kanemochi/ajax.do" //Request URL
	     , dataType : "json" //전송받을 데이터 타입
	     , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	     , error : function(request, status, error) {
				     	alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
				   }
	     , success : function(data) {
	     	 			setCalendar(data);
	     			}
	   });
	  
	 
	 });
	 
	 function setCalendar( data ){
/* 		  var date = new Date();
		  var d = date.getDate();
		  var m = date.getMonth();
		  var y = date.getFullYear(); */
		  
		  
		  $('#calendar').fullCalendar({
		     editable : true
		     ,eventLimit : true
		     ,events: data
		  });
		  
		  $("#calendar a").click(function(){
		   	$(this).attr("href","javascript:goDetail('"+$(this).attr("href")+"')");
		  });
		 
	  
	 }
</script>
<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;

}

#calendar {
	max-width: 500px;
	margin: 0 auto;
}



</style>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>