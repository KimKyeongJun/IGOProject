<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link href="<c:url value='/css/member.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function(){
		var emailAfter = $('<div class="error"><span class="redPoint">*</span> E-Mail을 입력해 주세요.</div>');
		var nameAfter = $('<div class="error"><span class="redPoint">*</span> 이름을 입력해 주세요.</div>');
		var passwordAfter = $('<div class="error"> <span class="redPoint">*</span> Password를 입력해 주세요.</div>');
		var emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var emailRegexAfter = $('<div class="error"><span class="redPoint">*</span> E-Mail 형식이 맞지 않습니다.</div>');
		var passwordRegex = /^(?=.*[a-zA-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}/;
		var passwordRegexAter = $('<div class="error"> 비밀번호는 8글자 이상 20글자 이하 <br/>  대소문자, 숫자, 특수문자를 포함해야 합니다.</div>');
		var emailRegexboolAfter = $('<div class="error"><span class="redPoint">*</span>  E-Mail 이미 존재합니다.</div>');
		var passwordConfirmAfter = $('<div class="error"> <span class="redPoint">*</span> 비밀번호를 확인해 주세요. </div>');
		var phoneAfter = $('<div class="error"><span class="redPoint">*</span> 연락처를 입력해 주세요. </div>');
		var emmailConfirmCheckAfter = $('<div class="error"> <span class="redPoint">*</span> E-Mail을 확인해주세요. </div>');
		
		$("#emailError").prepend(emailAfter);
		$("#nameError").prepend(nameAfter);
		$("#passwordError").prepend(passwordAfter); 
		$("#passwordConfirmError").prepend(passwordConfirmAfter);
		$("#phoneError").prepend(phoneAfter);
		
		var emailEmpty = false;
		var nameEmpty = false;
		var phoneEmpty = false;
		var passwordEmpty = false;
		var emailRegexbool = false;
		var passwordConfirmEmpty = false;
		var emailComfirmCheck = false;
		
		function EmptyCheck(){
			emailEmpty = false;
			nameEmpty = false;
			phoneEmpty = false;
			passwordEmpty = false;
			passwordConfirmEmpty = false;
			
			if ($("#duplicatedEmail").val() == "") {
				emailEmpty = true;
			}
			if ($("#name").val() == "") {
				nameEmpty = true;
			}
			if ($("#phone").val() == "") {
				phoneEmpty = true;
			}
			if ($("#registPassword").val() == "") {
				passwordEmpty = true;
			}
			if ($("#passwordConfirm").val() == "") {
				passwordConfirmEmpty = true;
			}
		}
		
		function errorDivAdd() {
			EmptyCheck();
			
			var result = false;
			if (emailEmpty || nameEmpty || phoneEmpty || passwordEmpty || passwordConfirmEmpty) {
				$(".error").remove();
				if (emailEmpty) {
					$("#emailError").prepend(emailAfter);
				}
				else {
					if ( !emailRegex.test($("#duplicatedEmail").val()) ) {
						$("#emailError").prepend(emailRegexAfter);
		            }
					else { 
						if ( !emailComfirmCheck && !emailRegexbool ) {
							$("#emailError").prepend(emmailConfirmCheckAfter);
						}
						else if ( emailComfirmCheck && emailRegexbool ) {
							$("#emailError").prepend(emailRegexboolAfter);
						}
						else if ( !emailComfirmCheck && emailRegexbool ) {
							$("#emailError").prepend(emailRegexboolAfter);
						}
					}
				}
				if (nameEmpty) {
					$("#nameError").prepend(nameAfter);
				}
				if (phoneEmpty) {
					$("#phoneError").prepend(phoneAfter);
				}
				if (passwordEmpty) {
					$("#passwordError").prepend(passwordAfter);
				}
				else {
					if ( !passwordRegex.test($("#registPassword").val()) ) {
						$("#passwordError").prepend(passwordRegexAter);
			        }
				}
				if (passwordConfirmEmpty) {
					$("#passwordConfirmError").prepend(passwordConfirmAfter);
				}
				else {
					if ( $("#registPassword").val() != $("#passwordConfirm").val() ) {
						$("#passwordConfirmError").prepend(passwordConfirmAfter);
					}
				}
				result = true;
			}
			else {
				$(".error").remove();
				if ( !passwordRegex.test($("#registPassword").val()) ) {
					$("#passwordError").prepend(passwordRegexAter);
					result = true;
		        }
				if ( !emailRegex.test($("#duplicatedEmail").val()) ) {
					$("#emailError").prepend(emailRegexAfter);
					result = true;
	            }
				else {
					if ( !emailComfirmCheck && !emailRegexbool ) {
						$("#emailError").prepend(emmailConfirmCheckAfter);
						result = true;
					}
					else if ( emailComfirmCheck && emailRegexbool ) {
						$("#emailError").prepend(emailRegexboolAfter);
						result = true;
					}
					else if ( !emailComfirmCheck && emailRegexbool ) {
						$("#emailError").prepend(emailRegexboolAfter);
						result = true;
					}
				}
				if ( $("#registPassword").val() != $("#passwordConfirm").val() ) {
					$("#passwordConfirmError").prepend(passwordConfirmAfter);
					result = true;
				}
			}
			return result;
				
		}
		
		function duplicate() {
			$.post("/IGOProject/member/duplicate", {
	            "email" : $("#duplicatedEmail").val()
	         }, function(response) {
	            if (response.duplicated) {
	            	emailRegexbool  = true;
	            }
	            else {
	            	emailRegexbool  = false;
	            }
	         });       
		}
		
		
		$("#phone").blur( function() {
	         var num = $("#phone").val();
	         var phone_num = num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	         $("#phone").val(phone_num);
	      });
		 

		$("#emailComfirmBtn").click(function(){
			duplicate();
			if ( emailRegexbool ) {
				emailComfirmCheck = false;
			}
			else {
				emailComfirmCheck = true;
			}
			errorDivAdd();
		})
		
		$("#registBtn").click(function(){
			if ( errorDivAdd() ) {
				return;
			}
			if ( emailRegexbool ) {
				return;
			}
			var isCheck = $("#agreeChkBox").prop("checked");
			if ( !isCheck ) {
				alert("이용약관에 동의해주세요.");
				return;
			}
			alert("회원가입 인증 메일을 발송했습니다. \n인증 확인 후 이용해주세요.");
			$("#memberRegistForm").attr({
				"method" : "post",
				"action" : "/IGOProject/member/regist",
			}).submit();
			
		});
		$("#duplicatedEmail").blur( function() {
			errorDivAdd();
			return;
	    });
		$("#name").blur(function(){
			errorDivAdd();
			return;
		});
		$("#phone").blur(function(){
			errorDivAdd();
			return;
		});
		$("#registPassword").blur(function(){
			errorDivAdd();
			return;
		});
		$("#passwordConfirm").blur(function(){
			errorDivAdd();
			return;
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
		
		$(".cancelBtn").click(function() {
			location.href="<c:url value='/index'/>";
		});
		
	})
</script>
<body>

	<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
	
	<div class="sub_common">
		<div class="headImg subHeadMembers"><h2>회원가입</h2></div>
			<div class="headBox">
			
				<div class="heading"><h2 class="headTxt">회원가입</h2>
				</div>	
		</div>
	</div>

	<section id="memWrap">
  <div id="memForm">
    <form:form id="memberRegistForm" modelAttribute="memberVO" >
      <ul>
        <li>
          <div>
            <label for="duplicatedEmail">이메일</label>
            <input type="email" id="duplicatedEmail" name="email" placeholder="E-Mail" />
            <input type="button" id="emailComfirmBtn" value="이메일 확인"/>
          </div>
          <div id="emailError" class="regError"> </div>
          <div>
            <form:errors path="email"/>
          </div>
        </li>
        <li>
          <div>
            <label for="name">이름</label>
            <input type="text" id="name" name="name" placeholder="NAME" />
          </div>
          <div id="nameError" class="regError"> </div>
          <div>
            <form:errors path="name"/>
          </div>
        </li>
        <li>
          <div>
            <label for="phone">연락처</label>
            <input type="text" id="phone" name="phone" placeholder="PHONE"  maxlength="11" />
          </div>
          <div id="phoneError" class="regError"> </div>
          <div>
            <form:errors path="phone"/>
          </div>
        </li>
        <li>
          <div>
            <label for="registPassword">비밀번호</label>
            <input type="password" id="registPassword" name="password" placeholder="PASSWORD" />
          </div>
          <div id="passwordError" class="regError"> </div>
          <div>
            <form:errors path="password"/>
          </div>
        </li>
        <li>
          <div>
            <label for="passwordConfirm">비밀번호 확인</label>
            <input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="PASSWORD CONFIRM"/>
          </div>
          <div id="passwordConfirmError" class="regError"> </div>
          <!-- <div id="passwordConfirmError">
			</div> --> 
          
        </li>
        <li>
          <div class="checkWrap">
            <input type="checkbox" id="agreeChkBox" class="agreeChkBox chkbox2">
            이용약관에 동의 <a href="<c:url value='/html/terms.html'/>"  onclick="window.open(this.href, '팝업이름','location=0, scrollbars=1');return false;" target="_blank" class="viewBtn">이용약관보기 <i class="ion-md-search viewBtnI"></i></a> </div>
        </li>
        <li>
          <div class="bottomBtn2">
            <input type="button" class="cancelBtn" value="취소" />
            <input type="button" id="registBtn" value="등록"/>
          </div>
        </li>
      </ul>
    </form:form>
  </div>
</section>
		
	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>

</body>
</html>