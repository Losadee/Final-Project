<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Start your development with JoeBLog landing page.">
<meta name="author" content="Devcrud">
<!-- font icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/themify-icons/css/themify-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap + JoeBLog main styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/joeblog.css">
<link href="${pageContext.request.contextPath }/resources/harVest_css/start.css" rel="stylesheet">

<title>start.jsp</title>

</head>
<body>
 <c:if test="${empty sessionScope.id}">
	<c:redirect url="/user/login"></c:redirect>
</c:if>
	<!-- page-header -->
  	<jsp:include page="../inc/header.jsp"></jsp:include>
	
  	<input type="hidden" name="id" value="${sessionScope.id}">
  	<div class="layout">
  		<div class="leftImage"></div>
  		<div class="rightContents">
  			<div class="wrap">
  				<div class="notice">
  					<div class="align loca">
  						<svg viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M44 24C44 35.0457 35.0457 44 24 44C12.9543 44 4 35.0457 4 24C4 12.9543 12.9543 4 24 4C35.0457 4 44 12.9543 44 24ZM21.0099 15.1091C21.0046 15.0505 21.0507 15 21.1095 15H26.8905C26.9493 15 26.9954 15.0505 26.9901 15.1091L26.0083 25.9091C26.0036 25.9606 25.9604 26 25.9087 26H22.0913C22.0396 26 21.9964 25.9606 21.9917 25.9091L21.0099 15.1091ZM24 29C22.3431 29 21 30.3431 21 32C21 33.6569 22.3431 35 24 35C25.6569 35 27 33.6569 27 32C27 30.3431 25.6569 29 24 29Z"></path></svg>
  					</div>
  					<b>작성 중인 프로젝트가 있습니다.</b>
  				</div>
  				<input type="hidden" name="id" value="${sessionScope.id }">
  				<c:forEach var="projectList" items="${projectList }">
  				<div class="draftWrap">
  					<div class="draftInfo">
						<div>
							<div class="imageWrap">
						    	<c:set var="img" value="${projectList.IMG1}" />
							    <c:if test="${not empty img}">
									<img class="imageWrap" src="${pageContext.request.contextPath}/resources/upload/${fn:split(img,'&')[0]}">
								</c:if>
							</div>
							<p>${projectList.TITLE }</p>
						</div>
						<button class="writeBtn" onclick="location.href='${pageContext.request.contextPath}/creator/project?idx=${projectList.IDX}'">
							<span>
								이어서 작성
								<div class="align">
									<svg viewBox="0 0 48 48"><path fill-rule="evenodd" fill="" clip-rule="evenodd" d="M4.29858 26.2811L37.8779 26.2811L22.7872 40.9312C21.8888 41.8405 21.7878 43.3561 22.6873 44.2654C23.5867 45.1747 25.0858 45.2757 25.9852 44.3664L45.2734 25.5738C46.1728 24.6645 46.2728 23.25 45.3733 22.2396H45.2734L25.9852 3.54807C25.0858 2.73979 23.5867 2.84082 22.7872 3.75014C21.9877 4.65946 21.9877 6.07396 22.8881 6.98328L37.9779 21.5324L4.29858 21.5324C2.99938 21.5324 2 22.5428 2 23.8562C2 25.1697 2.99938 26.2811 4.29858 26.2811Z"></path></svg>
								</div>
							</span>
						</button>
  					</div>
  				</div>
				</c:forEach>
				
  				<!-- 페이징 처리 -->
				<div  class="pre">
				<c:if test="${pageMap.startPage > pageMap.pageBlock }">
					<a href="${pageContext.request.contextPath }/creator/start?pageNum=${pageMap.startPage-pageMap.pageBlock}">Prev</a>
				</c:if>
				</div>
   
				<div class="next">
				<c:if test="${pageMap.startPage < pageMap.pageCount }">
			    	<a href="${pageContext.request.contextPath }/creator/start?pageNum=${pageMap.startPage+pageMap.pageBlock}">Next</a>
				</c:if>
				</div>
			    
				<div class="newBtnWrap">
					<button class="newBtn wd" onclick="location.href='${pageContext.request.contextPath}/creator/project?idx=0'">
						<span>새 프로젝트 작성하기</span>
					</button>
				</div>
  			</div>
  		</div>
  	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
	<script type="text/javascript">
		let randomNumber = Math.floor(Math.random() * 5) + 1;
		$('.leftImage').addClass('bg' + randomNumber);
	</script>
</body>
</html>
