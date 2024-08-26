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
		<h1 class="font-weight-semi-bold text-uppercase mb-3">users
			message</h1>

	</div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
	<div class="row px-xl-5">
		<%
		List<user> theuser = (List) request.getAttribute("users");
		List<contact> thecontact = (List) request.getAttribute("messages");
		int size = thecontact.size();
		for (int i = 0; i < size; i++) {
		%>
		<div class="col-lg-3 table-responsive mb-5">
			<table class="table table-bordered text-center mb-0">
				<thead class="bg-secondary text-dark">
					<tr class="bg-primary text-dark">

						<th colspan="1">contact id</th>
						<th colspan="4"><%=thecontact.get(i).getIdcontact()%></th>

					</tr>
					<tr>
						<th colspan="1">id</th>
						<th colspan="4"><%=theuser.get(i).getId()%></th>

					</tr>
					<tr>
						<th colspan="1">name</th>
						<th colspan="4"><%=theuser.get(i).getUsername()%></th>

					</tr>
					<tr>
						<th colspan="1">email</th>
						<th colspan="4"><%=theuser.get(i).getEmail()%></th>

					</tr>
					<tr class="bg-primary text-dark">

						<th colspan="5">information</th>

					</tr>

				</thead>
				<tbody class="align-middle">
					<tr>
						<th>contact email</th>
						<th colspan="4"><%=thecontact.get(i).getEmail()%></th>

					</tr>
					<tr>
						<th>subject</th>
						<th colspan="4"><%=thecontact.get(i).getSubject()%></th>

					</tr>
					<tr>
						<th colspan="4">message</th>
						<th colspan="1">
							<!-- ---------------------------------- -->
							<div class="container">
								<button type="button" class="btn btn-sm btn-primary"
									data-bs-toggle="modal" data-bs-target="#myModal<%=i%>">
									<i class="fa fa-times"></i>
								</button>
								<div class="modal" id="myModal<%=i%>">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">Message</h5>

											</div>
											<div class="modal-body">

												<p style="overflow-wrap: break-word"><%=thecontact.get(i).getMessage()%></p>


											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-danger"
													data-bs-dismiss="modal">Cancel</button>
											</div>
										</div>
									</div>
								</div>
							</div>

						</th>

					</tr>
				</tbody>

				<tfoot class="bg-secondary text-dark">
					<tr>
						<th colspan="4">done</th>
						<th><a
							href="${pageContext.request.contextPath}/user_message_controller?page=user_message&delete=<%=thecontact.get(i).getIdcontact() %>"
							class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></th>
					</tr>
				</tfoot>




			</table>
		</div>
		<%
		}
		%>
	</div>
</div>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>

<!-- Cart End -->
<c:import url="/header&footer/Footer.jsp"></c:import>