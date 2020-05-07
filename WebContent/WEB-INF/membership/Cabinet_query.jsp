<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/membership/topMVC.jsp" />
<!DOCTYPE html>

<html>
<head>
<c:set var="funcName" value="cabinetfood_query" scope="session" />
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

<style type="text/css">
body {
	font-family: 'Noto Sans TC', sans-serif;
}

h2 {
	margin: auto;
	text-align: center;
	padding: 25px;
}

form {
	margin: auto;
	width: 400px;
	text-align: center;
}

.button {
	text-align: center
}
.section1{margin: auto;}

</style>

</head>
<body>
	<h2>查詢庫存</h2>
	<form action="processquery.controller" method="post"
		class="form-horizontal">
		<br/>
		<table class="section1">
			<tr>
				<th><h5>全部食物</h5></th>
			</tr>
			<tr>
				<td><input type="submit" value="確認" class="btn btn-warning"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="memberid" value="${mbID}"
					class="btn btn-warning"></td>
			</tr>
		</table>
	</form>

</body>
</html>
