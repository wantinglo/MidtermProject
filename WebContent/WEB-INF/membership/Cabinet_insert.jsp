<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/membership/topMVC.jsp" />
<!DOCTYPE html>
<c:set var="funcName" value="cabinetfood_insert" scope="session" />
<html>
<head>
<meta charset="UTF-8">
<title>Login System</title>
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
body {
	font-family: 'Noto Sans TC', sans-serif;
}

h2 {
	margin: auto;
	text-align: center;
	padding: 15px;
}

form {
	margin: auto;
	width: 400px;
}

.err {
	font-size: smaller;
	color: #CC0000
}

.button {
	text-align: center
}
.msg1{color:blue}
</style>

<script>
	function myFunction() {
		alert("確認要新增");
	
	}
</script>
</head>
<body>
	<h2>新增食物</h2>

	<form action="processinsert.controller" method="post"
		class="form-horizontal">
	<span class="msg1">${insertkey.insertsuccess}</span>
	<br/>
		<label>食物名稱 </label>&nbsp;<input class="form-control" type="text"
			id="nameid" name="foodname" /> <span class="err">${nullMsgKey.nameEmptyError}</span>
		<br /> <label>食物類別</label><br /> &nbsp;<input type="radio"
			name="foodclass" value="食品雜貨"><label>食品雜貨</label>&nbsp;
		&nbsp;<input type="radio" name="foodclass" value="泡麵罐頭"><label>泡麵罐頭</label>
		&nbsp;<input type="radio" name="foodclass" value="飲料沖泡"><label>飲料沖泡</label><br>
		&nbsp;<input type="radio" name="foodclass" value="零食點心"><label>零食點心</label>
		&nbsp;<input type="radio" name="foodclass" value="蔬菜生鮮"><label>蔬菜生鮮</label>
		&nbsp;<input type="radio" name="foodclass" value="蛋奶製品"><label>蛋奶製品</label><br>
		&nbsp;<input type="radio" name="foodclass" value="魚/肉品類"><label>魚/肉品類</label>
		&nbsp;<input type="radio" name="foodclass" value="其他"><label>其他</label>
		<br /> <span class="err">${nullMsgKey.classEmptyError}</span> <label>有效日期</label><input
			type="text" id="datepicker" name="expirydate" class="form-control"><br />
		<span class="err">${nullMsgKey.dateEmptyError}</span> <label>數量</label><input
			type="text" name="count" class="form-control"> <span
			class="err">${nullMsgKey.countEmptyError}</span> <span class="err">${nullMsgKey.countFormatError}</span>
		<br />

		<div class="button">
			<input type="submit" value="儲存" class="btn btn-warning"
				onclick="myFunction()"> &nbsp; <input type="reset"
				value="清除" class="btn btn-warning">
		</div>
	</form>
	<br>
</body>
</html>
