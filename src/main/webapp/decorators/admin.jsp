<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Beagle</title>
    <link rel="stylesheet" href="<c:url value="/css/app.css"/>" type="text/css">
    <script src="<c:url value="/js/jquery.js"/>"></script>
  </head>
  <body>
    <div class="be-wrapper be-fixed-sidebar">
      <nav class="navbar navbar-expand fixed-top be-top-header">
        <div class="container-fluid">
          <div class="page-title"><span>Dashboard</span></div>
          <div class="be-right-navbar">
            <h4>Xin chào, ${USER.user_username}</h4>
          </div>
          <div class="be-right-navbar">
            <a href="<c:url value="web-trang-chu?type=logout" />">
              <h4>Đăng xuất</h4>
            </a>
          </div>
        </div>
      </nav>
      <div class="be-left-sidebar">
        <div class="left-sidebar-wrapper"><a class="left-sidebar-toggle" href="#">Dashboard</a>
          <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll">
              <div class="left-sidebar-content">
                <ul class="sidebar-elements">
                  <li class="divider">Menu</li>
                  <li class="active"><a href="<c:url value="admin-addproduct"/>"><i class="icon mdi mdi-home"></i><span>Thêm sản phẩm</span></a></li>
                  <li class="active"><a href="<c:url value="admin-editproducts"/>"><i class="icon mdi mdi-home"></i><span>Chỉnh sửa sản phẩm</span></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

	<dec:body/>

  </body>
</html>