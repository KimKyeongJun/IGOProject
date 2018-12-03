<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<footer id="info">
		<button type="button" id="top_btn">
			<i class="fa fa-arrow-up" aria-hidden="true"></i><span
				class="sound_only">상단으로</span>
		</button>
		<div class="fMenu">
			<ul class="imenu">
				<li> <a href="<c:url value='/html/terms.html'/>"  onclick="window.open(this.href, '팝업이름','location=0, scrollbars=1');return false;">이용약관</a></li>
				<li> <a href="<c:url value='/html/privacy.html'/>"  onclick="window.open(this.href, '팝업이름','location=0, scrollbars=1');return false;">개인정보취급방침</a></li>

				<li><a href="<c:url value='/notice'/>">고객센터</a></li>
			</ul>
		</div>
		<div class="fTop">
			<a href="<c:url value='/'/>"><div id="fLogo"></div></a>
		</div>
		<div class="fMtxt">
			<address>
				서울특별시 서초구 효령로 176 KTDS 2층, 대표번호 : 02-1234-6	875
				<p>COPYRIGHT 2018 © I GO. ALL RIGHT RESERVED.</p>
			</address>
		</div>
	</footer>
</body>
</html>