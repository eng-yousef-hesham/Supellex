<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if (request.getAttribute("validindexjsp") == null) {
	response.sendRedirect(request.getContextPath() + "/home?page=home");
	return;
}
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header&footer/home_header.jsp"></c:import>
<%@ page import="com.supellex.entity.product"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>

<!-- Featured Start -->
<div class="container-fluid pt-5">
	<div class="row px-xl-5 pb-3">
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
			<div class="d-flex align-items-center border mb-4"
				style="padding: 30px;">
				<h1 class="fa fa-check text-primary m-0 mr-3"></h1>
				<h5 class="font-weight-semi-bold m-0">Quality Product</h5>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
			<div class="d-flex align-items-center border mb-4"
				style="padding: 30px;">
				<h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
				<h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
			<div class="d-flex align-items-center border mb-4"
				style="padding: 30px;">
				<h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
				<h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
			<div class="d-flex align-items-center border mb-4"
				style="padding: 30px;">
				<h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
				<h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
			</div>
		</div>
	</div>
</div>
<!-- Featured End -->


<!-- Categories Start -->
<div class="container-fluid pt-5">
	<div class="row px-xl-5 pb-3">
		<div class="col-lg-4 col-md-6 pb-1">
			<div class="cat-item d-flex flex-column border mb-4"
				style="padding: 30px;">
				<p class="text-right">15 Products</p>
				<a href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=chairs" class="cat-img position-relative overflow-hidden mb-3">
					<img class="img-fluid" src="img/cat-1.jpg" alt="">
				</a>
				<h5 class="font-weight-semi-bold m-0">chairs</h5>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 pb-1">
			<div class="cat-item d-flex flex-column border mb-4"
				style="padding: 30px;">
				<p class="text-right">15 Products</p>
				<a href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=sofa" class="cat-img position-relative overflow-hidden mb-3">
					<img class="img-fluid" src="img/cat-2.jpg" alt="">
				</a>
				<h5 class="font-weight-semi-bold m-0">Sofas</h5>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 pb-1">
			<div class="cat-item d-flex flex-column border mb-4"
				style="padding: 30px;">
				<p class="text-right">15 Products</p>
				<a href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=tables" class="cat-img position-relative overflow-hidden mb-3">
					<img class="img-fluid" src="img/cat-3.jpg" alt="">
				</a>
				<h5 class="font-weight-semi-bold m-0">Tables</h5>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 pb-1">
			<div class="cat-item d-flex flex-column border mb-4"
				style="padding: 30px;">
				<p class="text-right">15 Products</p>
				<a href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=storage" class="cat-img position-relative overflow-hidden mb-3">
					<img class="img-fluid" src="img/cat-4.jpg" alt="">
				</a>
				<h5 class="font-weight-semi-bold m-0">storage</h5>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 pb-1">
			<div class="cat-item d-flex flex-column border mb-4"
				style="padding: 30px;">
				<p class="text-right">15 Products</p>
				<a href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=portraits" class="cat-img position-relative overflow-hidden mb-3">
					<img class="img-fluid" src="img/cat-5.jpg" alt="">
				</a>
				<h5 class="font-weight-semi-bold m-0">portraits</h5>
			</div>
		</div>
		<div class="col-lg-4 col-md-6 pb-1">
			<div class="cat-item d-flex flex-column border mb-4"
				style="padding: 30px;">
				<p class="text-right">15 Products</p>
				<a href="${pageContext.request.contextPath}/shop_cortroller?page=shop&categ=lights" class="cat-img position-relative overflow-hidden mb-3">
					<img class="img-fluid" src="img/cat-6.jpg" alt="">
				</a>
				<h5 class="font-weight-semi-bold m-0">lights</h5>
			</div>
		</div>
	</div>
</div>
<!-- Categories End -->


<!-- Offer Start -->
<div class="container-fluid offer pt-5">
	<div class="row px-xl-5">
		<div class="col-md-6 pb-4">
			<div
				class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
				<img src="img/offer-1.png" alt="">
				<div class="position-relative" style="z-index: 1;">
					<h5 class="text-uppercase text-primary mb-3">20% off the all
						order</h5>
					<h1 class="mb-4 font-weight-semi-bold">Black&White Collection</h1>
					<a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop
						Now</a>
				</div>
			</div>
		</div>
		<div class="col-md-6 pb-4">
			<div
				class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
				<img src="img/offer-2.png" alt="">
				<div class="position-relative" style="z-index: 1;">
					<h5 class="text-uppercase text-primary mb-3">20% off the all
						order</h5>
					<h1 class="mb-4 font-weight-semi-bold">colorful Collection</h1>
					<a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop
						Now</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Offer End -->


