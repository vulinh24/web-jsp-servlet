<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="product-big-title-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="product-bit-title text-center">
					<h2>WELCOME LINH VŨ SHOP :D</h2>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="navbar-collapse collapse">
	<ul class="nav navbar-nav">
		<c:forEach var="cate" items="${categorys }">
			<li><a
				href="<c:url value="/web-list-products?cateid=${cate.cate_id}" />">${cate.cate_name }</a></li>
		</c:forEach>
	</ul>
</div>

<div class="single-product-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<c:forEach var="product" items="${products}">
				<div class="col-md-3 col-sm-6">
					<div class="single-shop-product">
						<div class="product-upper">
							<img style="height: 243px; width: 243px;"
								src="${product.prod_imgurl }"
								alt="">
						</div>
						<h2>
							<a href="<c:url value="/web-detailproduct?id=${product.prod_id }"/>">${product.prod_name }</a>
						</h2>
						<div class="product-carousel-price">
							<ins><fmt:formatNumber value="${product.prod_price }" type="number"/></ins>
							<del><fmt:formatNumber value="${product.prod_price +1000000}" type="number"/></del>
						</div>

				
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="product-pagination text-center">
					<nav>
						<ul class="pagination">
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<li><a href="<c:url value="/web-list-products?cateid=${cateid}&page=1"/>">1</a></li>
							<li><a href="<c:url value="/web-list-products?cateid=${cateid}&page=2"/>">2</a></li>
							<li><a href="<c:url value="/web-list-products?cateid=${cateid}&page=3"/>">3</a></li>
							<li><a href="<c:url value="/web-list-products?cateid=${cateid}&page=4"/>">4</a></li>
							<li><a href="<c:url value="/web-list-products?cateid=${cateid}&page=5"/>">5</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>

