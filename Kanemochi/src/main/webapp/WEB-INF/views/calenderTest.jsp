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
<link href="/kanemochi/resources/js/fullcalendar.print.css" rel="stylesheet" media="print" />
<script type="text/javascript" src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/fullcalendar.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	background: #578CA9;
	background-image:url(/kanemochi/resources/image/bg/bg3.gif);
	background-size: 100% 100%;
	color: navy;
}

#calendar {
	max-width: 700px;
	max-height: 100px;
	margin: 0 auto;
}
.nav.nav-pills>li>a{
	font-size: 25px;
	padding: 10px;
	color: white;
	
	/* background-color: yellow;
	border-radius: 10em 0 5em 2em;
	 box-shadow: 10px 10px 10px #FFFFCC inset; */
}

 #chart_div, #line_top_x{
	width: 50%;
	display: inline-block;
} 
#menu1{
	margin: 0px;
	padding:0px;
	display: table;
	width: 100%;
}
#buttons>button{
	float: right;
}

</style>
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
	google.charts.load('current', {
		'packages' : [ 'line' ]
	});
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		// [Pie Chart]
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([ [ '#버거킹', 3 ], [ '#오크우드', 1 ], [ '#편의점', 1 ],
				[ '#소노야', 1 ], [ '#신의주국밥', 2 ] ]);
	
		// Set chart options
		var options = {
			'title' : '식비',
			//'is3D' : true,
			'width' : 700,
			'height' : 400,
			'backgroundColor': 'transparent',
			'colors': ['#91A8D0', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'],
			'fontSize':20
		};
	
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	
		// [Line Chart]
		var data = new google.visualization.DataTable();
		data.addColumn('number', 'Day');
		data.addColumn('number', '식비 변동');
		data.addColumn('number', '문화비 변동');
		data.addColumn('number', '교통비 변동');
	
		data.addRows([ [ 1, 37.8, 80.8, 41.8 ], [ 2, 30.9, 69.5, 32.4 ],
				[ 3, 25.4, 57, 25.7 ], [ 4, 11.7, 18.8, 10.5 ],
				[ 5, 11.9, 17.6, 10.4 ], [ 6, 8.8, 13.6, 7.7 ],
				[ 7, 7.6, 12.3, 9.6 ], [ 8, 12.3, 29.2, 10.6 ],
				[ 9, 16.9, 42.9, 14.8 ], [ 10, 12.8, 30.9, 11.6 ],
				[ 11, 5.3, 7.9, 4.7 ], [ 12, 6.6, 8.4, 5.2 ],
				[ 13, 4.8, 6.3, 3.6 ], [ 14, 4.2, 6.2, 3.4 ] ]);
	
		var options = {
			chart : {
				title : '월간 레포트',
				subtitle : '카테고리별 변동'
			},
			width : 700,
			height : 400,
			axes : {
				x : {
					0 : {
						side : 'top'
					}
				}
			},
			'backgroundColor': 'transparent', 
			'colors': ['#88B04B', '#578CA9', '#F3CF55'],
			'fontSize':20
			
		};
	
		var chart = new google.charts.Line(document
				.getElementById('line_top_x'));
		chart.draw(data, google.charts.Line.convertOptions(options));
	}
	 
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

</head>
<body>
<div class="container">
  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Home</a></li>
    <li><a data-toggle="pill" href="#menu1">Menu 1</a></li>
    <li><a data-toggle="pill" href="#menu2">Menu 2</a></li>
    <li><a data-toggle="pill" href="#menu3">Menu 3</a></li>
  </ul>
  
  <div class="tab-content fade in active">
    <div id="home" class="tab-pane fade in active">
      	<div id="calendar"></div>	
    </div>
    <div id="menu1" class="tab-pane fade">
      <h1>[Report]</h1>
	  <div id="chart_div"></div>
	  <div id="line_top_x"></div>
	  <div id="buttons">
		  <button type="button" class="btn btn-info" onclick="location.href='/kanemochi/member/loginForm'">home</button>
		  <button type="button" class="btn btn-warning">export in excel</button>
		  <button type="button" class="btn btn-success">export in pdf</button>
	  </div>
    </div>
  </div>
</div>


</body>
</html>

