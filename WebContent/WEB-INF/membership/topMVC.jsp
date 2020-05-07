<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!--  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style>
body {
	font-family: 'Noto Sans TC', sans-serif;
	background-color:;
}

.menuData {
	margin: 15px;
	text-align: left;
	padding-top: 10px;
	color: #66009D
}

.menu {
	margin: 10px
}

.menu a:hover {
	color: #2200AA;
	font-weight: bolder;
}
</style>
</head>
<body>
	<table class="menuInner" class="nav navbar-default navbar-fixed-top">
		<tr>
			<td class="menuData">
				<div class="menu">
					<c:if test="${empty LoginOK}">
						<a href="<c:url value='/login.controller' />" class="btn btn-light"> 登入 </a>
					</c:if>

				</div>
			</td>


			<td class='menuData'>
				<div class='menu'>
					<c:choose>
						<c:when test="${empty LoginOK}">
							<a href="<c:url value='/login.controller' />"  class="btn btn-light"> 新增食物</a>

						</c:when>
						<c:when
							test="${!empty LoginOK  &&  funcName != 'cabinetfood_insert' }">
							<a href="<c:url value='/insert.controller' />" class="btn btn-light">新增食物</a>

						</c:when>
						<c:when
							test="${!empty LoginOK  &&  funcName == 'cabinetfood_insert' }">
							<a class="btn btn-light">新增食物</a>

						</c:when>

					</c:choose>
				</div>
			</td>

			<td class='menuData'>
				<div class='menu'>
					<c:choose>
						<c:when test="${empty LoginOK}">
							<a href="<c:url value='/login.controller' />" class="btn btn-light">庫存查詢 </a>

						</c:when>
						<c:when test="${!empty LoginOK}">
							<div class="btn-group">
								<button type="button" class="btn btn-light dropdown-toggle"
									data-toggle="dropdown">庫存查詢</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="<c:url value='/query.controller'/>">全部庫存</a> 
									<a class="dropdown-item" href="#">按分類</a> 
									<a class="dropdown-item" href="#">按日期</a>
								</div>
							</div>
						</c:when>
					</c:choose>
				</div>
			</td>

			<td class='menuData'>
				<div class='menu'>
					<c:if test="${ funcName != 'register' }" >
						<a href="<c:url value='/register.controller' />" class="btn btn-light"> 註冊 </a>
					</c:if>
					<c:if test="${ funcName == 'register' }" ><a class="btn btn-light"> 註冊</a>
			</c:if>
				</div>
			</td>

			<td class='menuData'>
				<div class='menu'>
					<c:if test="${ funcName != 'index' }">
						<a href="<c:url value='/index.controller' />" class="btn btn-light"> 回首頁 </a>
					</c:if>
					<c:if test="${ funcName == 'index' }"> <a class="btn btn-light">回首頁 </a>
			</c:if>
				</div>
			</td>

			<td class='menuData'>
				<div class='menu'>
					<c:if test="${!empty LoginOK }">
						<a href="<c:url value='/membership/Logout.jsp' />"  class="btn btn-light"> 登出 </a>
					</c:if>
					<c:if test="${funcName == 'logout' }"></c:if>
				</div>
			</td>

		</tr>
	</table>
</body>
</html>