<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

=======
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#replyReg").click(function() {
			if($("#content").val() == "") {
				alert("댓글 내용을 입력하세용!!");
				$("#content").focus();
				return;
			}
			
			$.post("<c:url value='/reply/write' />"
					, $("#replyData").serialize()
					, function(response) {
						if(response.status == 'ok') {
							//alert(response.content + " " + response.email);
							$(".reply").append('<div>' + response.name + " : " + response.content + '</div>')
						} else {
							alert("댓글 등록 실패");
						}
					}
			);
			
		});
	});
</script>
</head>
<body>

	<div>	
		${qnaVO.title}
	</div>
	<div>	
		${qnaVO.memberVO.name}
	</div>
	<div>	
		${qnaVO.regDate}
	</div>
	<div>	
		${qnaVO.content}
	</div>
	
	<hr/>
	
	<div class="reply">
		<c:forEach items="${replyList}" var="reply">
		<div>${reply.memberVO.name} : ${reply.content}</div>
		</c:forEach>
	</div>
	
	<div class="replyWrite">
		<form:form id="replyData" modelAttribute="replyVO">
			<input type="hidden" id="token" name="token" value="1" />
			<input type="hidden" id="qnaId" name="qnaId" value="${qnaVO.qnaId}" />
			<textarea id="content" name="content"></textarea>
			<input type="button" id="replyReg" value="등록" />
		</form:form>
	</div>
	<div>
		<a href="<c:url value="/qna"/>">목록</a>
		<a href="<c:url value="/qna/modify/${qnaVO.qnaId}"/>">수정</a>
	</div>
	
</body>
</html>