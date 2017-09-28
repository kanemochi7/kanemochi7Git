<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/kanemochi/resources/js/print.js" ></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<link href="/kanemochi/resources/js/fullcalendar.css" rel="stylesheet" />
<link href="/kanemochi/resources/js/fullcalendar.print.css" rel="stylesheet" media="print" />
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/fullcalendar.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/jquery.techbytarun.excelexportjs.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/kanemochi/resources/js/html2canvas.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<style type="text/css">
/* body{
	color: black;
}
button {
    color:#fff;
    background-image: linear-gradient(to bottom,#337ab7 0,#265a88 100%);
    background-repeat: repeat-x;
    padding: 5px 10px;
    font-size: 12px;
    font-weight:bold;
    line-height: 1.5;
    border-radius: 3px;
    cursor: pointer;
    border-color: #265a88;
    text-shadow: 0 -1px 0 rgba(0,0,0,.2);
    box-shadow: inset 0 1px 0 rgba(255,255,255,.15),0 1px 1px rgba(0,0,0,.075);
}
button:hover{
    background-image: linear-gradient(to top,#337ab7 0,#265a88 100%);
    box-shadow: inset 0 1px 0 rgba(255,255,255,.25),0 1px 1px rgba(0,0,0,.175);
} */
</style>
<script type="text/javascript">
/* google.charts.load('current', {
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
		data.addRows([ [ 'food', 3 ], [ '交通費', 1 ], [ '文化費', 1 ], [ '教育費', 1 ],
				[ '生活費', 2 ] ]);

		var options = {
			'title' : '9월',
			//'is3D' : true,
			'width' : 700,
			'height' : 400,
			'backgroundColor' : 'transparent',
			'colors' : [ '#91A8D0', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6' ],
			'fontSize' : 20
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
		
		 var data = google.visualization.arrayToDataTable([
	          ['Category', '2017/08', '2017/09'],
	          ['식비', 1000, 400],
	          ['문화비', 1170, 460],
	          ['교통비', 660, 1120],
	          ['교육비', 1030, 540]
	        ]);

	        var options = {
	          chart: {
	            title: '월별 분석',
	            subtitle: '지난달과 이번달 소비 비교'
	            },
	            width : 700,
	         height : 400,
	         'backgroundColor': 'transparent',
	         'fontSize':20,
	         color:'pink'
	        };

	        var chart = new google.charts.Bar(document.getElementById('line_div'));
	        chart.draw(data, options);
	} */
</script>
</head>
<body>
<!-- <button id="pdf">pdf</button>
<hr/>
<div id="JSFiddle">
    <div id="chart_div" ></div>
	<div id="line_div" ></div>
</div>
</body>
<script type="text/javascript">       
		$('#pdf').click(function() {
			html2canvas(document.getElementById("JSFiddle"),{
				onrendered:function(canvas){
					var inputString = prompt('파일명을 입력하세요', 'KANEMOCHI_グラフ');
					var imgData = canvas.toDataURL('image/png');
					var doc = new jsPDF();
					doc.addImage(imgData,'JPEG',20,20);
					doc.save(inputString+'sample_file.pdf');
				}
			})
		})  

</script> -->
</html>