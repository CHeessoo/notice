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
	fnList();
  })
  
  function fnModify(){
    var modifyResult = '${modifyResult}';
    if(modifyResult !== ''){
  	  if(modifyResult === '1'){
  	    alert('공지사항이 수정되었습니다.');
   	  } else {
  	    alert('공지사항 수정이 실패했습니다.');
  	  }
    }
  }
  
  function fnList(){
	$('#btn_list').click(function(){
	  location.href = "${contextPath}/notice/list.do";
	})
  }
  
  function fnBack(){
	$('#btn_back').click(function(){
	   history.back(-1);
	})
  }
  
  
</script>
<style>
  #btn_back {
    border: none;
    background-color: transparent;
  }
</style>
</head>
<body>

  <div>
    <div>
      <button type="button" id="btn_back"> ← 뒤로가기 </button>
    </div>
    <h1>공지사항 편집하기</h1>
    <form method="post" action="${contextPath}/notice/modify.do" >
      <div>
        <label for="gubun">구분</label>
        <select id="gubun" name="gubun">
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
      <div>
        <textarea name="content" id="content" rows="5" cols="30" ></textarea>        
      </div>
      <hr>
      <div>
        <input type="hidden" name="notice_no" value="${notice.notice_no}">
        <button type="submit" >편집완료</button>
        <button type="button" id="btn_list">목록</button>
      </div>
    </form>
  </div>


</body>
</html>