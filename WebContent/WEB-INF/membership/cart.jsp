<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
	body {
		background: #7d706f
	}

	.container {
		background: #dadfe1;
		width: 1000px;
		position: relative;
		margin-top: 110px;
	}
</style>

<body>


	<div class="container">

		<h1>Shopping Cart</h1>
		<hr>
		<table class="table table-striped table-hover table-bordered">
			<tbody>
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>Color</th>
					<th>Storage</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total Price</th>
				</tr>
				<tr>
					<td>iphone11</td>
					<td>手機</td>
					<td>black</td>
					<td>48GB</td>
					<td>1<a href="#">X</a></td>
					<td>$16800</td>
					<td>$16800</td>
				</tr>

				<tr>
					<th colspan="6"><span class="pull-right">Total</span></th>
					<th>$16800</th>
				</tr>
				<tr>
					<td><a href="#" class="btn btn-primary" style="background-color: #7D706f">Continue Shopping</a></td>
					<td colspan="6"><a href="#" class="pull-right btn btn-success"
							style="background-color: #7D706f">Checkout</a></td>
				</tr>
			</tbody>
		</table>

	</div>


	<form:form id="cartForm">
		<div class="shopping-cart content">
			<!-- Title -->
			<div class="title">
				購物車
				<button type="button" class="btn2 btn-info " onclick="return continueShopping()">繼續購物</button>
			</div>
			<div id="items">
				<c:forEach varStatus="vs" var="anEntry" items="${ShoppingCart.content}">
					<div class="item">
						<div class="buttons">
							<!-- 刪除購物車商品 -->
							<a class="delete-btn" onclick="return cancelProduct(${anEntry.key})"></a>
						</div>

						<div class="image">
							<img width='70px' height='75px'
								src="<c:url value='/getPicture/${anEntry.value.productId}'/>" />
						</div>

						<div class="description">
							<span>${anEntry.value.description}</span>
						</div>

						<div class="quantity">
							<input type="text" class="productId" value="${anEntry.key}" hidden="hidden">
							<button class="plus-btn" type="button" name="button">
								<img src="<c:url value='/shoppingCart/plus.svg' />" />
							</button>
							<input id="${vs.index}qty" class="newQty" type="number" name="name"
								value="${anEntry.value.quantity}">
							<button class="minus-btn" type="button" name="button">
								<img src="<c:url value='/shoppingCart/minus.svg' />" />
							</button>
						</div>

						<div class="unit-price">
							<fmt:formatNumber value="${anEntry.value.unitPrice * anEntry.value.discount }"
								pattern="#,###" />
							元
						</div>
					</div>
					<input type="text" id="oItem" value="${ShoppingCart.content}" disabled hidden="hidden">

				</c:forEach>
			</div>
			<div class="total-price">
				<span class="total_price_span">總付款金額:
					<fmt:formatNumber value="${ShoppingCart.subtotal}" pattern="#,###" />元
				</span>
				<button type="button" class="btn1 btn-success " onclick="return checkOut()">去買單</button>
			</div>
		</div>
	</form:form>

	<c:if test="${errorMsg != null}">
		<input id="error" type="text" value="${errorMsg}" hidden="hidden">
		<script>
			var error = $('#error').val();
			alert(error);
		</script>
	</c:if>
	</div>

	<script type="text/javascript">
		$('.minus-btn').on('click', function (e) {
			e.preventDefault();
			var $this = $(this);
			var $input = $this.prev();
			var value = parseInt($input.val());
			if (value > 1) {
				value = value - 1;
			} else {
				value = 1;
			}
			$input.val(value);

			var pId = $(this).closest("div").find(".productId").val();
			//     	var pId = $(this).prev().prev().prev().val();    		
			var newQty = value;
			console.log(pId);

			$.ajax({
				type: "GET",
				url: "modifyQty?pId=" + pId + "&newQty=" + newQty,
				success: function (data) {
					if (data.hasOwnProperty('error')) {
						alert(data["error"]);
						$input.val(data["stock"]);
						ajax_modifyQty(pId, data["stock"]);
					} else {
						$(".total_price_span").html("總付款金額:" + data + "元");
					}
				}
			});
		});

		$('.plus-btn').on('click', function (e) {
			e.preventDefault();
			var $this = $(this);
			var $input = $this.next();
			var value = parseInt($input.val());
			if (value < 100) {
				value = value + 1;
			} else {
				value = 100;
			}
			$input.val(value);
			var pId = $(this).closest("div").find(".productId").val();
			var newQty = value;
			console.log(pId);

			$.ajax({
				type: "GET",
				url: "modifyQty?pId=" + pId + "&newQty=" + newQty,
				success: function (data) {
					//     				var error = JSON.parse(data);
					if (data.hasOwnProperty('error')) {
						alert(data["error"]);
						$input.val(data["stock"]);
						ajax_modifyQty(pId, data["stock"]);
					} else {
						$(".total_price_span").html("總付款金額:" + data + "元");
					}
				}
			});
		});


		$('.newQty').change(function (e) {
			var newQty_Input = $(this).closest("div").find(".newQty");
			var newQty = $(this).closest("div").find(".newQty").val();
			var pId = $(this).closest("div").find(".productId").val();
			$.ajax({
				type: "GET",
				url: "modifyQty?pId=" + pId + "&newQty=" + newQty,
				success: function (data) {
					if (data.hasOwnProperty('error')) {
						alert(data["error"]);
						newQty_Input.val(data["stock"]);
						ajax_modifyQty(pId, data["stock"]);
					} else {
						$(".total_price_span").html("總付款金額:" + data + "元");
					}
				}
			});
		});

		function ajax_modifyQty(pId, newQty) {
			$.ajax({
				type: "GET",
				url: "modifyQty?pId=" + pId + "&newQty=" + newQty,
				success: function (data) {
					if (data.hasOwnProperty('error')) {
						alert(data["error"]);
						$input.val(data["stock"]);
					} else {
						$(".total_price_span").html("總付款金額:" + data + "元");
					}
				}
			});
		}

	</script>

	<!-- 購物車script -->
	<script type="text/javascript">
		function continueShopping() {
			window.location.href = "home";
		}
		function checkOut() {
			let oItem = document.getElementById("oItem").value;
			if (oItem == '{}' || oItem == '') {
				window.alert("購物車為空，請選購商品");
			} else {
				window.location.href = "<c:url value='/addOrder' />";
			}
		}
		function cancelProduct(pId) {
			if (confirm("你確定要移除嗎?")) {
				document.getElementById("cartForm").action = "<c:url value='/cancelProduct?pId=" + pId + "' />";
				document.getElementById("cartForm").submit();

			}
		}
		function modifyQty(pId, qty, index) {
			let x = index + "qty";
			let newQty = document.getElementById(x).value;
			if (confirm("購買數量將變更為" + newQty + "個，請確認是否更新")) {
				document.getElementById("cartForm").action = "<c:url value='/modifyQty?pId=" + pId + "&newQty=" + newQty + "' />";
				document.getElementById("cartForm").submit();
			}
		}
	</script>
</body>

</html>