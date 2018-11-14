<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$("#qnaBtn").click(function() {
			if ($("#qnaTitle").val() == ""){
				alert("제목을 입력하세요");
				$("#qnaTitle").focus();
				return;
			}
			
			if($("#qnaContent").val() == ""){
				alert("내용을 입력하세요");
				$("#qnaContent").focus();
				return;
			}
			$.post("<c:url value='/qna/modify'/>"
					, $("#registForm").serialize()
					, function(response) {
						if(response) {
							location.href='<c:url value="/qna/detail/${qnaVO.qnaId}"/>';
						}
						else {
							alert("수정 실패");
						}
			});
		});
	});
</script>
<body>

	<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
	
	<div class="sub_common">
		<div class="headImg1"><h2>Q & A</h2></div>
			<div class="headBox">
			
				<div class="heading"><h2 class="headTxt">Q & A</h2>
				</div>	
		</div>
	</div>
	
	<c:url var="qnaResist"  value="/qna/regist" />
	<form id="registForm">
		<div>
			<input type="hidden" name="qnaId" value="${qnaVO.qnaId}"/>
			<input type="hidden" name="token" value="${sessionScope._TOKEN_}"/>
			<input type="text" id="qnaTitle" name="title" placeholder="제목을 입력하세요." value="${qnaVO.title}"/>
		</div>
		<div>
			<textarea id="qnaContent" name="content" placeholder="내용을 입력하세요.">${qnaVO.content}</textarea>
		</div>
		<div>
			<input type="button" id="qnaBtn" value="수정" />
		</div>
	</form>
	
	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>
	
</body>
</html>