<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header&footer/header.jsp"></c:import>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
	<div
		class="d-flex flex-column align-items-center justify-content-center"
		style="min-height: 300px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Add product photos</h1>

	</div>
</div>
<!-- Page Header End -->


<!-- Contact Start -->
<div class="container-fluid pt-5">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">add photo</span>
		</h2>
	</div>
	<div class="row px-xl-5">
		<div class="col-lg-3 mb-5"></div>
		<div class="col-lg-6 mb-5">
			<div class="contact-form">
				<div id="success"></div>
				<form name="addproduct"
					action="${pageContext.request.contextPath}/admin_photo_controller"
					method="post" enctype="multipart/form-data">

					<div class="control-group">
						<input type="file" name="files" multiple="multiple"
							class="form-control" required="required"/>
						<p class="help-block text-danger"></p>
					</div>



					<div>
						<button class="btn btn-primary py-2 px-4" type="submit"
							id="sendMessageButton">add Photo</button>
					</div>
				</form>
			</div>
		</div>
		<div class="col-lg-3 mb-5"></div>
	</div>
</div>
<!-- Contact End -->
<c:import url="/header&footer/Footer.jsp"></c:import>