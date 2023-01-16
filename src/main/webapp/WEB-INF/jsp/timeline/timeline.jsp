<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="timelineBox" class="w-50 m-auto p-5">
	<div class="writeBox">
		<textarea class="p-1" placeholder="내용을 입력해주세요"></textarea>
		<div class="d-flex justify-content-between p-1">
			<button>
				<img src="/static/img/imgPlus.png" alt="사진첨부버튼">
			</button>
			<input type="button" class="btn btn-info" value="업로드">
		</div>
	</div>
	<div class="" id="card">
		<div class="d-flex justify-content-between p-1 align-items-center">
			<span class="font-weight-bold">${userName}userName</span>
			<a href="#" class="moreBtn">
				<img src="/static/img/more-icon.png" alt="더보기버튼">
			</a>
		</div>
		<div class="uploadImgBox">
			<img src="/static/img/dog.jpg">
		</div>
		<div id="contentBox">
			<div id="heart">
				<img src="/static/img/heart-icon.png">
				<!-- <img src="/static/img/heart-icon-black.png"> -->
				<span>좋아요 11개</span>
			</div>
			<div class="d-flex">
				<span class="font-weight-bold">${userName}userName</span>
				<p>
					비지도 학습을 해본 결과입니다. cluster 알고리즘을 사용해봤어요
				</p>
			</div>
		</div>
		<div>
			<div class="font-weight-bold">댓글</div>
			<div class="commentBox">
				<div>
					<span>
						<span class="name">userName </span> :
					</span>
					<span class="comment">
						분류가 잘 되었군요~
						<button>
							<img src="/static/img/x-icon.png">
						</button>
					</span>
				</div>
				<div>
					<span>
						<span class="name">userName </span> :
					</span>
					<span class="comment">
						철이 없었죠 분류를 위해 클러스터를 썼다는게
						<button>
							<img src="/static/img/x-icon.png">
						</button>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>