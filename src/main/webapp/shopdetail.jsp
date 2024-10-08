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
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
		<div class="d-inline-flex">
			<p class="m-0">
				<a
					href="${pageContext.request.contextPath}/shop_cortroller?page=shop">Shop</a>
			</p>
			<p class="m-0 px-2">-</p>
			<p class="m-0">Shop Detail</p>
		</div>
	</div>
</div>
<!-- Page Header End -->


<!-- Shop Detail Start -->
<div class="container-fluid py-5">
	<div class="row px-xl-5">
		<div class="col-lg-5 pb-5">
			<div id="product-carousel" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner border">
					<%
					Map<Integer, String[]> items = new HashMap<Integer, String[]>();
					items = (Map) request.getAttribute("get_product_poto");
					int product_id = Integer.parseInt(request.getParameter("item"));
					String path1 = "product_imgs" + File.separator;
					String[] item;
					item = (String[]) items.get(product_id);

					if (item == null) {
						item = new String[1];
						item[0] = ("nothing.png");
					}
					int item_numpers = item.length;
					for (int i = 0; i < item_numpers; i++) {
					%>
					<div
						class="carousel-item <%if (i == 0) {
	out.print("active");
}%>">
						<img class="w-100 h-100" src="<%=path1 + item[i]%>" alt="Image"
							style="max-width: 700px; max-height: 500px;">
					</div>
					<%
					}
					%>
				</div>
				<a class="carousel-control-prev" href="#product-carousel"
					data-slide="prev"> <i class="fa fa-2x fa-angle-left text-dark"></i>
				</a> <a class="carousel-control-next" href="#product-carousel"
					data-slide="next"> <i class="fa fa-2x fa-angle-right text-dark"></i>
				</a>
			</div>
		</div>
		<%
		product product1 = (product) request.getAttribute("get_product_by_id");
		%>
		<div class="col-lg-7 pb-5">
			<h3 class="font-weight-semi-bold"><%=product1.getProduct_titel()%></h3>
			<div class="d-flex mb-3">
				<div class="text-primary mr-2">
					<%
					int r = product1.getProduct_rate();
					int nr = 5 - r;
					for (int i = 0; i < r; i++) {
					%>
					<small class="fas fa-star"></small>
					<%
					}
					%>
					<%
					for (int i = 0; i < nr; i++) {
					%>

					<small class="far fa-star"></small>
					<%
					}
					%>
				</div>
				<small class="pt-1">(50 Reviews)</small>
			</div>
			<h3 class="font-weight-semi-bold mb-4">
				$<%=product1.getPrice()%></h3>
			<h6 class="text-muted ml-2">
				<del>
					$<%
					out.print((product1.getdiscount()));
					%>
				</del>
			</h6>
			<!-- description -->
			<p class="mb-4">
				<%=product1.getDescription()%>
			</p>

			<div class="d-flex mb-4"></div>
			<div class="d-flex align-items-center mb-4 pt-2">
				<%
				String test = "no";
				if (request.getAttribute("inwishlist") != null) {
					test = (String) request.getAttribute("inwishlist");
				}
				if (!test.equals("true")) {
				%>
				<div class=" input-group quantity mr-3" style="width: 130px;">
					<a
						href="${pageContext.request.contextPath}/wishlist_controller?page=wishlist&item_id=<%
									out.print((product1.getIdproduct()));
								%>"
						class="btn btn-primary px-3"> <i class="fa fa-heart mr-1"></i>Wish
						List
					</a>
				</div>
				<%
				}
				%>
				<a
					href="${pageContext.request.contextPath}/cart_controller?page=cart&add=<%
									out.print((product1.getIdproduct()));
								%>"
					class="btn btn-primary px-3"> <i
					class="fa fa-shopping-cart mr-1"></i> Add To Cart
				</a>
			</div>
			<div class="d-flex pt-2">
				<p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
				<div class="d-inline-flex">
					<a class="text-dark px-2" href=""> <i class="fab fa-facebook-f"></i>
					</a> <a class="text-dark px-2" href=""> <i class="fab fa-twitter"></i>
					</a> <a class="text-dark px-2" href=""> <i
						class="fab fa-linkedin-in"></i>
					</a> <a class="text-dark px-2" href=""> <i class="fab fa-pinterest"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row px-xl-5">
		<div class="col">
			<div
				class="nav nav-tabs justify-content-center border-secondary mb-4">
				<a class="nav-item nav-link active" data-toggle="tab"
					href="#tab-pane-1">Description</a> <a class="nav-item nav-link"
					data-toggle="tab" href="#tab-pane-2">Information</a> <a
					class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews
					(0)</a>
			</div>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="tab-pane-1">
					<h4 class="mb-3">Product Description</h4>
					<p><%=product1.getDescription()%></p>

				</div>
				<div class="tab-pane fade" id="tab-pane-2">
					<h4 class="mb-3">Additional Information</h4>
					<p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam
						sea. Consetetur vero aliquyam invidunt duo dolores et duo sit.
						Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur
						invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum
						rebum diam. Dolore diam stet rebum sed tempor kasd eirmod.
						Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam
						consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod
						nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit
						rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus
						eirmod takimata dolor ea invidunt.</p>
					<div class="row">
						<div class="col-md-6">
							<ul class="list-group list-group-flush">
								<li class="list-group-item px-0">Sit erat duo lorem duo ea
									consetetur, et eirmod takimata.</li>
								<li class="list-group-item px-0">Amet kasd gubergren sit
									sanctus et lorem eos sadipscing at.</li>
								<li class="list-group-item px-0">Duo amet accusam eirmod
									nonumy stet et et stet eirmod.</li>
								<li class="list-group-item px-0">Takimata ea clita labore
									amet ipsum erat justo voluptua. Nonumy.</li>
							</ul>
						</div>
						<div class="col-md-6">
							<ul class="list-group list-group-flush">
								<li class="list-group-item px-0">Sit erat duo lorem duo ea
									consetetur, et eirmod takimata.</li>
								<li class="list-group-item px-0">Amet kasd gubergren sit
									sanctus et lorem eos sadipscing at.</li>
								<li class="list-group-item px-0">Duo amet accusam eirmod
									nonumy stet et et stet eirmod.</li>
								<li class="list-group-item px-0">Takimata ea clita labore
									amet ipsum erat justo voluptua. Nonumy.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="tab-pane-3">
					<div class="row">
						<div class="col-md-6">
							<h4 class="mb-4">1 review for "Colorful Stylish Shirt"</h4>
							<div class="media mb-4">
								<img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1"
									style="width: 45px;">
								<div class="media-body">
									<h6>
										John Doe<small> - <i>01 Jan 2045</i></small>
									</h6>
									<div class="text-primary mb-2">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
										<i class="far fa-star"></i>
									</div>
									<p>Diam amet duo labore stet elitr ea clita ipsum, tempor
										labore accusam ipsum et no at. Kasd diam tempor rebum magna
										dolores sed sed eirmod ipsum.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<h4 class="mb-4">Leave a review</h4>
							<small>Your email address will not be published. Required
								fields are marked *</small>
							<div class="d-flex my-3">
								<p class="mb-0 mr-2">Your Rating * :</p>
								<div class="text-primary">
									<i class="far fa-star"></i> <i class="far fa-star"></i> <i
										class="far fa-star"></i> <i class="far fa-star"></i> <i
										class="far fa-star"></i>
								</div>
							</div>
							<form>
								<div class="form-group">
									<label for="message">Your Review *</label>
									<textarea id="message" cols="30" rows="5" class="form-control"></textarea>
								</div>
								<div class="form-group">
									<label for="name">Your Name *</label> <input type="text"
										class="form-control" id="name">
								</div>
								<div class="form-group">
									<label for="email">Your Email *</label> <input type="email"
										class="form-control" id="email">
								</div>
								<div class="form-group mb-0">
									<input type="submit" value="Leave Your Review"
										class="btn btn-primary px-3">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Shop Detail End -->


