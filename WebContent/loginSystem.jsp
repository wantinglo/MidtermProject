<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>LoginPage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.alldata {
	font-family: 'Noto Sans TC', sans-serif;
}

form {
	margin: auto;
	width: 500px;
}

.section1 {
	font-size: 18px;
	background-color: white;
	margin: auto;
	width: 600px;
	padding: 25px;
	padding-top: 40px;
	padding-bottom: 50px;
	border-radius: 5px;
}

.title {
	padding-top: 50px;
	padding-bottom: 30px;
	font-size: 30px;
	width: 600px;
	text-align: center;
	font-size: 30px;
}

#checkpwdtxt {
	font-size: 13px;
	color: #FF0000
}

#checkmailtxt {
	font-size: 13px;
	color: #FF0000
}

#content {
	background-repeat: no-repeat;
	background-size: cover;
	height: 1000px;
	margin-top: -21px;
	margin-bottom: 0px;
	margin: auto;
	width: 800px
}

　 /*input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}*/     

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.container {
	padding: 10px;
}

.signbtn {
	line-height: 30px;
	font-size: 15px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>

	<%@ include file="fragment/indexTOP.jsp"%>


	<div id="content">
		<div class="alldata">


			<form action="<c:url value="/login" />" method="post" id="form1">
				<h2 class="title">登入</h2>
				<div class="section1">
					<div class="container">
						<label for="uname"><b>帳號</b></label> <input type="text"
							class="form-control   " name="email" id="email"
							placeholder="請輸入email" onblur="verifymail()" required> <label
							id="checkmailtxt"></label> <br> <label for="psw"><b>密碼</b></label>
						<input type="password" class="form-control   " name="password"
							placeholder="請輸入密碼" id="password" onblur="verifypwd()" required>
						<label id="checkpwdtxt"></label> <br>

						<button type="submit" class="btn btn-primary  btn-block">登入</button>
						<p style="color: red">${errors.msg}</p>
						<a href="forgetPwdPage.jsp" class="signbtn">忘記密碼?</a>
					</div>

					<div class="container">
						<a class="signbtn" href="RigsterPage.jsp">還沒有註冊?建立新帳號</a> <br>
					</div>
					<div class="container">
						<input type="button" class="btn btn-outline-primary" value="一鍵輸入"
							onclick="input()">
					</div>
				</div>
			</form>


		</div>
	</div>


	<%@ include file="fragment/indexBOTTOM.jsp"%>


	<script type="text/javascript">
		function input() {
			$("#email").val("w92532@hotmail.com");
			$("#password").val("w41420");
			//form1.submit();
		}

		function verifymail() {

			let txt = document.getElementById("checkmailtxt");
			let name1 = document.getElementById("email").value;

			let emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;

			if (name1 == "") {
				txt.innerHTML = "不可空白";

			} else if (name1.search(emailRule) == -1) {

				txt.innerHTML = "錯誤的email格式";

			} else {
				txt.innerHTML = "";
			}

		}

		function verifypwd() {
			var rexEng = /[A-Za-z]/
			var rexNum = /[0-9]/

			var txtValue = document.getElementById("checkpwdtxt")
			var pwdValue = document.getElementById("password").value
			// 不能為空值
			if (pwdValue == "") {

				txtValue.innerHTML = '密碼不能空白';
			}
			// 至少六個字
			else if (pwdValue.length < 6) {

				txtValue.innerHTML = '至少六個字';
			}
			// 判斷英文
			else if (!rexEng.test(pwdValue)) {

				txtValue.innerHTML = '沒有英文';
			}
			// 判斷數字
			else if (!rexNum.test(pwdValue)) {

				txtValue.innerHTML = '沒有數字';
			} else {

				txtValue.innerHTML = "";
			}
		}
	</script>

</body>
</html>