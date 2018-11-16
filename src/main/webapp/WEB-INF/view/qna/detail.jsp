<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/IGOProject/css/board.css" rel="stylesheet" type="text/css">
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
	
	<s:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
	<c:if test="${isAdmin || qnaVO.email eq sessionScope._USER_.email}">
		<div class="replyWrite">
			<form:form id="replyData" modelAttribute="replyVO">
				<input type="hidden" id="token" name="token" value="${sessionScope._TOKEN_}" />
				<input type="hidden" id="qnaId" name="qnaId" value="${qnaVO.qnaId}" />
				<textarea id="content" name="content"></textarea>
				<input type="button" id="replyReg" value="등록" />
			</form:form>
		</div>
	</c:if>
	
	<div>
		<a href="<c:url value="/qna"/>">목록</a>
		<a href="<c:url value="/qna/modify/${qnaVO.qnaId}"/>">수정</a>
	</div>
	<%-- 
	<article id="bo_v" style="width:100%">
    <header>
        <h2 id="bo_v_title">
                        <span class="bo_v_tit">${qnaVO.title}</span>
        </h2>
    </header>

    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        <span class="sound_only">작성자</span> <strong><span class="sv_member">${qnaVO.memberVO.name}</span></strong>
        <strong class="if_date" ><span class="sound_only">작성일</span><i class="fa fa-clock-o" aria-hidden="true"></i> ${qnaVO.regDate}</strong>

    </section>

    <section id="bo_v_atc">
        <h2 id="bo_v_atc_title">본문</h2>

        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">${qnaVO.content}</div>
          <!-- } 본문 내용 끝 -->
    </section>    
    <!-- 게시물 상단 버튼 시작 { -->
    <div id="bo_v_top">
        <ul class="bo_v_com">
           <li><a href="/IGOProject/qna" class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i> 목록</a></li>
           <c:if test="${sessionScope._USER_.email eq qnaVO.email}">           
				<li><a href="<c:url value="/qna/modify/${qnaVO.qnaId}"/>" class="btn_b02 btn"><i class="icon ion-md-close" aria-hidden="true"></i> 수정</a></li>    
				<li><a href="<c:url value="/qna/delete/${qnaVO.qnaId}"/>" class="btn_b02 btn"><i class="icon ion-md-close" aria-hidden="true"></i> 삭제</a></li>    
           </c:if>
		</ul>    
	</div>
    <!-- } 게시물 상단 버튼 끝 -->
</article>
 --%>
	
	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>
	
</body>
</html>