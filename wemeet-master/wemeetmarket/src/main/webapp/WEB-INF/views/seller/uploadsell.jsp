<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>판매 게시판</title>

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


</head>
<script>
	$(document).ready(function(){
		  $("#imgInput1").on('change', function(){
       	  	
			  var ext = $('#imgInput1').val().split('.').pop().toLowerCase();
			  
			  
			  if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
			      $('#imgInput1').val("");
			      alert('이미지파일을 올려주세요 gif/png/jpg/jpeg');
			  }else{
		  
			  readURL1(this);
			  }
    	  });
		  
		  $("#imgInput2").on('change', function(){
			  var ext = $('#imgInput2').val().split('.').pop().toLowerCase();
			  if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
				  $('#imgInput2').val("");
				  alert('이미지파일을 올려주세요 gif/png/jpg/jpeg');
			  }
			  else{
			  	readURL2(this);
			  }
	      });
			  
		
  	});
  	
 	function readURL1(input) {
   	   if (input.files && input.files[0]) {
   	      var reader = new FileReader();
   	      reader.onload = function (e) {
   	         $('#image_section1').attr('src', e.target.result);
   		      }
    	     reader.readAsDataURL(input.files[0]);
      	}
   	   else{
   		   alert("이미지 파일을 올려주세요");
   		   $("#imgInput1").val()=null;
   	   }
   	   
 	}
 

 	function readURL2(input) {
   	   if (input.files && input.files[0]) {
   	      var reader = new FileReader();
   	      reader.onload = function (e) {
   	         $('#image_section2').attr('src', e.target.result);
   		      }
    	     reader.readAsDataURL(input.files[0]);
      	}
   		else{
		   alert("이미지 파일을 올려주세요");
		   $("#imgInput2").val()=null;
	   }
 	}
 	
	


</script>


<style>
#sname{
  width:85%;
}
#scontent{
 width:100%;
  resize: none; 
 
}
 #imagebox{
	
	width: 800px;
	height:600px;
	 border:1px solid black;
}
#image_section1,#image_section2{
	
	position:relative;
	width: 800px;
	height:600px;
	
	
}
#tname{
 width:100%;
}


#sphone,#smoney,#saddress{
width:100%;
}

#submitbtn{

width:8%;
margin-top : 5%;
margin-left: 93%;

}
</style>

<body>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
  <!-- Navigation -->
  <%@include file="/resources/main/header1.jsp"%>
 
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/resources/img/about-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>Sell</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->

  <div class="container">
  	<form action="upload" method="post" id="addform" enctype="multipart/form-data">
  	<input name="mid" type="hidden" value=${member.mid }>
    <div id="tname">판매글 제목  </div> <input id="sname" name="sname"> 
 	
	<select name="scategory" id="scategory">
    	<option value="">카테고리</option>
   		 <option value="가전제품">가전제품</option>
  	 	 <option value="전자">전자</option>
  	 	 <option value="식료품">식료품</option>
  	 	 <option value="반려동물">반려동물</option>
  	 	 <option value="중고차">중고차</option>
  	 	 <option value="유아/장난감">유아/장난감</option>
  	 	 <option value="레저/여행">레저/여행</option>
  	 	 <option value="기타">기타</option>
	</select>
 	
 	<p></p>
 	<div id="tname"> 상품 설명 </div>
 	 <textarea id="scontent" name="scontent" rows="8"></textarea>
 	
 	 <p></p>  
 	 <div id="tname"> 썸네일 <br>
 	  <input type='file' name="sthumb1" id="imgInput1"/> </div>
 	 <div id="imagebox">
  	 <img id="image_section1" src="#" alt="your image"/>
	 </div> 	
 	 <p></p>  
 	 <div id="tname"> 상품 이미지  <br>
 	  <input type='file' name="simage1" id="imgInput2"/> </div>
 	 <div id="imagebox">
  	 <img id="image_section2" src="#" alt="your image"/>
	 </div> 	
	 <p></p>
	 <div id="tname"> 연락가능한 전화번호  </div>
 	 <input id="sphone" name="sphone" />
 	 <p></p>
 	 <div id="tname"> 판매 가격 </div>
 	 <input id="smoney" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="smoney" />

 	 <div id="tname"> 거래 위치 <button type="button" onclick="execPostCode()">찾기</button> </div>
 	  <input id="saddress" name="saddress" readonly />
 	 </form>
 	  <button type="button" id="submitbtn" onclick="return submitform()" class="btn btn-primary">등록</button>	 	   
 	 
 	 
  </div>


  <hr>

  <!-- Footer -->
  <footer>

    <div class="container">
        <a href="#" id="top">TOP</a>
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

  </footer>











<!-- <form action="upload" method="post" id="uploadForm" enctype="multipart/form-data"> -->
 











  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/clean-blog.min.js"></script>
  
  <script>
  
  	function submitform(){
  	var sname=$("#sname").val();
  	var scontent=$("#scontent").val();
  	var sphone=$("#sphone").val();
  	var smoney=$("#smoney").val();
  	var saddress=$("#saddress").val();
  	var form=$("#addform");
  	var scategory=$("#scategory").val();
  	if(sname&&scontent&&sphone&&smoney&&saddress&&scategory){
  		
  		form.submit();
  		
  	}
  	else{
  		alert("빈칸을 확인해주세요(썸네일/이미지 제외)");
  		
  	}
  		
  	}
  
  
  </script>
  
  

  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                  <script>

                  //우편번호 찾기 버튼 클릭시 발생 이벤트

                  function execPostCode() {
                     new daum.Postcode({
                        oncomplete: function(data) {
                           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                              extraRoadAddr += data.bname;
                           }
                           // 건물명이 있고, 공동주택일 경우 추가한다.
                           if(data.buildingName !== '' && data.apartment === 'Y'){
                              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                           }
                           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                           if(extraRoadAddr !== ''){
                              extraRoadAddr = ' (' + extraRoadAddr + ')';
                           }

                           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                           if(fullRoadAddr !== ''){
                              fullRoadAddr += extraRoadAddr;
                           }
                           // 우편번호와 주소 정보를 해당 필드에 넣는다.
                           console.log(data.zonecode);
                           console.log(fullRoadAddr);
                           /* var a = console.log(data.zonecode);
                           var b = console.log(fullRoadAddr);
                           if(a == null || b = null){
                              alert("주소를 확인하세요.");
                              return false;
                           } */
                           $("[name=oaddress]").val(data.zonecode);
                           $("[name=address]").val(fullRoadAddr);
                       
                           document.getElementById('saddress').value = fullRoadAddr;
                        }
                     }).open();
                  }

                  </script> 
  
  
</body>

</html>