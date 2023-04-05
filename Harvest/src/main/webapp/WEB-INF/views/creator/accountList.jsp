<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/harVest_css/accountList.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
<title>accountList</title>
<script type="text/javascript">
$(document).ready(function() {
	
	$('.btn').click(function() {
		alert('클릭');
		var accountNum = $('#accountNum').val();
		var bankNm = $('#bankNm').val();
		var accHolderNm = $('#accHolderNm').val();
		$('#accountNum', opener.document).val(accountNum);
		$('#bankNm', opener.document).val(bankNm);
		$('#accHolderNm', opener.document).val(accHolderNm);

		window.close();
		
	});
});

</script>
</head>
<body>
<div class="eBdlqL">
	<div class="kTtzKJ czoHQq">
		<span class="cnihzD">
		등록 계좌 조회
		</span>
	</div>
		<ul class="eBdlqL">
		<c:forEach var="account" items="${accountResponseDTO.res_list }">
			<li class="divffB">
				<button class="lbNzAb btn" type="button">
				<div>
					<strong>계좌번호</strong>
					<input type="text" id="accountNum" value="${account.account_num_masked }">
				</div>
				<div>
					<strong class="morePad">거래은행</strong>
					<input type="text" id="bankNm" value="${account.bank_name }">
				</div>
				<div>
					<strong>예금주명</strong>
					<input type="text" id="accHolderNm" value="${account.account_holder_name }">
				</div>
				</button>
			</li>
	</c:forEach>
		</ul>
</div>

</body>
</html>