<!-- Products Start -->
<div class="container-fluid py-5">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">You May Also Like</span>
		</h2>
	</div>
	<div class="row px-xl-5">
		<div class="col">
			<div class="owl-carousel related-carousel">
				<%
				List<product> product3 = (List) request.getAttribute("get_product");
				int sizee2 = product3.size();
				if (sizee2 >= 15) {
					sizee2 = 15;
				}
				for (int i = 0; i < sizee2; i++) {

					item = (String[]) items.get(product3.get(i).getIdproduct());

					if (item == null) {
						item = new String[1];
						item[0] = ("nothing.png");
					}
				%>
				<div class="card product-item border-0">
					<div
						class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
						<img class="img-fluid w-100" src="<%=path1 + item[0]%>" alt=""
							style="max-height: 300px;">
					</div>
					<div
						class="card-body border-left border-right text-center p-0 pt-4 pb-3">
						<h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
						<div class="d-flex justify-content-center">
							<h6>
								$<%=product3.get(i).getPrice()%></h6>
							<h6 class="text-muted ml-2">
								<del>
									$<%=product3.get(i).getdiscount()%></del>
							</h6>
						</div>
					</div>
					<div
						class="card-footer d-flex justify-content-between bg-light border">
						<a
							href="${pageContext.request.contextPath}/shopdetail_controller?page=shopdetail&item=<%
									out.print((product3.get(i).getIdproduct()));
								%>"
							class="btn btn-sm text-dark p-0"><i
							class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a
							href="${pageContext.request.contextPath}/cart_controller?page=cart&add=<%
									out.print((product3.get(i).getIdproduct()));
								%>"
							class="btn btn-sm text-dark p-0"><i
							class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</div>
<!-- Products End -->
<c:import url="/header&footer/Footer.jsp"></c:import>