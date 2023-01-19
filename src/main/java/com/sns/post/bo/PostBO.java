package com.sns.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.common.FileManagerService;
import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManagerService;

	public int addPost(int userId, String userLoginId, String userName, String content, MultipartFile file) {
		
		// 파일 업로드(내 컴퓨터인 서버에 일단 저장) => 경로
		String imagePath = null;
		if (file != null) {
			// 파일이 있을 때만 업로드 => 이미지 경로를 얻어냄
			imagePath = fileManagerService.saveFile(userLoginId, file);
		}
		
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<Post> getPostListByUserId(int userId) {
		return postDAO.selectPostListByUserId(userId);
	}
	
	public int getPostByPostId(int postId) {
		return postDAO.selectPostByPostId(postId);
	}
	
}
