<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Clean Blog - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="/resources/css/clean-blog.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
  
  <style>
  	 #writer, #regdate{
  	 width:180px;
  	 }
  
  	 #sellbutton{
  	 	text-align:center;
  	 	border: 1px solid black;
  	 	display:inline-block;
  	 	width: 50px;
  	 }
  	 #boardlistWriteBttn {
    	margin-top: 30px;
    	float: right;
    	padding: 10px;
    	width: 200px;
	}
	#thumb{
		width:200px;
		
	}
	
  </style>
</head>
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
   		
   		$(".move").on("click", function(e){
   	   		e.preventDefault();
   	   			actionForm.append("<input type='hidden' name='adno' value='"+
   	   		$(this).attr("href")+"'>");
   	   			actionForm.attr("action","/member/acinfoDetail");
   	   			actionForm.submit();
   			

   		});
 	});

  </script>

<body>
	
        <form id='actionForm' action="acinfoDetail" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
			<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
		</form>
  <!-- Navigation -->
  <%@include file="/resources/main/header1.jsp"%>
 
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/resources/img/post-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="post-heading" style="text-align: center;">
            <h1>회원정보</h1>
        
          </div>
        </div>
      </div>
    </div>
  </header>


  <!-- Post Content -->
	<div class="container">
       <div>
           
           <table class="table table-striped table-bordered table-hover"  id="f2">
               <thead>
                  <tr>
                    
                     <th id=thumb style="text-align: center;">이름</th>
                     <th id=c style="text-align: center;">아이디</th>
                     <th id=writer style="text-align: center;">핸드폰번호</th>
                     <th id=money style="text-align: center;">주소</th>
                     <th></th>
                  </tr>
               </thead>
               
            	<c:forEach var="acin" items="${acin }">
            		<c:if test="${acin.ADMIN == 'N' }">
               		<tr>
              			<th>${acin.MNAME }</th>
              			<th>${acin.MID }</th>
              			<th>${acin.MPHONE}</th>
              			<th>${acin.MADDRESS }</th>
               			<th><a class='move' id="adno" href='<c:out value="${acin.ADNO }"/>' >상세보기</a></th>
               			
               		</tr>	
               		</c:if>
				</c:forEach>
            </table>
            <div class='pull-right'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
					<a id="sellbutton" href="${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next }">
					<li class="paginate_button next"><a
					href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>
			</ul>
		</div>
            
            
            
            
            
		</div>
		
		<form id='actionForm' action="acinfo" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
			<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
		</form>
     </div>
  <hr>
  <!-- Footer -->
  <footer>
    <div class="container">

      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
          </ul>
          <p class="copyright text-muted">Copyright &copy; Your Website 2019</p>
        </div>
      </div>
    </div>

		<!-- <script src="/board/boardlist.js"></script> -->
	<script type="text/javascript">
 	$(document).ready(function(){
 		
 		
 		console.log('${acin}');

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
  </footer>


  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/clean-blog.min.js"></script>

</body>

</html>