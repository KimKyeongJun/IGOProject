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
		$("#phone").blur( function() {
			var num = $("#phone").val();
			var phone_num = num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
			$("#phone").val(phone_num);
		});
		
		$("#modifyBtn").click(function() {
			$.post("/IGOProject/member/modify"
					, $("#memberModifyForm").serialize()
					, function(response) {
						if ( response ) {
							if ( $("#fpassword").val() != "" ) {
								alert("비밀번호가 변경되었습니다. 다시 로그인해주세요")
								location.href="/IGOProject/member/logout2";
							}
							else {
								location.href="/IGOProject/index";
							}
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
			
				<div class="heading"><h2 class="headTxt">회원 정보 수정</h2>
				</div>	
		</div>
	</div>

	<form:form id="memberModifyForm">
		<div>
			<input type="hidden" id="femail" name="email" value="${sessionScope._USER_.email}" />
		</div>
		<div>
			<form:errors path="email"/>
		</div>
		<div>
			<input type="password" id="fpassword" name="password" placeholder="PASSWORD" />
		</div>
		<div>
			<form:errors path="password"/>
		</div>
		<div>
			<input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="PASSWORD CONFIRM"/>
		</div>
		<div>
			<input type="text" id="name" name="name" placeholder="NAME" value="${sessionScope._USER_.name}" />
		</div>
		<div>
			<form:errors path="name"/>
		</div>
		<div>
			<input type="text" id="phone" name="phone" placeholder="PHONE" value="${sessionScope._USER_.phone}" />
		</div>
		<div>
			<form:errors path="phone"/>
		</div>
		
		
		<div>
			<input type="button" id="modifyBtn" value="수정"/>
		</div>
	</form:form>
		
	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>

</body>
</html>