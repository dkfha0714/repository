<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보</title>
 <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
	#change{
		
		margin-left:40%;
	}
	#exit{
		margin-left:1%;
	}
	#subtitle{
		margin-bottom:7%;
		margin-left:1%;
	}
	#button{
		margin-top:7%;
	}
</style>

</head>

<body>
	​
	<div class="dashWrapper">
		<div class="container">


			<form action="update" method="POST" id="minfoWrapper"
				enctype="multipart/form-data">
			 	<input name="mno" type="hidden" value="${member.mno }"> 
				<fieldset id="memberinfo">

					<div id="subtitle">
						<h3>회원정보</h3>
					</div>
				<ul>

					<li><label for="a" class="title">이름</label> <input
						class="form-control" id="inputName" value="${member.mname}"
						readonly></li>
					<li><label for="a" class="title">아이디</label> <input
						class="form-control" name="mid" id="inputID" value="${member.mid}"
						readonly></li>
					<li><label for="a" class="title">현재 비밀번호</label> <input
						type="password" onKeyup="this.value=this.value.replace(/\s/g,'');"
						class="form-control" id="inputPW" value="${member.mpassword }"
						readonly></li>
					<li><label for="a" class="title">변경 비밀번호</label> <input
						type="password" class="form-control"
						onKeyup="this.value=this.value.replace(/\s/g,'');"
						name="mpassword" id="inputPW1" value=""></li>
					<li><label for="a" class="title">변경 비밀번호확인</label> <input
						type="password" class="form-control"
						onKeyup="this.value=this.value.replace(/\s/g,'');"
						name="mpassword1" id="inputPW2" value=""></li>
					<li><label for="inputPhone">전화번호</label> 
					<input name="mphone" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" id="mphone" maxlength="3"
						placeholder="010" value="${member.mphone }"> 
					<input name="mphone1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" id="mphone1" maxlength="4"
						placeholder="0000" value=${member.mphone1 }> 
					<input name="mphone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" id="mphone2" maxlength="4"
						placeholder="0000" value="${member.mphone2 }"></li>
					<li><label for="a" class="title">이메일</label> <input
						type="email" class="form-control" name="memail" id="inputEmail"
						value="${member.memail}" readonly="readonly"></li>

					<li><label for="inputAddress" class="title1">주소</label> <input
						class="form-control  col-md-3" name="mpost" type="text"
						id="postcode" value="${member.mpost}" readonly>
						<button type="button" onclick="sample4_execDaumPostcode()"
							value="" class="btn btn-primary">우편번호 찾기</button>
						<br> <label class="title1"></label> <input
						class="form-control" type="text" name="maddress" id="address"
						placeholder="주소" value="${member.maddress}" readonly><br>
						<label class="title1"></label> <input class="form-control"
						type="text" name="mdetailaddress" id="detailAddress"
						placeholder="상세주소" value="${member.mdetailaddress}"></li>
				</ul>			
				</fieldset>
			</form>
			<div id="button">
			<div style="display:inline-block" id="change">
			<button type="button" id="submit" onclick="return updateMember()"
				class="btn btn-primary">회원변경</button>
			</div>
			<div style="display:inline-block" id="subtitle" class="member">
			<button type="button" id="" onclick="return deleteMember()"
				class="btn btn-primary">회원탈퇴</button>
			</div>
			
			<div style="display:inline-block" id="exit">
			<a href="/" class="btn btn-primary">나가기</a>
			</div>
			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/resources/js/clean-blog.min.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function deleteMember(){
		$mid=$("#inputID").val();
		$mpassword = $("#inputPW").val();
		$.ajax({
		   	  url : "/member/login",
		      type : "POST",
		      data : {"mid":$mid , "mpassword":$mpassword},
		 	  dataType: "json",
		 	  success : function(data){
		 		 if(data==0){
		 			alert("비밀번호가 틀립니다");
		 		 }else{
		 			if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		 				$.ajax({
		 				   	  url : "/member/deletemember",
		 				      type : "POST",
		 				      data : {"mid":$mid , "mpassword":$mpassword},
		 				 	  dataType: "json",
		 				 	  success : function(data){ 	  
		 				 	  alert("삭제되었습니다")
		 				 	  location.href="/";
		 				 	}
		 				  });
		 			 }else{   //취소
		 			     return false;
		 			 }		 			 		 			 
		 		 }	 		  
		 	  }
		   });		
	}
	</script>


	<script>
		// 이미지업로드미리보기-썸네일
		function readURL(input) {
			if (input.files && input.files[0]) {
				const reader = new FileReader();

				reader.onload = function(e) {
					$('#profileImg').attr('src', e.target.result);
				};

				reader.readAsDataURL(input.files[0]); // convert to base64 string
			}
		}

		$('#ex_file').change(function() {
			readURL(this);
		});
	</script>

	<script>
		/* function onlyNumber() {
		 const data = $('#inputPhone1','#inputPhone2','#inputPhone3').val();
		 data.replace(/[^0-9]/g,'');
		
		 } */

		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('address').value = fullRoadAddr;
							document.getElementById('detailAddress').value = data.jibunAddress;

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';

							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();

		}
	</script>

	<script>
		function updateMember() {
			var mpassword = $("#inputPW1").val();
			var mpassword2 = $("#inputPW2").val();
			var mphone = $('#mphone').val();
			var mphone1 = $('#mphone1').val();
			var form = $("#minfoWrapper");
			var mphone2 = $('#mphone2').val();
			
			if (mpassword && mpassword2 && mphone && mphone1 && mphone2) {
				form.submit();
					
			}else{
				
				alert("빈칸을 확인해주세요");
			}
		}
		
	</script>


</body>

</html>