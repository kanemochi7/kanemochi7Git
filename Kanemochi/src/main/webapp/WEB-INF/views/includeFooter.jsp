<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	* {
		font-family: "GoodFont";
	}
	body {

		height: 100%;
		width: 100%;
	}
	div {
		text-align: center;
	}
	.foot {
		display: inline;
		margin-left: 10px;
		margin-right: 10px;
		float: left;
	}
	#p_footer {
		/* color: white; */
		text-align: center;
		font-size: 15px;
	}
	.icon_footer {
		width: auto;
		height: 50px;
		margin: 10px;
		float: left;
	}
	#write {
		margin-left: 30px;
		margin-right: 30px;
	}
	#btn_setbudget, #btn_modifybudget{
		display: none;
	}
	
div.blueTable {
  width: 500px;
  height: 200px;
  text-align: center;
  float: center;
}
.divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
  padding: 3px 2px;
  float: center;
}
.divTable.blueTable .divTableBody .divTableCell {
	float: center;
	font-size: 20px;
}
.blueTable .tableFootStyle {
	float: center;  font-size: 20px;
}
/* DivTable.com */
.divTable{ display: table; float: center;}
.divTableRow { display: table-row; }
.divTableHeading { display: table-header-group;}
.divTableCell, .divTableHead { display: table-cell;}
.divTableHeading { display: table-header-group;}
.divTableFoot { display: table-footer-group;}
.divTableBody { display: table-row-group;}

