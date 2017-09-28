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
	var data = new google.visualization.DataTable();
	// Declare columns
	data.addColumn('string', 'tag');
	data.addColumn('number', 'visit');
	data.addColumn('number', 'avg');
	data.addColumn('number', 'sum');
	
	var startdate = $("#start_date").val();
	var enddate = $("#end_date").val();
	var category = $("#select-category").val();
	$.ajax({
		url : '/kanemochi/record/getSelectDateRecord',
		method : 'post',
		cache : false,
		async: false,
		data : {"start_date":startdate, "end_date":enddate, "category":category},
		success: function (result) {
			console.log(typeof result);
				for (var i = 0; i < result.length; i++) {
			console.log(result[i].avg);
			console.log(result[i].sum);
			console.log(result[i].tag);
			console.log(result[i].visit);
			data.addRow([result[i].tag, result[i].visit, result[i].avg, result[i].sum]);
				}
			},
		error: function() {
			}
		});

	// Add data.
	
	var options = {
	title: category,
/* 	width: 1200, 
    height: 450,
    sortBubblesBySize: true,
	backgroundColor: 'transparent' */
	hAxis: {title: 'visit'},
	vAxis: {title: 'average'},
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
		<select class="select" id="select-category" name="select-category" onchange="drawChart()">
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