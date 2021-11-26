<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="addURL" value="/admin-addproduct" />
<c:url var="apiURL" value="/admin-editproducts" />
<div class="be-content">
	<div class="row">
		<div class="col-sm-12">
			<div class="card card-table">
				<div class="card-header">
					<h4>Danh sách sản phẩm</h4>
				</div>
				<div class="card-body">
					<table class="table table-striped table-hover table-fw-widget"
						id="table1">
						<thead>
							<tr>
								<th>Id</th>
								<th>Tên sản phẩm</th>
								<th>Giá</th>
								<th>Ảnh</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${products}">
								<tr class="odd gradeX">
									<td>${product.prod_id }</td>
									<td>${product.prod_name }</td>
									<td><fmt:formatNumber type="number" value= "${product.prod_price }" /></td>
									<td><img src="${product.prod_imgurl}" style="width:30px;height:30px;"></img></td>
									<td>
										<a class="btn btn-primary" href="${addURL}?id=${product.prod_id }&type=update">Sửa</a>
										<a class="btn btn-primary" href="${apiURL }?id=${product.prod_id }&type=delete">Xóa</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>