<!-- Products Start -->
<div class="container-fluid pt-5">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">Trandy Products</span>
		</h2>
	</div>
	<div class="row px-xl-5 pb-3">


		<%
		List<product> product1 = (List) request.getAttribute("trandy_products");
		
		Map<Integer, String[]> items = new HashMap<Integer, String[]>();
		items =	(Map) request.getAttribute("get_product_poto");
		
		
		int sizee = product1.size();
		if (sizee >= 8) {
			sizee = 7;
		}
		for (int i = 0; i < sizee; i++) {
			
			
			String path1 = "product_imgs" + File.separator;
			
			String [] item ;
			
			
			 item  = (String[])items.get(product1.get(i).getIdproduct());
			
			
			
			if (item == null) {
				item = new String[1];
				item[0]=("nothing.png");
			}
			System.out.print("kkk");
		%>
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
			<div class="card product-item border-0 mb-4">
				<div
					class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
					<img class="img-fluid w-100" src="<%=path1 + item[0]%>" alt=""style="max-height: 300px;">
				</div>
				<div
					class="card-body border-left border-right text-center p-0 pt-4 pb-3">
					<h6 class="text-truncate mb-3">
						<%
						out.print((product1.get(i).getProduct_titel()));
						%>

					</h6>
					<div class="d-flex justify-content-center">

						<h6>
							$<%
							out.print((product1.get(i).getPrice()));
							%>
						</h6>
						<h6 class="text-muted ml-2">
							<del>
								$<%
								out.print((product1.get(i).getdiscount()));
								%>
							</del>
						</h6>
					</div>
				</div>
				<div
					class="card-footer d-flex justify-content-between bg-light border">
					<a
						href="${pageContext.request.contextPath}/shopdetail_controller?page=shopdetail&item=<%
									out.print((product1.get(i).getIdproduct()));
								%>"
						class="btn btn-sm text-dark p-0"><i
						class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a href="${pageContext.request.contextPath}/cart_controller?page=cart&add=<%
									out.print((product1.get(i).getIdproduct()));
								%>"
						class="btn btn-sm text-dark p-0"><i
						class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
				</div>
			</div>
		</div>
		<%
		}
		%>


	</div>
</div>
<!-- Products End -->


<!-- Subscribe Start -->
<div class="container-fluid bg-secondary my-5">
	<div class="row justify-content-md-center py-5 px-xl-5">
		<div class="col-md-6 col-12 py-5">
			<div class="text-center mb-2 pb-2">
				<h2 class="section-title px-5 mb-3">
					<span class="bg-secondary px-2">Stay Updated</span>
				</h2>
				<p>With us, you will find all that you need.</p>
			</div>
		</div>
	</div>
</div>
<!-- Subscribe End -->


<!-- Products Start -->
<div class="container-fluid pt-5">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">Just Arrived</span>
		</h2>
	</div>
	<div class="row px-xl-5 pb-3">
		<!--for each-->
		<%
		List<product> product2 = (List) request.getAttribute("Just_Arrived_product");
				
		
				
				
				
		int sizee2 = product2.size();
		if (sizee2 >= 8) {
			sizee2 = 8;
		}
		for (int i = 0; i < sizee2; i++) {
			
			String path1 = "product_imgs" + File.separator;
			
			String [] item ;
			
			
			 item  = (String[])items.get(product2.get(i).getIdproduct());
			
			
			
			if (item == null) {
				item = new String[1];
				item[0]=("nothing.png");
			}
			System.out.print("kkk");
		%>
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
			<div class="card product-item border-0 mb-4">
				<div
					class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
					<img class="img-fluid w-100" src="<%=path1 + item[0]%>" alt="" style="max-height: 300px;">
				</div>
				<div
					class="card-body border-left border-right text-center p-0 pt-4 pb-3">
					<h6 class="text-truncate mb-3">
						<%
						out.print((product2.get(i).getProduct_titel()));
						%>
					</h6>
					<div class="d-flex justify-content-center">
						<h6>
							<%
							out.print((product2.get(i).getPrice()));
							%>
						</h6>
						<h6 class="text-muted ml-2">
							<del>
								$<%
								out.print((product2.get(i).getdiscount()));
								%>
							</del>
						</h6>
					</div>
				</div>
				<div
					class="card-footer d-flex justify-content-between bg-light border">
					<a
						href="${pageContext.request.contextPath}/shopdetail_controller?page=shopdetail&item=<%
									out.print((product2.get(i).getIdproduct()));
								%>"
						class="btn btn-sm text-dark p-0"><i
						class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a href="${pageContext.request.contextPath}/cart_controller?page=cart&add=<%
									out.print((product2.get(i).getIdproduct()));
								%>"
						class="btn btn-sm text-dark p-0"><i
						class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
				</div>
			</div>
		</div>
		<%
		}
		%>


	</div>
</div>
<!-- Products End -->



<!-- Vendor End -->
<c:import url="/header&footer/Footer.jsp"></c:import>