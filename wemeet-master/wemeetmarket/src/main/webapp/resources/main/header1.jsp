<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="/resources/css/clean-blog.min.css" rel="stylesheet">

<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a href="/"> <img src="/resources/img/logo.png" width="400px"
				height="80px" class="navbar-brand" />
			</a>

			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="/">홈으로</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/seller/sellboardlist">판매</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/buyer/buyboardlist">구매</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/chat/waitingroom">상품토론</a></li>
					<c:if test="${empty member||member.magree=='N'}">
						<li class="nav-item"><a class="nav-link"
							href="/member/register">login</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/register">회원가입</a></li>
					</c:if>
					<c:if test="${member.mid != null && member.magree=='Y'}">
						<li class="nav-item"><a class="nav-link"
							href="/member/cinfo?mno=${member.mno }">내정보</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/logout">로그아웃</a></li>
					</c:if>
					<c:if test="${member.admin == 'Y' }">
						<li class="nav-item"><a class="nav-link"
							href="/member/acinfo">회원정보</a></li>
					</c:if>

		

				</ul>
			</div>
		</div>
	</nav>

</body>