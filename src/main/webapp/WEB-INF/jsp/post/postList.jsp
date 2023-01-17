<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w-50 m-auto p-5">
	<div class="writeBox">
		<textarea class="p-2" id="content" placeholder="내용을 입력해주세요"></textarea>
		<div class="d-flex justify-content-between p-1">
			<!-- <button>
				<img src="/static/img/imgPlus.png" id="imagePath" alt="사진첨부버튼">
			</button> -->
			<input type="file" id="file" accept=".jpg,.jpeg,.png,.gif">
			<input type="button" class="btn btn-info" value="업로드" id="uploadBtn">
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#uploadBtn').on('click', function() {
			let content = $('#content').val();
			if (content == '') {
				alert('내용을 입력해주세요.');
				return;
			}
		})
		
	});
</script>