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
<script src="/kanemochi/resources/js/jquery.mtz.monthpicker.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/jquery.techbytarun.excelexportjs.min.js"></script>
<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	background: #578CA9;
	background-image:url(/kanemochi/resources/image/bg/bg3.gif);
	background-size: 100% 100%;
	color: navy;
}

#calendar{
	color: navy;
	max-width: 700px;
	max-height: 0px;
	margin: 0 auto;
}

td, tr {
	color:black;
	background-color: #ffffff;
    background-color: rgba( 255, 255, 255, 0.25);
}

.fc-unthemed td.fc-today {
	background: rgba(255, 207, 24, 0.43);
}

.fc-today {
    border: none !important;
    border-top: 1px solid #ddd !important;
    font-weight: bold;
}
 
.fc-sun {
	color:#e31b23;
}

.fc-sat {
	color:#007dc3
}

.nav.nav-pills>li>a{
	font-size: 25px;
	padding: 10px;
	color: white;
	
	/* background-color: yellow;
	border-radius: 10em 0 5em 2em;
	 box-shadow: 10px 10px 10px #FFFFCC inset; */
}

 #pieChart, #lineChart, #columnChart{
	width: 50%;
	display: inline-block;
	max-width: 700px;
	max-height: 0px;
	margin: 0 auto;
	padding: 0 auto;
}
#menu1,#menu2 {
	margin: 0px;
	padding: 0px;
	display: table;
	width: 100%;
}

#buttons>button{
	float: right;
}

/* #listTable>tbody>tr>td{
	border-collapse:separate;
    border-radius:12px;
    -moz-border-radius:12px;
} */

#first{
	font-weight: bold;
	background-color: #FDF7F7;
	
}

#listTable{
	opacity: 0.85;
}

#recordWrapper{
	margin-top: 50px;
}

#menu3{
	position: absolute;
	top: 200px;
}

/* #listTable>tbody{
	background-color: rgba( 255, 255, 255, 0.25);
} */




</style>
<script>
$(document).ready(function() {
	/* $.datepicker.regional['jp'] = {
			closeText: '닫기',
			prevText: '이전달',
			nextText: '다음달',
			currentText: '오늘',
			monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			weekHeader: 'Wk',
			dateFormat: 'yy-mm',
			firstDay: 0,
			isRTL: false,
			duration:200,
			showAnim:'show',
			showMonthAfterYear: true,
			yearSuffix:'년'
			};
			$.datepicker.setDefaults($.datepicker.regional['jp']);
			$('#input').datepicker({
				changeMonth: false,
				changeYear: false,
			}); */
	
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
		  $('#calendar').fullCalendar({
		     editable : false
		     ,color: "black"
		     ,eventLimit : true
		     ,events: data
		     ,dayClick: function(date) {
				 $.ajax({
					type: "POST"
					, url: "/kanemochi/getDayRecord"
					, data: {"date":date.format()}
					, dataType : "json" //전송받을 데이터 타입
				    , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
				    , success : function(data) {
				    	$("#listTable").empty();
						var addrow = "<tbody>";
						addrow += '<tr><td><h4>レポート<h4></td></tr>';
						addrow += '<tr><td><button id="btnExport" class="btn btn-warning" type="button">Export</button><td><tr>';
						addrow += '<tr id="first"><td>日付</td><td>カテゴリー</td><td>価格</td><td>支払方法</td></tr>';
						var arr = ["info","success","danger","warning","acive"];
						var i = 0;
						$(data).each(function (index,item) {
								addrow += "<tr class='"+arr[i]+"''>";
								addrow += '<td>'+item.record_date+'</td>';
								addrow += '<td>'+item.category+'</td>';
								addrow += '<td>¥'+item.record_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",")+'</td>';
								addrow += '<td>'+item.record_pay+'</td></tr>';
								if(Object.keys(data).length==index+1){
									addrow += "</tbody>";
									$("#listTable").append(addrow);
								}
							i++;
							if(i==4){
								i=0;
							}
						}); 
						
						$("#btnExport").click(function () {
				            $("#tblExport").excelexportjs({
				                containerid: "listTable"
				               , datatype: 'table'
				            });
				        });
						
						$("h2").click(function(){
							var month = $("h2").text();
							var strArray = month.split(' ');
							
							$.ajax({
								type: "POST"
									, url: "/kanemochi/getMonthRecord"
									, data: {"month":strArray[0],"year":strArray[1]}
									, dataType : "json"
								    , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
								    , success : function(data) {
									    $("#listTable").empty();
									    var addrow = "<tbody>";
										addrow += '<tr><td><h4>レポート<h4></td></tr>';
										addrow += '<tr><td><button id="btnExport" class="btn btn-warning" type="button">Export</button><td><tr>';
										addrow += '<tr id="first"><td>月</td><td>カテゴリー</td><td>価格</td><td>支払方法</td></tr>';
										var arr = ["info","success","danger","warning","acive"];
										var i = 0;
										$(data).each(function (index,item) {
											addrow += "<tr class='"+arr[i]+"''>";
											addrow += '<td>'+item.record_date+'</td>';
											addrow += '<td>'+item.category+'</td>';
											addrow += '<td>¥'+item.record_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",")+'</td>';
											addrow += '<td>'+item.record_pay+'</td></tr>';
											if(Object.keys(data).length==index+1){
												addrow += "</tbody>";
												$("#listTable").append(addrow);
											}
											i++;
											if(i==4){
												i=0;
											}
							
										});
								    }
							}); 
						});
	     			}
				 })
		     } 
		  });
	 }
	
	

	 
