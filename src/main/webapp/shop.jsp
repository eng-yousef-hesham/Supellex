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
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
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
	<div class="row px-xl-5">
		<!-- Shop Sidebar Start -->
		<div class="col-lg-3 col-md-12">
			<!-- Price Start -->
			<div class="border-bottom mb-4 pb-4">
				<h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
				<form action="${pageContext.request.contextPath}/shop_cortroller"
					method="get">
					<input type="hidden" name="page" value="shop">
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="price" value="0" id="price-all">
						<label class="custom-control-label" for="price-all">All
							Price</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="price" value="100" id="price-1">
						<label class="custom-control-label" for="price-1">$0 -
							$100</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="price" value="200" id="price-2">
						<label class="custom-control-label" for="price-2">$100 -
							$200</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="price" value="300" id="price-3">
						<label class="custom-control-label" for="price-3">$200 -
							$300</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="price" value="400" id="price-4">
						<label class="custom-control-label" for="price-4">$300 -
							$400</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="price" value="500" id="price-5">
						<label class="custom-control-label" for="price-5">$400 -
							$500</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="price" value="600" id="price-6">
						<label class="custom-control-label" for="price-6"> more
							than $500</label>
					</div>
				</form>
			</div>
			<!-- Price End -->

			<!-- Color Start -->
			<div class="border-bottom mb-4 pb-4">
				<h5 class="font-weight-semi-bold mb-4">Filter by categorie</h5>
				<form action="${pageContext.request.contextPath}/shop_cortroller"
					method="get">
					<input type="hidden" name="page" value="shop">

					<%
					if (request.getSession().getAttribute("get_price") != null) {
					%><input type="hidden" name="price"
						value="<%out.print(request.getSession().getAttribute("get_price"));%>">
					<%
					}
					%>

					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="categ" value="all" id="color-all">
						<label class="custom-control-label" for="color-all">All
							categorie</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="categ" value="chairs" id="color-1">
						<label class="custom-control-label" for="color-1">Chairs</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="categ" value="sofa" id="color-2">
						<label class="custom-control-label" for="color-2">Sofa</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="categ" value="tables" id="color-3">
						<label class="custom-control-label" for="color-3">Tables</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="categ" value="storage" id="color-4">
						<label class="custom-control-label" for="color-4">Storage</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="categ" value="lights" id="color-6">
						<label class="custom-control-label" for="color-6">Lights</label>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
						<input type="checkbox" class="custom-control-input"
							onChange='submit();' name="categ" value="portraits" id="color-5">
						<label class="custom-control-label" for="color-5">Portraits</label>
					</div>
				</form>
			</div>
			<!-- Color End -->

			<!-- Size Start -->

			<!-- Size End -->
		</div>
		<!-- Shop Sidebar End -->


		<!-- Shop Product Start -->
		<div class="col-lg-9 col-md-12">
			<div class="row pb-3">
				<div class="col-12 pb-1">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<!-- search by name -->
						<form action="${pageContext.request.contextPath}/shop_cortroller"
							method="get">
							<input type="hidden" name="page" value="shop">
							<div class="input-group">
								<input type="text" name="name" class="form-control"
									placeholder="Search by name">
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
				List<product> product3 = (List) request.getAttribute("get_product");
				int elements;
				if (request.getParameter("elements") == null) {
					elements = 20;
				} else {
					elements = Integer.parseInt(request.getParameter("elements"));
				}
				Map<Integer, String[]> items = new HashMap<Integer, String[]>();
				items =	(Map) request.getAttribute("get_product_poto");
				
				int sizee2 = product3.size();
				int start_from_numper = elements - 20;
				if (sizee2 < elements) {
					elements = sizee2;
				}
				
				for (int i = start_from_numper; i < elements; i++) {
					String path1 = "product_imgs" + File.separator;
					
					String [] item ;
					
					
					 item  = (String[])items.get(product3.get(i).getIdproduct());
					
					
					
					if (item == null) {
						item = new String[1];
						item[0]=("nothing.png");
					}
					System.out.print("kkk");
					//System.out.print(item.get(0));
				%>

				<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
					<div class="card product-item border-0 mb-4">
						<div
							class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
							<img class="img-fluid w-100" style="max-height: 300px;"
								src="<%=path1 + item[0]%>" alt="">
						</div>
						<div
							class="card-body border-left border-right text-center p-0 pt-4 pb-3">
							<h6 class="text-truncate mb-3">
								<%
								out.print((product3.get(i).getProduct_titel()));
								%>
							</h6>
							<div class="d-flex justify-content-center">
								<h6>
									$<%
									out.print((product3.get(i).getPrice()));
									%>
								</h6>
								<h6 class="text-muted ml-2">
									<del>
										$<%
										out.print((product3.get(i).getdiscount()));
										%>
									</del>
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
				</div>

				<%
				}
				%>
				<div class="col-12 pb-1">
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center mb-3">
							<!-- code for go backward (>>) botton -->
							<li
								class="page-item <%if (request.getParameter("elements") == null) {
	out.print("disabled");
} else if (Integer.parseInt(request.getParameter("elements")) <= 20) {
	out.print("disabled");
}%>"><a
								class="page-link"
								href="${pageContext.request.contextPath}/shop_cortroller?page=shop&elements=<%if(request.getParameter("elements")==null)
									{
								out.print(20);
							}else{
							elements = Integer.parseInt(request.getParameter("elements"));
							out.print(elements-20);
							} %>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>

							<!-- code for numper of taps -->
							<%
							int temp_size = (sizee2 / 20) + 1;
							for (int j = 0; j < temp_size; j++) {
							%>

							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/shop_cortroller?page=shop&elements=<%=(j+1)*20%>"><%=j + 1%></a></li>

							<%
							}
							%>

							<!-- code for go forward (>>) botton -->
							<li
								class="page-item <%if (sizee2 <= elements) {
	out.print("disabled");
}%>"><a
								class="page-link"
								href="${pageContext.request.contextPath}/shop_cortroller?page=shop&elements=<%if(request.getParameter("elements")==null)
									{
									
								out.print(40);
							}else{
							elements = Integer.parseInt(request.getParameter("elements"));
							out.print(elements+20);
							} %>"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- Shop Product End -->
	</div>
</div>
<!-- Shop End -->
<c:import url="/header&footer/Footer.jsp"></c:import>