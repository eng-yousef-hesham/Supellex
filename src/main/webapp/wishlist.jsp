<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header&footer/header.jsp"></c:import>
<%@ page import="com.supellex.entity.product"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
	<div
		class="d-flex flex-column align-items-center justify-content-center"
		style="min-height: 300px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Your Wishlist</h1>
		<div class="d-inline-flex">
			<p class="m-0">
				<a href="${pageContext.request.contextPath}/home?page=home">Home</a>
			</p>
			<p class="m-0 px-2">-</p>
			<p class="m-0">Shop</p>
		</div>
	</div>
</div>
<!-- Page Header End -->


<!-- Shop Start -->
<div class="container-fluid pt-5">

	<!-- Shop Sidebar End -->


	<!-- Shop Product Start -->
	<div class="col-lg-12 col-md-12">
		<div class="row pb-3">
			<div class="col-12 pb-1">
				<div class="d-flex align-items-center justify-content-center mb-4">
					<!-- search by name -->
					<form action="${pageContext.request.contextPath}/shop_cortroller"
						method="get">
						<input type="hidden" name="page" value="shop">
						<div class="input-group">
							<input type="text" name="name" class="form-control"
								placeholder="Search by name in shop">
							<div class="input-group-append">
								<button type="submit"
									class="input-group-text bg-transparent text-primary">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
					
				</div>
			</div>
			<!-- items  -->
			<%
			List<product> product3 = (List) request.getAttribute("products");
			
			
			
			Map<Integer, String[]> items = new HashMap<Integer, String[]>();
			items =	(Map) request.getAttribute("get_product_poto");
			
			int sizee2 = product3.size();
			
			
			
			for (int i = 0; i < sizee2; i++) {
				String path1 = "product_imgs" + File.separator;
				
				String [] item ;
				
				
				 item  = (String[])items.get(product3.get(i).getIdproduct());
				
				 System.out.println(item);
				
				if (item == null) {
					item = new String[1];
					item[0]=("nothing.png");
				}
				//System.out.print(item.get(0));
			%>

			<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
				<div class="card product-item border-0 mb-4">
					<div
						class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
						<img class="img-fluid w-100" style="max-height: 300px;" src="<%=path1 + item[0]%>"
							alt="">
					</div>
					<div
						class="card-body border-left border-right text-center p-0 pt-4 pb-3">
						<h6 class="text-truncate mb-3"><%
								out.print((product3.get(i).getProduct_titel()));
								%></h6>
						<div class="d-flex justify-content-center">
							<h6>$<%
									out.print((product3.get(i).getPrice()));
									%></h6>
							<h6 class="text-muted ml-2">
								<del> $<%
										out.print((product3.get(i).getdiscount()));
										%></del>
							</h6>
						</div>
					</div>
					<div
						class="card-footer d-flex justify-content-between bg-light border">
						<a href="${pageContext.request.contextPath}/shopdetail_controller?page=shopdetail&item=<%
									out.print((product3.get(i).getIdproduct()));
								%>" class="btn btn-sm text-dark p-0"><i
							class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a href="${pageContext.request.contextPath}/cart_controller?page=cart&add=<%
									out.print((product3.get(i).getIdproduct()));
								%>"
							class="btn btn-sm text-dark p-0"><i
							class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
					</div>
				</div>
			</div>

			<%
			}
			%>
			

<c:import url="/header&footer/Footer.jsp"></c:import>