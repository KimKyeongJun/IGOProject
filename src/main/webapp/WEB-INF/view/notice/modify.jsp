<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/css/board.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#qnaBtn").click(function() {
			if ($("#wr_title").val() == ""){
				alert("제목을 입력하세요");
				$("#wr_title").focus();
				return;
			}
			
			if($("#wr_content").val() == ""){
				alert("내용을 입력하세요");
				$("#wr_content").focus();
				return;
			}
			$.post("<c:url value='/notice/modify'/>"
					, $("#registForm").serialize()
					, function(response) {
						if(response) {
							location.href='<c:url value="/notice/detail/${noticeVO.noticeId}"/>';
						}
			});
		});
	});
</script>

	<div class="sub_common">
		<div class="headImg subHeadNotice"><h2>공지사항</h2></div>
			<div class="headBox">
				<div class="heading"><h2 class="headTxt">공지사항</h2>
			</div>	
		</div>
	</div>
	
	<c:url var="qnaResist"  value="/notice/write" />
	
	<section id="bo_w">
		<h2 class="sound_only">자유게시판 글쓰기</h2>

	<!-- 게시물 작성/수정 시작 { -->
	<form id="registForm">
		<input type="hidden" name="token" value="${sessionScope._TOKEN_}" />
		<input type="hidden" name="noticeId" value="${noticeVO.noticeId}" />
		<div class="bo_w_tit write_div">
			<label for="wr_subject" class="sound_only">제목<strong>필수</strong></label>
			
			<div id="autosave_wrapper write_div">
				<input type="text" value="${noticeVO.title}" name="title"  id="wr_title" required="required" class="frm_input full_input required" size="50" maxlength="255" placeholder="제목을 입력하세요."/>            
			</div>
		</div>

		<div class="write_div">
			<label for="wr_content" class="sound_only">내용<strong>필수</strong></label>
			<div class="wr_content ">
				<span class="sound_only">웹에디터 시작</span>
				<textarea id="wr_content" name="content" class="" maxlength="65536" rows="5" cols="30" required="required" placeholder="내용을 입력하세요.">${noticeVO.content}</textarea>
				<span class="sound_only">웹 에디터 끝</span>                    
			</div>
		</div> 

		<div class="btn_confirm write_div">
			<a href="<c:url value="/notice/detail/${noticeVO.noticeId}"/>" class="btn_cancel btn"><i class="icon ion-md-close" aria-hidden="true"></i>취소</a>
			<button value="작성완료" id="qnaBtn" accesskey="s" class="btn_submit btn"><i class="icon ion-md-create"></i>수정</button>
		</div>
	</form>
</section>
	
<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>