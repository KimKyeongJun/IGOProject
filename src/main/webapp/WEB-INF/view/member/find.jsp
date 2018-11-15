<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/js/jquery-3.3.1.min.js" />" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#EmailFindBtn").click(function() {
			if($("#name").val() == "") {
				alert("이름을 입력하세용!!");
				$("#name").focus();
				return ;
			}
			
			if($("#phone").val() == "") {
				alert("전화번호를 입력하세용!!");
				$("#phone").focus();
				return ;
			}
			
			$.post("<c:url value='/member/find' />"
					, $("#EmailFindData").serialize()
					, function(response) {
						if(response.status == "fail") {
							alert("존재하지 않는 회원입니다.");
						} else {
							$("#findEmail").val(response.findEmail);
						}
					}
			);
		});
	}); 
</script>
</head>
<body>
	<%-- <jsp:include page="/WEB-INF/view/common/header_layout.jsp" /> --%>
	<div>
		<div>
			Email 찾기
		</div>
		<form id="EmailFindData">
			<div>
				이름 <input type="text" id="name" name="name" placeholder="이름" />
			</div>
			<div>
				전화번호 <input type="text" id="phone" name="phone" placeholder="전화번호" />
			</div>
			<div>
				<input type="button" id="EmailFindBtn" value="찾기" />
			</div>
			<div>
				이메일 <input type="text" id="findEmail" />
			</div>
		</form>
	</div>
	<hr>
	<div>
		<div>
			비밀번호 재설정
		</div>
		<form>
			<div>
			</div>
			<div>
			</div>
			<div>
			</div>
			<div>
			</div>
		</form>
	</div>

</body>
</html>