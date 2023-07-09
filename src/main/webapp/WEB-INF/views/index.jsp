<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D.C</title>
<link rel="stylesheet" href="/resource/css/initial.css" />
<link rel="stylesheet" href="/resource/css/style.css" />
<link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro-v6@44659d9/css/all.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
	<div class="home_wrap">
		<div>
			<c:choose>
				<c:when test="${sessionScope.logon }">
					<h2>${logonUser.id} 님 환영합니다!</h2>
				</c:when>
				<c:otherwise>
					<a href="/user/login" class="login_btn"><i class="ri-user-line"></i>로그인</a>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div>
			<a href="/post/post-list" class="text_btn">글목록</a>
		</div>
	</div>
</body>
</html>