<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header&footer/header.jsp"></c:import>
<%@ page import="com.supellex.entity.product"%>
<%@ page import="java.util.List"%>
<!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="${pageContext.request.contextPath}/shop_cortroller?page=shop">Shop</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shopping Cart</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>discount</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <%
                    List<product> product1 = (List)request.getAttribute("get_cart_product");
                    int size =product1.size(); 
                    int total = 0;
                    for(int i =0 ;i<size ;i++){
                    total = total + product1.get(i).getPrice()-product1.get(i).getdiscount();%> 
                        <tr>
                            <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;"> <%=product1.get(i).getProduct_titel() %></td>
                            <td class="align-middle">$<%=product1.get(i).getPrice()%></td>
                            <td class="align-middle">$<%=product1.get(i).getdiscount() %></td>
                            <td class="align-middle">$<%=product1.get(i).getPrice()- product1.get(i).getdiscount()%></td>
                            <td class="align-middle"><a href="${pageContext.request.contextPath}/cart_controller?page=cart&delete=<%
									out.print((product1.get(i).getIdproduct()));
								%>" class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">

                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">$<%=total %></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">$10</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">$<%=total+10 %></h5>
                        </div>
                        <a href="${pageContext.request.contextPath}/checkout_controller?page=checkout" class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->
<c:import url="/header&footer/Footer.jsp"></c:import>