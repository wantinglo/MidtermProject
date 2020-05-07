<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/membership/MtopMVC.jsp" />
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
		document.forms[0].action = "<c:url value='/querybytype.controller?cmd=MOD&p_type="
				+ n + "' />";
		document.forms[0].method = "POST";
		document.forms[0].submit();
	}
</script>
<script>
	function openFile(event) {
		var input = event.target; //取得上傳檔案
		var reader = new FileReader(); //建立FileReader物件

		reader.readAsDataURL(input.files[0]); //以.readAsDataURL將上傳檔案轉換為base64字串

		reader.onload = function() { //FileReader取得上傳檔案後執行以下內容
			var dataURL = reader.result; //設定變數dataURL為上傳圖檔的base64字串
			$('#output').attr('src', dataURL).show(); //將img的src設定為dataURL並顯示
		};
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
	width: 1000px;
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
}

.button {
	text-align: center;
	padding-bottom: 30px;
}
</style>

</head>
<body>


	<h2>修改</h2>
	<form action="productupdate.controller" method="post" enctype="multipart/form-data"
		class="form-horizontal" >
		<table class="alldata">

			<c:forEach var="anProduct" varStatus="stat" items="${single_items}">

				<tr class="section1">
					<td>產品編號</td>
				</tr>
				<tr>
					<td><input type="text" name="p_id" value="${anProduct.p_id}"
						class="form-control "></td>
				</tr>
				<tr class="section1">
					<td>產品類別</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${anProduct.p_type=='電腦'}">
							<td><input type="radio" name="p_type" value="電腦"
								checked="checked"> <label>電腦</label> <input type="radio"
								name="p_type" value="平板"><label>平板</label> <input
								type="radio" name="p_type" value="手機"><label>手機</label></td>
						</c:when>

						<c:when test="${anProduct.p_type=='平板'}">
							<td><input type="radio" name="p_type" value="電腦"><label>電腦</label>
								<input type="radio" name="p_type" value="平板" checked="checked"><label>平板</label>
								<input type="radio" name="p_type" value="手機"><label>手機</label></td>
						</c:when>

						<c:when test="${anProduct.p_type=='手機'}">
							<td><input type="radio" name="p_type" value="電腦"><label>電腦</label>
								<input type="radio" name="p_type" value="平板"><label>平板</label>
								<input type="radio" name="p_type" value="手機" checked="checked"><label>手機</label></td>
						</c:when>
					</c:choose>
				</tr>
				<tr class="section1">
					<td>產品名稱</td>
				</tr>
				<tr>
					<td><input type="text" name="p_name"
						value="${anProduct.p_name}" class="form-control "></td>
				</tr>
				<tr class="section1">
					<td>照片</td>
				</tr>
			 <tr>
				
					<td>	<!--   <img  alt="" id="img" style="width:100px" src="<c:url value="/getImage?img=${anProduct.p_img}" /> " >-->
			  	<img id="output" height="200" style="display: none">
						<input type="file" id="p_img" name="files" class="form-control"
						onchange="openFile(event)">	
						</td>

				</tr> 

				<tr class="section1">
					<td>螢幕</td>
				</tr>
				<tr>
					<td><input type="text" name="monitor"
						value="${anProduct.monitor}" class="form-control "></td>
				</tr>
				<tr class="section1">
					<td>CPU</td>
				</tr>
				<tr>
					<td><input type="text" name="cpu" value="${anProduct.cpu}"
						class="form-control "></td>
				</tr>
				<tr class="section1">
					<td>記憶體</td>
				</tr>
				<tr>
					<td><input type="text" name="ram" value="${anProduct.ram}"
						class="form-control "></td>
				</tr>
				<tr class="section1">
					<td>容量</td>
				</tr>
				<tr>
					<td><input type="text" name="storage"
						value="${anProduct.storage}" class="form-control "></td>
				</tr>
				<tr class="section1">
					<td>產品描述</td>
				</tr>
				<tr>
					<td><input type="text" name="des" value="${anProduct.des}"
						class="form-control "></td>
				</tr>
				<tr class="section1">
					<td>顏色</td>
				</tr>
				<tr>
					<td><input type="text" name="color" value="${anProduct.color}"
						class="form-control "></td>
				</tr>
				<tr class="section1">
					<td>價格</td>
				</tr>
				<tr>
					<td><input type="text" name="price" value="${anProduct.price}"
						class="form-control "></td>
				</tr>

				<tr class="section1">
					<td>折數</td>
				</tr>
				<tr>
					<td><input type="text" name="discount"
						value="${anProduct.discount}" class="form-control "></td>
				</tr>

				<tr class="section1">
					<td>產品狀態</td>
				</tr>
				<tr>
					<td><input type="text" name="df"
						value="${anProduct.delete_flag}" class="form-control "></td>
				</tr>

				<tr>
					<td><div class="button">
							<input type="submit" value="確認 " class="btn btn-warning">
							<input type="button" class="btn btn-warning" value="返回"
								onclick="confirmUpdateBack(p_type)" />
						</div></td>
				</tr>
				</tbody>
			</c:forEach>
		</table>
	</form>

	<img alt="" style="width: 300px; height: 300px"
		src="<c:out value="C:\Users\羅琬婷\Desktop"/>">
</body>
</html>
