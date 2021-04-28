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
			 	<input name="mno" type="hidden" value="${acinfo.mno }"> 
				<fieldset id="acinfoinfo">

					<div id="subtitle">
						<h3>회원정보</h3>
					</div>
				<ul>

					<li><label for="a" class="title">이름</label> <input
						class="form-control" id="inputName" value="${acinfo.mname}"
						readonly></li>
					<li><label for="a" class="title">아이디</label> <input
						class="form-control" name="mid" id="inputID" value="${acinfo.mid}"
						readonly></li>
					<li><label for="a" class="title">현재 비밀번호</label> <input
						type="password" onKeyup="this.value=this.value.replace(/\s/g,'');"
						class="form-control" id="inputPW" value="${acinfo.mpassword }"
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
					<input name="mphone" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" id="inputPhone1" maxlength="3"
						placeholder="010" value="${acinfo.mphone }"> 
					<input name="mphone1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" id="inputPhone2" maxlength="4"
						placeholder="0000" value=${acinfo.mphone1 }> 
					<input name="mphone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" id="inputPhone3" maxlength="4"
						placeholder="0000" value="${acinfo.mphone2 }"></li>
					<li><label for="a" class="title">이메일</label> <input
						type="email" class="form-control" name="memail" id="inputEmail"
						value="${acinfo.memail}" readonly="readonly"></li>

					<li><label for="inputAddress" class="title1">주소</label> <input
						class="form-control  col-md-3" name="mpost" type="text"
						id="postcode" value="${acinfo.mpost}" readonly>
						<button type="button" onclick="sample4_execDaumPostcode()"
							value="" class="btn btn-primary">우편번호 찾기</button>
						<br> <label class="title1"></label> <input
						class="form-control" type="text" name="maddress" id="address"
						placeholder="주소" value="${acinfo.maddress}" readonly><br>
						<label class="title1"></label> <input class="form-control"
						type="text" name="mdetailaddress" id="detailAddress"
						placeholder="상세주소" value="${acinfo.mdetailaddress}"></li>
				</ul>			
				</fieldset>
			</form>
			<div id="button">
			<div style="display:inline-block" id="change">
			<button type="button" id="submit" onclick="return updateMember()"
				class="btn btn-primary">회원변경</button>
			</div>
			<div style="display:inline-block" id="subtitle" class="acinfo">
			<button type="button" id="" onclick="return deleteacinfo()"
				class="btn btn-primary">회원추방</button>
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
	function deleteacinfo(){
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
		function updateMember() {
			var mpassword = $("#inputPW1").val();
			var mpassword2 = $("#inputPW2").val();
			var mphone = $('#inputPhone1').val();
			var mphone1 = $('#inputPhone2').val();
			var form = $("#minfoWrapper");
			var mphone2 = $('#inputPhone3').val();
			if (mpassword && mpassword2 && mphone && mphone1 && mphone2) {
				form.submit();
					
			}else{
				
				alert("빈칸을 확인해주세요");
			}
		}
		
	</script>
	


</body>

</html>