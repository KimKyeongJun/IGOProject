<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<link href="<c:url value='/css/board.css'/>" rel="stylesheet" type="text/css">
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
							location.reload();
						}
						else {
							alert("댓글 등록 실패");
						}
					}
			);
			
		});
		
		$(".reply").on("click", ".replyModi", function() {
			var originContent = $(this).closest(".replyDiv").find(".clickContent").text();
			$(this).closest(".replyDiv").find(".clickContent").hide();
			$(this).closest(".replyDiv").find(".replyModi").hide();
			$(this).closest(".replyDiv").find(".replyDel").hide();
			
			var modi_text = '<textarea class="modiContent">' + originContent + '</textarea> <a class="reBtn1 replyModiBtn "><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 수정</a>'
			$(this).parent().find(".replyModi").after(modi_text);
		});
		
		$(".reply").on("click", ".replyModiBtn", function() {
			var reply_id = $(this).closest(".replyDiv").find(".replyId").val();
			var modifyContent = $(this).closest(".replyDiv").find(".modiContent").val();
			if(modifyContent == "") {
				alert("수정할 내용을 입력하세용!!");
				$(this).parent().find(".modiContent").focus();
				return;
			}
			
			$.post("<c:url value='/reply/modify/" + reply_id + "' />"
					, {
						qnaId : '${qnaVO.qnaId}'
						, content : modifyContent
						, token : '${sessionScope._TOKEN_}'
					}, function(response) {
						if(response) {
							location.reload();
						} else {
							alert("댓글 수정 실패");
						}
					}
			);
			
		});
		
		$(".reply").on("click", ".replyDel", function() {
			var reply_id = $(this).closest(".replyDiv").find(".replyId").val();
			$.post("<c:url value='/reply/delete/" + reply_id + "' />"
					, {
						token : '${sessionScope._TOKEN_}'
					}, function(response) {
						if(response) {
							location.reload();
						} else {
							alert("댓글 삭제 실패");
						}
					}
			);
		});
	});
</script>

	
	
	<div class="sub_common">
		<div class="headImg subHeadQna"><h2>Q &amp; A</h2></div>
			<div class="headBox">
			
				<div class="heading"><h2 class="headTxt">Q &amp; A</h2>
				</div>	
		</div>
	</div>
	
	
	<article id="bo_v" >
  		<header>
    		<h2 id="bo_v_title"> <span class="bo_v_tit"> ${qnaVO.title}</span> </h2>
  	</header>
  		<section id="bo_v_info">
    		<h2>페이지 정보</h2>
    		<span class="sound_only">작성자</span>
    		<span class="sv_member">${qnaVO.memberVO.name}</span>
    		<strong class="if_date">
    			<span class="sound_only">작성일</span>
    			<i class="fa fa-clock-o" aria-hidden="true"></i> 
    			${qnaVO.regDate}
    		</strong>
    	</section>
  
  	<section id="bo_v_atc">
    	<h2 id="bo_v_atc_title">본문</h2>
    	<div id="bo_v_img"> </div>
    
   	 	<!-- 본문 내용 시작 { -->
    	<div id="bo_v_con">${qnaVO.content}</div>
    <!-- } 본문 내용 끝 --> 
    
  	</section>
  
  	<!-- 게시물 상단 버튼 시작 { -->
  	<div id="bo_v_top">	
	    <ul class="bo_v_com">
			<li><a href="<c:url value='/qna/modify/${qnaVO.qnaId}'/>" onclick="comment_box('4', 'cu'); return false;" class="btn_b03 replyModi"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 수정</a></li>
	      	<li><a href="<c:url value='/qna'/>" class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i> 목록</a></li>
	    </ul>
  	</div>
  <!-- } 게시물 상단 버튼 끝 --> 
  
	
	<button type="button" class="cmt_btn"><i class="fas fa-comment"></i>댓글목록<i class="fas fa-angle-down"></i></button>
	
	<!-- 댓글 시작 { -->
  	<section id="bo_vc">
    	<h2>댓글목록</h2>
    	<article id="c_4">
      		<header>
	        	<h2>${reply.memberVO.name}님의  댓글</h2>
	        	<span class="member">${reply.memberVO.name}</span>
	        	<span class="sound_only">작성일</span>
	        	<%-- <span class="bo_vc_hdinfo"><i class="fa fa-clock-o" aria-hidden="true"></i>
	        		<time datetime="2018-10-17T11:09:00+09:00">${reply.regDate}</time>
	        	</span>  --%>
        	</header>
      
      <!-- 댓글 출력 -->
		
      <div class="cmt_contents reply">
        	<c:forEach items="${replyList}" var="reply">
      		<div class="replyDiv">
          		<ul class="reTopWrap"><li class="member"> ${reply.memberVO.name} </li>
          		<li class="if_date reT2"> <i class="fa fa-clock-o" aria-hidden="true"></i>${reply.regDate} </li>
          		</ul>
          		<p class="clickContent"> ${reply.content} </p>
          		<c:if test="${reply.email eq sessionScope._USER_.email}">
	          		<input type="hidden" class="replyId" name="replyId" value="${reply.replyId}" />
	          		<ul class="bo_vc_act">
	            		<li>
	            			<a href="#" class="btn_b01 btn replyModi">
	            				<i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정</a>
	            		</li>
	            		<li>
	            			<a href="#" onclick="return comment_delete();" class="btn_b03 replyDel">
	            			<i class="fa fa-trash-o" aria-hidden="true"></i>삭제</a>
	            		</li>
	          		</ul>
          		</c:if>
      		</div>
       		</c:forEach>
      </div>
      <input type="hidden" value="" id="secret_comment_4">
      <textarea id="save_comment_4" style="display:none">ㅇ_ㅇ!</textarea>
    </article>
  </section>
  <!-- } 댓글 끝 --> 
  
  <!-- 댓글 쓰기 시작 { -->
 	<aside id="bo_vc_w" class="bo_vc_w">
		<h2>댓글쓰기</h2>
    	<s:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
    	<c:if test="${isAdmin || qnaVO.email eq sessionScope._USER_.email}">
      	<div class="replyWrite">
			<form:form name="fviewcomment" id="replyData" modelAttribute="replyVO" method="post" autocomplete="off">
          		<input type="hidden" id="token" name="token" value="${sessionScope._TOKEN_}" />
          		<input type="hidden" id="qnaId" name="qnaId" value="${qnaVO.qnaId}" />
				<textarea id="content" name="content" maxlength="10000" required="" class="required" title="내용" placeholder="댓글내용을 입력해주세요">
				</textarea>
			
	          	<div class="bo_vc_w_wr">
		            <div class="bo_vc_w_info"> </div>
		            <div class="btn_confirm">
		              <input type="button" id="replyReg" class="btn_submit" value="등록">
		            </div>
	          	</div>
        	</form:form>
      </div>
    </c:if>
  </aside>
	
<script>
$(function() {
    //댓글열기
    $(".cmt_btn").click(function(){
        $(this).toggleClass("cmt_btn_op");
        $("#bo_vc").toggle();
    });
});
</script> 
</article>

<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>
	
