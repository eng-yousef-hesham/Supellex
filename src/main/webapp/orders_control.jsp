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

	</div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
	<div class="row px-xl-5">
		<%
		List<Integer> ids = (List) request.getAttribute("ids_from_order");
		List<user> users = (List) request.getAttribute("user_from_order");
		List<address> address = (List) request.getAttribute("address_from_order");
		int size1 = ids.size();
		for (int i = 0; i < size1; i++) {
		%>
		<div class="col-lg-3 table-responsive mb-5">
			<table class="table table-bordered text-center mb-0">
				<thead class="bg-secondary text-dark">
					<tr class="bg-primary text-dark">

						<th colspan="1">order id</th>
						<th colspan="4"><%=i%></th>

					</tr>
					<tr>
						<th colspan="1">id</th>
						<th colspan="4"><%=users.get(i).getId()%></th>

					</tr>
					<tr>
						<th colspan="1">name</th>
						<th colspan="4"><%=users.get(i).getUsername()%></th>

					</tr>
					<tr>
						<th colspan="1">email</th>
						<th colspan="4"><%=users.get(i).getEmail()%></th>

					</tr>
					<tr class="bg-primary text-dark">

						<th colspan="5">orders</th>

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
					Map<Integer, List<product>> map = (Map) request.getAttribute("products_from_order");
					List<product> product1 = (List) map.get(users.get(i).getId());

					int size2 = product1.size();
					int price = 0;
					for (int t = 0; t < size2; t++) {
						price = price + product1.get(t).getPrice() - product1.get(t).getdiscount();
					%>
					<tr>
						<td class="align-middle"><%=product1.get(t).getIdproduct()%></td>
						<td class="align-middle" colspan="2"><%=product1.get(t).getProduct_titel()%></td>
						<td class="align-middle">$<%=product1.get(t).getPrice() - product1.get(t).getdiscount()%></td>
						<td class="align-middle"><a
							href="${pageContext.request.contextPath}/shopdetail_controller?page=shopdetail&item=<%=product1.get(t).getIdproduct()%>"
							class="btn btn-sm btn-primary"><i class="fas fa-eye  mr-1"></i></a></td>
					</tr>
					<%
					}
					%>
					<tr>
						<td class="bg-secondary text-dark" colspan="3">total price</td>
						<td class="bg-primary text-dark" colspan="2"><%=price%></td>

					</tr>
				</tbody>

				<tfoot class="bg-secondary text-dark">
					<tr>
						<th colspan="4">address</th>
						<th>
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
												<h5 class="modal-title"><%=users.get(i).getUsername() + "  "%>address
												</h5>

											</div>
											<div class="modal-body">

												<table class="table table-bordered text-center mb-0">
													<tbody class="align-middle">

														<tr>
															<td colspan="1">contact email</td>
															<td colspan="4"><%=address.get(i).getEmail()%></td>
														</tr>
														<tr>
															<td colspan="1">Phone</td>
															<td colspan="4"><%=address.get(i).getPhone()%></td>
														</tr>
														<tr>
															<td colspan="1">address 1</td>
															<td colspan="4"><%=address.get(i).getAddress1()%></td>
														</tr>
														<tr>
															<td colspan="1">address 2</td>
															<td colspan="4"><%=address.get(i).getAddress2()%></td>
														</tr>
														<tr>
															<td colspan="1">country</td>
															<td colspan="4"><%=address.get(i).getCountry()%></td>
														</tr>
														<tr>
															<td colspan="1">city</td>
															<td colspan="4"><%=address.get(i).getCity()%></td>
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
					<tr>
						<th colspan="4">done</th>
						<th><a
							href="${pageContext.request.contextPath}/orders_control_controller?page=orderscontrol&delete=<%=users.get(i).getId()%>"
							class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></th>
					</tr>
				</tfoot>




			</table>
		</div>
		<%
		}
		%>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<!-- Cart End -->
	<c:import url="/header&footer/Footer.jsp"></c:import>