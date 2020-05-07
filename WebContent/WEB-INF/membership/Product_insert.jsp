<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/membership/MtopMVC.jsp" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<c:set var="funcName" value="product_insert" scope="session" />
<html>
<head>
<meta charset="UTF-8">
<title>Product System</title>
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

<style type="text/css">
body {
	font-family: 'Noto Sans TC', sans-serif;
}

h2 {
	margin: auto;
	text-align: center;
	padding: 15px;
}

form {
	margin: auto;
	width: 400px;
}

.err {
	font-size: smaller;
	color: #CC0000
}

.button {
	text-align: center
}
.msg1{color:blue}
</style>

<script>
$("#p_img").change(function(){
  readURL(this);
});
function readURL(input){
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function (e) {
       $("#preview_progressbarTW_img").attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}

	function myFunction() {
		alert("確認要新增");
	
	}
</script>
</head>
<body>
	<h2>新增產品</h2>

	<form action="processproductinsert.controller" method="post" enctype="multipart/form-data" 
		class="form-horizontal">
	<span class="msg1">${insertkey.insertsuccess}</span>
	<br/>
	
		<!-- 產品基本資料 -->
<!--  <label>產品編號 </label>&nbsp;
		<input class="form-control" type="text"
			id="pid" name="pid" /> <span class="err">${nullMsgKey.nameEmptyError}</span>
		<br />-->
		
		
		
		<label>產品類別</label><br/> 
		<!--  <input class="form-control" type="text"
			 name="productclass" />-->
     	  &nbsp;<input type="radio" name="p_type" value="電腦"><label>電腦</label>
		&nbsp;<input type="radio" name="p_type" value="平板"><label>平板</label>
		&nbsp;<input type="radio" name="p_type" value="手機"><label>手機</label>
	 
		<br/>
		
		
		
		
		<label>產品編號</label>&nbsp;
		<input class="form-control" type="text"
			id="p_id" name="p_id" /> <span class="err">${nullMsgKey.nameEmptyError}</span>
		<br />
		
		<label>產品名稱 </label>&nbsp;
		<input class="form-control" type="text"
			id="p_name" name="p_name" /> <span class="err">${nullMsgKey.nameEmptyError}</span>
		<br />
		
		
		<label>照片</label><input type="file"  id="p_img" name="p_img"  accept="image/gif, image/jpg, image/jpeg, image/png" 

   class="form-control"> <img id="preview_p_img" src="#" />
		<br />

	<!-- 產品詳細內容 --> 
		<label>螢幕</label>
		<input class="form-control" type="text"
			id="monitor" name="monitor" /> <span class="err">${nullMsgKey.classEmptyError}</span> 
		<br /> 	
		
		<label>CPU</label>
		<input class="form-control" type="text"
			id="cpu" name="cpu" /> <span class="err">${nullMsgKey.classEmptyError}</span> 
		<br /> 	
		
		<label>記憶體</label>
		<input class="form-control" type="text"
			id="ram" name="ram" /> <span class="err">${nullMsgKey.classEmptyError}</span> 
		<br /> 
		
		
		<label>容量</label>
		<input class="form-control" type="text"
			id="storage" name="storage" /> <span class="err">${nullMsgKey.classEmptyError}</span> 
		<br /> 
		
		
		<label>產品描述</label>
		<input class="form-control" type="text"
			id="des" name="des" /> <span class="err">${nullMsgKey.classEmptyError}</span> 
		<br /> 	
		
		<label>顏色</label>
		<input class="form-control" type="text"
			id="color" name="color" /> <span class="err">${nullMsgKey.classEmptyError}</span> 
		<br /> 
			
		
		<label>價格</label><input
			type="text" id="price" name="price" class="form-control"><br />
		<span class="err">${nullMsgKey.dateEmptyError}</span> 
		
		<label>折扣</label><input type="text"  id="discount" name="discount" class="form-control"> 
		<br />
		
	<!--  	<label>商品狀態</label><br/> -->
		&nbsp;<input type="hidden"  id="df" name="delete_flag" value="y" class="form-control"> 
	<!--  	&nbsp;<input type="radio"  id="dfid" name="dfname" value="已下架" class="form-control"> <label>已下架</label>
		<br />-->
		
		

		<div class="button">
			<input type="submit" value="儲存" class="btn btn-warning"> &nbsp; 
			<input type="reset" value="清除" class="btn btn-warning">
		</div>
	</form>
	<br>
</body>
</html>
