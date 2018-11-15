<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		
		$("#confirmBtn").click(function() {
			$.post("/IGOProject/member/passwordconfirm"
					, $("#passwordConfirmForm").serialize()
					, function(response) {
						if ( response ) {
							location.href="/IGOProject/member/modify"
						}
						else {
							alert("비밀번호를 다시 확인해주세요");
						}
			});
		});
	});
</script>
<body>

	<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
	
	<div class="sub_common">
		<div class="headImg1"><h2>회원 정보 수정</h2></div>
			<div class="headBox">			
				<div class="heading"><h2 class="headTxt">비밀번호 확인</h2>
			</div>	
		</div>
	</div>

	<form:form id="passwordConfirmForm">
		<div>
			<input type="hidden" id="email" name="email" value="${sessionScope._USER_.email}" />
		</div>
		<div>
			<input type="password" id="fpassword" name="password" placeholder="비밀번호 입력" />
		</div>
		
		<div>
			<input type="button" id="confirmBtn" value="확인"/>
		</div>
	</form:form>
		
	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>

</body>
</html>