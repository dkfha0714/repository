<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
  integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">

<style>

</style>
<script type="text/javascript">
$(document).ready(function(){
   
   var formObj = $("form");
   $('button').on("click", function(e){
      
      e.preventDefault();
      var operation = $(this).data("oper");
      
      console.log(operation);
      
      operation === 'list'
         formObj.attr("action","/board/list").attr("method","get");
         formObj.empty();
         formObj.submit();
   });
});
</script>
<body>
  <%@include file="/resources/main/header1.jsp"%>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<form role="form" action="/board/modify" method="post">

<div class="form-group">
   <label>글번호</label>
   <input class="form-control" name='adno'
      value='<c:out value="${adminboard.adno}"/>' readonly="readonly">
</div>

<div class="form-group">
   <label>제목</label>
   <input class="form-control" name='atitle'
      value='<c:out value="${adminboard.atitle}"/>'>
</div>

<div class="form-group">
   <label>내용</label>
   <textarea class="form-control" rows="3" name='acontent'>
   <c:out value="${adminboard.acontent}"/></textarea>
</div>

<div class="form-group">
   <label>작성자</label>
   <input class="form-control" name='mid'
      value='<c:out value="${adminboard.mid}"/>' readonly="readonly">
</div>

<div class="form-group">
   <label>등록일</label>
   <input class="form-control" name='aregdate'
      value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${adminboard.aregdate }"/>' readonly="readonly">
</div>

<div class="form-group">
   <label>첨부파일</label>
   <input class="form-control" name='apicture'
      value='<c:out value="${adminboard.apicture}"/>'>
</div>

<div class="form-group">
   <label>카테고리</label>
   <input class="form-control" name='acategory'
      value='<c:out value="${adminboard.acategory}"/>' readonly="readonly">
</div>

<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
<button type="submit" data-oper='list' class="btn btn-info">목록</button>

</form>

</body>
</html>