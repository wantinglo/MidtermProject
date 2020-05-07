<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登出</title>
<style>
h1{margin:auto;text-align:center;color:#2200AA;font-family: 'Noto Sans TC', sans-serif;}
</style>
</head>
<body>
<c:set var="funcName" value="Mlogout" scope="session"/>
<!-- 先將使用者名稱取出 -->
<!-- 移除放在session物件內的屬性物件 -->
<c:remove var="MLoginOK" scope="session" />
<jsp:include page="/WEB-INF/membership/MtopMVC.jsp"/>

<h1><BR>
感謝您使用本系統。<BR>
您已經登出管理權限<BR>
</h1>



</body> 
</html></html>