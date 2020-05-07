<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login System</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<style type="text/css">
	body {font-family: 'Noto Sans TC', sans-serif;}
	h2 {margin: auto; text-align: center;padding: 15px;}
	form {margin: auto;width: 300px; }
	.err{font-size:smaller; color:#CC0000}
	.button{text-align:center}
	.msg1{color:blue}
</style>


</head>
<body>
<c:set var="funcName" value="xxxxxx" scope="session"/>
<jsp:include page="/WEB-INF/membership/MtopMVC.jsp"/>
<h2>後台管理系統</h2>
<form action="managelogin.controller" method="post" class="form-horizontal">
<span class="msg1">${insertkey.registersuccess}</span>
<div >
<label >帳號 </label>&nbsp;<input  class="form-control "  type="text" name="acc" >&nbsp;<span class="err">${nullMsgKey.AccountEmptyError}</span>
</div>
<div >
<label >密碼 </label>&nbsp; <input class="form-control " type="password" name="pwd" >&nbsp;<span  class="err">${nullMsgKey.PasswordEmptyError}</span>
</div>
<div class="button">
<input   type="submit" value="確認" class="btn btn-warning" > &nbsp;
<input   type="reset" value="清除" class="btn btn-warning">
</div>
</form>
<br>
</body>
</html>