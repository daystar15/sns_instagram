<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="wrap">
    <div class="w-50 m-auto p-5">
        <h1 class="font-weight-bold mb-4">회원 가입</h1>
        <form method="post" id="formAction" action="/user/sign_up">
        	<div class="form-group">
	            <label for="loginId" class="font-weight-bold">ID</label>
	            <div class="idBox d-flex">
	                <input type="text" name="loginId" id="loginId" class="form-control" placeholder="ID를 입력해주세요">
	                <button type="button" id="loginIdCheckBtn" class="btn btn-primary ml-2">중복확인</button>
	            </div>
	            <div class="pl-2">
	            	<div id="idLength" class="text-danger d-none">4글자 이상 입력해주세요.</div>
	                <div id="usedId" class="text-danger d-none ">사용중인 아이디입니다.</div>
	                <div id="usefulId" class="text-success d-none">사용가능한 아이디입니다.</div>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="password" class="font-weight-bold">password</label>
	            <input type="password" name="password" id="password" class="form-control" placeholder="Password">
	        </div>
	        <div class="form-group">
	            <label for="confirmPassword" class="font-weight-bold">conform password</label>
	            <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="confirm password">
	        </div>
	        <div class="form-group">
	            <label for="name" class="font-weight-bold">이름</label>
	            <input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력해주세요">
	        </div>
	        <div class="form-group">
	            <label for="email" class="font-weight-bold">이메일</label>
	            <input type="text" name="email" id="email" class="form-control" placeholder="이메일을 입력해주세요">
	        </div>
	        <div class="form-group d-flex justify-content-end">
	            <input type="submit" value="가입하기" class="btn btn-primary">
	        </div>
        </form>
    </div>
</div>

<script>
	$(document).ready(function() {
		$("#loginIdCheckBtn").on("click", function() {
			// 초기화
			$("#idLength").addClass("d-none");
			$("#usedId").addClass("d-none");
			$("#usefulId").addClass("d-none");
			
			let loginId = $("#loginId").val().trim();
			
			if(loginId.length < 4) {
				$("#idLength").removeClass("d-none");
				return;
			}
			
			// AJAX 통신 - 중복확인
			$.ajax({
				//request
				url: "/user/is_duplicated_id"
				, data: {"loginId":loginId}
			
				// response
				, success:function(data) {
					if (data.code == 1) {
						// 성공
						if (data.result) {
							// 중복
							$("#usedId").removeClass("d-none");
						} else {
							// 사용가능
							$("#usefulId").removeClass("d-none");
						}
					} else {
						// 실패
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("중복확인에 실패했습니다.");
				}
			});
			
		});
		
		$("#formAction").on('submit', function(e) {
			e.preventDefault();
			
			// validation check
			let loginId = $("#loginId").val().trim();
			if (loginId.length == '') {
				alert('아이디를 입력해주세요');
				return false;
			}
			
			let password = $("#password").val().trim();
			let confirmPassword = $("#confirmPassword").val().trim();
			if (password.length == '' || confirmPassword.length == '') {
				alert('비밀번호를 입력해주세요');
				return false;
			}
			
			if (password != confirmPassword) {
				alert('비밀번호가 다릅니다.');
				return false;
			}
			
			let name = $("#name").val().trim();
			if (name.length == '') {
				alert('이름을 입력해주세요');
				return false;
			}
			
			let email = $("#email").val().trim();
			if (email.length == '') {
				alert('이메일을 입력해주세요');
				return false;
			}
			
			if ($("#usefulId").hasClass("d-none")) {
				alert("아이디 중복확인을 해주세요.")
				return false;
			}
			
			// AJAX - 서버 보내기
			let url = $(this).attr('action');
			let params = $(this).serialize();

			$.post(url, params) // request
			.done(function(data) {
				// response
				if (data.code == 1) {
					// 성공
					alert("가입을 환영합니다! 로그인 해주세요.");
					location.href="/user/sign_in_view";
				} else {
					// 실패
					alert(data.errorMessage);
				}
				
			});
			
		});
		
		
	})
</script>
    