/* The Modal (background) */
	.modal {
		text-align: center;
		vertical-align: middle;

	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    padding-top: 100px; /* Location of the box */
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    left: 0;
	    top: 0;
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
/* Modal Content */
	.modal-content {
		text-align: center;
	    vertical-align: middle;

	    width: 50%;
	    background-color: #aaaaaa;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #888;
	}
	.select {
		background-color: #fefefe;
		color: #aaaaaa;
	}
	
/* The Close Button */
	.close {
	    color: #aaaaaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}
</style>
<script>
var user_level = "1";

$(function() {
	datepicker();
	login_times(); //로그인횟수 체크 -> upExp -> 초기프로그레스바 설정 -> 광역 변수에 레벨 정보 저장
	setModal_budget();
	/* setProgressbar_exp(); */
	setProgressbar_budget();
	
	
	$(".click").on('click', function() {
		var audio = new Audio("/kanemochi/resources/sound/ClickOn.wav");
		audio.volume = 1;
		audio.play();
	})

});

	function datepicker() {
		$('#record_date').datepicker({
			format: 'yyyy/mm/dd',
			autoclose: true,
			todayHighlight: true
		});
	}
	
	function input() {
		/* 유효성 검사 아직 안함 */
		var param = $("#input-form").serialize();
		$.ajax({
		url : '/kanemochi/record/input',
		method : 'post',
		cache : false,
		data : param,
		success: function (result) {
			document.getElementById(result.category).textContent = result.count.toString();
			document.getElementById("modal_write").style.display = "none";
			document.getElementById("input-form").reset();
			
			var month = document.getElementById("month_result").innerHTML;
			var monthly = Number(month.replace(/,/g, ""));
			
			setProgressbar_budget();
			},
		error: function() {
			}
		});
	}	
	
	function setProgressbar_budget() {
		var budget = 0;
		var expense = 0;
		
		//budget
		$.ajax({
			url : '/kanemochi/record/getbudget',
			method : 'get',
			success: function (result_b) {
				budget = result_b.monthly;
				document.getElementById("show_budget").innerHTML = "￥"+numberWithCommas(budget);

				//expense
				$.ajax({
					url : '/kanemochi/record/getExpense',
					method : 'get',
					success: function (result_e) {
						expense = result_e;
						document.getElementById("show_spend").innerHTML = "￥"+numberWithCommas(expense);

						//progress set
						var elem = document.getElementById("budget_progress");
						var value = 0;
						var width = 0;
						if (expense != 0 && budget != 0) {
							value = expense/budget*100;
						}
						var id = setInterval(frame, 10);
						function frame() {
							if (width >= value) {
						    	clearInterval(id);
						    } else {
						      width++; 
						      elem.style.width = width*5 + 'px'; 
						      elem.innerHTML = width*1  + '%';
							}
						}
					},
					error: function() {
					}
				});
			},
			error: function() {
			}
		});
	}

	function setProgressbar_exp() {
		var level_img ="";
		var full_score = 0;
		
		$.ajax({
			url : '/kanemochi/exp/getExp',
			method : 'get',
			cache : false,
			success: function (user_score) {
				console.log("setProgressbar_exp() - ajax : /kanemochi/record/getExp -> 현재 사용자 점수 :"+user_score);
				if (user_score < 300) {
					user_level="1";
					level_img="level1";
					full_score = 300;
				} else if (user_score < 700) {
					user_level="2";
					level_img="level2";
					user_score = user_score-300;
					full_score = 700-300;
				} else if (user_score < 1240) {
					user_level="3";
					level_img="level3";
					user_score = user_score-700;
					full_score = 1240-700;
				} else if (user_score < 2000) {
					user_level="4";
					level_img="level4";
					user_score = user_score-1240;
					full_score = 2000-1240;
				} else if (user_score < 3120) {
					user_level="5";
					level_img="level5";
					user_score = user_score-2000;
					full_score = 3120-2000;
				} else if (user_score < 4620) {
					user_level="6";
					level_img="level6";
					user_score = user_score-3120;
					full_score = 4620-3120;
				} else if (user_score < 6600) {
					user_level="7";
					level_img="level7";
					user_score = user_score-4620;
					full_score = 6600-4620;
				} else if (user_score < 9000) {
					user_level="8";
					level_img="level8";
					user_score = user_score-6600;
					full_score = 9000-6600;
				} else if (user_score < 12000) {
					user_level="9";
					level_img="level9";
					user_score = user_score-9000;
					full_score = 12000-9000;
				} else if (user_score > 12000) {
					user_level="10";
					level_img="level10";
					/* user_score = user_score-12000;
					full_score = user_score; */
				}
				
				var level_img_url = "/kanemochi/resources/image/level/"+level_img+".png";
				$("#level").attr("src", level_img_url);

				var elem = document.getElementById("exp_progress");
				var value = 0;
				var width = 0;
				if (user_score != 0 && full_score != 0 && user_score <= 12000) {
					value = user_score/full_score*100;
					var id = setInterval(frame, 10);
						function frame() {
							if (width >= value) {
								clearInterval(id);
						    } else {
						      width++;
						      elem.style.width = width*5 + 'px';
						      elem.innerHTML = width*1  + '%';
						    }
						}
						document.getElementById("next_level").innerHTML = numberWithCommas(full_score)+"xp";
						document.getElementById("show_point").innerHTML = numberWithCommas(user_score)+"xp";
						
				} else if (user_score > 12000) {
					elem.style.width = 500+'px';
					elem.innerHTML = "LEVEL COMPLETE!";
					document.getElementById("next_level").innerHTML = "MAX";
					document.getElementById("show_point").innerHTML = "MAX";
				}
			},
			error: function() {
					}
			});
	}

	function setModal_budget() {
		//budget
		$.ajax({
			url : '/kanemochi/record/getbudget',
			method : 'get',
			success: function (result) {
				if (result.monthly != 0) {
					document.getElementById("budget_input_text").style.display = "none";
					document.getElementById("btn_setbudget").style.display='none';
					document.getElementById("btn_changebudget").style.display='block';
				} else if (result.monthly == 0) {
					document.getElementById("budget_input_text").style.display = "block";
					document.getElementById("btn_setbudget").style.display='block';
					document.getElementById("btn_changebudget").style.display='none';
				}
				document.getElementById("month_result").innerHTML = numberWithCommas(result.monthly);
				document.getElementById("weekly_result").innerHTML = numberWithCommas(result.weekly);
				document.getElementById("daily_result").innerHTML = numberWithCommas(result.daily);
			},
			error: function() {
			}
		});
	}
	
	function setbudget() {
		var month = document.getElementById("month_result").innerHTML;
		var week = document.getElementById("weekly_result").innerHTML;
		var day =  document.getElementById("daily_result").innerHTML;
		var monthly = Number(month.replace(/,/g, ""));
		var weekly = Number(week.replace(/,/g, ""));
		var daily = Number(day.replace(/,/g, ""));
		$.ajax({
		url : '/kanemochi/record/setbudget',
		method : 'post',
		cache : false,
		data : {"monthly":monthly,"weekly":weekly,"daily":daily},
		success: function (result) {
			setModal_budget();
			setProgressbar_budget();
			var modal_budget = document.getElementById('modal_budget');
			modal_budget.style.display = "none";
			},
		error: function() {
			}
		});
	}

	function changebudget() {
		document.getElementById("budget_input_text").style.display = "block";
		document.getElementById("btn_setbudget").style.display='block';
		document.getElementById("btn_changebudget").style.display='none';
		cal();
	}
	
	function f_leapyear(yy) {
		if (yy%4==0 && yy%100!=0 || yy%400==0) return 1;
		else return 0;
	}
	function f_weekofmonth(year,month) {
		var nowDate = new Date(year, month-1, 1);
		var lastDate = new Date(year, month, 0).getDate();
		var monthSWeek = nowDate.getDay();
		var weekSeq = parseInt((parseInt(lastDate) + monthSWeek - 1)/7) + 1;
		return weekSeq;
	}
	function f_dayofmonth(year,month) {
		switch(month) {
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
		return 31;
		case 4: case 6: case 9: case 11:
		return 30;
		case 2:
		return 28 + f_leapyear(year);
		}
	}
	
	function cal(){
		var date = new Date();
		var year = date.getFullYear();
		var month = 1 + date.getMonth();
		
		var howmanyweeks = f_weekofmonth(year, month);
		var howmanydays = f_dayofmonth(year, month);
		
		var budget_Monthly = document.getElementById("budget_month").value;
		var budget_Weekly = budget_Monthly/howmanyweeks;
		var budget_Daily = budget_Monthly/howmanydays;
			if (budget_Monthly == "") {
				budget_Monthly = '0';
				budget_Monthly = Number(budget_Monthly);
			}
		document.getElementById("month_result").innerHTML = numberWithCommas(parseInt(budget_Monthly));
		document.getElementById("weekly_result").innerHTML = numberWithCommas(parseInt(budget_Weekly));
		document.getElementById("daily_result").innerHTML = numberWithCommas(parseInt(budget_Daily));
		document.getElementById("btn_setbudget").style.display='block';
	}
	
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function login_times() {
		var exp = 0;
		$.ajax({
			url : '/kanemochi/exp/login_times',
			method : 'get',
			success: function (result) {
				exp = 1000;
/* 				if (result == 5) {
					alert("ログイン"+result+"回! ＋"+result*2+"px");
					exp = result*2;
				} else if (result == 10) {
					alert("ログイン"+result+"回! ＋"+result*2+"px");
					exp = result*2;
				} else if (result == 15) {
					alert("ログイン"+result+"回! ＋"+result*2+"px");
					exp = result*2;
				} else if (result == 20) {
					alert("ログイン"+result+"回! ＋"+result*2+"px");
					exp = result*2;
				} else if (result == 25) {
					alert("ログイン"+result+"回! ＋"+result*2+"px");
					exp = result*2;
				} else if (result == 30) {
					alert("ログイン"+result+"回! ＋"+result*2+"px");
					exp = result*2;
				} else if (result == 35) {
					alert("ログイン"+result+"回! ＋"+result*2+"px");
					exp = result*2;
				} else if (result == 45) {
					alert("ログイン"+result+"回! ＋"+result*2+"px");
					exp = result*2;
				} else {
					
				}
 */				upExp(exp);
			},
			error: function() {
				}
			});
	}
	
	function upExp(exp) {
		$.ajax({
			url : '/kanemochi/exp/getExp',
			method : 'get',
			cache : false,
			success: function (user_score) {
				$.ajax({
					url : '/kanemochi/exp/upExp',
					method : 'get',
					data : {"exp":exp, "user_score":user_score},
					success: function () {
				var pre_point = user_score;
				var post_point = Number(exp) + Number(user_score);
				var level_img = "level1";
				var level_title = 1;

				if (pre_point < 300 && post_point >= 300) {
					level_img="level2";
					level_title = 2;
					var audio_LevelUp = new Audio("/kanemochi/resources/sound/MusicBox.wav");
					audio_LevelUp.volume = 1;
					audio_LevelUp.play();
				} else if (pre_point < 700 && post_point >= 700) {
					level_img="level3";
					level_title = 3;
					var audio_LevelUp = new Audio("/kanemochi/resources/sound/MusicBox.wav");
					audio_LevelUp.volume = 1;
					audio_LevelUp.play();
				} else if (pre_point < 1240 && post_point >= 1240) {
					level_img="level4";
					level_title = 4;
					var audio_LevelUp = new Audio("/kanemochi/resources/sound/MusicBox.wav");
					audio_LevelUp.volume = 1;
					audio_LevelUp.play();
				} else if (pre_point < 2000 && post_point >= 2000) {
					level_img="level5";
					level_title = 5;
					var audio_LevelUp = new Audio("/kanemochi/resources/sound/MusicBox.wav");
					audio_LevelUp.volume = 1;
					audio_LevelUp.play();
				} else if (pre_point < 3120 && post_point >= 3120) {
					level_img="level6";
					level_title = 6;
					var audio_LevelUp = new Audio("/kanemochi/resources/sound/MusicBox.wav");
					audio_LevelUp.volume = 1;
					audio_LevelUp.play();
				} else if (pre_point < 4620 && post_point >= 4620) {
					level_img="level7";
					level_title = 7;
					var audio_LevelUp = new Audio("/kanemochi/resources/sound/MusicBox.wav");
					audio_LevelUp.volume = 1;
					audio_LevelUp.play();
				} else if (pre_point < 6600 && post_point >= 6600) {
					level_img="level8";
					level_title = 8;
					var audio_LevelUp = new Audio("/kanemochi/resources/sound/MusicBox.wav");
					audio_LevelUp.volume = 1;
					audio_LevelUp.play();
				} else if (pre_point < 9000 && post_point >= 9000) {
					level_img="level9";
					level_title = 9;
					var audio_LevelUp = new Audio("/kanemochi/resources/sound/MusicBox.wav");
					audio_LevelUp.volume = 1;
					audio_LevelUp.play();
				} else if (pre_point < 12000 && post_point >= 12000) {
					level_img="level10";
					level_title = 10;
					var audio_LevelUp = new Audio("/kanemochi/resources/sound/MusicBox.wav");
					audio_LevelUp.volume = 1;
					audio_LevelUp.play();
				} else {
					level_img="no change";
				}
				var level_img_url = "/kanemochi/resources/image/level/"+level_img+".png";
				/* $("#level").attr("src", level_img_url); */
				
				setProgressbar_exp();
					},
					error: function() {
							}
					});

				},
			error: function() {
					}
			});
	}
	/* modal_budget */
		var modal_budget = document.getElementById("modal_budget");
		var btn_b = document.getElementById("budget");
		var span_b = document.getElementById("close_modal_budget");
		btn_b.onclick = function() {
			modal_budget.style.display = "block";
			span_b.onclick = function() {
				modal_budget.style.display = "none";
			}
			window.onclick = function(event_b) {
				if (event_b.target == modal_budget) {
					modal_budget.style.display = "none";
				}
			}
		};
	/* modal_write */
		var modal_write = document.getElementById('modal_write');
		var btn_w = document.getElementById("write");
		var span_w = document.getElementsByClassName("close")[0];
		btn_w.onclick = function() {
			var check = document.getElementById("month_result").innerHTML;
			if (check == 0) {
				alert("budget first!");
				modal_budget.style.display = "block";
				span_b.onclick = function() {
					modal_budget.style.display = "none";
				}
				window.onclick = function(event_b) {
					if (event_b.target == modal_budget) {
						modal_budget.style.display = "none";
					}
				}
			} else {
				modal_write.style.display = "block";
				span_w.onclick = function() {
					modal_write.style.display = "none";
				}
				window.onclick = function(event_w) {
					if (event.target == modal_write) {
						modal_write.style.display = "none";
					}
				}
			}
		};
	/* modal_write - category change */
	function itemChange(){
		var food = ["バーがー","ラーメン","すし", "カフェ", "デザート", "ビール", "コンビニ"];
		var culture = ["映画"];
		var fashion = ["服","美容室"];
		var medical = ["病院"];
		var education = ["本"];
		var transportation = ["バス"];
		var save = ["銀行"];
		 
		var selectItem = $("#select-category").val();
		var changeItem;
		
		if(selectItem == "食べ物"){
			changeItem = food;
		}
		else if(selectItem == "文化生活"){
			changeItem = culture;
		}
		else if(selectItem == "ファッション"){
			changeItem =  fashion;
		}
		else if(selectItem == "医慮"){
			changeItem =  medical;
		}
		else if(selectItem == "教育"){
			changeItem = education;
		}
		else if(selectItem == "交通"){
			changeItem = transportation;
		}
		else if(selectItem == "貯金"){
			changeItem = save;
		}
		
		$("#category").empty();
		for(var count = 0; count < changeItem.length; count++){
			var option = "<option value='"+changeItem[count]+"'>"+changeItem[count]+"</option>";
			$("#category").append(option);
		}
	};
</script>
</head>
<body>
<div>
	<div class="foot"><img class="icon_footer click" data-toggle="tooltip" data-placement="top" title="記録" id="write" src="/kanemochi/resources/image/icon/write.png"></div>
	<div class="foot"><img class="icon_footer click" data-toggle="tooltip" data-placement="top" title="予算" id="budget" src="/kanemochi/resources/image/icon/moneyPack.png"></div>
	<div class="foot">
		<div style="width:500px; height:30px; margin-top:10px; background-color:#e8e8e8; border-radius: 10px;">
			<div id="budget_progress" style="width:0px; height:30px; padding:5px; background-color:#fff3b2; text-align:center; border-radius: 10px;"></div>
		</div>
		<div style="color: black;">今まで使ったお金 ： <span id="show_spend"></span> / 全体予算 ： <span id="show_budget"></span></div>	
	</div>
	
	<div class="foot"><img class="icon_footer click" data-toggle="tooltip" data-placement="top" title="ポイント" id="exp" src="/kanemochi/resources/image/icon/exp.png"></div>
	<div class="foot">
		<div style="width:500px; height:30px; margin-top:10px; background-color:#e8e8e8; border-radius:10px;">
			<div id="exp_progress" style="width:0px; height:30px; padding:5px; background-color:#fff3b2; text-align:center; border-radius:10px;"></div>
		</div>
		<div style="color: black;">今までのポイント ： <span id="show_point"></span> / 次のレベルまでのポイント ： <span id="next_level"></span></div>	
	</div>
	<div class="foot"><img class="icon_footer click" id="level" src="/kanemochi/resources/image/level/level1.png"></div>
</div>

<!-- Modal_write -->
<div id="modal_write" class="modal">
	<div class="modal-content">
		<span class="close" id="close_modal_write">&times;</span>
		<h3>支出</h3>
		<h4>[今日はいくら使いましたか？]</h4>
			<form id="input-form" name="input-form">
			<div class="divTable blueTable" style="text-align: center; position: relative; left: 15%;">
				<div class="divTableBody">
					<div class="divTableRow">
						<div class="divTableCell">date</div>
						<div class="divTableCell"><input type="text" style="width: 250px; text-align: left;" id="record_date" name="record_date" placeholder="date"></div>
					</div>
					<div class="divTableRow">
						<div class="divTableCell">category</div>
						<div class="divTableCell">
							<select class="select" id="select-category" name="select-category" onchange="itemChange()">
								<option>選択してください！</option>
								<option value="食べ物">食べ物</option>
								<option value="文化生活">文化生活</option>
								<option value="ファッション">ファッション</option>
								<option value="医慮">医慮</option>
								<option value="教育">教育</option>
								<option value="交通">交通</option>
								<option value="貯金">貯金</option>
							</select>
							<select class="select" id="category" name="category">
							</select>
						</div>
					</div>
					<div class="divTableRow">
						<div class="divTableCell">price</div>
						<div class="divTableCell">
							<input type="text" style="width: 232px; text-align: left;" id="record_price" name="record_price" placeholder="値">￥
						</div>
					</div>
					<div class="divTableRow">
						<div class="divTableCell">tag</div>
						<div class="divTableCell"><textarea rows="3" id="record_tag" style="width: 250px; text-align: left;" name="record_tag" placeholder="#item"></textarea></div>
					</div>
					<div class="divTableRow">
						<div class="divTableCell">pay</div>
						<div class="divTableCell">
							<input type="radio" name="record_pay" id="cash" value="cash" checked="checked">cash 
							<input type="radio" name="record_pay" id="card" value="card" >card
						</div>
					</div>
					<div class="divTableRow">
						<div class="divTableCell"></div>
						<div class="divTableCell">
							<input type="button" class="btn btn-primary click" value=" ok " onclick="input()">
							<input type="reset" class="btn btn-success click" value="reset">
						</div>
					</div>
				</div>
			</div>
			</form>
	</div>
</div>

<!-- Modal_budget -->
<div id="modal_budget" class="modal">
	<div class="modal-content">
		<span class="close" id="close_modal_budget">&times;</span>
		<h3>Budget</h3>
		<p id="p_footer">[<span id="today_year_budget"></span>年<span id="today_month_budget"></span>月]</p>
		<form id="budget_form" name="budget_form">
		<div class="divTable blueTable" style="text-align: center; position: relative; left: 10%;">
			<div class="divTableBody">
				<div class="divTableRow" id="budget_input_text">
					<div class="divTableCell"></div>
					<div class="divTableCell"><input type="text" id="budget_month" placeholder="一ヵ月の予算" onkeyup="cal()"></div>
					<div class="divTableCell">￥</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell">monthly budget</div>
					<div class="divTableCell"><span id="month_result"></span></div>
					<div class="divTableCell">￥</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell">weekly budget</div>
					<div class="divTableCell"><span id="weekly_result"></span></div>
					<div class="divTableCell">￥</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell">daily budget</div>
					<div class="divTableCell"><span id="daily_result"></span></div>
					<div class="divTableCell">￥</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell"></div>
					<div class="divTableCell">
						<input type="button" id="btn_setbudget" class="btn btn-primary click" value="save this plan" onclick="setbudget()">
						<input type="button" id="btn_changebudget" class="btn btn-success click" value="change the plan" onclick="changebudget()">
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</div>
<script>
//광역변수
//user_level
//user_character_js

/* function getCharacter() {
	$.ajax({
		url : '/kanemochi/exp/getCharacter',
		method : 'get',
		cache : false,
		success: function (character) {
		
		},
		error: function() {
		}
	});	
} */


/*
game.js 에 추가할 것들

var GameState = {
  preload:function(){

	  this.load.spritesheet('chineseGirl', '/kanemochi/resources/image/character/character_final/chineseGirl_final.png', 150, 200);
	  this.load.spritesheet('catGirl', '/kanemochi/resources/image/character/character_final/catGirl_final.png', 150, 200);
	  this.load.spritesheet('pinkGirl', '/kanemochi/resources/image/character/character_final/pink_final.png', 150, 200);
	  this.load.spritesheet('englishBoy', '/kanemochi/resources/image/character/character_final/englishBoy_final.png', 150, 200);
	  this.load.spritesheet('coolBoy', '/kanemochi/resources/image/character/character_final/coolBoy_final.png', 150, 200);
	  this.load.spritesheet('usoku', '/kanemochi/resources/image/character/character_final/Usoku_final.png', 150, 200);

  }

game.js 에서 삭제할 것들
var userCharacter;
userCharacter = this.game.add.sprite(0,0,'mainCharacter');

userCharacter.scale.setTo(0.5);
userCharacter.y = game.world.height - userCharacter.height;
game.physics.arcade.enable(userCharacter);

var wink = userCharacter.animations.add('wink',[4,5],2,true);
var leftWalk = userCharacter.animations.add('leftWalk',[0,1],2,true);
var rightWalk = userCharacter.animations.add('rightWalk',[2,3],2,true);
userCharacter.play('wink');

game.js*/




function userCharacterBehavior(userCharacter,situation){
	var randBehavior = Math.floor(Math.random() * 2);
		comeUserCharacter(userCharacter,situation);
}

function comeUserCharacter(userCharacter,situation){
	if(userCharacter.x < 300 && userDirection=='right'){
		userCharacter.play('rightWalk');
		userCharacter.x = userCharacter.x+1;
	}
	else if(userCharacter.x > 0 && userDirection == 'left'){
		userCharacter.play('leftWalk');
		userCharacter.x = userCharacter.x-1;
	}
	if(userCharacter.x ==300){
		var ballon = this.game.add.sprite(300+(userCharacter.width*2),userCharacter.y-(userCharacter.height*1.2),'onlySpeech');
		ballon.anchor.set(0.5);
		ballon.scale.setTo(-0.3,0.3);
		ballon.x -= userCharacter.width;
		userCharacter.play('wink');
	if(situation == 'levelUP'){
		var joun=  game.add.text(150,-350,"레벨 업", { font: "100px arial", fill: "#000000", align: "center" });
		joun.scale.setTo(-1,1);
		ballon.addChild(joun);
		var levelImg = game.add.sprite(+150,-200,'level_'+level);
		levelImg.scale.setTo(-1.5,1.5);
		ballon.addChild(levelImg);
	}	
	else{
		var joun=  game.add.text(300,-200,"히오스는 갓겜", { font: "100px arial", fill: "#000000", align: "center" });
		joun.scale.setTo(-1,1);
		ballon.addChild(joun);
	}	
		setTimeout(function(){
			userDirection = 'left';
			ballon.destroy();
		},2000);
	}
	else if(userCharacter.x ==0){
		userDirection = 'right';
		userCharacter.play('wink');
		beforeLevel = level;
	}
}
</script>
</body>
</html>