<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header&footer/header.jsp"></c:import>
<%@ page import="com.supellex.entity.product"%>
<%@ page import="com.supellex.entity.user"%>
<%@ page import="com.supellex.entity.address"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
	<div
		class="d-flex flex-column align-items-center justify-content-center"
		style="min-height: 300px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Delete
			Account</h1>
		<div class="d-inline-flex">
			<p class="m-0">
				<a
					href="${pageContext.request.contextPath}/settings_controller?page=settings">settings</a>
			</p>
			<p class="m-0 px-2">-</p>
			<p class="m-0">settings</p>
		</div>
	</div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
	<div class="row px-xl-5">
		<div class="col-lg-3  mb-5"></div>
		<div class="col-lg-6  mb-5"
			style="display: grid; justify-content: center;overflow: hidden;">
			<div class="container-fluid pt-5">
				<div class="row px-xl-5">
					<img alt="" src="img/warning.png">
				</div>
			</div>
			<div class="row px-xl-5">
				<h3>You will lose your all data, Are you sure?</h3>
			</div>
			<div class="row px-xl-5" style=" justify-content:center;">
				<a
					href="${pageContext.request.contextPath}/delete_account_controller?page=delete_account&agree_on_delete=agree"
					class="btn btn-sm btn-danger m-4"
					onclick="if(!(confirm('Are You Want To Delete Your Account?')))return false">i'm
					sure</a>
			</div>

		</div>
		<div class="col-lg-3  mb-5"></div>


	</div>

</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>

<!-- Cart End -->
<c:import url="/header&footer/Footer.jsp"></c:import>