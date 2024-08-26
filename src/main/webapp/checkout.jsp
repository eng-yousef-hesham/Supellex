<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header&footer/header.jsp"></c:import>
<%@ page import="com.supellex.entity.address"%>
<%@ page import="com.supellex.entity.product"%>
<%@ page import="java.util.List"%>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
	<div
		class="d-flex flex-column align-items-center justify-content-center"
		style="min-height: 300px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
		<div class="d-inline-flex">
			<p class="m-0">
				<a href="${pageContext.request.contextPath}/cart_controller?page=cart">cart</a>
			</p>
			<p class="m-0 px-2">-</p>
			<p class="m-0">Checkout</p>
		</div>
	</div>
</div>
<!-- Page Header End -->


<!-- Checkout Start -->
<div class="container-fluid pt-5">
	<form action="${pageContext.request.contextPath}/checkout_controller?">
		<input type="hidden" name="page" value="checkout">
		<div class="row px-xl-5">

			<div class="col-lg-8">
				<div class="mb-4">
					<h4 class="font-weight-semi-bold mb-4">Shipping Address</h4>
					<%
					List<address> address2 = new ArrayList<address>();
					if (request.getAttribute("getoldaddress") != null) {
						address2 = (List) request.getAttribute("getoldaddress");
					}
					%>
					<div class="row">
						<div class="col-md-6 form-group">
							<label>E-mail</label> <input name="email"
								<%if (request.getAttribute("getoldtest") != null) {%>
								value="<%=address2.get(0).getEmail()%>" <%}%>
								class="form-control" type="text" placeholder="example@email.com">
						</div>
						<div class="col-md-6 form-group">
							<label>Mobile No</label> <input name="phone"
								<%if (request.getAttribute("getoldtest") != null) {%>
								value="<%=address2.get(0).getPhone()%>" <%}%>
								class="form-control" type="text" placeholder="+123 456 789">
						</div>
						<div class="col-md-6 form-group">
							<label>Address Line 1</label> <input name="address1"
								<%if (request.getAttribute("getoldtest") != null) {%>
								value="<%=address2.get(0).getAddress1()%>" <%}%>
								class="form-control" type="text" placeholder="123 Street">
						</div>
						<div class="col-md-6 form-group">
							<label>Address Line 2</label> <input name="address2"
								<%if (request.getAttribute("getoldtest") != null) {%>
								value="<%=address2.get(0).getAddress2()%>" <%}%>
								class="form-control" type="text" placeholder="123 Street">
						</div>
						<div class="col-md-6 form-group">
							<label>country</label> <input name="country"
								<%if (request.getAttribute("getoldtest") != null) {%>
								value="<%=address2.get(0).getCountry()%>" <%}%>
								class="form-control" type="text" placeholder="ex : Egypt">
						</div>
						<div class="col-md-6 form-group">
							<label>City</label> <input name="city"
								<%if (request.getAttribute("getoldtest") != null) {%>
								value="<%=address2.get(0).getCity()%>" <%}%>
								class="form-control" type="text" placeholder="New York">
						</div>

						<div class="col-md-12 form-group">


							<div class="input-group quantity mr-3" style="width: 230px;">
								<button name="getold" value="true" type="submit"
									class="btn btn-primary px-3">
									<i class="fa  mr-1"></i>Get last address
								</button>
							</div>
							<input type="checkbox" name="save" value="true"><label>&nbsp;&nbsp;save
								address</label>


						</div>
						<div class="col-md-12 form-group">
							<div class="custom-control custom-checkbox">
								<!-- error message area -->
							</div>
						</div>
					</div>
				</div>
				<div class="collapse mb-4" id="shipping-address"></div>
			</div>
			<div class="col-lg-4">
				<div class="card border-secondary mb-5">
					<div class="card-header bg-secondary border-0">
						<h4 class="font-weight-semi-bold m-0">Order Total</h4>
					</div>
					<div class="card-body">
						<h5 class="font-weight-medium mb-3">Products</h5>

						<%
						List<product> product1 = (List) request.getAttribute("get_cart_product_for_address");
						int size = product1.size();
						int total = 0;
						for (int i = 0; i < size; i++) {
							total = total + product1.get(i).getPrice() - product1.get(i).getdiscount();
						%>
						<div class="d-flex justify-content-between">
							<p><%=product1.get(i).getProduct_titel()%></p>
							<p>
								$<%=product1.get(i).getPrice() - product1.get(i).getdiscount()%></p>
						</div>
						<%
						}
						%>

						<hr class="mt-0">
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium">Subtotal</h6>
							<h6 class="font-weight-medium">
								$<%=total%></h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Shipping</h6>
							<h6 class="font-weight-medium">$10</h6>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent">
						<div class="d-flex justify-content-between mt-2">
							<h5 class="font-weight-bold">Total</h5>
							<h5 class="font-weight-bold">
								$<%=total + 10%></h5>
						</div>
					</div>
				</div>
				<div class="card border-secondary mb-5">
					<div class="card-header bg-secondary border-0">
						<h4 class="font-weight-semi-bold m-0">Payment</h4>
					</div>
						<div class="m-4">
							<div class="custom-control custom-radio">
								<input checked="checked" type="radio" class="custom-control-input" name="payment"
									id="banktransfer"> <label class="custom-control-label"
									for="banktransfer">only cash on delivery</label>
							</div>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent">
						<button 
							class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place
							Order</button>
					</div>
				</div>
			</div>

		</div>
	</form>
</div>
<!-- Checkout End -->
<c:import url="/header&footer/Footer.jsp"></c:import>