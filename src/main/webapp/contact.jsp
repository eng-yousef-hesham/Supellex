<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header&footer/header.jsp"></c:import>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
	<div
		class="d-flex flex-column align-items-center justify-content-center"
		style="min-height: 300px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Contact Us</h1>
		<div class="d-inline-flex">
			<p class="m-0">
				<a href="${pageContext.request.contextPath}/shop_cortroller?page=shop">Shop</a>
			</p>
			<p class="m-0 px-2">-</p>
			<p class="m-0">Contact</p>
		</div>
	</div>
</div>
<!-- Page Header End -->


<!-- Contact Start -->
<div class="container-fluid pt-5">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">Contact For Any Queries</span>
		</h2>
	</div>
	<div class="row px-xl-5">
	<div class="col-lg-3 mb-5">
			
		</div>
		<div class="col-lg-6 mb-5">
			<div class="contact-form">
				<div id="success"></div>
				<form action="${pageContext.request.contextPath}/contact_controller" method="get" name="sentMessage" >
					<input type="text" hidden="true" name="page" value="contact" >
					<div class="control-group">
						<input type="email" name="email" class="form-control" id="email"
							placeholder="Contant Email" required="required"
							required title="please enter an email" />
						<p class="help-block text-danger"></p>
					</div>
					<div class="control-group">
						<input type="text" name="subject" class="form-control" id="subject"
							placeholder="Subject" required="required"
							required title="Please enter a subject" />
						<p class="help-block text-danger"></p>
					</div>
					<div class="control-group">
						<textarea maxlength="500" class="form-control" name="message" rows="6" id="message"
							placeholder="Message" required="required"
							required title="Please enter your message"></textarea>
						<p class="help-block text-danger"></p>
					</div>
					<div>
						<button class="btn btn-primary py-2 px-4" type="submit"
							id="sendMessageButton">Send Message</button>
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