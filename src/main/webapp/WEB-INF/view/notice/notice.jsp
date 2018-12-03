<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link href="<c:url value='/css/board.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script>
	$().ready(function() {
		$(".detail").click(function() {			
			location.href = "<c:url value='/notice/updateviewcount/'/>"+$(this).data('noticeid');
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
	
	<div id="con_lf"> 
  
  <!-- 게시판 목록 시작 { -->
  <div id="bo_list">
    <div class="tbl_head01 tbl_wrap">
      <table>
       
        <thead>
          <tr>
            <th scope="col" class="number header box">번호</th>
            <th scope="col" class="subject header box">제목</th>
            <th scope="col" class="writer header box">글쓴이</th>
            <th scope="col" class="create-date header box">작성일</th>
            <th scope="col" class="create-date header box">조회수</th>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${not empty noticeList}">
              <c:forEach items="${noticeList}" var="noticeVO">
                  <tr>
                    <td class="tac number box">${noticeVO.rnum}</td>
                    <td class="subject box detail" data-noticeid="${noticeVO.noticeId}"><%-- <a href="<c:url value='/qna/detail/${qnaVO.qnaId}'/>"> --%>${noticeVO.title}<!-- </a> --></td>
                    <td class="tac sv_use writer box">${noticeVO.memberVO.name}</td>
                    <td class="tac create-date box">${noticeVO.regDate}</td>
                    <td class="tac create-date box">${noticeVO.viewCount}</td>
                  </tr>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <tr id="no-articles">
                <td colspan="4" style="text-align:center;"> 등록된 게시글이 없습니다. </td>
              </tr>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </div>
    
    <div class="padded pg_wrap">
      <form id="searchForm" class="pagination" onsubmit="javascript:movePage(0);">
         <div class="pageNum">
         	${pagenation}
         </div>
         <div class="bottonSearch">
            <input type="text" name="searchKeyword" value="${noticeSearchVO.searchKeyword}" placeholder="제목" class="bsInput">
            <button type="submit" value="검색" class="bsBtn"><i class="icon ion-md-search"></i></button>
			 <a href="<c:url value='/notice/init'/>" class="bsResetBtn"><i class="icon ion-md-refresh"></i></a>			 
         </div>           
      </form>
   </div>
  	
  	<s:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
    <div class="btn_confirm">
      <ul class="btn_bo_user">
      	<c:if test="${isAdmin}">
        	<li class="btnWrite"><a href="<c:url value='/notice/write'/>">글쓰기</a></li>
      	</c:if>
      </ul>
    </div>
    
  
</div>
</div>
	

<jsp:include page="/WEB-INF/view/common/footer_layout.jsp" />