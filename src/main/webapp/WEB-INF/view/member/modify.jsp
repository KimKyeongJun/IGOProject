<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/css/member.css'/>" rel="stylesheet" type="text/css">
</head>
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		var passwordAfter = $(`<div class="error"> <span class=redPoint>* </span> 비밀번호를 입력해주세요. <br/>  입력하지 않을 시 기존 비밀번호를 유지합니다.</div>`);
		var passwordConfirmAfter = $(`<div class="error"> <span class=redPoint>* </span> 비밀번호를 확인해 주세요. <br/>  입력하지 않을 시 기존 비밀번호를 유지합니다.</div>`);
		var nameAfter = $(`<div class="error"> <span class=redPoint>* </span> 이름을 입력해 주세요.</div>`);
		var phoneAfter = $(`<div class="error"> <span class=redPoint>* </span> 연락처를 입력해 주세요. </div>`);
		var passwordRegex = /^(?=.*[a-zA-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}/;
		var passwordRegexAter = $(`<div class="error"> <span class=redPoint>* </span> 비밀번호는 8글자 이상 20글자 이하 <br/>  대소문자, 숫자, 특수문자를 포함해야 합니다.</div>`);
						
		$("#passwordError").prepend(passwordAfter); 
		$("#passwordConfirmError").prepend(passwordConfirmAfter);
						
		var nameEmpty = false;
		var phoneEmpty = false;
		var passwordEmpty = false;
		var passwordConfirmEmpty = false;

		function EmptyCheck(){
			nameEmpty = false;
			phoneEmpty = false;
			passwordEmpty = false;
			passwordConfirmEmpty = false;

			if ($("#name").val() == "") {
					nameEmpty = true;
			}
			if ($("#phone").val() == "") {
				phoneEmpty = true;
			}
			if ($("#fpassword").val() == "") {
				passwordEmpty = true;
			}
			if ($("#passwordConfirm").val() == "") {
				passwordEmpty = true;
			}
		}
						
		function errorDivAdd() {
			EmptyCheck();
			var result = false;
			if ( nameEmpty || phoneEmpty ) {
				$(".error").remove();
				if (nameEmpty) {
					$("#nameError").prepend(nameAfter);
				}
				
				if (phoneEmpty) {
					$("#phoneError").prepend(phoneAfter);
				}
				
				if ( !passwordEmpty && !passwordRegex.test($("#fpassword").val()) ) {
					$("#passwordError").prepend(passwordRegexAter);
		        }
				if ( !passwordConfirmEmpty && $("#fpassword").val() != $("#passwordConfirm").val() ) {
					$("#passwordConfirmError").prepend(passwordConfirmAfter);
				}
				result = true;
			}
			else {
				$(".error").remove();
				
				if ( !passwordEmpty && !passwordRegex.test($("#fpassword").val()) ) {
					$("#passwordError").prepend(passwordRegexAter);
					result = true;
				}
				if ( !passwordConfirmEmpty && $("#fpassword").val() != $("#passwordConfirm").val() ) {
					$("#passwordConfirmError").prepend(passwordConfirmAfter);
					result = true;
				}
			}
			return result;
								
		}
						
		$("#phone").blur(function() {
			var num = $("#phone").val();
			var phone_num = num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
			$("#phone").val(phone_num);
			errorDivAdd();
		});
						
		$("#phone").keyup(function(event){
			if ( !onlyNumber(event) ) {
				removeChar(event)
			}
		});
						
		function onlyNumber(event){
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				return false;
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
						
		$("#name").blur(function(){
			errorDivAdd();
			return;
		});
		$("#phone").blur(function(){
			errorDivAdd();
			return;
		});
		$("#fpassword").blur(function(){
			errorDivAdd();
			return;
		});
		$("#passwordConfirm").blur(function(){
			errorDivAdd();
			return;
		});
		$("#modifyBtn").click(function() {
			if ( errorDivAdd() ) {
				return;
			}
			$.post("/IGOProject/member/modify",
					$("#memberModifyForm").serialize(),
					function(response) {
						if (response) {
							if ($(
									"#fpassword")
									.val() != "") {
								alert("비밀번호가 변경되었습니다. 다시 로그인해주세요")
								location.href = "/IGOProject/member/logout2";
							} else {
								location.href = "/IGOProject/index";
							}
						}
					});
		});
	});
</script>
<body>

	<jsp:include page="/WEB-INF/view/common/header_layout.jsp" />

	<div class="sub_common">
		<div class="headImg subHeadMembers">
			<h2>회원 정보 수정</h2>
		</div>
		<div class="headBox">

			<div class="heading">
				<h2 class="headTxt">회원 정보 수정</h2>
			</div>
		</div>
	</div>

	<section id="modifyWrap">
  <div id="modifyForm">
    <form:form id="memberModifyForm">
		<ul>
			<li>
				<div>
				<input type="hidden" id="femail" name="email"
						value="${sessionScope._USER_.email}" />
			  </div>
			  <div >
				<form:errors path="email" />
			  </div>
			</li>
			
			<li>
				<div>
					<label for="fpassword">비밀번호</label>
        <input type="password" id="fpassword" name="password"
				placeholder="PASSWORD" />
      </div>
      <div id = "passwordError"> </div>
      <div>
        <form:errors path="password" />
      </div>
			
			</li>
			
			
			<li>
				<div><label for="passwordConfirm">비밀번호 확인</label>
        <input type="password" id="passwordConfirm" name="passwordConfirm"
				placeholder="PASSWORD CONFIRM" />
      </div>
      <div id = "passwordConfirmError" > </div>
			
			</li>
			
			
			
			<li>
			<div><label for="name">이름</label>
        <input type="text" id="name" name="name" placeholder="NAME"
				value="${sessionScope._USER_.name}" />
      </div>
      <div id="nameError"> </div>
      <div>
        <form:errors path="name" />
      </div>
			
			
			</li>
			<li>
			
			<div><label for="phone">휴대폰번호</label>
        <input type="text" id="phone" name="phone" placeholder="PHONE"
				value="${sessionScope._USER_.phone}" />
      </div>
      <div id = "phoneError"> </div>
      <div>
        <form:errors path="phone" />
      </div>
			
			</li>
	<li>
		<div>
			<input type="button" id="modifyBtn" value="수정" />
		</div>	
	</li>
      
      
			
			</ul>
    </form:form>
  </div>
</section>

	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp" />

</body>
</html>