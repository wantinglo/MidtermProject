<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Noto+Serif+TC&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
.main{margin: auto; text-align: center;font-family:Nanum Pen Script;font-size: 200px;}

</style>
</head>
<body>
<body background="">
<c:set var="funcName" value="index" scope="session"/>
<jsp:include page="/WEB-INF/membership/topMVC.jsp"/>
<div>
<h1 class="main">WELCOME</h1>
</div>



</body>
