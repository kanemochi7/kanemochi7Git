<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
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
}
/* #chart_div, #line_div, #columnChart{
	width: 50%;
	display: inline-block;
	max-width: 700px;
	max-height: 0px;
	margin: 0 auto;
	padding: 0 auto;
} */
svg{
	background-color: rgba( 255, 255, 255, 0.7);
}
pdfbtn,pdfbtn2{
	width: 50px;
	margin-top: 30px;
}

</style>
<script type="text/javascript">
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
		var bank = ${price_bank};
		var culture = ${price_culture};
		var fashion = ${price_fashion};
		var food = ${price_food};
		var hospital = ${price_itai};
		var others = ${price_others};
		var study = ${price_study};
		var bus = ${price_transportation};
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([ [ '食べ物費',food], [ '交通費',bus], [ '文化費', culture], 
			[ '教育費', study],	[ '医慮費', hospital] ,['ファッション',fashion],['貯金',bank],['その他',others] ]);

		var options = {
			'title' : '',
			//'is3D' : true,
			'width' : 700,
			'height' : 400,
			'backgroundColor' : 'transparent',
			'colors' : [ '#DF0101', '#FE642E', '#F7FE2E', '#00FF00', '#0040FF','#0B0B61','#3A01DF','#B404AE'],
			'fontSize' : 20,
		};

		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
		chart.draw(data, options);
		
		// [Line Chart]
		/*  // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
         ['Month', '食べ物', '文化生活', 'ファッション', '医慮', '教育', '交通','貯金','その他'],
         ['2004/05',  165,      938,         522,             998,           450,614.6,614.6,      614.6],
         ['2005/06',  135,      1120,        599,             1268,          288,614.6,614.6,      682],
       
	    ]);
	
	    var options = {
	      title : 'Monthly Coffee Production by Country',
	      vAxis: {title: 'Cups'},
	      hAxis: {title: 'Month'},
	      width: 700,
	      height: 400,
	      seriesType: 'bars',
	      series: {9: {type: 'line'}}
	    };
	
	    var chart = new google.visualization.ComboChart(document.getElementById('line_div'));
	    chart.draw(data, options); */
	}
	
	$(function() {
		datepicker1();
	})
		function datepicker1() {
			$('#start_date1').datepicker({
				format: 'yyyy-mm-dd',
				autoclose: true,
				todayHighlight: true
			});
			$('#end_date1').datepicker({
				format: 'yyyy-mm-dd',
				autoclose: true,
				todayHighlight: true
			});
		}
	
	
	
	function loadChart() {
		var list1 = null;
		var list2 = null;
		var list1_price_food = 0;
		var list1_price_culture = 0;
		var list1_price_fashion = 0;
		var list1_price_book = 0;
		var list1_price_bus = 0;
		var list1_price_bank = 0;
		var list1_price_others = 0;
		var list1_price_hospital = 0;
		var list2_price_food = 0;
		var list2_price_culture = 0;
		var list2_price_fashion = 0;
		var list2_price_book = 0;
		var list2_price_bus = 0;
		var list2_price_bank = 0;
		var list2_price_others = 0;
		var list2_price_hospital = 0;
		$.ajax({
		     type : "POST" 
		     , url : "/kanemochi/getChartInfo1" //Request URL
		     , dataType : "json" //전송받을 데이터 타입
		     , data : {"date1":$('#start_date1').val()}
			 , async: true
		     , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		     , error : function(request, status, error) {
					     	alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
					   }
		     , success : function(data) {
		     	 			list1 = data;
						$.ajax({
						     type : "POST" 
						     , url : "/kanemochi/getChartInfo2" //Request URL
						     , dataType : "json" //전송받을 데이터 타입
						     , data : {"date2":$('#end_date1').val()}
							 , async: true
						     , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
						     , error : function(request, status, error) {
									     	alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
									   }
						     , success : function(data2) {
						     	 			list2 = data2;
						     	 			
											$(list1).each(function (index,item) {
												switch (item.category) {
												case "burger": case "ramen": case "sushi": case "cafe":
												case "dessert": case "beer": case "cvs":
													list1_price_food += item.record_price; 
													break;
												case "movie":
													list1_price_culture += item.record_price; 
													break;
												case "clothes": case "hair":
													list1_price_fashion += item.record_price; 
													break;
												case "hospital": 
													list1_price_hospital += item.record_price; 
													break;
												case "book":
													list1_price_book += item.record_price; 
													break;
												case "bus":
													list1_price_bus += item.record_price; 
													break;
												case "bank":
													list1_price_bank += item.record_price; 
													break;
												default:
													list1_price_others += item.record_price; 
													break;
												}
											});	
											
											$(list2).each(function (index,item) {
												switch (item.category) {
												case "burger": case "ramen": case "sushi": case "cafe":
												case "dessert": case "beer": case "cvs":
													list2_price_food += item.record_price; 
													break;
												case "movie":
													list2_price_culture += item.record_price; 
													break;
												case "clothes": case "hair":
													list2_price_fashion += item.record_price; 
													break;
												case "hospital": 
													list2_price_hospital += item.record_price; 
													break;
												case "book":
													list2_price_book += item.record_price; 
													break;
												case "bus":
													list2_price_bus += item.record_price; 
													break;
												case "bank":
													list2_price_bank += item.record_price; 
													break;
												default:
													list2_price_others += item.record_price; 
													break;
												}
											});
											var date1 = $('#start_date1').val();
											date1 = date1.substring(0,7);
											var date2 = $('#end_date1').val();
											date2 = date2.substring(0,7);
											var data = google.visualization.arrayToDataTable([
										         ['Month', '食べ物', '文化生活', 'ファッション',      '医慮',        '教育',   '交通',  '貯金',   'その他'],
										         [date1, list1_price_food, list1_price_culture, list1_price_fashion, list1_price_hospital, list1_price_book, list1_price_bus, list1_price_bank,  list1_price_others],
										         [date2, list2_price_food, list2_price_culture, list2_price_fashion, list2_price_hospital, list2_price_book, list2_price_bus, list2_price_bank,  list2_price_others],
										       
											    ]);
											
											    var options = {
											      title : date1+'と'+date2+'の比較グラフ',
											      vAxis: {title: 'カテゴリ'},
											      hAxis: {title: '月'},
											      width: 700,
											      height: 400,
											      backgroundColor : 'transparent',
											      seriesType: 'bars',
											      series: {9: {type: 'line'}}
											    };
											  	var chart = new google.visualization.ComboChart(document.getElementById('line_div'));
											    chart.draw(data, options);
											    
						     			 }
						     
						});
		
		
		     			 }
		});
		
		  
	}
	
		
	
