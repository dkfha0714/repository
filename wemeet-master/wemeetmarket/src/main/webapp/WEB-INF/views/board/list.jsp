<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
</head>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
   integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
   crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">
<script>
	
	$(document).ready(function(){
		
		const tr=$("#listtr");
		
		
		 $.ajax({
			 url : "http:127.0.0.1:10000/board/listboard",
			 type : "GET",
			 data : JSON.stringify({acategory:"문의"}),
			 dataType: "json",
			 contentType:'application/json; charset=utf-8',
			 success : function(data){
				 
			 }
		 });
		
		
		
		
		
		
	});

</script>
<style>
</style>

<body>
   <%@include file="/resources/main/header1.jsp"%>
   <div id="bg"></div>
   <div id="boardWrapper">
      <h4>자유게시판</h4>
      <table id="boardLists">
         <tbody>
            <!-- 상단 -->
         <thead>
            <tr>
               <td id="boardNum">번호</td>
               <td id="boardTitle">제목</td>
               <td id="boardWriter">글쓴이</td>
               <td id="boardDate">날짜</td>
            </tr>
         </thead>

         <c:forEach var="list" items="${list}">
            <tr id="listtr">
               <td>${list.adno}</td>
               <td><a href="/board/get?adno=${list.adno}">${list.atitle}</a></td>
               <td>${list.mid}</td>
               <td>${list.aregdate}</td>
            </tr>
         </c:forEach>

         </tbody>
      </table>
      
      <div class='row'>
         <div class="col-lg-12">
            
            <form id='searchForm' action="/board/list" method='get'>
                  <select name='type'>
                    <option value=""
                      <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
                      <option value="T"
                      <c:out value="${pageMaker.cri.type eq'T'?'selected':'' }"/>>제목</option>
                      <option value="C"
                      <c:out value="${pageMaker.cri.type eq'C'?'selected':'' }"/>>내용</option>
                      <option value="W"
                      <c:out value="${pageMaker.cri.type eq'W'?'selected':'' }"/>>작성자</option>
                      <option value="TC"
                      <c:out value="${pageMaker.cri.type eq'TC'?'selected':'' }"/>>제목 or 내용</option>
                      <option value="TW"
                      <c:out value="${pageMaker.cri.type eq'TW'?'selected':'' }"/>>제목 or 작성자</option>
                      <option value="TWC"
                      <c:out value="${pageMaker.cri.type eq'TWC'?'selected':'' }"/>>제목 or 작성자 or 내용 </option>
                    </select>
                       <input type='text' name='keyword'
                         value='<c:out value="${pageMaker.cri.keyword }"/>' />
                       <input type='hidden' name='pageNum'
                         value='<c:out value="${pageMaker.cri.pageNum }"/>' />
                       <input type="hidden" name='amount' 
                          value='<c:out value="${pageMaker.cri.amount }"/>' />
                       <button class='btn btn-default'>검색</button>
                  </form>
         </div>
      </div>
      
      <div class='pull-right'>
         <ul class="pagination">
            <c:if test="${pageMaker.prev }">
               <li class="paginate_button previous"><a
                  href="${pageMaker.startPage -1}">Previous</a></li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage }"
               end="${pageMaker.endPage }">
               <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
                  <a href="${num}">${num}</a>
               </li>
            </c:forEach>

            <c:if test="${pageMaker.next }">
               <li class="paginate_button next"><a
                  href="${pageMaker.endPage +1 }">Next</a></li>
            </c:if>
         </ul>
      </div>
      
      
      <form id='actionForm' action="/board/list" method='get'>
         <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
         <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
         <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
         <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
      </form>
      <a id="boardlistWriteBttn" class="btn btn-primary"
         href="/board/insert" role="button">글작성</a>

   
   </div>
      <!-- <script src="/board/boardlist.js"></script> -->
   <script type="text/javascript">
    $(document).ready(function(){

         var actionForm = $("#actionForm");
         
         $(".paginate_button a").on("click", function(e){
            
            e.preventDefault();
            
            console.log('click');
            
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
         });
         
         var searchForm = $("#searchForm");
         
         $("#searchForm button").on("click", function(e){
            if(!searchForm.find("option:selected").val()){
                alert("검색종류를 선택하세요.");
                return false;
             }
            
            if(!searchForm.find("input[name='keyword']").val()){
               alert("키워드를 입력하세요");
               return false;
            }
            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();
            
            searchForm.submit();
         });
    });
    
  </script>


</body>

</html>