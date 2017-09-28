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

	var data = google.visualization.arrayToDataTable([
		['ID', 'Life Expectancy', 'Fertility Rate', 'Region',     'Population'],
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

	var options = {
	title: 'Correlation between life expectancy, fertility rate ' + 'and population of some world countries (2010)',
	hAxis: {title: 'Life Expectancy'},
	vAxis: {title: 'Fertility Rate'},
	bubble: {
			textStyle: {
			auraColor: 'none',
			}
		}
	};

	var chart = new google.visualization.BubbleChart(document.getElementById('noAura'));

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
	<form>
	<div class="sub-div">
		<input type="text" id="start_date" name="start_date" placeholder="start date">
		<input type="text" id="end_date" name="end_date" placeholder="end date">
	</div>
	<div class="sub-div">
		<select class="select" id="select-category" name="select-category" onchange="">
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
	</form>
</div>
<div id="noAura" style="width: 900px; height: 500px;"></div>
</body>
</html>