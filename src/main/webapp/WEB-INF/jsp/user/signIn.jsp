<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="wrap">
    <div class="w-50 m-auto p-5">
        <h1 class="font-weight-bold mb-4">로그인</h1>
        <form id="loginForm" method="post" action="/user/sign_in">
        	<div class="form-group">
	            <input type="text" name="loginId" id="loginId" placeholder="Username" class="form-control">
	        </div>
	        <div class="form-group">
	            <input type="password" name="password" id="password" class="form-control" placeholder="Password">
	        </div>
	        <input type="submit" class="btn btn-primary w-100 mb-3" value="로그인">
        </form>
        <a href="/user/sign_up_view" class="btn btn-secondary w-100">회원가입</a>
    </div>
</div>

<script>
	$(document).ready(function() {
		$("#loginForm").on("submit", function(e) {
			e.preventDefault();
			
			// validation
			let loginId = $("#loginId").val().trim();
			let password = $("#password").val();
			if (loginId == '') {
				alert("아이디를 입력해주세요.");
			}
			
			if (password == '') {
				alert("비밀번호를 입력해주세요.");
			}
			
			let url = $(this).attr('action');
			let params = $(this).serialize();
			console.log(url);
			console.log(params);
			
			$.post(url, params) // request
			.done(function(data) {
				if (data.code == 1) {
					location.href = "/timeline/timeline_view";
				} else {
					alert(data.errorMessage);
				}
			});
			
		});
	});
</script>