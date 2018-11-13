<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	                   $("#content").val("");
	                   $(".reply").append('<div>' + response.name + ' : <span class="content">' + response.content + '</span> <a class="replyModi">|수정|</a></div>');
	                } else {
	                   alert("댓글 등록 실패");
	                }
	             }
	       );
	       
	    });
	    
	    $(".reply").on("click", ".replyModi", function() {
	       var content_text = $(this).parent().find(".content").text();
	       $(this).parent().find(".content").hide();
	       $(this).parent().find(".replyModi").hide();
	       $(this).parent().find(".replyDel").hide();
	       
	       var modi_text = '<textarea class="modiContent">' + content_text + '</textarea> <input type="button" class="replyModiBtn" value="수정" />'
	       $(this).parent().find(".replyModi").after(modi_text);
	    });
	    
	    $(".reply").on("click", ".replyModiBtn", function() {
	       var reply_id = $(this).parent().find("#replyId").val();
	       var modiContent = $(this).parent().find(".modiContent").val();
	       
	       if(modiContent == "") {
	          alert("수정할 내용을 입력하세용!!");
	          $(this).parent().find(".modiContent").focus();
	          return;
	       }
	       
	       $.post("<c:url value='/reply/modify/" + reply_id + "' />"
	             , {
	                qnaId : '${qnaVO.qnaId}'
	                , content : modiContent
	                , token : '${sessionScope._TOKEN_}'
	             }, function(response) {
	                if(response) {
	                   window.location.reload();
	                } else {
	                   alert("댓글 수정 실패");
	                }
	             }
	       );
	       
	    });
	    
	    $(".reply").on("click", ".replyDel", function() {
	       var reply_id = $(this).parent().find("#replyId").val();
	       $.post("<c:url value='/reply/delete/" + reply_id + "' />"
	             , {
	                token : '${sessionScope._TOKEN_}'
	             }, function(response) {
	                if(response) {
	                   window.location.reload();
	                } else {
	                   alert("댓글 삭제 실패");
	                }
	             }
	       );
	    });
	 });

</script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
	
	<div class="sub_common">
		<div class="headImg1"><h2>Q & A</h2></div>
			<div class="headBox">
			
				<div class="heading"><h2 class="headTxt">Q & A</h2>
				</div>	
		</div>
	</div>

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
			<div>${reply.memberVO.name} : <span class="content">${reply.content}</span>
				<input type="hidden" id="replyId" name="replyId" value="${reply.replyId}" />
				<c:if test="${reply.email eq sessionScope._USER_.email}">
					<a class="replyModi">|수정|</a><a class="replyDel">삭제|</a>
				</c:if>
			</div>
		</c:forEach>
	</div>

	<div class="replyWrite">
		<form:form id="replyData" modelAttribute="replyVO">
			<input type="hidden" id="token" name="token" value="${sessionScope._TOKEN_}" />
			<input type="hidden" id="qnaId" name="qnaId" value="${qnaVO.qnaId}" />
			<textarea id="content" name="content"></textarea>
			<input type="button" id="replyReg" value="등록" />
		</form:form>
	</div>
	<div>
		<a href="<c:url value="/qna"/>">목록</a>
		<a href="<c:url value="/qna/modify/${qnaVO.qnaId}"/>">수정</a>
	</div>

	
	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>
	
</body>
</html>