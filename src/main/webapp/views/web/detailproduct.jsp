<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url var="apiURL" value="/api-cart" />
<div class="single-product-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="single-sidebar">
					<h2 class="sidebar-title">Search Products</h2>
					<form action="">
						<input type="text" placeholder="Search products..."> <input
							type="submit" value="Search">
					</form>
				</div>

				<div class="single-sidebar">
					<h2 class="sidebar-title">Sản phẩm</h2>
					<c:forEach var="product" items="${products }">
						<div class="thubmnail-recent">
							<img src="${product.prod_imgurl }" class="recent-thumb" alt="">
							<h2>
								<a href="<c:url value="/web-detailproduct?id=${product.prod_id }"/>">${product.prod_name }</a>
							</h2>
							<div class="product-sidebar-price">
								<ins><fmt:formatNumber value="${product.prod_price }" type="number" /></ins>
								<del><fmt:formatNumber value="${product.prod_price + 1000000 }" type="number" /></del>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="single-sidebar">
					<h2 class="sidebar-title">Bài viết</h2>
					<ul>
						<li><a href="">Đánh giá sản phẩm</a></li>
						<li><a href="">Đánh giá sản phẩm</a></li>
						<li><a href="">Đánh giá sản phẩm</a></li>
						<li><a href="">Đánh giá sản phẩm</a></li>
						<li><a href="">Đánh giá sản phẩm</a></li>
					</ul>
				</div>
			</div>

			<div class="col-md-8">
				<div class="product-content-right">
					<div class="row">
						<div class="col-sm-6">
							<div class="product-images">
								<div class="product-main-img">
									<img src="${product.prod_imgurl }" alt="">
								</div>

								<div class="product-gallery">
									<img src="${product.prod_imgurl }" alt=""> <img
										src="${product.prod_imgurl }" alt=""> <img
										src="${product.prod_imgurl }" alt="">
								</div>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="product-inner">
								<h2 class="product-name">${product.prod_name }</h2>
								<div class="product-inner-price">
									<ins><fmt:formatNumber value="${product.prod_price }" type="number" /></ins>
									<del><fmt:formatNumber value="${product.prod_price + 1000000 }" type="number" /></del>
								</div>

								<form class="cart">
									<div class="quantity">
										<input type="number" size="4" class="input-text qty text"
											title="Qty" value="1" name="quantity" min="1" step="1" id="quantity">
									</div>
									<button  type="submit" id="btnn"> Thêm vào giỏ hàng</button>
									<!--  <button id="btnn"  type="submit"  >Thêm vào giỏ hàng</button> -->
								</form>

								<div role="tabpanel">
									<ul class="product-tab" role="tablist">
										<li role="presentation" class="active"><a href="#home"
											aria-controls="home" role="tab" data-toggle="tab">Giới thiệu</a></li>
										<li role="presentation"><a href="#profile"
											aria-controls="profile" role="tab" data-toggle="tab">Reviews</a></li>
									</ul>
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane fade in active" id="home">
											<h2>Chi tiết</h2>
											<p>${product.prod_description }</p>
										</div>
										<div role="tabpanel" class="tab-pane fade" id="profile">
											<h2>Reviews</h2>
											<div class="submit-review">
												<p>
													<label for="name">Name</label> <input name="name"
														type="text">
												</p>
												<p>
													<label for="email">Email</label> <input name="email"
														type="email">
												</p>
												<div class="rating-chooser">
													<p>Your rating</p>

													<div class="rating-wrap-post">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i>
													</div>
												</div>
												<p>
													<label for="review">Your review</label>
													<textarea name="review" id="" cols="30" rows="10"></textarea>
												</p>
												<p>
													<input type="submit" value="Submit">
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>


	
	$("#btnn").click(function(e) {
		e.preventDefault();
		var data = {};
		data["user_username"] = "${USER.user_username}";
		data["prod_id"] = ${product.prod_id};
		data["amount"] = $("#quantity").val();
		$.ajax({
			url : "${apiURL}",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(data),
			dataType : "json",
			success : function(success) {
				window.alert("Thêm thành công!");
			},
			error : function (error) {
				window.alert("Thêm thất bại!");
			}
		});
	});
</script>