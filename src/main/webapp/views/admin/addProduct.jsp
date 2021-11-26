<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="URL" value="/api-admin" />
<c:url var="RedirectURL" value="/admin-addproduct" />

<div class="be-content">
	<div class="page-head">
		<h2 class="page-head-title">
		<c:choose>
			<c:when test="${not empty type }">
				Cập nhật sản phẩm
			</c:when>
			<c:otherwise>
				Thêm sản phẩm
			</c:otherwise>
			</c:choose>
			</h2>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card card-border-color card-border-color-primary">
				<div class="card-body">
					<form id="admin-form">
						<div class="form-group row">
							<label class="col-12 col-sm-3 col-form-label text-sm-right"
								for="prod_id">Id sản phẩm:</label>
							<div class="col-12 col-sm-8 col-lg-6">
								<input class="form-control"  type="text"
									name="prod_id" id="prod_id" value="${ product.prod_id}" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-12 col-sm-3 col-form-label text-sm-right"
								for="inputText1">Tên sản phẩm:</label>
							<div class="col-12 col-sm-8 col-lg-6">
								<input class="form-control" id="inputText1" type="text"
									name="prod_name" value="${ product.prod_name}">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-12 col-sm-3 col-form-label text-sm-right"
								for="inputText2">Giá sản phẩm:</label>
							<div class="col-12 col-sm-8 col-lg-6">
								<input class="form-control" id="inputText2" type="text"
									name="prod_price" value="<fmt:formatNumber value="${ product.prod_price}" type="number"/>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-12 col-sm-3 col-form-label text-sm-right"
								for="inputText3">Địa chỉ ảnh:</label>
							<div class="col-12 col-sm-8 col-lg-6">
								<input class="form-control" id="inputText3" type="text"
									name="prod_imgurl" value="${ product.prod_imgurl}" >
							</div>
						</div>
						<div class="form-group row">
							<label class="col-12 col-sm-3 col-form-label text-sm-right"
								for="inputText4">Miêu tả:</label>
							<div class="col-12 col-sm-8 col-lg-6">
								<input class="form-control" id="inputText4" type="text"
									name="prod_description" value="${ product.prod_description}">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-12 col-sm-3 col-form-label text-sm-right"
								for="inputText5">Id thể loại:</label>
							<div class="col-12 col-sm-8 col-lg-6">
								<input class="form-control" id="inputText5" type="text"
									name="cate_id" value="${ product.cate_id}">
							</div>
						</div>
						<div class="form-group row">
							<div>
								<button style="margin-left: 700px;" type="submit" id="btn">
									<c:choose>
										<c:when test="${not empty type }">
											${type}
										</c:when>
										<c:otherwise>
											Thêm mới
										</c:otherwise>
									</c:choose>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	<c:if test="${not empty smessage}">
		function dp_alert() {
			window.alert("${smessage}");
		}
		dp_alert();
	</c:if>
	$("#btn").click(function (e) {
		var data = {};
		e.preventDefault();
		var formdata = $("#admin-form").serializeArray();
		$.each(formdata,function(i,v) {
			data[""+v.name+""] = v.value;
		});
		
		var check = $("#prod_id").val();
		if(check=="") addProduct(data);
		else {
			data["prod_id"] = $("#prod_id").val();
			updateProduct(data);
		}
	});
	
	function addProduct(data) {
		$.ajax({
			url : '${URL}',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success: function (result) {
            	window.location.href = "${RedirectURL}?state=success";
            },
            error: function (error) {
            	window.location.href = "${RedirectURL}?state=error";
            }
			
		});
	}
		function updateProduct(data) {
			$.ajax({
				url : '${URL}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success: function (result) {
	            	window.location.href = "${RedirectURL}?state=success&id=${ product.prod_id}";
	            },
	            error: function (error) {
	            	window.location.href = "${RedirectURL}?state=error";
	            }
			});
	}
</script>

<!-- 
<c:if test = "${not empty message }">
	<script>
		function run() {
		alert(${message});
		}
		run();
	</script>
</c:if>
 -->
