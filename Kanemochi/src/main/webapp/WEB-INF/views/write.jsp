<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="/kanemochi/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/kanemochi/resources/css/bootstrap-datetimepicker.min.css">
<script src="/kanemochi/resources/js/bootstrap.js"></script>
<script src="/kanemochi/resources/js/bootstrap-datetimepicker.min.js"></script>
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
</style>
<script>
	$(function () {
	    $('#datetimepicker').datetimepicker();
	});
</script>


</head>
<body>
	<h1>[ write ]</h1>
	<table>
		<tr>
			<td>date</td>
			<!-- <td><input type="text" class="form-control input-sm"placeholder="date" id ="datetimepicker"></td> -->
			<td>
                <div class='input-group date' id='datetimepicker'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</td>
		</tr>
		<tr>
			<td>category</td>
			<td><input type="text" class="form-control input-sm" placeholder="category"></td>
		</tr>
		<tr>
			<td>price</td>
			<td><input type="text" class="form-control input-sm"
				placeholder="price"></td>
			<td><select class="form-control input-sm" id="select">
					<option>Won</option>
					<option>Yen</option>
					<option>Dollar</option>
					<option>Euro</option>
					<option>Pound</option>
			</select></td>
		</tr>
		<tr>
			<td>tag</td>
			<td><textarea class="form-control input-sm" rows="3" id="textArea"></textarea></td>
		</tr>
		<tr>
			<td>pay</td>
			<td><input type="radio"> cash <input type="radio">
				card</td>
		</tr>
		<tr>
			<td colspan="2"><a href="/kanemochi/member/"
				class="btn btn-success">back</a> <a href="#" class="btn btn-success">ok</a>
			</td>
		</tr>

	</table>
</body>
</html>