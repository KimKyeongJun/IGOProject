<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="/js/jquery-3.3.1.min.js" />" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		var emailAfter = $(`<div class="error"> E-Mail을 입력해 주세요.</div>`);
		var emailFindnameAfter = $(`<div class="error"> 이름을 입력해 주세요.</div>`);
		var passwordFindnameAfter = $(`<div class="error"> 이름을 입력해 주세요.</div>`);
		var passwordAfter = $(`<div class="error"> Password를 입력해 주세요.</div>`);
		var emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var emailRegexAfter = $(`<div class="error"> E-Mail 형식이 맞지 않습니다.</div>`);
		var passwordRegex = /^(?=.*[a-zA-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}/;
		var passwordRegexAter = $(`<div class="error"> 비밀번호는 8글자 이상 20글자 이하 <br/>  대소문자, 숫자, 특수문자를 포함해야 합니다.</div>`);
		var passwordConfirmAfter = $(`<div class="error"> 비밀번호를 확인해 주세요. </div>`);
		var emailFindphoneAfter = $(`<div class="error"> 연락처를 입력해 주세요. </div>`);
		var passwordFindphoneAfter = $(`<div class="error"> 연락처를 입력해 주세요. </div>`);
		var emmailConfirmCheckAfter = $(`<div class="error"> E-Mail을 확인해주세요. </div>`);
		
		$("#eFindNameError").prepend(emailFindnameAfter);
		$("#eFindPhoneError").prepend(emailFindphoneAfter);
		$("#pFindEmailError").prepend(emailAfter);
		$("#pFindNameError").prepend(passwordFindnameAfter);
		$("#pFindPhoneError").prepend(passwordFindphoneAfter);
		$("#newPassError").prepend(passwordAfter);
		$("#newPassConfirmError").prepend(passwordConfirmAfter);
		
		var eFindNameEmpty = false;
		var eFindPhoneEmpty = false;
		var pFindEmailEmpty = false;
		var pFindPhoneEmpty = false;
		var pFindNameEmpty = false;
		var newPassEmpty = false;
		var newPassConfirmEmpty = false;
		
		function EmptyCheck(status){
			eFindNameEmpty = false;
			eFindPhoneEmpty = false;
			pFindEmailEmpty = false;
			pFindPhoneEmpty = false;
			pFindNameEmpty = false;
			newPassEmpty = false;
			newPassConfirmEmpty = false;
			
			if (status == 1) {
				if($("#findName").val() == "") {
					eFindNameEmpty = true;
				}
				
				if($("#findPhone").val() == "") {
					eFindPhoneEmpty = true;  
				}
			}
			else if (status == 2) {
				if($("#newPassEmail").val() == "") {
					pFindEmailEmpty = true;
				}
				
				if($("#newPassName").val() == "") {
					pFindNameEmpty = true;
				}
				
				if($("#newPassPhone").val() == "") {
					pFindPhoneEmpty = true;
				}
			}
			else if ( status == 3 ) {
				if ($("#newPassword").val() == "") {
					newPassEmpty = true; 
				}
				if ($("#newPasswordConfirm").val() == "") {
					newPassConfirmEmpty = true; 
				}
			}
		}
		
		function errorDivAdd(status) {
			EmptyCheck(status);
			var result = false;
			if ( status == 1 ) {
				if ( eFindNameEmpty || eFindPhoneEmpty ) {
					//$("#eFindNameError").removeClass($(".error"));
					//$("#eFindPhoneError").removeClass($(".error"));
					$("#eFindNameError").find(".error").remove();
					$("#eFindPhoneError").find(".error").remove();
					if ( eFindNameEmpty ) {
						$("#eFindNameError").prepend(emailFindnameAfter);
					} 
					if ( eFindPhoneEmpty ) {
						$("#eFindPhoneError").prepend(emailFindphoneAfter);
					}
					result = true;
				}
				else {
					$("#eFindNameError").find(".error").remove();
					$("#eFindPhoneError").find(".error").remove();
				}
			}
			else if ( status == 2 ) {
				if ( pFindEmailEmpty || pFindNameEmpty || pFindPhoneEmpty ) {
					$("#pFindEmailError").find(".error").remove();
					$("#pFindNameError").find(".error").remove();
					$("#pFindPhoneError").find(".error").remove();
					if ( pFindEmailEmpty ) {
						$("#pFindEmailError").prepend(emailAfter);
					}
					else {
						if ( !emailRegex.test($("#newPassEmail").val()) ) {
							$("#pFindEmailError").prepend(emailRegexAfter);
			            }
					}
					if ( pFindNameEmpty ) {
						$("#pFindNameError").prepend(passwordFindnameAfter);
					}
					if ( pFindPhoneEmpty ) {
						$("#pFindPhoneError").prepend(passwordFindphoneAfter);
					}
					result = true;
				}
				else {
					$("#pFindEmailError").find(".error").remove();
					$("#pFindNameError").find(".error").remove();
					$("#pFindPhoneError").find(".error").remove();
					if ( !emailRegex.test($("#newPassEmail").val()) ) {
						$("#pFindEmailError").prepend(emailRegexAfter);
						result = true;
		            }
				}
				
			}
			else if ( status == 3 ) {
				if ( newPassEmpty || newPassConfirmEmpty ) {
					$("#newPassError").find(".error").remove();
					$("#newPassConfirmError").find(".error").remove();
					if ( newPassEmpty ) {
						$("#newPassError").prepend(passwordAfter);
					}
					else {
						if ( !passwordRegex.test($("#newPassword").val()) ) {
							$("#newPassError").prepend(passwordRegexAter);
				        }
					}
					if ( newPassConfirmEmpty ) {
						$("#newPassConfirmError").prepend(passwordConfirmAfter);
					}
					else {
						if ($("#newPassword").val() != $("#newPasswordConfirm").val()) {
							$("#newPassConfirmError").prepend(passwordConfirmAfter);
						}
					}
					result = true;
				}
				else {
					$("#newPassError").find(".error").remove();
					$("#newPassConfirmError").find(".error").remove();
					if ( !passwordRegex.test($("#newPassword").val()) ) {
						$("#newPassError").prepend(passwordRegexAter);
						result = true;
			        }
					if ($("#newPassword").val() != $("#newPasswordConfirm").val()) {
						$("#newPassConfirmError").prepend(passwordConfirmAfter);
						result = true;
					}
				}
			}
			return result;
		}
		
		$("#newPassPhone").keyup(function(event){
			if ( !onlyNumber(event) ) {
				removeChar(event)
			}
		});
		
		$("#findPhone").keyup(function(event){
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
		
		$("#setNewPassData").hide();
		
		$("#newPassBtn").click(function() {
			if ( errorDivAdd(2) ) {
				return;
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
			if ( errorDivAdd(3) ) {
				return;
			}
			
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
			if ( errorDivAdd(1) ) {
				return;
			}
			/* if($("#findName").val() == "") {
				alert("이름을 입력하세용!!");
				$("#findName").focus();
				return ;
			}
			
			if($("#findPhone").val() == "") {
				alert("전화번호를 입력하세용!!");
				$("#findPhone").focus();
				return ;
			}
			if ($("#newPassword").val() != $("#newPasswordConfirm").val()) {
				alert("패스워드를 다시 확인해 주세요.");
				return;
			} */
			
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
		
		$("#findName").blur( function() {
			errorDivAdd(1);
			return;
	    });
		$("#findPhone").blur( function() {
			errorDivAdd(1);
			return;
	    });
		$("#newPassEmail").blur( function() {
			errorDivAdd(2);
			return;
	    });
		$("#newPassName").blur( function() {
			errorDivAdd(2);
			return;
	    });
		$("#newPassPhone").blur( function() {
			errorDivAdd(2);
			return;
	    });
		$("#newPassword").blur( function() {
			errorDivAdd(3);
			return;
	    });
		$("#newPasswordConfirm").blur( function() {
			errorDivAdd(3);
			return;
	    });
		
		$("#findPhone").blur( function() {
	         var num = $("#findPhone").val();
	         var phone_num = num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	         $("#findPhone").val(phone_num);
	    });
		
		$("#newPassPhone").blur( function() {
	         var num = $("#newPassPhone").val();
	         var phone_num = num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	         $("#newPassPhone").val(phone_num);
	    });
	}); 
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
	
	<div class="sub_common">
		<div class="headImg1"><h2>회원 정보 찾기</h2></div>
			<div class="headBox">
			
				<div class="heading"><h2 class="headTxt">회원 정보 찾기</h2>
				</div>	
		</div>
	</div>
	<div>		
		<form id="EmailFindData">
			<div>
				이름 <input type="text" id="findName" name="name" placeholder="이름" />
			</div>
			<div id="eFindNameError">
			</div>
			<div>
				전화번호 <input type="text" id="findPhone" name="phone" placeholder="전화번호" maxlength=11/>
			</div>
			<div id="eFindPhoneError">
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
			<div id="pFindEmailError">
			</div>
			<div>
				이름 <input type="text" id="newPassName" name="name" placeholder="이름" />
			</div>
			<div id="pFindNameError">
			</div>
			<div>
				전화번호 <input type="text" id="newPassPhone" name="phone" placeholder="전화번호" maxlength=11/>
			</div>
			<div id="pFindPhoneError">
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
			<div id="newPassError">
			</div>
			<div>
				새 비밀번호 확인 <input type="password" id="newPasswordConfirm" name="newPasswordConfirm" placeholder="New Password Confirm"/>
			</div>
			<div id="newPassConfirmError">
			</div>
			<div>
				<input type="button" id="setNewPassBtn" value="비밀번호 재설정" />
			</div>
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>

</body>
</html>