<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판목록</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css"/>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>



<script>
	$(document).ready(function(){
		
		$('#addBtn').click(function(){
			location.href = "writeForm.jsp"
		})
	})
	
	<%-- jsp먼저 해석, el먼저해석한 후 자바스크립트 해석하기 때문에 core태그 사용가능. 
	
		서버가 jsp->JSTL을 Servlet코드로 해석하면서 c태그가 해석됨
		response되면 웹브라우저가 javascript코드 해석하기 때문에 core태그를 사용할 수 있다.
	--%>
	function doAction(no){
		<c:choose>
			<c:when test="${ not empty sessionScope.loginfo}">
				location.href="detail.jsp?no=" + no 
						+ '&type=list'
			</c:when>
			<c:otherwise>
				if(confirm('로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?'))
					location.href="/Mission-Web/jsp/login/login.jsp"
			</c:otherwise>
		</c:choose>
	}
	
</script>

</head>

<body>
	<header>
		<%-- <jsp:include page="/jsp/include/topMenu.jsp" /> --%>
	</header>
	<section>
		
		<div align="center">
		
			<hr>	
			<h2>게시판 목록</h2>
			<hr>
			
			<br>
			<table id="list" border="1" style="width:100%">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">작성자</th>
					<th width="20%">등록일</th>
				</tr>
				
				<c:forEach items="${ requestScope.list }" var="l" varStatus="loop">
				<tr <c:if test="${ loop.index mod 2 ne 0 }"> class="odd"</c:if>>
					<td>${ l.no }</td>
					<td>
						<%-- <a href="${pageContext.request.contextPath }/board/detail?no=${l.no}"> --%>
						<a href="${pageContext.request.contextPath }/board/${l.no}">
						<%-- href="javascript:doAction()" a태그에서 자바스크립트 문법 실행하도록. --%>
						<%-- <a href="javascript:doAction(${ l.no })"> --%>
							<c:out value="${ l.title }" />
						</a></td>
					<td>${ l.writer }</td>
					<td>${ l.regDate }</td>
				</tr>
				</c:forEach>
			</table>
			<br>
			<c:if test="${ not empty sessionScope.loginfo }">
				<button id="addBtn">새글등록</button>
			</c:if>
		</div>

	</section>
	
	<footer>
		<%-- <%@ include file="/jsp/include/bottom.jsp" %> --%>
	</footer>

</body>
</html>