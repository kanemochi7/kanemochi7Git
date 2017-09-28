<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Statistics</title>
<link rel="icon" href="/kanemochi/resources/image/favicon.png">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />

<script src="/kanemochi/resources/js/print.js" ></script>
<!-- <link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css"> -->
<link href="/kanemochi/resources/js/fullcalendar.css" rel="stylesheet" />
<link href="/kanemochi/resources/js/fullcalendar.print.css" rel="stylesheet" media="print" />
<!-- <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css"> -->
<script type="text/javascript" src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/fullcalendar.js"></script>
<script type="text/javascript" src="/kanemochi/resources/js/jquery.techbytarun.excelexportjs.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/kanemochi/resources/js/html2canvas.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script src="/kanemochi/resources/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap-datepicker.min.css">
<!-- <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script> -->
<style>
body {
	background-image:url(/kanemochi/resources/image/bg/bg2.png);
}
div.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}
div.tab button:hover {
    background-color: #ddd;
}
div.tab button.active {
    background-color: #ccc;
}
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
</style>
</head>
<body>
<div id="header">
	<%-- <jsp:include page="includeHeader.jsp"></jsp:include> --%>
</div>

<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'Calendar')" id="defaultOpen">Calendar</button>
  <button class="tablinks" onclick="openCity(event, 'Chart')">PieChart</button>
  <button class="tablinks" onclick="openCity(event, 'BubbleChart')">BubbleChart</button>
  <button class="tablinks" onclick="openCity(event, 'AllRecords')">AllRecords</button>
</div>

<div id="Calendar" class="tabcontent">
	<%-- <jsp:include page="includeCalendar.jsp"></jsp:include> --%>
</div>

<div id="PieChart" class="tabcontent">
	<%-- <jsp:include page="includeChart.jsp"></jsp:include> --%>
</div>

<div id="BubbleChart" class="tabcontent">
	<%-- <jsp:include page="includeBubbleChart.jsp"></jsp:include> --%>
</div>

<div id="AllRecords" class="tabcontent">
	<%-- <jsp:include page="includeAllRecords.jsp"></jsp:include> --%>
</div>

<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
</body>
</html> 
