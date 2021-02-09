<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>

<script>
	$(document).ready(function(){
	
	
		
	function readURL(input) {
		 if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  
		  reader.onload = function (e) {
		   $('#image_section').attr('src', e.target.result);  
		  }
		  
		  reader.readAsDataURL(input.files[0]);
		  }
		}
		  
		$("#imgInput").change(function(){
		   readURL(this);
	});
		

		$("#addchat").on("click",function(){
		
			addchat();
		});
		
	});
	

	function addchat(){
		var title=$("#ctitle").val();
		var category=$("#ccategory").val();
		var addpost=$("#addpost");
		if(title.length < 1){
			alert("방제목을 입력해주세요");
		}
		else{
			
			if(category.length < 1){
				alert("카테고리를 선택해주세요");
			}
			else{
				
				addpost.submit();
				
			}	
		}
	}	
	

	
</script>


<style>
#Loadpage{
width:100%;
height:auto;
}
#message{

    width: 50%;
    height: auto;
}
ul{
	 list-style-type:none;
}

.mx-auto{
	margin-top:200px;
}

#chatarea{
    width: 100%;
    y: inline-block;
    border: 1px solid black;
    height: 500px;
    overflow:auto;
    scroll:auto;
    	
    
}

#content1{
align:center;
	margin-left:10%;
	border:1px solid black;
	height:1600px;
	width:80%;
	overflow:auto;
}


#subcontent1{
	align:center;
	height:200px;

	width:50%;

	 float:left;
}

#imgdiv{
align:center;
	width:400px;
	height:200px;
	float:left;
}

#addpost{
	margin-left:30%;
	
	margin-top : 30px;
}

#ctitle{
	width:50%;
	
}

#addchat{
margin-left:28%;
}

#image_section{
	
	position:relative;
	width: 800px;
	height:600px;
	
}
#imgInput{
	
	
	position:relative;
	
}

#imagebox{
	
	width: 800px;
	height:600px;
}


</style>


<body>


<script>

</script>


  <!-- Navigation -->
  <%@include file="/resources/main/header1.jsp"%>
 
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>채팅방 만들기</h1>
            <span class="subheading">토론주제를 정하는 채팅방</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
 <!-- action="addchat" method="post" -->
 <form id="addpost" action="addchat" method="post" enctype="multipart/form-data">
 	
 	<input type="hidden" name="mid" value="${member.mid}">
 	<p>방 제목 : <input id="ctitle" name="ctitle"> 
 	
 	
	<select name="ccategory" id="ccategory">
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
 	</p>
	<div>
	<p>썸네일 :
  	 <input type='file' name="cimage1" id="imgInput"/> <br>
  	 </p>
  	 <div id="imagebox">
  	 <img id="image_section" src="#" alt="your image"/><br>
	 </div>
	</div>
	
 	<button id="addchat" type="button" class="btn btn-primary">만들기</button>
 </form>
 	
 
 
 
 
 
 
 

  <!-- Footer -->
  <footer id="footer">
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
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="/resources/js/jqBootstrapValidation.js"></script>
  <script src="/resources/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/clean-blog.min.js"></script>
	

</body>

</html>
