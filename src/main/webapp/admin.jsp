<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header&footer/header.jsp"></c:import>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
	<div
		class="d-flex flex-column align-items-center justify-content-center"
		style="min-height: 300px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Add new product</h1>

	</div>
</div>
<!-- Page Header End -->


<!-- Contact Start -->
<div class="container-fluid pt-5">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">add new product</span>
		</h2>
	</div>
	<div class="row px-xl-5">
	<div class="col-lg-3 mb-5">
	</div>
		<div class="col-lg-6 mb-5">
			<div class="contact-form">
				<div id="success"></div>
				<form name="addproduct"
					action="${pageContext.request.contextPath}/admin_controller"
					method="post"  enctype="multipart/form-data">
					
					<div class="control-group">
						<input name="product_name" type="text" class="form-control"
							id="name" placeholder="product name" required="required"
							data-validation-required-message="Please enter product name" />
						<p class="help-block text-danger"></p>
					</div>
					<div class="control-group">
						<input name="product_price" type="number" class="form-control"
							id="email" placeholder="product price" required="required"
							data-validation-required-message="Please enter product price" />
						<p class="help-block text-danger"></p>
					</div>
					<div class="control-group">
						<input name="product_discount" type="number" class="form-control"
							id="discount" placeholder="product discount" 
							data-validation-required-message="Please enter product discount" />
						<p class="help-block text-danger"></p>
					</div>
					<div class="control-group">
						<input name="category" type="text" class="form-control"
							id="subject" placeholder="category" required="required"
							data-validation-required-message="Please enter a category" />
						<p class="help-block text-danger"></p>
					</div>
					<div class="control-group">
						<textarea name="description" class="form-control" rows="6"
							id="message" placeholder="description" required="required"
							data-validation-required-message="Please enter your description"></textarea>
						<p class="help-block text-danger"></p>
					</div>
					<!-- rate area -->
					<div>
						<p class="text-dark font-weight-medium mb-0 mr-3">Rate:</p>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-1"
								name="rate" value="1"> <label class="custom-control-label"
								for="color-1">1</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-2"
								name="rate" value="2"> <label class="custom-control-label"
								for="color-2">2</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-3"
								name="rate" value="3"> <label class="custom-control-label"
								for="color-3">3</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-4"
								name="rate" value="4"> <label class="custom-control-label"
								for="color-4">4</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-5"
								name="rate" value="5"> <label class="custom-control-label"
								for="color-5">5</label>
						</div>
					</div>
					<div>
						<button class="btn btn-primary py-2 px-4" type="submit"
							id="sendMessageButton">add product</button>
					</div>
				</form>
			</div>
		</div>
		<div class="col-lg-3 mb-5">
			
		</div>
	</div>
</div>
<!-- Contact End -->
<c:import url="/header&footer/Footer.jsp"></c:import>