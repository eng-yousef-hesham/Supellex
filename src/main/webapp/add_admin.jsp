<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header&footer/header.jsp"></c:import>
<%@ page import="com.supellex.entity.contact"%>
<%@ page import="com.supellex.entity.user"%>
<%@ page import="java.util.List"%>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
	<div
		class="d-flex flex-column align-items-center justify-content-center"
		style="min-height: 300px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Add new
			admin</h1>

	</div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">Users List</span>
		</h2>
	</div>
	<div class="row px-xl-5">
		<div class="col-lg-3 mb-5"></div>

		<div class="col-lg-6 mb-5>">
			<form action="${pageContext.request.contextPath}/add_admin_controller?page=add_admin" method="post">
			<label>Id - Username - Email</label>
				<select id="username" name="admin"
					style="width: 100%; margin-bottom: 25px; border-style: solid; border-block-width: initial; border-width: thick;">
					<%
					List<user> users = (List) request.getAttribute("users");
					int sizee = users.size();
					for (int i = 0; i < sizee; i++) {
					%>
					<option value="<%=users.get(i).getId()%>">{<%=users.get(i).getId()%>}
						- {<%=users.get(i).getUsername()%>} - {<%=users.get(i).getEmail() %>}
					</option>
					<%
					}
					%>
				</select>

				<div>
					<button class="btn btn-primary py-2 px-4" type="submit"
						id="sendMessageButton">add admin</button>
				</div>

			</form>

		</div>


		<div class="col-lg-3 mb-5"></div>
	</div>
</div>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>

<!-- Cart End -->
<c:import url="/header&footer/Footer.jsp"></c:import>