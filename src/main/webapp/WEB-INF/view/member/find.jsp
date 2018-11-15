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
		$("#setNewPassData").hide();
		
		$("#newPassBtn").click(function() {
			
			if($("#newPassEmail").val() == "") {
				alert("이메일을 입력하세용!!");
				$("#newPassEmail").focus();
				return ;
			}
			
			if($("#newPassName").val() == "") {
				alert("이름을 입력하세용!!");
				$("#newPassName").focus();
				return ;
			}
			
			if($("#newPassPhone").val() == "") {
				alert("전화번호를 입력하세용!!");
				$("#newPassPhone").focus();
				return ;
			}
			
			$.post("<c:url value='/member/findMember' />"
					, $("#newPassData").serialize()
					, function(response) {
						if(response.status == "fail") {
							alert("존재하지 않는 회원입니다.");
						} else {
							$("#setNewPassData").show();
							$("#emailForNewPass").val(response.memberEmail);
						}
					}
			);
			
		});
		
		$("#setNewPassBtn").click(function() {
			$.post("<c:url value='/member/updatePw' />"
					,$("#setNewPassData").serialize()
					, function(response) {
						if(response) {
							location.href="<c:url value='/index' />";
						}
					}
			);
		});
		
		$("#EmailFindBtn").click(function() {
			if($("#findName").val() == "") {
				alert("이름을 입력하세용!!");
				$("#findName").focus();
				return ;
			}
			
			if($("#findPhone").val() == "") {
				alert("전화번호를 입력하세용!!");
				$("#findPhone").focus();
				return ;
			}
			
			$.post("<c:url value='/member/findEmail' />"
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
				이름 <input type="text" id="findName" name="name" placeholder="이름" />
			</div>
			<div>
				전화번호 <input type="text" id="findPhone" name="phone" placeholder="전화번호" />
			</div>
			<div>
				<input type="button" id="EmailFindBtn" value="찾기" />
			</div>
		</form>
		<div>
			이메일 <input type="text" id="findEmail" />
		</div>
	</div>
	<hr>
	<div>
		<div>
			비밀번호 재설정
		</div>
		<form id="newPassData">
			<div>
				이메일 <input type="email" id="newPassEmail" name="email" placeholder="이메일" />
			</div>
			<div>
				이름 <input type="text" id="newPassName" name="name" placeholder="이름" />
			</div>
			<div>
				전화번호 <input type="text" id="newPassPhone" name="phone" placeholder="전화번호" />
			</div>
			<div>
				<input type="button" id="newPassBtn" value="찾기" />
			</div>
		</form>
		<form id="setNewPassData">
			<input type="text" id="emailForNewPass" name="email" />
			<div>
				새 비밀번호 <input type="password" id="newPassword" name="password" placeholder="New Password" />
			</div>
			<div>
				새 비밀번호 확인 <input type="password" id="newPasswordConfirm" name="newPasswordConfirm" placeholder="New Password Confirm"/>
			</div>
			<div>
				<input type="button" id="setNewPassBtn" value="비밀번호 재설정" />
			</div>
		</form>
	</div>

</body>
</html>