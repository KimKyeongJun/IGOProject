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

</script>
<body>

	<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
	
	<div class="sub_common">
		<div class="headImg1"><h2>회원가입</h2></div>
			<div class="headBox">
			
				<div class="heading"><h2 class="headTxt">회원가입</h2>
				</div>	
		</div>
	</div>

	<form:form id="memberRegistForm" modelAttribute="memberVO"  method="post" action="/IGOProject/member/regist">
			<div>
				<input type="email" id="email" name="email" placeholder="E-Mail" /> <!-- 동영상 파일만 선택되도록 설정 -->
			</div>
			<div>
				<form:errors path="email"/>
			</div>
			<div>
				<input type="text" id="name" name="name" placeholder="NAME" />
			</div>
			<div>
				<form:errors path="name"/>
			</div>
			<div>
				<input type="text" id="phone" name="phone" placeholder="PHONE" />
			</div>
			<div>
				<form:errors path="phone"/>
			</div>
			<div>
				<input type="password" id="password" name="password" placeholder="PASSWORD" />
			</div>
			<div>
				<form:errors path="password"/>
			</div>
			<div>
				<input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="PASSWORD CONFIRM"/>
			</div>
			<!-- <div id="passwordConfirmError">
			</div> -->
			
			<div>
				<input type="submit" id="registBtn" value="등록"/>
			</div>
		</form:form>
		
	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>

</body>
</html>