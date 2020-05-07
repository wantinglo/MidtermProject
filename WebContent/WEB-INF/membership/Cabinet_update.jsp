<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/membership/topMVC.jsp" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
<script type="text/javascript">
function confirmUpdateBack(n) {
		document.forms[0].action="<c:url value='/processquery.controller?cmd=MOD&memberid=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
}
</script>
<style>
body {
	font-family: 'Noto Sans TC', sans-serif;
}

h2 {
	margin: auto;
	text-align: center;
	padding: 15px;
}

.alldata {
	margin: auto;
	width: 400px;
	border: 2px solid #cccccc;
	padding: 20px;
}

.section1 {
	background-color: #F5F5F5;
}

tr {
	border: 20px;
	line-height: 48px;
}

td {
	padding-left: 10px;
	padding-right: 10px;
	line-height: 48px;
}

.button {
	text-align: center;
	padding-bottom: 30px;
}
</style>

</head>
<body>
	<h2>修改</h2>
	<form action="processupdate.controller" method="post"
		class="form-horizontal">
		<table class="alldata">

			<c:forEach var="anCabinet" varStatus="stat" items="${item}">

				<tr class="section1">
					<td>食物名稱</td>
				</tr>
				<tr>
					<td><input name="foodname" value="${anCabinet.foodname}"
						class="form-control "></td>
				</tr>
				<tr class="section1">
					<td>食物類別</td>
				</tr>
				<tr>
					<td>${anCabinet.foodclass}</td>
				</tr>
				<tr class="section1">
					<td>有效期限</td>
				</tr>
				<tr>
					<td><fmt:formatDate value="${anCabinet.expirydate}"
							type="date" /></td>
				</tr>
				<tr class="section1">
					<td>數量</td>
				</tr>
				<tr>
					<td><input type="text" name="count" value="${anCabinet.count}"
						class="form-control "></td>
				</tr>
				<tr>
					<td><input type="hidden" name="foodid"
						value="${anCabinet.foodid}"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="memberid" value="${mbID}"></td>
				</tr>
				<tr>
					<td><div class="button">
							<input type="submit" value="確認 " class="btn btn-warning">
							<input type="button" class="btn btn-warning" value="返回"
								onclick="confirmUpdateBack(${mbID})">
						</div></td>
				</tr>
				</tbody>
			</c:forEach>
		</table>
	</form>


</body>
</html>