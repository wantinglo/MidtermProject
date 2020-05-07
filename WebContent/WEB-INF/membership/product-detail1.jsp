<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<!DOCTYPE html>
<html class=''>
<head>
<script
	src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<script
	src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
<script
	src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon"
	href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type=""
	href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
	color="#111" />
<link rel="canonical"
	href="https://codepen.io/enwaara/pen/dRqJMv?depth=everything&order=popularity&page=78&q=shop&show_forks=false" />
<script src="https://use.typekit.net/tsl0qfs.js"></script>
<script>
	try {
		Typekit.load({
			async : true
		});
	} catch (e) {
	}
</script>



<style class="cp-pen-styles">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	-webkit-transition: 0.2s ease-in-out;
	-moz-transition: 0.2s ease-in-out;
	-o-transition: 0.2s ease-in-out;
	transition: 0.2s ease-in-out;
	color: #444B54;
}

*:focus {
	outline: none;
}

body {
	background-color: #7d706f;
}

#wrapper {
	position: absolute;
	top: 50%;
	margin-top: -300px;
	left: 0;
	width: 100%;
}

#container {
	width: 1200px;
	height: 650px;
	margin: 0 auto;
	box-shadow: 5px 5px 20px 0px rgba(0, 0, 0, 0.7);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	-ms-border-radius: 5px;
	border-radius: 5px;
	position: relative;
	background: #dadfe1;
	background: -moz-linear-gradient(45deg, #dadfe1 0%, #e8edef 30%, #f9feff 100%);
	background: -webkit-linear-gradient(45deg, #dadfe1 0%, #e8edef 30%, #f9feff 100%);
	background: linear-gradient(45deg, #dadfe1 0%, #e8edef 30%, #f9feff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#dadfe1',
		endColorstr='#f9feff', GradientType=1);
}

#img-wrap {
	width: 550px;
	height: 80%;
	float: left;
	position: relative;
}

#img-wrap .images {
	width: 70%;
	overflow: hidden;
	margin: 500px auto 0 auto;
}

#img-wrap .images li {
	list-style: none;
	width: 33.33%;
	float: left;
	padding: 10px;
	text-align: center;
	cursor: pointer;
	opacity: 0.5;
}

#img-wrap .images li img {
	width: 80%;
}

#img-wrap .images li:nth-child(4) {
	padding-top: 25px;
}

#img-wrap .images li:hover {
	opacity: 1;
}

#img-wrap .images .big-img {
	width: 60%;
	float: auto;
	padding: 0;
	margin: 12.5% 12.5%;
	text-align: center;
	opacity: 1;
	position: absolute;
	top: 0px;
	left: 0;
}

#img-wrap .images .big-img img {
	-webkit-filter: drop-shadow(0px 7px 3px #6C7A89);
	filter: drop-shadow(0px 7px 3px #6C7A89);
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	border-radius: 30px;
}

.colors {
	width: 125px;
	margin: 15px auto;
}

.colors li {
	width: 25px;
	height: 25px;
	margin-right: 25px;
	list-style: none;
	float: left;
	background: #F3C9BF;
	cursor: pointer;
	position: relative;
	opacity: 0.7;
	-webkit-border-radius: 100%;
	-moz-border-radius: 100%;
	-ms-border-radius: 100%;
	border-radius: 100%;
	-webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.3);
}

.colors li:nth-child(2) {
	background: #87E8C6;
}

.colors li:nth-child(3) {
	margin-right: 0;
	background: #BFE6EC;
}

.colors li:hover, .colors li.target {
	opacity: 1;
	-webkit-box-shadow: 0px 1px 4px 0px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0px 1px 4px 0px rgba(0, 0, 0, 0.5);
	box-shadow: 0px 1px 4px 0px rgba(0, 0, 0, 0.5);
}

.info {
	width: 550px;
	height: 100%;
	float: right;
	padding: 30px 50px 30px 0;
	background: url() no-repeat;
	background-position: 80% 0%;
	background-size: 65%;
}

.info h2 {
	clear: both;
	font-size: 2em;
	letter-spacing: 1px;
	text-transform: uppercase;
	margin: 5px 0 10px;
	float: left;
	color: #8199A3;
}

