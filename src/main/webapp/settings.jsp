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
		<h1 class="font-weight-semi-bold text-uppercase mb-3">orders</h1>
		<div class="d-inline-flex">
			<p class="m-0">
				<a
					href="${pageContext.request.contextPath}/shop_cortroller?page=shop">Shop</a>
			</p>
			<p class="m-0 px-2">-</p>
			<p class="m-0">Shopping Cart</p>
		</div>
	</div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
	<div class="row px-xl-5">
		<div class="col-lg-3  mb-5"></div>
		<div class="col-lg-6 table-responsive mb-5">
			<table class="table table-bordered text-center mb-0">
				<thead class="bg-secondary text-dark">
					<%
					user tempuser = (user) request.getAttribute("user_data");
					%>

					<tr class="bg-primary text-dark">

						<th colspan="5">Your Info</th>


					</tr>
					<tr>
						<th colspan="1">id</th>
						<th colspan="4"><%=tempuser.getId()%></th>

					</tr>
					<tr>
						<th colspan="1">name</th>
						<th colspan="4"><%=tempuser.getUsername()%></th>

					</tr>
					<tr>
						<th colspan="1">email</th>
						<th colspan="4"><%=tempuser.getEmail()%></th>

					</tr>
					<tr class="bg-primary text-dark">

						<th colspan="5">Your Orders</th>

					</tr>
					<tr>
						<th>id</th>
						<th colspan="2">Product name</th>
						<th>Price</th>
						<th>view</th>
					</tr>
				</thead>
				<tbody class="align-middle">
					<%
					List<product> products = (List) request.getAttribute("user_products");
					int size = products.size();
					int total = 0;
					int price;
					for (int i = 0; i < size; i++) {

						price = products.get(i).getPrice() - products.get(i).getdiscount();
						total = total + price;
					%>
					<tr>
						<td class="align-middle"><%=products.get(i).getIdproduct()%></td>
						<td class="align-middle" colspan="2"><%=products.get(i).getProduct_titel()%></td>
						<td class="align-middle">$<%=price%></td>
						<td class="align-middle"><a
							href="${pageContext.request.contextPath}/shopdetail_controller?page=shopdetail&item=<%=products.get(i).getIdproduct()%>"
							class="btn btn-sm btn-primary"><i class="fas fa-eye  mr-1"></i></a></td>
					</tr>
					<%
					}
					%>
					<tr>
						<td class="bg-secondary text-dark" colspan="3">total price</td>
						<td class="bg-secondary text-dark" colspan="2"><%=total%></td>

					</tr>
				</tbody>

				<tfoot class="bg-secondary text-dark">
					<tr class="bg-primary text-dark">

						<th colspan="5">Your Address</th>


					</tr>
					<tr>
						<th colspan="4">Click Here</th>
						<th>
							<!-- ---------------------------------- -->
							<div class="container">
								<button type="button" class="btn btn-sm btn-primary"
									data-bs-toggle="modal" data-bs-target="#myModal">
									<i class="fa fa-times"></i>
								</button>
								<div class="modal" id="myModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">address</h5>

											</div>
											<div class="modal-body">

												<table class="table table-bordered text-center mb-0">
													<tbody class="align-middle">
														<%
														address tempaddress = (address) request.getAttribute("user_address");
														%>
														<tr>
															<td colspan="1">contact email</td>
															<td colspan="4"><%=tempaddress.getEmail()%></td>
														</tr>
														<tr>
															<td colspan="1">Phone</td>
															<td colspan="4"><%=tempaddress.getPhone()%></td>
														</tr>
														<tr>
															<td colspan="1">address 1</td>
															<td colspan="4"><%=tempaddress.getAddress1()%></td>
														</tr>
														<tr>
															<td colspan="1">address 2</td>
															<td colspan="4"><%=tempaddress.getAddress2()%></td>
														</tr>
														<tr>
															<td colspan="1">country</td>
															<td colspan="4"><%=tempaddress.getCountry()%></td>
														</tr>
														<tr>
															<td colspan="1">city</td>
															<td colspan="4"><%=tempaddress.getCity()%></td>
														</tr>
													</tbody>
												</table>


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
						<!-- -------------------------------------- -->
					</tr>
					<tr class="bg-primary text-dark">

						<th colspan="5">Delete Account</th>


					</tr>
					<tr>
						<th colspan="4">Click Here To Delete Your Account</th>
						<th><a
							href="${pageContext.request.contextPath}/delete_account_controller?page=delete_account"
							class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></th>
					</tr>
				</tfoot>




			</table>
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