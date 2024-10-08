<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>supellex.com</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">


<link rel="shortcut icon" href="img/logo.svg" type="image/x-icon" />


<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Topbar Start -->
	<div class="container-fluid">
		<div class="row align-items-center py-3 px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a href="" class="text-decoration-none"> <img src="img/logo.svg"
					style="width: 200px;">
				</a>
			</div>
			<div class="col-lg-6 col-6 text-left">
				<form action="${pageContext.request.contextPath}/shop_cortroller">
					<input type="hidden" name="page" value="shop">
					<div class="input-group">
						<input type="text" name="name" class="form-control"
							placeholder="Search for products">
						<div class="input-group-append">
							<button type="submit"
								class="input-group-text bg-transparent text-primary">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3 col-6 text-right">
				<a
					href="${pageContext.request.contextPath}/wishlist_controller?page=wishlist"
					class="btn border"> <i class="fas fa-heart text-primary"></i> <span
					class="badge"></span>
				</a> <a
					href="${pageContext.request.contextPath}/cart_controller?page=cart"
					class="btn border"> <i
					class="fas fa-shopping-cart text-primary"></i> <span class="badge"></span>
				</a>
			</div>
		</div>
	</div>
	<!-- Topbar End -->
	<!-- Navbar Start -->
	<div class="container-fluid">
		<div class="row border-top px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; margin-top: -1px; padding: 0 30px;">
					<h6 class="m-0">Categories</h6> <i
					class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light"
					id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
					<div class="navbar-nav w-100 overflow-hidden" style="height: 300px">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link" data-toggle="dropdown">Rooms <i
								class="fa fa-angle-down float-right mt-1"></i></a>
							<div
								class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
								<a href="" class="dropdown-item">TV Room</a> <a href=""
									class="dropdown-item">Bedroom</a> <a href=""
									class="dropdown-item">Baby's Room</a>
							</div>
						</div>
						<a
							href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=chairs"
							class="nav-item nav-link">chairs</a> <a
							href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=sofa"
							class="nav-item nav-link">Sofas</a> <a
							href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=tables"
							class="nav-item nav-link">Tables</a> <a
							href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=storage"
							class="nav-item nav-link">Storage</a> <a
							href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=lights"
							class="nav-item nav-link">lights</a> <a
							href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=portraits"
							class="nav-item nav-link">portraits</a>
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
					<a href="" class="text-decoration-none d-block d-lg-none"> <img
						src="img/logo.svg" style="width: 200px">
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="${pageContext.request.contextPath}/home?page=home"
								class="nav-item nav-link ">Home</a> <a
								href="${pageContext.request.contextPath}/shop_cortroller?page=shop"
								class="nav-item nav-link">Shop</a> <a
								href="${pageContext.request.contextPath}/cart_controller?page=cart"
								class="nav-item nav-link">Shopping Cart</a> <a
								href="${pageContext.request.contextPath}/checkout_controller?page=checkout"
								class="nav-item nav-link">Checkout</a>

							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown">Account</a>
								<div class="dropdown-menu rounded-0 m-0">
									<a
										href="${pageContext.request.contextPath}/settings_controller?page=settings"
										class="dropdown-item">settings</a> <a
										href="${pageContext.request.contextPath}/contact_controller?page=contact"
										class="dropdown-item">Contact Us</a> <a
										href="${pageContext.request.contextPath}/logout_controller"
										class="dropdown-item">Logout</a>
								</div>
							</div>

							<%
							if (request.getSession().getAttribute("isadmin") != null) {
								if (request.getSession().getAttribute("isadmin").equals("yes")) {
							%>
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown">Admin</a>
								<div class="dropdown-menu rounded-0 m-0">
									<a
										href="${pageContext.request.contextPath}/admin_controller?page=admin"
										class="dropdown-item">Add product</a> <a
										href="${pageContext.request.contextPath}/orders_control_controller?page=orderscontrol"
										class="dropdown-item">orders controller</a> <a
										href="${pageContext.request.contextPath}/user_message_controller?page=user_message"
										class="dropdown-item">users messages</a> <a
										href="${pageContext.request.contextPath}/add_admin_controller?page=add_admin"
										class="dropdown-item">add new admin</a>
								</div>
							</div>
							<%
							}
							}
							%>
						</div>
						<div class="navbar-nav ml-auto py-0">
							<a
								href="${pageContext.request.contextPath}/login_controller?page=login"
								class="nav-item nav-link">LOGIN / SIGN UP</a>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->