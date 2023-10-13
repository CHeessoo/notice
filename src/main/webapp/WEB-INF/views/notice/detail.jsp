<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
  
  $(function(){
	fnModify();  
	fnDelete();
	fnList();
  })
  
  function fnModify(){
	$('#btn_modify').click(function(){
	  location.href = '${contextPath}/notice/modifyDetail.do';  
    })
  }
  
  function fnDelete(){
	$('#btn_delete').click(function(){
	  if(confirm('공지사항을 삭제할까요?')){
		$('#frm_modify').attr('action', '${contextPath}/notice/delete.do');
		alert('공지사항이 삭제되었습니다.');
		$('#frm_modify').submit();
	  }
	})
  }
  
  function fnList(){
	$('#btn_list').click(function(){
	  location.href = '${contextPath}/notice/list.do';
	})
  }
  
</script>
</head>
<body>

  <div>
    <form action="#" method="post" id="frm_modify">
      <h1>${notice.notice_no}번 공지사항</h1>
      <div>구분 : 
        <c:choose>
          <c:when test="${notice.gubun==1}">긴급</c:when>
          <c:when test="${notice.gubun==2}">일반</c:when>
        </c:choose>
       </div>
      <div>제목 : ${notice.title}</div>
      <div>${notice.content}</div>
    
      <hr>
    
      <input type="hidden" id="notice_no" name="notice_no" value="${notice.notice_no}">
      <button type="button" id="btn_modify">편집</button>
      <button type="button" id="btn_delete">삭제</button>
      <button type="button" id="btn_list">목록</button>  
    </form>
  </div>
  
</body>
</html>