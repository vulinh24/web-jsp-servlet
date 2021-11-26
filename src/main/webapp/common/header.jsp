<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglib.jsp" %>
<div class="header-area">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="user-menu">
					<ul>
						<c:choose>
							<c:when test="${not empty USER }">
								<li><a href="#"><i class="fa fa-user"></i> Tài khoản</a></li>
								<li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
								<li style="float:right;"><a href="<c:url value="web-trang-chu?type=logout"/>">Đăng xuất</a></li>
								<li style="float:right;margin-top:10px;margin-right:5px;"><h5><i class="fa fa-user"></i> Xin chào, ${USER.user_username}</h5></li>
							</c:when>
							<c:otherwise>
								<li><a href="#"><i class="fa fa-user"></i> Tài khoản</a></li>
								<li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
								<li><a href="<c:url value="/login" />"><i class="fa fa-user"></i> Đăng nhập</a></li>
							</c:otherwise>
						</c:choose>
						
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End header area -->
<div class="site-branding-area">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="logo">
					<h1>
						<a href="./"><img src="img/logo.png"></a>
					</h1>
				</div>
			</div>

			<div class="col-sm-6">
				<div class="shopping-item">
					<a href="<c:url value="/web-cart"/>">Cart<span class="cart-amunt"></span>
						<i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End site branding area -->

<div class="mainmenu-area">
	<div class="container">
		<div class="row">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value="/web-trang-chu"/>">Trang chủ</a></li>
					<li><a href="<c:url value="/web-list-products" />">Sản phẩm</a></li>
					<li><a href="<c:url value="/web-detailproduct?id=1"/>">Chi tiết sản phẩm</a></li>
					<li><a href="<c:url value="/web-cart"/>">Giỏ hàng</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End mainmenu area -->
