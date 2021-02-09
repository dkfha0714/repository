<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Clean Blog - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="/resources/css/clean-blog.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

</head>
<style>
#Loadpage {
	width: 100%;
	height: auto;
}

#message {
	overflow: hidden;
	width: 50%;
	height: auto;
}

ul {
	list-style-type: none;
}

#content {
	overflow: auto;
	scrolle: auto;
}

#chatarea1 {
	
}

#chatarea {
	width: 100%;
	y: inline-block;
	border: 1px solid black;
	height: 500px;
	overflow: auto;
}

#userlist {
	margin-top: 45px;
	width: 200px;
	height: 500px;
	overflow: auto;
	float: right;
	border: 1px solid black;
}
#userjoin{
	margin-left:91%;
	margin-top:40px;
}
</style>


<body>
	<script>

    
    function duck(socket,id,room1,rCheck) 
	{ 
	if (!rCheck) { 
	
		socket.emit('message', {
			status:1,
            name: id,
            message: "님이 접속하셨습니다",
            room:room1
        });
		
		} 	
	return true;
		
		
	}
    $(document).ready(function($){
    var userlist=new Set();
	/* $("#loadpage").load("/resources/main/HTMLPage.html"); */
	var userarray=new Array();
    var rCheck = false;			// 최초 입장 체크
    
	const memberlist=new Set();  // 방장의 유저리스트 수집

	var usergroup =""; 			// 유저 정보 담을 문자열
	
	const mid=$("#mid").val();
	const chatid=$("#cahtid").val();
	const room = $("#cno").val();
    
	var socket = io.connect("http://127.0.0.1:52273/");
	 
	
	// 변수를 선언합니다.
	socket.emit('join',{ 
        name:mid, 
        room:room
    }); 
	
	if(mid!=null){	
	  rCheck=duck(socket,mid,room,rCheck);
	} 

	// 이벤트를 연결합니다.
    socket.on('message', function (data) {
        // 추가할 문자열을 만듭니다.
         if(data.status==1){
        	var output = '';
        	output += '<li>';
        	output += '    <p id="name"> <strong>' + data.name +"</strong>"+ data.message + '</p>';
        	output += '</li>';
        	$('#chatcontent').append(output);
        	$('#chatcontent').scrollTop($('#chatcontent').prop('scrollHeight'));
    		
        	if(mid==chatid){
        		memberlist.add(data.name);
        		console.log(memberlist);
        		
        		for ( let item of memberlist ) {
        			usergroup += item+",";
                }

        		socket.emit('userlist',{
        			userlist:usergroup,
        			room:room
        		});
        		usergroup="";
        	}
        }        
        else if(data.status==2){	
        	rCheck = false;
         }
        else if(data.status==3){
        	
        	var output = '';
        	output += '<li>';
        	output += '    <p id="name">'+ data.message + '</p>';
        	output += '</li>';
        	$('#chatcontent').append(output);
        	$('#chatcontent').scrollTop($('#chatcontent').prop('scrollHeight'));
        
        	
        }
        else if(data.status==4){
        	var output = '';
        	output += '<li>';
        	output += '    <p id="name"><strong>'+data.name+"</strong>" + data.message + '</p>';
        	output += '</li>';
        	$('#chatcontent').append(output);
        	$('#chatcontent').scrollTop($('#chatcontent').prop('scrollHeight'));

        	
        	if(mid==chatid){
        		memberlist.delete(data.name);
        		
        		for ( let item of memberlist ) {
        			usergroup += item+",";
                }

        		socket.emit('userlist',{
        			userlist:usergroup,
        			room:room
        		});
        		usergroup="";
        	}
        
            var uselist = '';
            var userreset='';
            for(var i=0; i<userarray.length; i++){
            	if(userarray[i]==data.name){
            	
            	}
            	else{
           		 uselist += '<p>'+ userarray[i] + '</p>';
           		 userreset+=userarray[i]+",";
            	}
		      }
            userarray=userreset.split(',');
            userreset='';
            usergroup="";
            $('#userlist').html(uselist);
        	
        	
        }
        else{
        	var output = '';
        	output += '<li>';
        	output += '    <p id="name">' + data.name + ' : '+ data.message + '</p>';
        	output += '</li>';

        	// 문서 객체를 추가합니다.
        	$('#chatcontent').append(output);
        	$('#chatcontent').scrollTop($('#chatcontent').prop('scrollHeight'));
        }
      

        
    });
	
	
    socket.on('userstatus',function(data){
     /*     memberlist=data; */
     	    console.log(data);
      		userarray=data.split(',');
     	
             var uselist = '';
             for(var i=0; i<userarray.length; i++){
            	 uselist += '<p>'+ userarray[i] + '</p>';

 		      }
             $('#userlist').html(uselist);
      });
    
	
    // 버튼을 클릭할 때
    $('#btnchat').click(function () {
        socket.emit('message', {
        	status:0, 
            name: mid,
            message: $('#message').val(),
            room:room
            
            
        });
        $("#message").val('');
    });

    $("#message").keypress(function (e) {
        if (e.which == 13){
        	if($(this).val().length < 1){
        		
        		return;
        	}
        	else{
        	socket.emit('message', {
         		status:0, 
                name: mid,
                message: $('#message').val(),
                room:room
           	 });
        	$("#message").val('');
        	}
        }
    });
});
	
    

    
    
</script>
	


	<script src="http://127.0.0.1:52273/socket.io/socket.io.js"></script>

<script type="text/javascript">
function confirmz(){


	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href="/chat/delete?cno=${chatting.cno }";
		alert("삭제 되었습니다")
		
	}else {
		alert("삭제가 취소되었습니다")
	}
	
}


</script>






	<!-- Navigation -->
	<%@include file="/resources/main/header1.jsp"%>


	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('img/contact-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>토론장</h1>
						<span class="subheading">상품에 대한 의견을 말해주세요 !</span>
					</div>
				</div>
			</div>
		</div>
	</header>



	<!-- Main Content -->
	<div id="userjoin">접속자</div>
	<div id="userlist"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<h2>${chatting.ctitle}</h2>
				<input type="hidden" id="mid" value="${member.mid}"> <input
					type="hidden" id="chatid" value="${chatting.mid}"> <input
					type="hidden" id="cno" value="${chatting.cno}">


				<div data-role="page" id="chatpage">
					<div data-role="content" id="chatarea">

						<ul id="chatcontent" data-role="listview" data-inset="true">

						</ul>

					</div>

					<c:if test="${member.mid!=null}">
						<input type="text" id="message" />
						<button id="btnchat" class="btn btn-primary">전송</button>
					</c:if>
					<c:if test="${member.mid!=null}">
					<a class="btn btn-primary" href="/chat/waitingroom">나가기</a>
					</c:if>
					<c:if test="${member.mid!=null && chatting.cno!=null}">
					<input type="button" value="방삭제" onclick="javascript:confirmz();" class="btn btn-primary" >
					</c:if>
					<c:if test="${member.mid==null }">
						<p>로그인 후 이용해주세요</p>
					</c:if>
				</div>


			</div>
		</div>
	</div>

	<hr>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<ul class="list-inline text-center">
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<p class="copyright text-muted">Copyright &copy; Your Website
						2019</p>
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
