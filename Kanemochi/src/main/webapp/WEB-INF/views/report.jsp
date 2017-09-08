<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<style type="text/css">
body {
	margin: 50px;
	text-align: center;
}

table {
	margin: auto;
	text-align: center;
}

th, td {
	padding: 10px;
}
div {
	display: inline-block;
}
</style>
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
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
		data.addRows([ [ 'Mushrooms', 3 ], [ 'Onions', 1 ], [ 'Olives', 1 ],
				[ 'Zucchini', 1 ], [ 'Pepperoni', 2 ] ]);

		// Set chart options
		var options = {
			'title' : 'Where have my money gone?',
			'is3D' : true,
			'width' : 600,
			'height' : 300
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);

		// [Line Chart]
		var data = new google.visualization.DataTable();
		data.addColumn('number', 'Day');
		data.addColumn('number', 'Guardians of the Galaxy');
		data.addColumn('number', 'The Avengers');
		data.addColumn('number', 'Transformers: Age of Extinction');

		data.addRows([ [ 1, 37.8, 80.8, 41.8 ], [ 2, 30.9, 69.5, 32.4 ],
				[ 3, 25.4, 57, 25.7 ], [ 4, 11.7, 18.8, 10.5 ],
				[ 5, 11.9, 17.6, 10.4 ], [ 6, 8.8, 13.6, 7.7 ],
				[ 7, 7.6, 12.3, 9.6 ], [ 8, 12.3, 29.2, 10.6 ],
				[ 9, 16.9, 42.9, 14.8 ], [ 10, 12.8, 30.9, 11.6 ],
				[ 11, 5.3, 7.9, 4.7 ], [ 12, 6.6, 8.4, 5.2 ],
				[ 13, 4.8, 6.3, 3.6 ], [ 14, 4.2, 6.2, 3.4 ] ]);

		var options = {
			chart : {
				title : 'My money, please come back to me.',
				subtitle : '월별 변동'
			},
			width : 600,
			height : 300,
			axes : {
				x : {
					0 : {
						side : 'top'
					}
				}
			}
		};

		var chart = new google.charts.Line(document
				.getElementById('line_top_x'));
		chart.draw(data, google.charts.Line.convertOptions(options));
	}
</script>

</head>

<body>
	<h1>[Report]</h1>
	<div id="chart_div"></div>
	<div id="line_top_x"></div>

	<!-- <p>Column Chart</p>
  	<div id="chart_div2"></div> -->
	<!-- <p>Line Chart</p> -->
</body>
</html>
