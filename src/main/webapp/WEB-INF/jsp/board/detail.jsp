<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css"/>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css"/>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>

   $(document).ready(function(){
      
      $('#backBtn').click(function(){
         location.href="${ pageContext.request.contextPath }/board"
      })
      
      $('#modifyBtn').click(function(){
         location.href="modifyForm.jsp?no=" + <c:out value="${ board.no }"/>
      })
      
      $('#deleteBtn').click(function(){
         if(confirm('정말 삭제하시겠습니까?')){
            location.href="delete.jsp?no=" + <c:out value="${ board.no }"/>            
         }
      })
      
   })
</script>
</head>
<body>

   <header>
      <%-- <jsp:include page="/jsp/include/topMenu.jsp" /> --%>
   </header>
   <section>
      <div align="center">
      <hr width="100%">
      <h2>게시판 상세</h2>
      <hr>
      <br>
      <table border="1" style="width: 100%">
         <tr>
            <th width="25%">번호</th>
            <td><c:out value="${ board.no }"/></td>
         </tr>
         <tr>
            <th width="25%">제목</th>
            <td><c:out value="${ board.title }"/></td>
         </tr>
         <tr>
            <th width="25%">작성자</th>
            <td><c:out value="${ board.writer }"/></td>
         </tr>
         <tr>
            <th width="25%">내용</th>
            <td><c:out value="${ board.content }"/></td>
         </tr>
         <tr>
            <th width="25%">조회수</th>
            <td><c:out value="${ board.viewCnt }"/></td>
         </tr>
         <tr>
            <th width="25%">등록일</th>
            <td><c:out value="${ board.regDate }"/></td>
         </tr>
         
         <!--  
         <tr>
            <th width="25%">첨부파일</th>
            <td>
               <c:forEach items="${ fileList }" var="file">
               <a href="/Mission-Web/upload/${ file.fileSaveName }" download="${ file.fileOriName }">
                  <c:out value="${ file.fileOriName }" />
               </a>
                  <span style="color:lightgray">(${ file.fileSize } bytes)</span><br>
               </c:forEach>
               
            </td>
         </tr>
         -->
      </table>
      <br>
      <c:if test="${ sessionScope.loginfo.id eq board.writer }">
         <input type="button" id="modifyBtn" value="수정" />
         <input type="button" id="deleteBtn" value="삭제" />
      </c:if>
      <input type="button" id="backBtn" value="목록" />
   
   </div>
   </section>
   <footer>
      <%-- <%@ include file="/jsp/include/bottom.jsp" %> --%>
   </footer>

</body>
</html>