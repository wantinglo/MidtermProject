<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop Homepage - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="../static/css/bootstrap-grid.css" rel="stylesheet">
<link href="../static/css/bootstrap-reboot.css" rel="stylesheet">
<link href="../static/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../static/css/shop-homepage.css" rel="stylesheet">
<style>
#img{display:block; margin:auto;}
</style>
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4">Shop Name</h1>
				<div class="list-group">
					<a href="/HibernateWebProject/productC/phone"
						class="list-group-item">XPhone</a> <a
						href="/HibernateWebProject/productC/pad" class="list-group-item">XPad</a>
					<a href="/HibernateWebProject/productC/mac"
						class="list-group-item">XMac</a>
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="../static/css/img/iphone.png"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="../static/css/img/ipad.png"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="../static/css/img/mac.png"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div class="row">
					<c:forEach var="item" items="${listProduct}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
							<a href="<%=request.getContextPath()%>/productC/Detail?p_id=<c:out value='${item.p_id}'/>">
							<img id="img" src="<c:url value="/productC/getImage?img=${item.p_img}" /> " width="150" >
							</a>
								
								<div class="card-body">
									<h4 class="card-title">
										<a href="<%=request.getContextPath()%>/productC/Detail?p_id=<c:out value='${item.p_id}'/>">more</a>
									    
									</h4>

									<h5>${item.price}</h5>
									<p class="card-text">${item.des}</p>
								</div>
								 <input type="button" class="btn btn-secondary" style="background-color: #7D706f" value="buy" onclick="location.href='cart'">
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="../static/jquery/jquery.min.js"></script>
	<script src="../static/jquery/jquery.slim.min.js"></script>
	<script src="../static/js/bootstrap.min.js"></script>
	<script src="../static/js/bootstrap.bundle.min.js"></script>

</body>

</html>
