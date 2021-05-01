<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>


<%
//Date nowTime = new Date();
//SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");







%>
<!DOCTYPE html>


<html>

    <head>
      <meta charset="UTF-8">
        <title>로그인 / 회원가입 폼 템플릿</title>
        <link rel="stylesheet" href="/resources/main/css/style.css">
    </head>
    
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>



	var success= "사용가능한 id입니다.";
	var fail = "이미 존재하는 id입니다."; 
	function loginresult(){
	
	var $mid=$("#inputId").val();
	
	if($mid.length <1){
		
		$("#result").html("<p id='result1' style='color:red'>아이디를 입력해주세요</p>");
		
	}
	else if($mid.length<6 || $mid.length>12){
		$("#result").html("<p id='result1' style='color:red'>6~12자 아이디를 입력해주세요</p>");
	}

	else{
		$.ajax({
			url : "/member/loginresult",
			type : "GET",
			data : {"mid":$mid},
			dataType: "json",
			success : function(data){
				if(data==1){
					$("#result").html("<p id='result1' style='color:blue'>"+success+"</p");
				}  
				else{
					$("#result").html("<p id='result1' style='color:red'>"+fail+"</p");
				}
 	  		
			}      
		 });	
		}
	} 
	
</script>
    
    <body>
        
	<div id="header"></div> 
	
	 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                </div>
        
                <form id="login" class="input-group">
                	
                    <input type="text" class="input-field" name="mid" id="exampleInputId1"  placeholder="아이디 입력" required>
                    <input type="password" name="mpassword" id="exampleInputPassword1" onKeyup="this.value=this.value.replace(/\s/g,'');" class="input-field" placeholder="비밀번호 입력" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button onclick="return loginhome()" type="button" class="submit" id="loginButton">로그인</button>
                </form>
                <form id="register" action="insert" method="post" class="input-group">
                    <input type="text" name="mid"class="input-field" onKeyup="loginresult()" id="inputId" placeholder="아이디 입력" >
                    <label id="result"></label>
					<input type="text" name="mname"class="input-field" id="inputName" placeholder="이름 입력" >
                    <input type="email" name="memail" class="input-field" id="inputEmail" placeholder="이메일 입력" >
                    <input type="password" name="mpassword" onKeyup="this.value=this.value.replace(/\s/g,'');" class="input-field" id="inputPassword" placeholder="비밀번호 입력(6자리 이상)" >
					 <input type="password" name="mpassword1" class="input-field" onKeyup="this.value=this.value.replace(/\s/g,'');" id="inputPassword1" placeholder="비밀번호 확인(6자리 이상)" >
					<input type="text" name="mphone" id="mphone" class="input-field" placeholder="전화번호" > 
					<input type="text" name="mphone1" id="mphone1" class="input-field" placeholder="0000" > 
					<input type="text" name="mphone2" id="mphone2" class="input-field" placeholder="0000" > 
					
					<input type="text" name="mpost"   id="postcode" class="input-field" placeholder="우편 번호"  readonly><button type="button" onclick="sample4_execDaumPostcode()">찾기</button>
					<input type="text" name="maddress" id="address" class="input-field" placeholder="주소"  readonly>
					<input type="text" name="mdetailaddress" id="detailAddress" class="input-field" placeholder="상세 주소" >
				
					<input type="hidden" name="use_yn" id="use_yn" value='Y'>
					<button class="submit" onclick="return addsubmit()"  type="button">회원가입</button> 
                </form> 
            </div>
        </div>
          <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
 function loginhome(){

	 var $mid=$("#exampleInputId1").val();
	 var $mpassword=$("#exampleInputPassword1").val();
	 alert("확인");
 	$.ajax({
   	  url : "/member/login",
      type : "POST",
      data : {"mid":$mid , "mpassword":$mpassword},
 	  dataType: "json",
 	  success : function(data){
 		if(data==1){
 			location.href ='http://localhost:8080/';
 		}  
 		else if(data==2){
 			alert("이메일 인증을 완료하고 로그인하세요");
 		  }
 		else{
 			alert("ID나 비밀번호가 틀립니다.");
 			}
 	  	},  error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
 	 
	});
 }
 
 </script>
        <script>
		 
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
           			
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
		<script>
		
			   function addsubmit(){
			var pw=$("#inputPassword").val();
			var pw1=$("#inputPassword1").val();
			var id=$("#inputId").val();
			var name=$("#inputName").val();
			var phone=$("#mphone").val();
			var phone1=$("#mphone1").val();
			var phone2=$("#mphone2").val();
			var add=$("#address").val();
			var code=$("#postcode").val();
			var detail=$("#detailAddress").val();
			var email=$("#inputEmail").val();
			var $result1 = $("#result1").text();
			var $memail = $("#inputEmail").val();
			var use_yn = $("#use_yn").val();
			var pw1=$("#inputPassword1").val()
		 
			if($result1 == success){
				if(pw&&pw1&&id&&name&&phone&&phone1&&phone2&&add&&detail&&code&&email&&use_yn){
			 
					if(pw==pw1){
						if(pw.length > 5){
						$.ajax({
							url : "/member/emailcheck",
							type : "GET",
							data : {"memail":$memail},
							dataType: "json",
							success : function(data){
							if(data==1){
						  
								$("#register").submit();
							}
					  
							else{
								alert("이메일이 이미존재합니다.");
								}
							}	
				 
							});
						}
						else{
							alert("비밀번호는 6자리 이상 입력해주세요")
						}
					}
					else{
						alert("비밀번호가 일치하지않습니다");
					}
			 
			 
			} else{
				 alert("빈곳이 있는지 확인해주세요");
			 }
		 }
		 else {
			 
			 alert("ID가 중복됩니다");
		 }
  
	  }
		function sample4_execDaumPostcode() {
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
				document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address').value = fullRoadAddr;
				document.getElementById('detailAddress').value = data.jibunAddress;

				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if(data.autoRoadAddress) {
					//예상되는 도로명 주소에 조합형 주소를 추가한다.
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

				} else if(data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

				} else {
					document.getElementById('guide').innerHTML = null;
				}
			}
		}).open();
	}
   
	
	
		</script>
    </body>
</html>