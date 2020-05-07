<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/membership/MtopMVC.jsp" />
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
	if (confirm("確定刪除此產品 ? ") ) {
		document.forms[0].action="<c:url value='/productdelete_type.controller?cmd=DEL&p_id=" + n +"' />" ;
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
	width: 700px;
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
	text-align : center;
	line-height: 50px;
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
			<th>產品編號</th>
			<th>產品類別</th>
			<th>產品名稱</th>
			<th>容量</th>
			<th>顏色</th>
			<th>價格</th>
			<th>折數</th>
			<th colspan=3>產品維護</th>

		</tr>
		<c:forEach var="anProduct" varStatus="stat" items="${querydata}">
			<form action="queryproductsingle.controller" method="post" class="form-horizontal">
				<tr class="${stat.count%2==0?'odd':'even'}">
					<td>${anProduct.p_id}</td>
					<td>${anProduct.p_type}</td>
					<td>${anProduct.p_name}</td>
					<td>${anProduct.storage}</td>
					<td>${anProduct.color}</td>
					<td>${anProduct.price}</td>
					<td>${anProduct.discount}</td>
					<td><input type="hidden" name="p_id" value="${anProduct.p_id}"/></td>
					<td><input type="submit" value="修改" class="btn btn-warning"></td>
					<td><input type="button" class="btn btn-warning" name="delete"value="刪除" 
					onclick="confirmDelete(${anProduct.p_id})"></td>
				</tr>
			</form>
		</c:forEach>
	</table>

</body>
</html>
