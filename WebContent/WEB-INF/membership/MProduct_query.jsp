<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/membership/MtopMVC.jsp" />
<!DOCTYPE html>

<html>
<head>
<c:set var="funcName" value="cabinetfood_query" scope="session" />
<title>xxxxxx</title>
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
<style>
body {
	font-family: 'Noto Sans TC', sans-serif;
}

.alldata {
	margin: auto;
	padding: 20px;
	text-align: center;
}

form {
	text-align: center;
	padding: 20px;
}

h2 {
	margin: auto;
	text-align: center;
	padding: 20px;
}

.section1 {
	width: 400px;
	border: 2px solid #cccccc;
	text-align: center;
	line-height: 48px;
}
</style>
</head>
<body>
	<h2>產品查詢</h2>
	<table class="alldata">
	<tr class="section1">
			<td>
				<form action="querydata.controller" method="post"
					class="form-horizontal">
					<label>查詢</label> <br> &nbsp;
					<label>產品類別</label><input type="text" name="p_type" class="form-control">
					<label>產品名稱</label><input type="text" name="p_name" class="form-control">
					<br> <input type="submit" value="確認" class="btn btn-warning">
					&nbsp; <input type="reset" value="清除" class="btn btn-warning">
					&nbsp;
				</form>
			</td>
		</tr>

		<tr class="section1">
			<td>
				<form action="querybytype.controller" method="post"
					class="form-horizontal">
					<label>類型查詢</label> <br> &nbsp;<input type="radio"
						name="p_type" value="電腦"><label>電腦</label> &nbsp;<input
						type="radio" name="p_type" value="平板"><label>平板</label>
					&nbsp;<input type="radio" name="p_type" value="手機"><label>手機</label>
					<br> <input type="submit" value="確認" class="btn btn-warning">
					&nbsp; <input type="reset" value="清除" class="btn btn-warning">
					&nbsp;
				</form>
			</td>
		</tr>

		<tr class="section1">
			<td>

				<form action="querybyname.controller" method="post"
					class="form-horizontal">
					<label>品名查詢</label>&nbsp; &nbsp;<input class="form-control"
						type="text" name="p_name"> <input type="submit" value="確認"
						class="btn btn-warning"> &nbsp; <input type="reset"
						value="清除" class="btn btn-warning"> &nbsp;
				</form>
			</td>
		</tr>

	</table>
</body>
</html>