<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/common/bootstrap5.jsp"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 게시판 메인 전용 부트스트랩 -->
<link rel="stylesheet" href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">

<!-- 게시판 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_eventmain/evenstmain.css" rel="stylesheet">

<style type="text/css">
</style>
</head>
<body>

	<!-- 헤더 Start -->
	<div class="container-xxl py-5 bg-dark event-header mb-5 " style="background-image:url('<%=appName%>/assets/img/bg_event.jpg');  ">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-lg-6 text-center text-lg-start">
					<h1 class="display-3 text-white" style="margin-bottom: 20px;">행사</h1>
					<p class="medium-paragraph">제주도의 행사들을 만나보세요!</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 End -->



	<!-- 검색창 start -->
	<div class="container-xxl py-5 text-center">
		<div class="container">
			<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">
				<form class="search-box" name="myform" action="<%=withFormTag%>" method="get">
					<div class="row">
						<div class="search-box col-sm-12">
							<select class="form-control-sm" id="mode" name="mode">
								<option value="all" selected="selected">--- 검색옵션 ---
								<option value="name">글제목
								<option value="company">글내용
								<option value="category">작성자
							</select>
							<input class="form-control-sm" type="text" name="keyword" id="keyword" placeholder="키워드 입력">
							<button type="submit" class="btn btn-warning form-control-sm" onclick="">검색</button>
							<button type="button" class="btn btn-warning form-control-sm" onclick="searchAll();">전체 검색</button>
							<button type="button" class="btn btn-secondary form-control-sm" onclick="writeForm();">글 쓰기</button>
						</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 검색창 End -->
	<div class="container-xxl pt-5">
		<ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
			<li class="nav-item"><a class="category d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
					<i class="fa far fas fa-calendar-day fa-2x text-primary"></i>
					<div class="ps-3">
						<h2 class="category-text">전체</h2>
					</div>
				</a></li>
			<li class="nav-item"><a class="category d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
					<i class="fa far fa-calendar-check fa-2x text-primary"></i>
					<div class="ps-3">
						<h2 class="category-text">진행 중</h2>
					</div>
				</a></li>
			<li class="nav-item"><a class="category d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
					<i class="fa far fa-calendar-times fa-2x text-primary"></i>
					<div class="ps-3">
						<h2 class="category-text">종료</h2>
					</div>
				</a></li>
		</ul>
	</div>
	<!-- 게시물 목록 Start -->
	<section class="contest-waiting">
		<div class="container-xxl">
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="waiting-item">
						<img src="<%=appName%>/assets/img/minsokchon01.png" alt="">
						<div class="down-content">
							<h4>제주민속촌 귀몽</h4>
							<p>2023.07.01 ~ 2023.11.05</p>
						<!-- 	<ul class="info">
								<li><i class="fa fas fa-phone-square fa-2x text-primary" style="text-align: center;"></i> 064-1234-1234</li>
							</ul> -->
							<span class="price"><i class="fa fas fa-phone-square fa-2x text-primary" style="text-align: center;"></i> <em>064-1234-1234</em></span> 
							<br/>
						<!-- 	<span class="deadline">Deadline: <em>4 Days</em></span> -->

						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="waiting-item">
						<img src="<%=appName%>/assets/img/minsokchon01.png" alt="">
						<div class="down-content">
							<h4>Nature Walk in the Forest</h4>
							<p>Lorem ipsum dolor siter and ametters conseietur adipiscing elit.</p>
							<span class="price">Price: <em>$1,400</em></span> <span class="deadline">Deadline: <em>2 Days</em></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="waiting-item">
						<img src="<%=appName%>/assets/img/minsokchon01.png" alt="">
						<div class="down-content">
							<h4>The Road to Photograph</h4>
							<p>Lorem ipsum dolor siter and ametters conseietur adipiscing elit.</p>
							<span class="price">Price: <em>$1,250</em></span> <span class="deadline">Deadline: <em>4 Days</em></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="waiting-item">
						<img src="<%=appName%>/assets/img/minsokchon01.png" alt="">
						<div class="down-content">
							<h4>The Lake and Mountain Scenery</h4>
							<p>Lorem ipsum dolor siter and ametters conseietur adipiscing elit.</p>
							<span class="price">Price: <em>$1,600</em></span> <span class="deadline">Deadline: <em>10 Days</em></span>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<ul class="pagination">
						<li><a href="#">
								<i class="fa fa-arrow-left"></i>
							</a></li>
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">
								<i class="fa fa-arrow-right"></i>
							</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- 게시물 목록 End -->

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>