.info p {
	clear: both;
	padding: 20px 0px 5px;
	line-height: 1.5em;
	font-size: 1.5em;
	letter-spacing: 0.5px;
}

.info #pricing, .info #storage {
	text-transform: uppercase;
	letter-spacing: 1px;
	font-size: 1.5em;
	font-weight: bold;
	color: #232424;
}

.info #price {
	margin-top: 10px;
	float: none;
}

.important {
	width: 50%;
	float: left;
	margin-top: 15px;
}

.form {
	padding: 0px;
	width: 50%;
	float: right;
	margin-top: 15px;
}

.form .color {
	float: right;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	padding: 0 20px;
	width: 100%;
	height: 40px;
	border: none;
	background: #7d706f;
	font-size: 0.9em;
	letter-spacing: 1px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	-ms-border-radius: 5px;
	border-radius: 5px;
	color: #F2F2F2;
	cursor: pointer;
	font-weight: 400;
}

.form .color:hover {
	background: #232424;
}

.button {
	width: 100%;
	margin-top: 30px;
	border: none;
	background: #7d706f;
	padding: 20px 0;
	font-size: 1.1em;
	line-height: 1.1em;
	letter-spacing: 1px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	-ms-border-radius: 5px;
	border-radius: 5px;
	color: #F2F2F2;
	cursor: pointer;
}

.button:hover {
	background: #232424;
}

@media screen and (max-width: 1440px) {
	#wrapper {
		transform: scale(0.7);
	}
}

.info .title {
	font-family: 'Noto Sans SC', sans-serif;
	color: black;
	font-size: 50px;
	font-weight: 30px;
}

.info .subtitle2 {
	font-family: 'Noto Sans SC', sans-serif;
	color: grey;
	font-size: 20px;
	font-weight: 10px;
}

.info .subtitle {
	font-family: 'Noto Sans SC', sans-serif;
	color: black;
	font-size: 30px;
	font-weight: 5px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="container">

			<div id="img-wrap">

				<ul class="images">
					<li class="big-img" ><img width="200" id="image"
						src="<c:url value="/productC/getImage?img=${p_img}"/>"></li>
				</ul>

			  <select id="color" class="colors" onchange="changecolor()">
				<c:forEach var="color" items="${colorlist}" >
					<option  >${color}</option>	
				</c:forEach>
				</select> 

			</div>

			<div class="info">

				<h1  class="title">購買</h1><h1 class="title" id="p_name">${p_name}</h1>
				<h2 class="subtitle2">CPU:${cpu}</h2>
				<h2 class="subtitle2">RAM:${ram}</h2>
				<p class="subtitle2">${des}</p>

				<div class="important">
					<h2 class="subtitle">價格。</h2>
					<h2 class="subtitle" id="price">NT${price}</h2>
				</div>

				<div class="form">
					<h2 class="subtitle">選擇儲存容量。</h2>
					<select id="storage" class="color" name="storage"
						onchange="changeprice()">
						<c:forEach var="storage" items="${storagelist}">
							<option>${storage}</option>
						</c:forEach>
					</select>

				</div>

				<input type="button" class="button" value="Add to cart"
					onclick="location.href='cart'">
			</div>

		</div>
	</div>
<script type="text/javascript">


		function changeprice() {

			$.ajax({
			url : "/HibernateWebProject/productC/changeprice",
			type : "GET",
			dataType : "json",
			data : {
			"p_name" : $("#p_name").text(),
			"storage" : $("#storage option:selected").text(),
			},
			success : function(res) {
			$("#price").text("NT$" + res.price);
			},
			error : function(error) {
			alert("error: " + error);
			}
			})
		}


		function changecolor() {

			$.ajax({
			url : "/HibernateWebProject/productC/changecolor",
			type : "GET",
			dataType : "json",
			data : {
			"p_name" : $("#p_name").text(),
			"color" : $("#color option:selected").text(),
			},
			success : function(res) {
				$("#image1").html("<img src='<c:url value='/productC/getImage?img= '"  +res.p_img+  "'style='width:200px;'></img>");
						  
			},
			error : function(error) {
			alert("error: " + error);
			}
			})
		}
	</script>
</body>
</html>