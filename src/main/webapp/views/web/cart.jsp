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
                        <div class="woocommerce">
                            <form method="post" action="#">
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
                                            <th class="product-remove">&nbsp;</th>
                                            <th class="product-thumbnail">&nbsp;</th>
                                            <th class="product-name">Sản phẩm</th>
                                            <th class="product-price">Giá</th>
                                            <th class="product-quantity">Số lượng</th>
                                            <th class="product-subtotal">Tổng tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="product" items="${carts.products }">
                                    		<tr class="cart_item">
                                            <td class="product-remove">
                                                <a title="Remove this item" class="remove" href="<c:url value="/web-cart?id=${product.prod_id }" />">×</a> 
                                            </td>
            
                                            <td class="product-thumbnail">
                                                <a href="#"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${product.prod_imgurl }"></a>
                                            </td>
            
                                            <td class="product-name">
                                                <a href="<c:url value="/web-detailproduct?id=${product.prod_id }" />">${product.prod_name }</a> 
                                            </td>
            
                                            <td class="product-price">
                                                <span class="amount"><fmt:formatNumber value="${product.prod_price }" type="number" /></span> 
                                            </td>
            
                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <span class="amount"><fmt:formatNumber value="${product.quantity }" type="number" /></span> 
                                                </div>
                                            </td>
            
                                            <td class="product-subtotal">
                                                <span class="amount"><fmt:formatNumber value="${product.quantity * product.prod_price}" type="number" /></span> 
                                            </td>
                                        </tr>
                                    	</c:forEach>
                                        <tr>
                                            <td class="actions" colspan="6">
                                                <input id="thanhtoan" type="submit" value="Thanh Toán" name="proceed" class="checkout-button button alt wc-forward">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
            
                            <div class="cart-collaterals">
            
            
                            <div class="cross-sells">
                                <h2>You may be interested in...</h2>
                                <ul class="products">
                                    <li class="product">
                                        <a href="single-product.html">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="img/product-2.jpg">
                                            <h3>Ship Your Idea</h3>
                                            <span class="price"><span class="amount">£20.00</span></span>
                                        </a>
            
                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">Select options</a>
                                    </li>
            
                                    <li class="product">
                                        <a href="single-product.html">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="img/product-4.jpg">
                                            <h3>Ship Your Idea</h3>
                                            <span class="price"><span class="amount">£20.00</span></span>
                                        </a>
            
                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">Select options</a>
                                    </li>
                                </ul>
                            </div>
            
            
                            <div class="cart_totals ">
                                <h2>Thanh Toán</h2>
            
                                <table cellspacing="0">
                                    <tbody>
                                        <tr class="cart-subtotal">
                                            <th>Tổng tiền hàng</th>
                                            <td><span class="amount"><fmt:formatNumber value="${amount }" type="number"/></span></td>
                                        </tr>
            
                                        <tr class="shipping">
                                            <th>Phí ship</th>
                                            <td>Free Shipping</td>
                                        </tr>
            
                                        <tr class="order-total">
                                            <th>Tổng tiền</th>
                                            <td><strong><span class="amount"><fmt:formatNumber value="${amount }" type="number"/></span></strong> </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>                        
                    </div>                    
                </div>
		</div>
	</div>
</div>

<script>
	$("#thanhtoan").click(function(e) {
		e.preventDefault();
		window.alert("Thanh toán thành công!");
		
	});
</script>