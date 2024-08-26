<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/login_style.css">
<title>Document</title>
</head>
<body>
	<div class="container-fluid pt-5">
		<div class="row px-xl-6">
			<div class="col-lg-2 col-md-2 "></div>

			<div class="col-lg-8 col-md-8" style=" overflow: hidden; ">
				<section class="forms-section">
					<h1 class="section-title">
						<img src="img/logo.svg" alt=""
							style="width: 80%; margin: 50px; margin-right: 0px;">
					</h1>
					<div class="forms">
						<div class="form-wrapper is-active">
							<button type="button" class="switcher switcher-login">
								Login <span class="underline"></span>
							</button>
							<form class="form form-login"
								action="${pageContext.request.contextPath}/login_controller"
								method="post">
								<fieldset>
									<legend>Please, enter your email and password for
										login.</legend>

									<%
									String done = request.getParameter("done");
									String error = request.getParameter("error");
									if (error != null) {
										out.print(
										"<h6 style='display: flex; color: #a92b2bb8; border-color: #b90000b8; border-style: double; justify-content: center; border-radius: 20px;'>");
										out.print(error);
										out.print("</h6>");
									}
									if (done != null) {
										out.print(
										"<h6 style='display: flex; color: #277700b8; border-color: #277700; border-style: double; justify-content: center; border-radius: 20px;'>");
										out.print(done);
										out.print("</h6>");
									}
									%>


									<div class="input-block">
										<label for="login-email">E-mail</label> <input name="email"
											id="login-email" type="email" required>
									</div>
									<div class="input-block">
										<label for="login-password">Password</label> <input
											name="password" id="login-password" type="password" required>
									</div>
								</fieldset>
								<button type="submit" class="btn-login">Login</button>
							</form>
						</div>
						<div class="form-wrapper">
							<button type="button" class="switcher switcher-signup">
								Sign Up <span class="underline"></span>
							</button>
							<form class="form form-signup"
								action="${pageContext.request.contextPath}/signup_controller"
								method="post">
								<fieldset>
									<legend>Please, enter your email, password and
										password confirmation for sign up.</legend>
									<div class="input-block">
										<label for="signup-username">UserName</label> <input
											id="signup-username" type="text" name="signup-username"
											required>
									</div>
									<div class="input-block">
										<label for="signup-email">E-mail</label> <input
											id="signup-email" type="email" name="signup-email" required>
									</div>
									<div class="input-block">
										<label for="signup-password">Password</label> <input
											id="signup-password" type="password" name="signup-password"
											required>
									</div>
									<div class="input-block">
										<label for="signup-password-confirm">Confirm password</label>
										<input id="signup-password-confirm" type="password"
											name="signup-password-confirm" required>
									</div>
								</fieldset>
								<button type="submit" class="btn-signup">Continue</button>
							</form>
						</div>
					</div>
				</section>
			</div>
			<div class="col-lg-2 col-md-2"></div>
		</div>



		<script src="js/login_script.js"></script>
		<div class="row px-xl-0">
			<div class="col-lg-12 col-md-12">
				<c:import url="/header&footer/Footer.jsp"></c:import>
			</div>
		</div>
	</div>
</body>
</html>