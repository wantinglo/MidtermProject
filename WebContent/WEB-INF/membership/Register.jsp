<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Noto Sans TC', sans-serif;
	background-color:;
}

h2 {
	margin: auto;
	text-align: center;
	padding-top: 15px;
}

form {
	margin: auto;
	width: 300px;
}

.button {
	text-align: center
}

.st2{
font-size:small;
color:grey;
}

.check{
font-size:small;
color:red;}
</style>
</head>
<body>
	<c:set var="funcName" value="register" scope="session" />
	<jsp:include page="/WEB-INF/membership/topMVC.jsp" />
	<h2>註冊帳號</h2>
	<form action="processregister.controller" method="post">
		<label>帳號</label><input type="text" name="accapply"
			class="form-control"> <label class="check" id="acccheck"></label>
		<P class="st2">(至少6個字且需含英文、數字)</P>



		<label>密碼</label><input type="text" name="pwdapply"
			class="form-control"size="20" id="Pwdid"
			onblur="checkpwd()"> <br> <label  class="check" id="pwdcheck"></label>
		<P class="st2">(至少6個字且需含英文、數字、特殊字元)</P>



		<br> <label>姓名</label><input type="text" name="nameapply"
			class="form-control"  size="20" id="Nameid"
			onblur="checkname()"> <br> <label  class="check" id="namecheck"></label>
		<P class="st2">(至少填寫兩個字且皆須為中文)</P>


		<br> <label>電話 </label><input type="text" name="phoneapply"
			class="form-control" size="20" id="Phoneid" onblur="checkphone()"> <br> <br>
		<label   class="check" id="phonecheck"></label>
		<P class="st2">(請填寫手機號碼)</P>
		
		<div class="button">
			<input type="submit" value="送出" class="btn btn-warning">
			&nbsp; <input type="reset" value="清除" class="btn btn-warning">

		</div>
		<br>
	</form>

	<script>





function checkpwd() {
	var PwdidVal = document.getElementById("Pwdid").value
	if (PwdidVal == "") {
	document.getElementById("pwdcheck").innerHTML
	= "不可空白";
	} else if (!(PwdidVal.match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#%^*&/]).{6,15}$/))) {
	document.getElementById("pwdcheck").innerHTML
	= "格式有誤";
	} else {
	document.getElementById("pwdcheck").innerHTML
	= "正確";
	}
	}



function checkname() {
var NameidVal = document.getElementById("Nameid").value;
if (NameidVal == "") {
document.getElementById("namecheck").innerHTML
= "不可為空白";
} else if (!(NameidVal.match(/^(?=.*[\u4e00-\u9fa5]).{2,10}$/))) {
document.getElementById("namecheck").innerHTML
= "格式有誤";
} else {
document.getElementById("namecheck").innerHTML
= "正確";
}
}


function checkphone() {
	var PhoneidVal = document.getElementById("Phoneid").value;
	if (PhoneidVal == "") {
	document.getElementById("phonecheck").innerHTML
	= "不可為空白";
	} else if (!PhoneidVal.match(/^(09)[0-9]{8}$/)) {
	document.getElementById("phonecheck").innerHTML
	= " 格式有誤";
	} else {
	document.getElementById("phonecheck").innerHTML
	= "正確";
	}
	}

</script>

</body>
</html>

