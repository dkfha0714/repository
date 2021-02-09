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

</head>
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
.btn{
      text-decoration: none;
      font-size:2rem;
      color:white;
      padding:10px 20px 10px 20px;
      margin:20px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px 0px rgba(0, 0, 0, 0.44);
      font-family: 'Lobster', cursive;
      margin-left:50%;
    }
    .btn:active{
      transform: translateY(3px);
    }
    .btn.blue{
      background-color: #1f75d9;
      border-bottom:5px solid #165195;
    }
    .btn.blue:active{
      border-bottom:2px solid #165195;
    }
 
</style>


<body>


  <!-- Navigation -->
 <%@include file="/resources/main/header1.jsp"%>
 

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>토론장</h1>
            <span class="subheading">대기방입니다.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
 
 	<div id="content1">
 		
   <c:if test="${chattinglist !=null }">
        	<c:forEach items="${chattinglist}" var="chattinglist">	
     
 		<div id="subcontent1">
 		<a href="/chat/chattingroom?cno=${chattinglist.cno}">
 			<img src="/resources/img/${chattinglist.cimage}" id="imgdiv">
 			<h2>${chattinglist.ctitle}</h2>
 			<p>카테고리:${chattinglist.ccategory}</p>
 			<p>방 생성날짜:${chattinglist.cregdate}</p>
 			</a>
 		</div>
       </c:forEach>
	</c:if> 	
 	</div>
 	<c:if test="${member.mid!=null }">
 	<a href="/chat/addchat" class="btn btn-primary"> 방만들기</a>
	 </c:if>

 

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