</script>

<title>Insert title here</title>
</head>
<body>
<form>
	<input type="text" id="start_date1" name="start_date1" placeholder="start date">
	<input type="text" id="end_date1" name="end_date1" placeholder="end date">
	<input type="button" onclick="loadChart()" value="button">
</form>
<button id="pdfbtn">今月のグラフpdf</button><br>
<button id="pdfbtn2">比較グラフpdf</button>
<div id="jsChart_div">
    <div id="chart_div" style="float:left;"></div>
	<div id="line_div" style="float:left;">
	</div>
</div>
</body>
<script type="text/javascript">       
		$('#pdfbtn').click(function() {
			
			html2canvas(document.getElementById("chart_div"),{
				onrendered:function(canvas){
					var inputString = prompt('파일명을 입력하세요', 'KANEMOCHI_グラフ');
					var imgData = canvas.toDataURL('image/png');
					var doc = new jsPDF();
					doc.addImage(imgData,'png',20,20);
					console.log("wait");
					doc.save(inputString+'sample_file.pdf');
				}
			})
		}) 
		
		$('#pdfbtn2').click(function() {
			
			html2canvas(document.getElementById("line_div"),{
				onrendered:function(canvas){
					var inputString = prompt('파일명을 입력하세요', 'KANEMOCHI_グラフ');
					var imgData = canvas.toDataURL('image/png');
					var doc = new jsPDF();
					doc.addImage(imgData,'png',20,20);
					console.log("wait");
					doc.save(inputString+'sample_file.pdf');
				}
			})
		})  

</script>
</html>