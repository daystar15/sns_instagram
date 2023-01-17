<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="timelineBox" class="w-50 m-auto p-5">
	<div class="mt-5 mb-5" id="card">
		<div class="d-flex justify-content-between p-2 align-items-center">
			<span class="font-weight-bold pl-2">${userName}userName</span>
			<a href="#" class="moreBtn">
				<img src="/static/img/more-icon.png" alt="더보기버튼">
			</a>
		</div>
		<div class="uploadImgBox">
			<img src="/static/img/dog.jpg">
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
				<span class="font-weight-bold mr-2">${userName}userName</span>
				<p>
					비지도 학습을 해본 결과입니다. cluster 알고리즘을 사용해봤어요
				</p>
			</div>
		</div>
		<div>
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
			</div>
		</div>
		<div id="writeComment" class="d-flex justify-content-between p-1">
			<input type="text" placeholder="내용을 입력해주세요." class="pl-2">
			<input type="submit" value="게시" class="btn btn-light">
		</div>
	</div>
</div>