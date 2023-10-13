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
	fnBack();
  })
  
  function fnModify(){
	var modifyResult = '${modifyResult}';
	if(modifyResult !== ''){
	  if(modifyResult === '1'){
		$('#frm_modify').attr('action', '${contextPath}/notice/modify.do'); 
		alert('공지사항이 수정되었습니다.');
		$('#frm_modify').submit();
	  } else {
		alert('공지사항 수정이 실패했습니다.');
	  }
	}
  }
  
  function fnBack(){
	$('#btn_back').click(function(){
	   history.back(-1);
	})
  }
  

</script>
<style>
  .btn_back {
    border: none;
    background-color: none;
  }
</style>
</head>
<body>

  <div>
    <div>
      <button type="button" id="btn_back"> ← 뒤로가기 </button>
    </div>
    <h1>${notice.notice_no}번 공지사항</h1>
    <form method="post" action="${contextPath}/notice/modify.do" id="frm_modify">
      <div>
        <label for="gubun">구분</label>
        <select id="gubun" name="gubun" value="${notice.gubun}">
          <option value="1">긴급</option>
          <option value="2">일반</option>
        </select>
      </div>
      <div>
        <label for="title">제목</label>
        <input type="text" id="title" name="title" value="${notice.title}">
      </div>
      <div>
        <label for="content">내용</label>
      </div>
      <div id="content">
        <textarea name="content" rows="5" cols="30" value="${notice.content}"></textarea>        
      </div>
      <div>
        <button type="submit">편집완료</button>
        <button type="button" id="btn_list">목록</button>
      </div>
    </form>
  </div>


</body>
</html>