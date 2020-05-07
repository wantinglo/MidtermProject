<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/membership/topMVC.jsp" />
<!DOCTYPE html>

<html>
<head>
<c:set var="funcName" value="cabinetfood_query" scope="session" />
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
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此商品 ? ") ) {
		document.forms[0].action="<c:url value='/productdelete_type.controller?cmd=DEL&foodid=" + n +"' />" ;
		alert(n);
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
</script>
<style>
body {
	font-family: 'Noto Sans TC', sans-serif;
}

.alldata {
	margin: auto;
	width: 600px;
	border: 2px solid #cccccc;
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

tr {
	text-align: center;
	line-height: 48px;
}

.even {
	background-color: #cccccc
}

.odd {
	background-color: #ffffff
}

</style>
</head>
<body>
	<h2>查詢結果</h2>

	<table class="alldata">
		<tr>
			<th>食物名稱</th>
			<th>食物類別</th>
			<th>有效期限</th>
			<th>數量</th>
			<th colspan=4>庫存調整</th>
		
		</tr>
		<c:forEach var="anCabinet" varStatus="stat" items="${items}">
			<form action="processquerysingle.controller" method="post"
				class="form-horizontal">
				<tr class="${stat.count%2==0?'odd':'even'}">
					<td>${anCabinet.foodname}</td>
					<td>${anCabinet.foodclass}</td>
					<td><fmt:formatDate value="${anCabinet.expirydate}"
							type="date" /></td>
					<td>${anCabinet.count}</td>
					<td><input type="hidden" name="foodid"
						value="${anCabinet.foodid}"></td>
					<td><input type="hidden" name="memberid" value="${mbID}"></td>
					<td><input type="submit" value="修改" class="btn btn-warning"></td>
					<td><input type="button" class="btn btn-warning" name="delete"
						value="刪除" onclick="confirmDelete(${anCabinet.foodid})"></td>
				</tr>
			</form>
		</c:forEach>
	</table>

</body>
</html>