//google Chart
	google.charts.load('current', {
		'packages' : [ 'line' ]
	});
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		// [Pie Chart]
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([ [ '#버거킹', 3 ], [ '#오크우드', 1 ], [ '#편의점', 1 ],
				[ '#소노야', 1 ], [ '#신의주국밥', 2 ] ]);
	
		var options = {
			'title' : '식비',
			//'is3D' : true,
			'width' : 700,
			'height' : 400,
			'backgroundColor': 'transparent',
			'colors': ['#91A8D0', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'],
			'fontSize':20
		};
	
		var chart = new google.visualization.PieChart(document
				.getElementById('pieChart'));
		chart.draw(data, options);
		
		//[Column Chart]
        var data = google.visualization.arrayToDataTable([
          ['Category', '2017/08', '2017/09'],
          ['식비', 500000, 600000],
          ['문화비', 12000, 50000],
          ['교통비', 150000, 100000],
          ['교육비', 45000, 17000]
        ]);

        var options = {
          chart: {
            title: '월별 분석',
            subtitle: '지난달과 이번달 소비 비교'
            },
            width : 700,
			height : 400,
			'backgroundColor': 'transparent',
			'fontSize':20
        };

        var chart = new google.charts.Bar(document.getElementById('columnChart'));

        chart.draw(data, google.charts.Bar.convertOptions(options)); 
	
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
	/* 
		var chart = new google.charts.Line(document
				.getElementById('lineChart'));
		chart.draw(data, google.charts.Line.convertOptions(options));
		 */
		//[Bubble Chart]
		var data = google.visualization.arrayToDataTable([
	          ['ID', '방문 횟수', '평균 가격', '카테고리', '월 총 소비액'],
	          ['#버거킹',   20,  8000,      20*8000, 20*8000],
	          ['#오크우드',   30,  4500,      30*4500, 30*4500],
	          ['#소노야',   10,  8000,      10*8000,  10*8000],
	          ['#신의주',   5,  7500,      5*7500, 5*7500],
	          ['#편의점',   25,  5000,      25*5000, 25*5000],
	          ['#경성면옥',   1,  7500,      1*7500, 1*7500],
	          ['#하동관',   1,  13000,      1*13000, 1*13000],
	          ['#제너럴반점',   10,  7500,      10*7500, 10*7500]
	          ]);

	        var options = {
	          colorAxis: {colors: ['mistyrose', 'red']},
	          width: 1200, 
	          height: 450,
	          sortBubblesBySize: true, 
	          hAxis: {title: '방문 횟수'},
	          vAxis: {title: '평균 가격'},
	          backgroundColor: 'transparent'
	        };

	        var chart = new google.visualization.BubbleChart(document.getElementById('bubbleChart'));
	        chart.draw(data, options);
	}
	 
	 
</script>

</head>
<body>
<div>
</div>
<div id="header">
		<jsp:include page="includeHeader.jsp"></jsp:include>
</div>
<div class="container">
  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home"> カレンダー</a></li>
    <li><a data-toggle="pill" href="#menu1">月別分析</a></li>
    <li><a data-toggle="pill" href="#menu2">カテゴリー分析</a></li>
    <li><a data-toggle="pill" href="#menu3">全体記録</a></li>
  </ul>
  
  <div class="tab-content fade in fade" >
    <div id="home" class="tab-pane fade in active">
      	<div id="calendar" style="float:left;"></div>
      	<div id="recordWrapper" style="float:right;">
      		<table id="listTable" class="table table-striped table-hover "></table>
      	</div>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h1>[Report]</h1>
	  <div id="pieChart"></div>
	  <!-- <div id="lineChart"></div> -->
	  <div id="columnChart"></div>
	  <div id="buttons">
		  <button type="button" class="btn btn-info" onclick="location.href='/kanemochi/member/loginForm'">home</button>
		  <button type="button" class="btn btn-warning">export in excel</button>
		  <button type="button" class="btn btn-success">export in pdf</button>
	  </div>
    </div>
    <div id="menu2" class="tab-pane fade">
      <div id="bubbleChart"></div> 
    </div>
    <div id="menu3" class="tab-pane fade">
    	<!-- <input class="input"> -->
    </div>
  </div>
</div>


</body>
</html>

