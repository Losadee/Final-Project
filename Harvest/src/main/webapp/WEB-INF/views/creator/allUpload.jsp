<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html id="AllContent">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/harVest_css/projectUpload.css" rel="stylesheet">
<!-- js 파일로 떼기 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/Upload.js"></script>
<!-- 사진 미리보기 및 정렬 -->
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript" defer></script>
<!-- 달력 -->
<link href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
<title>project.jsp</title>

</head>
<body>
	<c:if test="${empty sessionScope.id}">
		<c:redirect url="/user/login"></c:redirect>
	</c:if>
	
	<form action="${pageContext.request.contextPath}/creator/createPro" id="project" name="project" method="post" enctype="multipart/form-data">
		<input type="text" name="idx" id="idx" value="${param.idx}"> 
		<input type="hidden" name="id" value="${sessionScope.id}"> 
		<input type="hidden" name="status" id="status" value="PJT03">
		<div id="layout"></div>
		<div id="projectContent">
			<!-- 상단 -->
			<div class="top">
				<div class="top_header">
					<div class="header_wrap">
						<a class="top_left" onclick="history.back()"> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16"> <path
									fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" /></svg>
						</a>
						<div class="top_right">
							<button class="able pre_width pre" id="priview">	<!-- 미리보기 버튼 -->
								<div class="topb icon">
									<svg viewBox="0 0 48 48">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M13.7 23.9943C13.8 29.506 18.4 34.0342 24 33.935C29.6 34.0342 34.2 29.506 34.3 23.9943C34.2 18.4826 29.6 13.9563 24 14.0545C18.4 13.9563 13.8 18.4826 13.7 23.9943ZM2 23.9943C5.5 15.2355 14.4 9.62552 24 10.0195C33.6 9.62552 42.5 15.2355 46 23.9943C42.5 32.8523 33.6 38.4623 24 37.97C14.4 38.364 5.5 32.7541 2 23.9943ZM30.6 23.9944C30.6 20.4614 27.646 17.5974 24 17.5974C20.355 17.5974 17.4 20.4614 17.4 23.9944C17.4 27.5274 20.355 30.3913 24 30.3913C27.646 30.3913 30.6 27.5274 30.6 23.9944Z"></path>
									</svg>
								</div>
								<span class="previewText">미리 보기</span>
							</button>
							<div class="rBtn">
							
								<button class="top_btn top_button saveBtn">
									<span>임시저장</span>
									<!-- <span>심사요청</span> -->
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 탭 버튼 -->
				<div class="top_contentWrap">
					<div class="top_title">프로젝트 기획</div>
				</div>
				<div id="header">
					<div class="top_contentFix">
						<div class="top_tap">
							<ul class="subtab" id="pills-tab" role="tablist">
								<li class="item" role="presentation">
									<button class="nav-link active" id="basic-tab" data-bs-toggle="tab" data-bs-target="#basic-tab-pane" type="button" role="tab" aria-controls="basic-tab-pane" aria-selected="true">
										기본정보</button>
								</li>
								<li class="item" role="presentation">
									<button class="nav-link" id="plan-tab" data-bs-toggle="tab" data-bs-target="#plan-tab-pane" type="button" role="tab" aria-controls="plan-tab-pane" aria-selected="false">
										프로젝트 계획</button>
								</li>
								<li class="item" role="presentation">
									<button class="nav-link" id="funding-tab" data-bs-toggle="tab" data-bs-target="#funding-tab-pane" type="button" role="tab" aria-controls="funding-tab-pane" aria-selected="false">
										펀딩	계획</button>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 본문 -->
			<div class="proj_cont">
				<div class="tab-content">
					<!-- 1. 기본정보 -->
					<div class="tab-pane fade show active" id="basic-tab-pane" role="tabpanel" aria-labelledby="basic-tab" tabindex="0">
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">창작자 이름</dt>
								<dd class="defi">창작자를 대표할 수 있는 이름을 써주세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<div class="wrap creNmWrap">
										<span class="input_wrap guide"> 
										<input type="text" class="textInput creNm text_" id="creNm" name="creNm" value="${projectMap.CRE_NM}">
										</span>
									</div>
									<div class="notiArea">
										<p id="p_creNm"></p>
										<span class="creNmLength length">${fn:length(projectMap.CRE_NM)}/20</span>
									</div>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">프로필 이미지</dt>
								<dd class="defi">창작자 용 사진을 올려주세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="profi_wrap">
									<div class="avatar_wrap dqYcqd">
										<div class="box">
											<c:set var="pro" value="${projectMap.CRE_PRO }" />
											<c:choose>
												<c:when test="${not empty pro}">
													<img class="image-box" src="${pageContext.request.contextPath }/resources/upload/${pro}">
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${empty pro}">
													<img class="image-box" src="${pageContext.request.contextPath }/resources/harVest_img/mypage.png">
												</c:when>
											</c:choose>
										</div>
									</div>
									<div class="right">
										<div class="up_wrap">
											<input type="file" id="file" accept=".png, .jpg" name="profile"> 
											<label for="file" class="up_btn btn_m fileSelBtn" color="grayEditor200">
												<div class="topb">
													<svg viewBox="0 0 48 48"> <path fill-rule="evenodd" clip-rule="evenodd"
															d="M25.9087 8.12155L36.4566 18.3158C37.2603 18.7156 38.2648 18.6156 38.968 18.3158C39.6712 17.5163 39.6712 16.4169 38.968 15.7173L25.3059 2.5247C24.6027 1.8251 23.4977 1.8251 22.7945 2.5247L9.03196 15.8172C8.32877 16.5168 8.32877 17.6162 9.03196 18.3158C9.73516 19.0154 10.9406 19.0154 11.6438 18.3158L22.2922 8.12155V28.4111C22.2922 29.4106 23.0959 30.2091 24.1005 30.2091C25.105 30.2091 25.9087 29.4106 25.9087 28.4111V8.12155ZM5.61644 29.4104C5.61644 28.4109 4.81279 27.6104 3.80822 27.6104C2.80365 27.6104 2 28.5099 2 29.5093V44.202C2 45.2015 2.80365 46 3.80822 46H44.1918C45.1963 46 46 45.2015 46 44.202V29.5093C46 28.5099 45.1963 27.7113 44.1918 27.7113C43.1872 27.7113 42.3836 28.5099 42.3836 29.5093V42.3021H5.61644V29.4104Z"></path></svg>
												</div> 이미지파일 업로드
											</label>
										</div>
										<p>파일 형식은 jpg 또는 png 만 가능합니다.</p>
									</div>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">창작자 소개</dt>
								<dd class="defi">창작자님의 소개를 간단하게 써주세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<div>
										<div class="wrap taWrap">
											<span class="ta taInput"> 
											<textarea class="taStyle creIntro text_" id="creIntro" name="creIntro">${projectMap.CRE_INTRO}</textarea>
											</span>
										</div>
										<div class="notiArea">
											<p id="p_creIntro"></p>
											<span class="creIntroLength length">${fn:length(projectMap.CRE_INTRO)}/300</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">프로젝트 카테고리</dt>
								<dd class="defi">프로젝트의 카테고리를 선택해주세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="sel_box">
									<p class="sub_tit">카테고리</p>
									<span class="category guide"> 
									<select name="category" id="category" class="textInput app select" required>
											<c:set var="categ" value="${projectMap.CATEGORY}" />
											<c:choose>
												<c:when test="${not empty categ}">
													<option value="${projectMap.CATEGORY_NM}" selected>${projectMap.CATEGORY_NM}</option>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${empty categ}">
													<option value="" disabled selected>카테고리 선택</option>
												</c:when>
											</c:choose>
											<!-- 카테고리 리스트 -->
											<c:forEach var="categoryNm" items="${categoryNm}">
												<option id="${categoryNm}" value="${categoryNm}">${categoryNm}</option>
											</c:forEach>
									</select>
									</span>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">프로젝트 제목</dt>
								<dd class="defi">프로젝트의 주제, 창작물의 특징이 드러나는 멋진 제목을 붙여주세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<div class="wrap titleWrap">
										<span class="input_wrap guide"> 
										<input type="text" class="textInput title text_" id="title" name="title" value="${projectMap.TITLE }">
										</span>
									</div>
									<div class="notiArea">
										<p id="p_title"></p>
										<span class="titleLength length">${fn:length(projectMap.TITLE)}/50</span>
									</div>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">프로젝트 상품 이름</dt>
								<dd class="defi">프로젝트에 포함되는 구성 상품을 말합니다. 특별한 물건부터 의미있는 경험까지 선물을 구성할 상품을 만들어 보세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<div class="wrap productNmWrap">
										<span class="input_wrap guide"> 
										<input type="text" class="textInput productNm text_" id="productNm" name="productNm" value="${projectMap.PRODUCT_NM }">
										</span>
									</div>
									<div class="notiArea">
										<p id="p_productNm"></p>
										<span class="productNmLength length">${fn:length(projectMap.PRODUCT_NM)}/10</span>
									</div>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">프로젝트 이미지</dt>
								<dd class="defi">후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지를 올려 주세요.</dd>
								<div class="notice">
									<div class="noti_tit">
										<div class="topb">
											<svg viewBox="0 0 48 48">
										<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
										<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
										<path fill-rule="evenodd" clip-rule="evenodd"
													d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path>
									</svg>
										</div>
										사진을 잘못 고르셨다면 이미지를 다시 업로드 해주세요. <br>
									</div>
									<div>
										<p>* 1개 이상의 이미지를 한꺼번에 등록 가능합니다.</p>
									</div>
								</div>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<div class="filewrap">
										<div class="filebox clearfix">
											<span><i><div class="topb">
														<svg viewBox="0 0 48 48">
														<path fill-rule="evenodd" clip-rule="evenodd"
																d="M25.9087 8.12155L36.4566 18.3158C37.2603 18.7156 38.2648 18.6156 38.968 18.3158C39.6712 17.5163 39.6712 16.4169 38.968 15.7173L25.3059 2.5247C24.6027 1.8251 23.4977 1.8251 22.7945 2.5247L9.03196 15.8172C8.32877 16.5168 8.32877 17.6162 9.03196 18.3158C9.73516 19.0154 10.9406 19.0154 11.6438 18.3158L22.2922 8.12155V28.4111C22.2922 29.4106 23.0959 30.2091 24.1005 30.2091C25.105 30.2091 25.9087 29.4106 25.9087 28.4111V8.12155ZM5.61644 29.4104C5.61644 28.4109 4.81279 27.6104 3.80822 27.6104C2.80365 27.6104 2 28.5099 2 29.5093V44.202C2 45.2015 2.80365 46 3.80822 46H44.1918C45.1963 46 46 45.2015 46 44.202V29.5093C46 28.5099 45.1963 27.7113 44.1918 27.7113C43.1872 27.7113 42.3836 28.5099 42.3836 29.5093V42.3021H5.61644V29.4104Z"></path>
													</svg>
													</div></i> <b>이미지 업로드</b></span>
											<p>최소 1개, 최대 3개까지 업로드 가능</p>
											<p>파일 형식: jpg 또는 png</p>
										</div>
										<div class="inputFile">
											<input type="file" id="AddImgs" name="images" class="upload-hidden" accept=".jpeg, .jpg, .png" multiple>
										</div>
										<ul id="Preview" class="sortable">
											<c:set var="img" value="${projectMap.IMG1}" />
											<c:if test="${not empty img}">
												<c:forEach var="newImg" items="${fn:split(img,'&')}">
													<li class="ui-state-default"><img src="${pageContext.request.contextPath }/resources/upload/${newImg}" width="150" height="110"></li>
												</c:forEach>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 				</div> -->
					<!-- 2. 프로젝트 계획 -->
					<div class="tab-pane fade" id="plan-tab-pane" role="tabpanel" aria-labelledby="plan-tab" tabindex="0">
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">프로젝트 소개</dt>
								<dd class="defi">무엇을 만들기 위한 프로젝트인지 소개해 주세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<%-- 							<iframe id="iframe_intro" src="${pageContext.request.contextPath }/creator/intro" width="550px" height="550px"> </iframe> --%>
									<textarea name="intro" class="mceEditor" style="white-space: pre;">
								<c:set var="intro" value="${projectMap.INTRO }" />
									<c:choose>
									    <c:when test="${not empty intro}">
										    	${intro }
									    </c:when>
									    <c:when test="${empty intro}">
										<p>막연하다면 아래의 질문에 대한 답이 내용에 포함되도록 작성해보세요.</p>

										<p>Q. 이 프로젝트를 시작하게 된 배경이 무엇인가요?</p>
								
										<p>Q. 무엇을 만들기 위한 프로젝트인가요?</p>
								
										<p>Q. 프로젝트를 간단히 소개한다면?</p>
								
										<p>Q. 이 프로젝트가 왜 의미있나요?</p>
									    </c:when>
									</c:choose>
							</textarea>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">프로젝트 예산</dt>
								<dd class="defi">펀딩 목표 금액을 제작에 어떻게 사용할 것인지 구체적으로 알려주세요. ‘인건비', ‘배송비’, ‘인쇄비’, ‘대관료’ 등 세부 항목별로 작성해야 합니다.</dd>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<textarea name="budget" class="mceEditor" style="white-space: pre;">
								<c:set var="budget" value="${projectMap.BUDGET }" />
									<c:choose>
									    <c:when test="${not empty budget}">
										    	${budget }
									    </c:when>
									    <c:when test="${empty budget}">
										<p>설정하신 목표 금액을 어디에 사용 예정이신지 구체적인 지출 항목으로 적어 주세요.</p>
									<ul>
										<li>예산은 ‘제작비’가 아닌 구체적인 ‘항목’으로 적어 주세요.</li>
										<li>이번 프로젝트의 실행에 필요한 비용으로만 작성해 주세요.</li>
										<li>기부, 다음 프로젝트에 사용하기 등은 이번 프로젝트의 예산으로 볼 수 없어요.</li>
										<li>만일 전체 제작 비용 중 일부만 모금하시는 경우라면, 나머지 제작 비용은 어떻게 마련 예정인지 추가로 작성해 주세요.</li>
									</ul>
								
									<p>(예시)</p>
								
									<p>목표 금액은 아래의 지출 항목으로 사용할 예정입니다.</p>
									<ul>
										<li>인건비</li>
										<li>배송비</li>
										<li>발주비</li>
										<li>디자인</li>
										<li>의뢰비</li>
										<li>수수료</li>
									</ul>
									    </c:when>
									</c:choose>
							</textarea>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">프로젝트 일정</dt>
								<dd class="defi">작업 일정을 구체적인 날짜와 함께 작성하세요. 후원자가 일정을 보면서 어떤 작업이 진행될지 알 수 있어야 합니다. 펀딩 종료 이후의 제작 일정을 반드시 포함하세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<textarea name="schedule" class="mceEditor" style="white-space: pre;">
									<c:set var="schedule" value="${projectMap.SCHEDULE }" />
										<c:choose>
										    <c:when test="${not empty schedule}">
											    ${schedule }
										    </c:when>
										    <c:when test="${empty schedule}">
												<p>( 예시 )</p>
												<p>
													0월 0일: 현재 제품 시안 및 1차 샘플 제작<br>
													0월 0일: 펀딩 시작일<br> 
													0월 0일: 샘플 작업 보완<br> 
													0월 0일: 펀딩 종료일<br> 
													0월 0일: 2차 샘플 제작<br> 
													0월 0일: 제품 디테일 보완<br> 
													0월 0일: 제품 발주 시작<br> 
													0월 0일: 후가공 처리 및포장 작업<br> 
													0월 0일: 선물 예상 전달일뢰비
												</p>
										    </c:when>
										</c:choose>
								</textarea>
								</div>
							</div>
						</div>
					</div>
					<!-- 3. 펀딩계획 -->
					<div class="tab-pane fade" id="funding-tab-pane" role="tabpanel" aria-labelledby="funding-tab" tabindex="0">
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">목표 금액</dt>
								<dd class="defi">프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.</dd>
								<div class="notice">
									<div class="noti_tit">
										<div class="topb">
											<svg viewBox="0 0 48 48">
									<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
									<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
									<path fill-rule="evenodd" clip-rule="evenodd"
													d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg>
										</div>
										목표 금액 설정 시 꼭 알아두세요!
									</div>
									<div>
										<p>* 종료일까지 목표금액을 달성하지 못하면 후원자 결제가 진행되지 않습니다.</p>

										<p>* 종료 전 후원 취소를 대비해 10% 이상 초과 달성을 목표로 해주세요.</p>

										<p>* 제작비, 선물 배송비, 인건비, 예비 비용 등을 함께 고려해주세요.</p>
									</div>
								</div>
							</dl>
							<div class="arti_cont">
								<div class="goal_con">
									<p class="sub_tit">목표금액</p>
									<div>
										<div class="wrap targetAmtWrap">
											<span class="input_wrap2 guide">
											<input type="text" class="textInput targetAmt text_" name="targetAmt" id="targetAmt" value="${projectMap.COMMA_AMT }" placeholder="50만원 이상의 금액을 입력해 주세요" oninput="this.value = this.value.replaceAll(/\D/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')">
												원
											</span>
										</div>
										<div class="notiArea">
											<p id="p_targetAmt"></p>
										</div>
									</div>
									<div class="amtShow">
										<div class="totalAmt">
											<span>목표 금액 달성 시 예상 수령액</span>
											<input type="text" id="totalAmt" name="totalAmt" readonly value="${projectMap.TOTAL_AMT }">
										</div>
										<div class="feeWrap">
											총 수수료 (총 결제액의 5%)
											<input type="text" id="fee" name="fee" value="${projectMap.FEE }" onfocus="this.blur()">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">최소 후원 금액</dt>
								<dd class="defi">후원자가 할 수 있는 최소 후원 금액을 정해주세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<p class="sub_tit">최소 후원 금액</p>
									<div>
										<div class="wrap minDonaWrap">
											<span class="input_wrap2 guide"> 
											<fmt:parseNumber value="${projectMap.MIN_DONA }" pattern="###,###" var="minDona" /> 
											<input type="text" class="textInput minDona text_" name="minDona" id="minDona" value="${minDona }" placeholder="1000원 이상의 금액을 입력해 주세요" oninput="this.value = this.value.replaceAll(/\D/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')">
												원
											</span>
										</div>
										<div class="notiArea">
											<p id="p_minDona"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">펀딩 일정</dt>
								<dd class="defi">설정한 일이 되면 펀딩이 자동 시작됩니다. 펀딩 시작 전까지 날짜를 변경할 수 있고, 즉시 펀딩을 시작할 수도 있습니다.</dd>
								<div class="notice">
									<div class="noti_tit">
										<div class="topb">
											<svg viewBox="0 0 48 48">
										<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
										<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
										<path fill-rule="evenodd" clip-rule="evenodd"
													d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg>
										</div>
										펀딩 일정은 최대 2개월 동안만 진행 가능합니다.
									</div>
									<div class="noti_tit">
										<div class="topb">
											<svg viewBox="0 0 48 48">
												<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
												<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
										<path fill-rule="evenodd" clip-rule="evenodd"
													d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg>
										</div>
										프로젝트가 성공하면 펀딩 종료 다음 날 후원금이 결제됩니다. 결제가 이루어지지 않은 경우 24시간 간격으로 7일 동안 결제를 시도합니다.
									</div>
									<div class="noti_tit">
										<div class="topb">
											<svg viewBox="0 0 48 48">
												<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
												<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
										<path fill-rule="evenodd" clip-rule="evenodd"
													d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg>
										</div>
										모금액은 후원자 결제 종료 다음 날부터 영업일 기준(주말 및 공휴일 제외) 7일째 되는 날 입금됩니다.
									</div>
								</div>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<ol class="fundPlan">
										<li class="fungPlanItem1">
											<div class="pjForm">
												<div class="pjFormHalf wd">
													<p class="formTit fTit">
														<b>시작일</b>
													</p>
													<div class="datePickerWrap">
														<div class="datePicker">
															<div class="dateWrap">
																<button class="dateInput" type="button" id="date" data-range="true">
																	<div class="topb">
																		<svg viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd"d="M43.5 13.6H4.5V11.8C4.5 10.4 5.6 9.3 7 9.3H41.2C42.6 9.3 43.7 10.4 43.7 11.8L43.5 13.6ZM43.5 41.1C43.5 42.5 42.4 43.6 41 43.6H6.9C5.5 43.6 4.4 42.5 4.4 41.1V16.1H43.5V41.1ZM41.1 6.9H38.6V2H36.1V6.9H11.8V2H9.3V6.9H6.9C4.2 6.9 2 9.1 2 11.8V41.1C2 43.8 4.2 46 6.9 46H41.1C43.8 46 46 43.8 46 41.1V11.8C46 9.1 43.8 6.9 41.1 6.9ZM11.2002 27.7001H14.9002C15.3002 27.7001 15.5002 27.4001 15.5002 27.0991V23.4001C15.5002 23.0001 15.2002 22.8001 14.9002 22.8001H11.2002C10.8002 22.8001 10.6002 23.1001 10.6002 23.4001V27.0001C10.5002 27.4001 10.8002 27.7001 11.2002 27.7001ZM25.9002 27.7001H22.2002C21.8002 27.7001 21.5002 27.4001 21.6002 27.0001V23.4001C21.6002 23.1001 21.8002 22.8001 22.2002 22.8001H25.9002C26.2002 22.8001 26.5002 23.0001 26.5002 23.4001V27.0991C26.5002 27.4001 26.3002 27.7001 25.9002 27.7001ZM33.2002 27.7001H36.9002C37.3002 27.7001 37.5002 27.4001 37.5002 27.0991V23.4001C37.5002 23.0001 37.2002 22.8001 36.9002 22.8001H33.2002C32.8002 22.8001 32.5992 23.1001 32.5992 23.4001V27.0001C32.5002 27.4001 32.8002 27.7001 33.2002 27.7001ZM14.9002 37.4999H11.2002C10.8002 37.4999 10.5002 37.1999 10.6002 36.8999V33.1999C10.6002 32.8999 10.8002 32.5999 11.2002 32.5999H14.9002C15.2002 32.5999 15.5002 32.7999 15.5002 33.1999V36.8999C15.5002 37.1999 15.3002 37.4999 14.9002 37.4999ZM22.2002 37.4999H25.9002C26.3002 37.4999 26.5002 37.1999 26.5002 36.8999V33.1999C26.5002 32.7999 26.2002 32.5999 25.9002 32.5999H22.2002C21.8002 32.5999 21.6002 32.8999 21.6002 33.1999V36.8999C21.5002 37.1999 21.8002 37.4999 22.2002 37.4999ZM36.9002 37.4999H33.2002C32.8002 37.4999 32.5002 37.1999 32.5992 36.8999V33.1999C32.5992 32.8999 32.8002 32.5999 33.2002 32.5999H36.9002C37.2002 32.5999 37.5002 32.7999 37.5002 33.1999V36.8999C37.5002 37.1999 37.3002 37.4999 36.9002 37.4999Z"></path></svg>
																	</div>
																	<input type="text" class="start" id="start" name="start" value="${projectMap.START }" placeholder=" 날짜를 선택해주세요." readonly>
																</button>
															</div>
														</div>
													</div>
													<div class="notiArea">
														<p id="p_start"></p>
													</div>
												</div>
												<div class="pjFormHalf wd">
													<p class="formTit fTit">
														<b>종료일</b>
													</p>
													<div class="datePickerWrap">
														<div class="datePicker">
															<div class="dateWrap">
																<div class="dateInput" type="button" id="date" data-range="true">
																	<div class="topb"></div>
																	<input type="text" class="end" id="end" name="end" value="${projectMap.END }" placeholder=" 날짜를 선택해주세요." readonly>
																</div>
															</div>
														</div>
													</div>
													<div class="notiArea">
														<p id="p_end"></p>
													</div>
												</div>
											</div>
											<div class="fundingTerm">
												<p class="formTit fTit">
													<b>펀딩 기간</b>
												</p>
												<div id="diffDate">
													<fmt:parseDate var="startDate" value="${projectMap.START }" pattern="yyyy-MM-dd" />
													<fmt:parseDate var="endDate" value="${projectMap.END }" pattern="yyyy-MM-dd" />
													<fmt:parseNumber var="startDate_N" value="${startDate.time / (1000*60*60*24)}" integerOnly="true" />
													<fmt:parseNumber var="endDate_N" value="${endDate.time / (1000*60*60*24)}" integerOnly="true" />
												<c:if test="${not empty startDate}">
													${endDate_N - startDate_N}일
												</c:if>
												<c:if test="${empty startDate}">
													최대 60일
												</c:if>
												</div>
											</div>
										</li>
										<li class="fungPlanItem1">
											<div class="toolTip">
												<div class="toolTipArea">
													<div type="button" class="writeAre">
														<p>후원자 결제 종료</p>
														<em><div class="topb">
																<svg viewBox="0 0 48 48">
																	<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
																	<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
																	<path fill-rule="evenodd" clip-rule="evenodd"
																		d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg>
															</div></em>
													</div>
												</div>
											</div>
											<div id="payDate">
												<c:if test="${not empty startDate}">
													${projectMap.PAYDATE }
												</c:if>
												<c:if test="${empty startDate}">
													종료일 다음 날부터 7일
												</c:if>
											</div>
										</li>
										<li class="fungPlanItem1">
											<div class="toolTip">
												<div class="toolTipArea">
													<div type="button" class="writeAre">
														<p>정산일</p>
														<em><div class="topb">
																<svg viewBox="0 0 48 48">
																	<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
																	<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
																	<path fill-rule="evenodd" clip-rule="evenodd"
																		d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg>
															</div></em>
													</div>
												</div>
											</div>
											<div id="adjDate">
												<c:if test="${not empty startDate}">
													${projectMap.ADJDATE }
												</c:if>
												<c:if test="${empty startDate}">
													후원자 결제 종료 다음 날부터 7영업일
												</c:if>
											</div>
										</li>
									</ol>
									<div class="datePickerWrap"></div>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">입금 계좌</dt>
									<dd class="defi">후원금을 전달받을 계좌를 등록해주세요.</dd>
									<div class="notice">
										<div class="noti_tit">
											<div class="topb">
												<svg viewBox="0 0 48 48">
											<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
											<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
											<path fill-rule="evenodd" clip-rule="evenodd"
														d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg>
											</div>
											계좌번호를 변경하려면 인증을 다시 진행해주세요.
										</div>
									</div>
								</dl>
						<div class="arti_cont">
							<div class="con_width">
								<ul class="accountWrap">
									<li class="halfContents">
										<div>
											<p class="itemName"><b>거래은행</b></p>
											<div class="AWrap">
												<div class="wrap">
													<span class="dvfxOp bXlLWE">
														<input type="text" class="none bankNm" id="bankNm" value="" placeholder="은행명" readonly>
													</span>
												</div>
												<div class="notiArea">
													<p id="p_bankNm"></p>
												</div>
											</div>
										</div>
										<div><p class="itemName"><b>예금주명</b></p>
										<div class="AWrap">
											<div class="wrap">
												<span class="dvfxOp bXlLWE">
													<input type="text" class="none accHolderNm" id="accHolderNm" value=""  placeholder="예금주명"  readonly>
												</span>
											</div>
											<div class="notiArea">
												<p id="p_accHolderNm"></p>
											</div>
										</div>
										</div>
									</li>
									<li><p class="itemName"><b>계좌 번호</b></p>
									<div class="wrap">
										<span class="input_wrap guide">
											<input type="text" class="none p_accountNum" id="accountNum" value=""  placeholder="인증을 진행해주세요."  readonly>
										</span>
									</div>
									<div class="notiArea">
										<p id="p_accountNum"></p>
									</div>
									</li>
									<div class="buttonWrap">
										<button type="button" id="accountCheck" class="accountCheck btn-l"><b>인증하기</b></button>
									</div>
								</ul>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
	$('#priview').click(function() {
		 var url = "${pageContext.request.contextPath}/project/projectInfo?idx=" + $('#idx').val();
	     var title = "popup";
	     var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=500, height=600, top=50,left=550";
	     window.open(url,title,status);
	});
</script>
	<script src="https://cdn.tiny.cloud/1/6d0eescgzo66t0hqfeu0aeu5fyxbu2c0415q0gzufzi1uyaa/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>