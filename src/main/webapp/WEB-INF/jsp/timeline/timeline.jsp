<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<div id="timelineBox" class="w-50 m-auto p-5">
	<!-- 글쓰기 영역: 로그인 된 상태에서만 보여짐 -->
	<c:if test="${not empty userName}">
		<div class="writeBox">
			<textarea class="p-2" id="content" placeholder="내용을 입력해주세요"></textarea>
			<div class="d-flex justify-content-between p-1">
				<input type="file" id="file" class="d-none" accept=".jpg,.jpeg,.png,.gif">
				<button>
					<img src="/static/img/imgPlus.png" id="imagePath" alt="사진첨부버튼">
				</button>
				
				<!-- 업로드 된 임시 파일 이름이 저장될 곳 -->
				<div id="fileName"></div>
				
				<input type="button" class="btn btn-info" value="업로드" id="uploadBtn">
			</div>
		</div>
	</c:if>
	
	<div class="mt-5 mb-5" id="card">
		<c:forEach var="post" items="${postList}">
		<div class="mb-5">
			<div class="d-flex justify-content-between p-2 align-items-center">
				<span class="font-weight-bold pl-2">${post.userId}</span>
				<a href="#" class="moreBtn">
					<img src="/static/img/more-icon.png" alt="더보기버튼">
				</a>
			</div>
			
			<div class="uploadImgBox">
				<a href="#" id="fileUploadBtn">
					<img src="${post.imagePath}">
				</a>
			</div>
			
			<div id="contentBox" class="p-3">
				<div id="heart" class="d-flex align-items-center mb-3">
					<button type="button">
						<img src="/static/img/heart-icon.png">
					</button>
					<!-- <img src="/static/img/heart-icon-black.png"> -->
					<span class="ml-2">좋아요 11개</span>
				</div>
				<div class="d-flex">
					<span class="font-weight-bold mr-2">${post.userId}</span>
					<p>
						${post.content}
					</p>
				</div>
			</div>
			<h6 class="font-weight-bold p-3 mb-0">댓글</h6>
			<div class="commentBox">
				<div class="p-3">
					<span>
						<span class="name">userName </span> :
					</span>
					<span class="comment">
						분류가 잘 되었군요~
						<button type="button">
							<img src="/static/img/x-icon.png">
						</button>
					</span>
				</div>
				<div class="pl-3 pb-3">
					<span>
						<span class="name">userName </span> :
					</span>
					<span class="comment">
						철이 없었죠 분류를 위해 클러스터를 썼다는게
						<button type="button">
							<img src="/static/img/x-icon.png">
						</button>
					</span>
				</div>
			<%-- 댓글쓰기 --%>
			<c:if test="${not empty userId}">
				<div id="writeComment" class="d-flex justify-content-between p-1">
					<input type="text" placeholder="내용을 입력해주세요." class="pl-2" id="commentContent">
					<input type="button" value="게시" class="btn btn-light comment-btn" data-post-id="${post.id}">
				</div>
			</c:if>
			</div>
		</div>
		
	
		
		</c:forEach>

	</div>
</div>

<script>
	$(document).ready(function() {
		// 파일업로드 이미지 클릭 => 숨겨져있는 file을 동작시킴
		$("#imagePath").on('click', function(e) {
			$("#file").click(); // input file을 클릭한 것과 같은 효과, 이미지 창을 뜨게만 만든다
		});
		
		// 사용자가 이미지를 선택했을 때 유효성 확인 및 업로드 된 파일 이름 노출
		$("#file").on('change', function(e) {
			//alert("파일선택");
			let fileName = e.target.files[0].name; //mountains-7468597_640.jpg
			//alert(fileName);
			
			// 확장자 유효성 확인
			let ext = fileName.split(".").pop().toLowerCase(); // 확장자만 자르기
			if (ext != 'jpg' && ext != 'jpeg' && ext != 'png' && ext != 'gif') {
				alert('이미지 파일만 업로드 할 수 있습니다.');
				$('#file').val(''); // 파일 태그에 실제 파일 제거
				$('#fileName').text(); // 파일 이름 비우기
				return;
			}
			
			// 유효성 통과한 이미지는 상자에 업로드 된 파일 이름 노출
			$("#fileName").text(fileName);
			
		});
		
		// 글 저장
		$("#uploadBtn").on('click', function() {
			let content = $("#content").val();
			let file = $("#file").val();
			
			// validation
			if (content == '') {
				alert('내용을 입력해주세요.');
				return;
			}
			if (file == '') {
				alert('사진을 선택해주세요.');
				return;
			}
			
			// ajax - 서버
			let formData = new FormData();
			
			// name 속성 사용
			formData.append("content", content);
			formData.append("file", $("#file")[0].files[0]);
			
			$.ajax({
				// request
				type: "post"
				, url: "/post/create"
				, data:formData
				, enctype:"multipart/form-data"
				, processData:false
				, contentType:false
				
				// response
				, success:function(data) {
					if (data.code == 1) {
						alert('글이 작성되었습니다.');
						location.reload(true);
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert('글쓰기에 실패했습니다.')
				}
			});
			
		}); //--- 글쓰기 버튼 끝
		
		// 댓글 쓰기
		$(".comment-btn").on('click', function() {
			// 글번호, 댓글 내용
			let postId = $(this).data('post-id');
			//alert(postId); - 안나옴
			
			// 지금 클릭된 게시버튼의 형제인 input 태그를 가져온다. siblings
			let comment = $(this).siblings('input').val().trim();
			alert(comment);
			
			if (comment == '') {
				alert('댓글 내용을 입력해주세요.');
				return;
			}
			
			// ajax
			$.ajax({
				type: "post"
				, url : "/comment/create"
				, data: {"postId":postId, "userId":userId}
				
				
				, success:function(data) {
					if (data.code == 1) {
						alert("댓글 쓰기에 성공했습니다.");
					} else {
						alert(data.errorMessage)
					}
				}
				, error:function(jqXHR, testStatus, errorThrown) {
					var errorMsg = jqXHR.responseJSON.status;
					alert(errorMsg + ":" + textStatus)
				}
			})
			
			
			
		});
		
		
		
		
		
		
		
	})
</script>