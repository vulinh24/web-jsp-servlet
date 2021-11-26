<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Đăng nhập</title>
<link href="<c:url value="/css/bootstrap.css" /> " rel="stylesheet"  type="text/css">
<link href="<c:url value="/css/stylelogin.css" /> " rel="stylesheet">
</head>
<body>
    <body>
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" action="<c:url value="/login" />" method="post">
                                <c:if test= "${not empty message}"> <!-- có "" -->
                                	<div class="alert alert-danger">
                                		${message}
                                	</div>
                                </c:if>
                                <h3 class="text-center text-info">Login</h3>
                                <div class="form-group">
                                    <label for="username" class="text-info">Tên đăng nhập:</label><br>
                                    <input type="text" name="username" id="username" class="form-control" value="${cusername }">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-info">Mật khẩu:</label><br>
                                    <input type="password" name="password" id="password" class="form-control" value="${cpassword }">
                                </div>
                                <div class="row justify-content-center form-group align-items-center" >
                                    <button type="submit" style="width: 200px;">Đăng nhập</button>
                                </div>
                                <input type="hidden" name="type" value="login">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</body>
</html>