<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<body>
  <%@include file="/resources/main/header1.jsp"%>

   <c:set var="mid" value="${member.mid}" />
   <c:set var="admin" value="${member.admin}" />
  <div id="bg"></div>
    <div id="boardWrapper">
    <input type="hidden" id="adno" value="${adminboard.adno }">
      <h4>공지사항</h4>      <h4>문의사항</h4>
      <table id="boardLists">
        <tbody>
          <!-- 상단 -->
          <thead>
            <tr>
              <td id="boardNum">번호</td>
              <td id="boardTitle">제목</td>
              <td id="boardDate">날짜</td>
            </tr>
          </thead>
          <tr>
            <td>${adminboard.adno}</td>
            <td>${adminboard.atitle}</td>
            <td>${adminboard.aregdate}</td>
          </tr>

        </tbody>
      </table>
      <table>
        <tbody>
          <tr>
            <td class="boardContent">
            <!--  이미지 삽입되는 부분 이미지코드가 내용위로  -->
            <c:if test="${not empty adminboard.apicture }">
          <img id="boardFileImg" name="" value="" src="/resources/img/${adminboard.apicture}" alt="본문이미지"> 
            </c:if>
            
            ${adminboard.acontent}
            
           
            
            </td>
          </tr>
          

        </tbody>
      </table>
      
      <form id='operForm' action="/board/modify" method="get">
         <input type='hidden' id='adno' name='adno' value='<c:out value="${adminboard.adno }"/>'>
         <input type='hidden' id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
         <input type='hidden' id='amount' name='amount' value='<c:out value="${cri.amount }"/>'>
         <input type='hidden' id='type' name='type' value='<c:out value="${cri.type }"/>'>
         <input type='hidden' id='keyword' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      </form>
     
     <!-- 답변달기 누르면 하단에 나오는 글쓰기 폼 -->
      <div id="boardReply">

        <div id="boardReplyWrapper">
   <c:if test="${not empty adcomment}">
          <table class="boardLists">
            <tbody>
              <thead>
                <tr>
                  <td class="boardNum">답변</td>
                </tr>
              </thead>
            </tbody>

          </table>
          

      <form>
            <table>
            <tbody>
              <tr>
                <td class="boardContent">
                            <!--  이미지 삽입되는 부분 이미지코드가 내용위로  -->
                            <c:if test="${not empty adcomment.adpicture }"> 
                           <img id="boardFileImg" name="" value="" src="/resources/img/${adcomment.adpicture}" alt="본문이미지"> 
                         </c:if>
                   안녕하세요 <br>
                   유니커 관리자   ${adcomment.mid} 입니다.<br>
                -----------------------------------------------------------------------------------------<br>   
                  ${adcomment.adcomment} 

                </td>
              </tr>
              
            </tbody>
          </table>
          </form>

      </c:if>
        </div>
      </div>

<c:if test="${empty adcomment && admin=='Y'}">


      <!-- 글쓰기 -->
<div id="boardReply">

        <div id="boardReplyWrapper">
          <table class="boardLists">
            <tbody>
              <thead>
                <tr>
                  <td class="boardNum">답변쓰기</td>
                </tr>
              </thead>
            </tbody>

          </table>
          
       <form action="insertcomment" method="post" id="sendcomment" enctype="multipart/form-data">
 
            <table>
            <tbody>
            
               <!--id="boardInputTextarea"  -->
            
              <tr>
                <td class="boardContent">
                    <input type="hidden" name="adno" value="${adminboard.adno}">
                   <input type="hidden" name="mid" value="${member.mid}">
                              <textarea  class="form-control" id="formTextarea1" name="adcomment" rows="10"></textarea>
                         
                </td>
              </tr>
              
              
          <tr>
         <td>
              <!-- 이미지업로드 리스트 -->
              <div id="fileUploadList">
               <input id="fileUpload" type="file" name="adpicture1" class="btn btn-light" accept="image/*">
 
              <div id="uploadfile" class="custom-file ">
                  <div class="card" id="imgcard">
                    <img class="imgbox" id="imgpreview" src="#" class="card-img-top" alt="이미지 미리보기">
                  </div>
                </div>
                </div>
         </td>
            

          </tr>
              
              

            </tbody>
          </table>
          </form>
          
 

        </div>
      </div>
</c:if>

<!--  버튼  --> 
                
  <c:if test="${empty adcomment && admin=='Y'}"><a type="submit" onclick="sendcomment()" id="boardlistWriteBttn" class="btn btn-primary" >답변하기</a></c:if>
    
 <c:if test="${ adminboard.mid == mid || admin=='Y'}"><a onclick="remove()" id="boardlistWriteBttn" class="btn btn-primary">글삭제</a> </c:if>
 <c:if test="${ adminboard.mid == mid}"><button id="boardlistWriteBttn" data-oper='modify' class="btn btn-secondary">글수정</button> </c:if>
 <button id="boardlistWriteBttn" data-oper='list' class="btn btn-secondary" >목록으로</button>
      <form id='operForm' action="/board/modify" method="get">
         <input type='hidden' id='adno' name='adno' value='<c:out value="${adminboard.adno }"/>'>
         <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
         <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
         <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
         <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
      </form>
 
              


  <!-- boardWrapper -->
  </div>


  <div id="footer"></div>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   var operForm = $("#operForm");
   
   $("button[data-oper='modify']").on("click", function(e){
      operForm.attr("action","/board/modify").submit();
   });
   
   $("button[data-oper='list']").on("click", function(e){
      operForm.find("#adno").remove();
      operForm.attr("action", "/board/list").submit();
   });
   
   
});
function sendcomment(){
   const sendcomment=$("#sendcomment");
   const formTextarea = $('#formTextarea1').val();
   
   if(formTextarea.length < 1){
      alert("내용을 입력해주세요");
   }
   else{
      sendcomment.submit();
   }
   
   
}
function remove(){
   const adno=$("#adno").val();
   if (confirm("정말 삭제하시겠습니까??") == true){    //확인
         
            location.href="/board/remove?adno="+adno;
   }else{   //취소
       alert("삭제 취소");
       return false;
    }
   
}




// 이미지업로드미리보기-썸네일
function readURL(input) {
  if (input.files && input.files[0]) {
    const reader = new FileReader();

    reader.onload = function (e) {
      $('#imgpreview').attr('src', e.target.result);
    };

    reader.readAsDataURL(input.files[0]); // convert to base64 string
  }
}

$('#fileUpload').change(function () {
  readURL(this);
});
</script>
</body>

</html>