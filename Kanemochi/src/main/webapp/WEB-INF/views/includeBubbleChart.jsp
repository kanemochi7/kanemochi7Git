<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var category = document.getElementById("");
	var data = google.visualization.arrayToDataTable([
		['TAG',   'AVG MONEY',            'VISIT',           'TAG',     'SPEND'],
		['CAN',    80.66,              1.67,      'North America',  33739900],
		['DEU',    79.84,              1.36,      'Europe',         81902307],
		['DNK',    78.6,               1.84,      'Europe',         5523095],
		['EGY',    72.73,              2.78,      'Middle East',    79716203],
		['GBR',    80.05,              2,         'Europe',         61801570],
		['IRN',    72.49,              1.7,       'Middle East',    73137148],
		['IRQ',    68.09,              4.77,      'Middle East',    31090763],
		['ISR',    81.55,              2.96,      'Middle East',    7485600],
		['RUS',    68.6,               1.54,      'Europe',         141850000],
		['USA',    78.09,              2.05,      'North America',  307007000]
	]);

	var data = new google.visualization.DataTable();

	// Declare columns
	data.addColumn('string', 'Employee Name');
	data.addColumn('datetime', 'Hire Date');

	// Add data.
	data.addRows([
	  ['Mike', {v:new Date(2008,1,28), f:'February 28, 2008'}], // Example of specifying actual and formatted values.
	  ['Bob', new Date(2007,5,1)],                              // More typically this would be done using a
	  ['Alice', new Date(2006,7,16)],                           // formatter.
	  ['Frank', new Date(2007,11,28)],
	  ['Floyd', new Date(2005,3,13)],
	  ['Fritz', new Date(2011,6,1)]
	]);

	
	var options = {
	title: category,
	hAxis: {title: 'Life Expectancy'},
	vAxis: {title: 'Fertility Rate'},
	bubble: {
			textStyle: {
			auraColor: 'none',
			}
		}
	};

	var chart = new google.visualization.BubbleChart(document.getElementById('bubbleChart'));

	chart.draw(data, options);
}

///////////////////////

$(function() {
	datepicker();
})
	function datepicker() {
		$('#start_date').datepicker({
			format: 'yyyy-mm-dd',
			autoclose: true,
			todayHighlight: true
		});
		$('#end_date').datepicker({
			format: 'yyyy-mm-dd',
			autoclose: true,
			todayHighlight: true
		});
	}

	function getData() {
		var startdate = $("#start_date").val();
		var enddate = $("#end_date").val();
		var category = $("#select-category").val();
		console.log(typeof startdate);
		console.log(startdate);
		console.log(typeof enddate);
		console.log(enddate);
		console.log(category);
		$.ajax({
			url : '/kanemochi/record/getSelectDateRecord',
			method : 'post',
			cache : false,
			data : {"start_date":startdate, "end_date":enddate, "category":category},
			success: function (result) {
				console.log(typeof result);
				console.log(result);
				},
			error: function() {
				}
			});
	}
</script>
<style>
.sub-div {
	padding: 10px;
	display: inline-block;
}
</style>
</head>
<body>
<div>
	<div class="sub-div">
		<input type="text" id="start_date" name="start_date" placeholder="start date">
		<input type="text" id="end_date" name="end_date" placeholder="end date">
	</div>
	<div class="sub-div">
		<select class="select" id="select-category" name="select-category" onchange="getData()">
			<option>カテゴリ選択</option>
			<option value="食べ物">食べ物</option>
			<option value="文化生活">文化生活</option>
			<option value="ファッション">ファッション</option>
			<option value="医慮">医慮</option>
			<option value="教育">教育</option>
			<option value="交通">交通</option>
			<option value="貯金">貯金</option>
		</select>
	</div>
</div>
<div id="bubbleChart" style="width: 900px; height: 500px;"></div>
</body>
</html>