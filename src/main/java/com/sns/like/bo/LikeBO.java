package com.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeDAO;

@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	
	public void likeToggle(int postId, int userId) {
		// 좋아요 있는지 확인
		if (likeDAO.selectLikeCountByPostIdOrUserId(postId, userId) > 0) {
			// 있으면 제거
			likeDAO.deleteLikeByPostIdUserId(postId, userId);
		} else {
			// 없으면 추가
			likeDAO.insertLike(postId, userId);
		}
	}
	
	public boolean existLike(int postId, Integer userId) {
		// userId는 비로그인일수도 있다.(null일 수도 있음)
		if(userId == null) { // 비로그인
			return false;
		}
		return likeDAO.selectLikeCountByPostIdOrUserId(postId, userId) > 0 ? true : false; // 로그인
	}
	
	public int getLikeCountByPostId(int postId) {
		return likeDAO.selectLikeCountByPostIdOrUserId(postId, null);
	}
	
}
