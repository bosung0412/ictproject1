<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/common/bootstrap5.jsp" %>
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
<link href="<%=appName%>/assets/css_boardmain/style.css" rel="stylesheet">

<style type="text/css">
</style>
</head>
<body>
 	
 	<!-- 헤더 Start -->
	<div class="container-xxl py-5 bg-dark hero-header mb-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-lg-6 text-center text-lg-start">
					<h1 class="display-3 text-white" style="margin-bottom: 20px;">
						맛집
					</h1>
                    	<p class="medium-paragraph">제주도의 맛집들을 카테고리 별로 만나보세요!</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 End -->

	<!-- 배너 Start -->
	<div class="container-xxl py-5">
	    <div class="container">
	        <div class="row g-4">
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
	                <div class="bn-korean banner-item rounded pt-3">
	                <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white">한식</h1>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
	                <div class="bn-yansik banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white">양식</h1>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
	                <div class="bn-cafe banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white">카페</h1>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
	                <div class="bn-beer banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white">술집</h1>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 배너 End -->
	
	<!-- 검색창 start -->
	<div class="container-xxl py-5 text-center">	
		<div class="container">		
			<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">	
			<form class="search-box" name="myform" action="<%=withFormTag%>" method="get">
				<div class="row">
					<div class="search-box col-sm-12" >
						<select class="form-control-sm" id="mode" name="mode">
							<option value="all" selected="selected">--- 검색옵션 ---
							<option value="name">글제목
							<option value="company">글내용
							<option value="category">작성자
						</select>
						<input class="form-control-sm" type="text" 
							name="keyword" id="keyword" placeholder="키워드 입력">
						<button type="submit" class="btn btn-warning form-control-sm" onclick="">검색</button>
						<button type="button" class="btn btn-warning form-control-sm" onclick="searchAll();">전체 검색</button>
						<button type="button" class="btn btn-secondary form-control-sm"  onclick="writeForm();">글 쓰기</button>
				</div>
			</form>	
			</div>					
		</div>
	</div>
	<!-- 검색창 End -->
	
	<!-- 게시물 목록 Start -->
	<div class="container-xxl py-5">
	    <div class="container">
	        <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
	            <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
	                <li class="nav-item">
	                    <a class="category d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
	                        <i class="fa fa-utensils fa-2x text-primary"></i>
	                        <div class="ps-3">
	                            <h2 class="category-text">한식</h2>
	                        </div>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="category d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
	                        <i class="fa fa-hamburger fa-2x text-primary"></i>
	                        <div class="ps-3">
	                            <h2 class="category-text">양식</h2>
	                        </div>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="category d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
	                        <i class="fa fa-coffee fa-2x text-primary"></i>
	                        <div class="ps-3">
	                            <h2 class="category-text">카페</h2>
	                        </div>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="category d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-4">
	                        <i class="fa fa-beer fa-2x text-primary"></i>
	                        <div class="ps-3">
	                            <h2 class="category-text">술집</h2>
	                        </div>
	                    </a>
	                </li>
	            </ul>
	            
	            <div class="tab-content">
	                <div id="tab-1" class="tab-pane p-0 active">
	                    <div class="row g-4">
							
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <img class="flex-shrink-0 img-fluid rounded" src="<%=appName%>/assets/img/menu-0.png" alt="" style="width: 120px;">
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                        <span class="thumbnail-title text-primary">중문수두리보말칼국수</span>
	                                    </h5>
	                                    <small class="thumbnail-content">제주특별자치도 서귀포시 천제연로 192</small>
	                                    <small class="thumbnail-content">수두리보말칼국수 : 11,000원 / 보말죽 : 13,000원 / 물만두 : 8,000원</small>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <img class="flex-shrink-0 img-fluid rounded" src="<%=appName%>/assets/img/menu-0.png" alt="" style="width: 120px;">
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                        <span class="thumbnail-title text-primary">상춘재</span>
	                                    </h5>
	                                    <small class="thumbnail-content">제주특별자치도 서귀포시 천제연로 192</small>
	                                    <small class="thumbnail-content">수두리보말칼국수 : 11,000원 / 보말죽 : 13,000원 / 물만두 : 8,000원</small>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <img class="flex-shrink-0 img-fluid rounded" src="<%=appName%>/assets/img/menu-0.png" alt="" style="width: 120px;">
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                    	<a href="<%=notWithFormTag%>fdDetail">
	                                        <span class="thumbnail-title text-primary">미영이네식당</span>
	                                        </a>
	                                    </h5>
	                                    <small class="thumbnail-content">제주특별자치도 서귀포시 천제연로 192</small>
	                                    <small class="thumbnail-content">수두리보말칼국수 : 11,000원 / 보말죽 : 13,000원 / 물만두 : 8,000원</small>
	                                </div>
	                            </div>
	                        </div>
	                       
	                    </div>
	                </div>
	                <div id="tab-2" class="tab-pane p-0">
	                    <div class="row g-4">
							
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <img class="flex-shrink-0 img-fluid rounded" src="<%=appName%>/assets/img/menu-1.jpg" alt="" style="width: 120px;">
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                        <span class="thumbnail-title text-primary">미영이네식당</span>
	                                    </h5>
	                                    <small class="thumbnail-content">제주특별자치도 서귀포시 천제연로 192</small>
	                                    <small class="thumbnail-content">수두리보말칼국수 : 11,000원 / 보말죽 : 13,000원 / 물만두 : 8,000원</small>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <img class="flex-shrink-0 img-fluid rounded" src="<%=appName%>/assets/img/menu-1.jpg" alt="" style="width: 120px;">
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                        <span class="thumbnail-title text-primary">미영이네식당</span>
	                                    </h5>
	                                    <small class="thumbnail-content">제주특별자치도 서귀포시 천제연로 192</small>
	                                    <small class="thumbnail-content">수두리보말칼국수 : 11,000원 / 보말죽 : 13,000원 / 물만두 : 8,000원</small>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <img class="flex-shrink-0 img-fluid rounded" src="<%=appName%>/assets/img/menu-1.jpg" alt="" style="width: 120px;">
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                        <span class="thumbnail-title text-primary">미영이네식당</span>
	                                    </h5>
	                                    <small class="thumbnail-content">제주특별자치도 서귀포시 천제연로 192</small>
	                                    <small class="thumbnail-content">수두리보말칼국수 : 11,000원 / 보말죽 : 13,000원 / 물만두 : 8,000원</small>
	                                </div>
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 게시물 목록 End -->
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
	
</body>
</html>