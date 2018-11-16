<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/css/board.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script>
	$().ready(function() {
		$(".detail").click(function() {			
			location.href = "<c:url value='/qna/detail/'/>"+$(this).data('qnaid');
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
	
	<div id="con_lf"> 
  
  <!-- 게시판 목록 시작 { -->
  <div id="bo_list" style="width:100%">
    <div class="tbl_head01 tbl_wrap">
      <table>
       
        <thead>
          <tr>
            <th scope="col" class="number header box">번호</th>
            <th scope="col" class="subject header box">제목</th>
            <th scope="col" class="writer header box">글쓴이</th>
            <th scope="col" class="create-date header box">작성일</th>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${not empty qnaList}">
              <c:forEach items="${qnaList}" var="qnaVO">
                <div class="contentWrapper">
                  <tr class="">
                    <td class="tac number box">${qnaVO.rnum}</td>
                    <td class="subject box detail" data-qnaid="${qnaVO.qnaId}"><%-- <a href="<c:url value='/qna/detail/${qnaVO.qnaId}'/>"> --%>${qnaVO.title}<!-- </a> --></td>
                    <td class="tac sv_use writer box">${qnaVO.memberVO.name}</td>
                    <td class="tac create-date box">${qnaVO.regDate}</td>
                  </tr>
                </div>
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
            <input type="text" name="searchKeyword" value="${qnaSearchVO.searchKeyword}" placeholder="제목" class="bsInput">
            <button type="submit" value="검색" class="bsBtn"><i class="icon ion-md-search"></i></button>
			 <a href="<c:url value='/qna/init'/>" class="bsResetBtn"><i class="icon ion-md-refresh"></i></a>			 
         </div>           
      </form>
   </div>
	
    <div class="btn_confirm">
      <ul class="btn_bo_user">
      	<c:if test="${not empty sessionScope._USER_}">
        	<li class="btnWrite"><a href="<c:url value='/qna/regist'/>">글쓰기</a></li>
      	</c:if>
      </ul>
    </div>
    
  
</div>
</div>
	

	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp" />
</body>
</html>