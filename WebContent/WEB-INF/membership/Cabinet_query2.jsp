<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/membership/topMVC.jsp" />
<!DOCTYPE html>
<c:set var="funcName" value="cabinetfood_query" scope="session" />
<html>
<head>
<meta charset="UTF-8">
<title>Query System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			minDate : "+0D",
			maxDate : "+30Y"
		})
	});
</script>
<style type="text/css">


h2 {
	text-align: center;
	padding: 20px;
}

form {
	margin: auto;
	width: 400px;
	padding: 20px;
}

.err {
	font-size: smaller;
	color: #CC0000
}

.button {
	padding: 10px;
	text-align: center
}

.alldata {
	width: 800px;
	border: 1px #cccccc solid;
	border-radius: 10px;
}

.section1{
 top-margin:10px;
 bottom-margin:10px;
	background-color: #ffffff;

}
 .section3 {
 top-margin:10px;
 bottom-margin:10px;
	background-color: #ffffff;

}

.section2{
 top-margin:10px;
 bottom-margin:10px;
	background-color: #F5F5F5;

}
.section4{
 top-margin:10px;
 bottom-margin:10px;
	background-color: #F5F5F5;

}

h4{
margin-top:5px;
margin-bottom:5px;
	text-align: center;

}

h5 {
margin-top:5px;
margin-bottom:5px;
	text-align: center;

}
body {
	font-family: 'Noto Sans TC', sans-serif;
	margin: auto;
	text-align: center;
}
</style>

<!--  <script>
function myFunction()
{
	var x =document.getElementById("nameid");
	alert("x >> " + x.value);
}
</script>-->
</head>
<body>
	<h2>查詢庫存</h2>
	<div class="alldata">
		<div class="section1">
			<tr>
				<th>
					<h4>查詢條件:</h4>&nbsp;
				</th>
			</tr>
		</div>

		<div class="section2">
			<form action="CabinetQueryAllServlet.do" method="post" class="form-horizontal">
			<tr>
				<td><h5>查詢全部食物</h5></td>
			</tr>
			<tr>
			<td>	
					<div class="button">
						<input type="submit" value="確認" class="btn btn-warning"> &nbsp;
						<input type="hidden" name="memberid" value="${mbID}" class="btn btn-warning">
					</div>
				</td>
			</tr>
			</form>
		</div>

		<div class="section3">
			<form action="XXXXXXXX" method="post" class="form-horizontal">
				<tr>
					<td>
						<h5>食物類別</h5> &nbsp;
						<input type="checkbox" name="foodclass"
						value="groceries"><label>食品雜貨</label>&nbsp; &nbsp;<input
						type="checkbox" name="foodclass" value="fastfood"><label>泡麵罐頭</label>
						&nbsp;<input type="checkbox" name="foodclass" value="drinks"><label>飲料沖泡</label><br>
						&nbsp;<input type="checkbox" name="foodclass" value="dessert"><label>零食點心</label>
						&nbsp;<input type="checkbox" name="foodclass" value="vegetabl"><label>蔬菜生鮮</label>
						&nbsp;<input type="checkbox" name="foodclass"
						value="dairyproducts"><label>蛋奶製品</label><br> &nbsp;<input
						type="checkbox" name="foodclass" value="meat"><label>魚/肉品類</label>
						&nbsp;<input type="checkbox" name="foodclass" value="others"><label>其他</label>
						<div class="button">
							<input type="submit" value="確認" class="btn btn-warning"
								onclick="myFunction()"> &nbsp; <input type="reset"
								value="清除" class="btn btn-warning">
						</div>
					</td>
				</tr>
			</form>
		</div>

		<div class="section4">
			<form action="XXXXXXXX" method="post" class="form-horizontal">
				<tr>
					<th>
						<h5>有效日期</h5>
					</th>
				</tr>

				<tr>
					<td><input type="text" id="datepicker" name="expirydate"
						class="form-control"><br />
						<div class="button">
							<input type="submit" value="確認" class="btn btn-warning"
								onclick="myFunction()"> &nbsp;
						</div></td>
				</tr>
			</form>
		</div>

	</div>
</body>
</html>
