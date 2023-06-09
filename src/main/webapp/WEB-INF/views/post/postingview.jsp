<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D.C</title>
<link rel="stylesheet" href="/resource/css/initial.css" />
<link rel="stylesheet" href="/resource/css/style.css" />
<link
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro-v6@44659d9/css/all.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>
<body>
	<div class="home_wrap board_list">
		<div class="title_login">
			<c:choose>
				<c:when test="${sessionScope.logon}">
					<h4>${logonUser.id}님 로그온</h4>
				</c:when>
				<c:otherwise>
					<a href="/user/login">로그인</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="title">
			<h3>디지털컨버전스 - 공공데이터융합 자바 웹개발자 양성 과정</h3>
			<h4>개발공부를 하면서 몰랐던 것이나 고민이 있다면 글을 남겨주세요</h4>
		</div>
		<%-- 글쓰기 --%>
		<div>
			<form action="/post/post-task" method="post" class="board_write">
				<c:choose>
					<c:when test="${sessionScope.logon}">
					</c:when>
					<c:otherwise>
						<div class="post_login">
							<input type="text" name="userid" placeholder="아이디"> 
							<input type="password" name="userpass" placeholder="비밀번호">
						</div>
					</c:otherwise>
				</c:choose>
				<div>
					<input type="text" name="title" placeholder="제목을 입력하세요.">
				</div>
				<textarea class="comment_formta" name="content" rows="8" cols="80"
					placeholder="내용을 입력하세요."></textarea>
				<div class="post_btn">
					<a href="/post/post-list"><button type="button">취소</button></a> <a><button
							type="submit">등록</button></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>